import 'package:chopsuey/bloc/home.dart';
import 'package:chopsuey/services/proto/chopsuey.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            Widget innerState = Container();
            if (state is HomeStateInitial) {
              innerState = const Text("enter URL to begin");
            }
            if (state is HomeStateConnecting) {
              innerState = Text("connecting to ${state.url} ...");
            }
            if (state is HomeStateConnected) {
              var buttons = state.machines
                  .map((name) => ElevatedButton(
                      onPressed: () => {
                            context.read<HomeBloc>().add(HomeEventWakeUp(
                                machine: Machine(identifier: name)))
                          },
                      child: Text(name)))
                  .toList();
              innerState = Column(children: buttons);
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const UrlField(),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: innerState,
                  ))
                ],
              ),
            );
          },
        ));
  }
}

class UrlField extends StatelessWidget {
  const UrlField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: "chopsueyd url"),
      onSubmitted: (value) =>
          context.read<HomeBloc>().add(HomeEventConnect(url: value)),
    );
  }
}
