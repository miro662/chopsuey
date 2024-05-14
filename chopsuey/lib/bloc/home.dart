import 'package:bloc/bloc.dart';
import 'package:chopsuey/services/proto/chopsuey.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';

sealed class HomeEvent {}

class HomeEventConnect extends HomeEvent {
  final String url;

  HomeEventConnect({required this.url});
}

class HomeEventWakeUp extends HomeEvent {
  final Machine machine;

  HomeEventWakeUp({required this.machine});
}

sealed class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateConnecting extends HomeState {
  final String url;

  HomeStateConnecting({required this.url});
}

class HomeStateConnected extends HomeState {
  final List<String> machines;

  HomeStateConnected({required this.machines});
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ChopSueyClient? stub;

  HomeBloc() : super(HomeStateInitial()) {
    on<HomeEventConnect>((event, emit) async {
      emit(HomeStateConnecting(url: event.url));
      var channel = ClientChannel(
        event.url,
        port: 2137,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()),
      );
      stub = ChopSueyClient(channel);

      if (stub != null) {
        var response = await stub?.listMachines(ListMachinesRequest());
        var machines = response?.machines ?? [];
        var machineNames = machines.map((m) => m.identifier).toList();
        emit(HomeStateConnected(machines: machineNames));
      }
    });
    on<HomeEventWakeUp>((event, emit) async {
      if (stub != null) {
        await stub?.wakeUp(WakeUpRequest(machine: event.machine));
      }
    });
  }
}
