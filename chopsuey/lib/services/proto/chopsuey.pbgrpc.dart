//
//  Generated code. Do not modify.
//  source: proto/chopsuey.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chopsuey.pb.dart' as $0;

export 'chopsuey.pb.dart';

@$pb.GrpcServiceName('chopsuey.ChopSuey')
class ChopSueyClient extends $grpc.Client {
  static final _$listMachines = $grpc.ClientMethod<$0.ListMachinesRequest, $0.ListMachinesReply>(
      '/chopsuey.ChopSuey/ListMachines',
      ($0.ListMachinesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListMachinesReply.fromBuffer(value));
  static final _$wakeUp = $grpc.ClientMethod<$0.WakeUpRequest, $0.WakeUpReply>(
      '/chopsuey.ChopSuey/WakeUp',
      ($0.WakeUpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.WakeUpReply.fromBuffer(value));

  ChopSueyClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListMachinesReply> listMachines($0.ListMachinesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listMachines, request, options: options);
  }

  $grpc.ResponseFuture<$0.WakeUpReply> wakeUp($0.WakeUpRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$wakeUp, request, options: options);
  }
}

@$pb.GrpcServiceName('chopsuey.ChopSuey')
abstract class ChopSueyServiceBase extends $grpc.Service {
  $core.String get $name => 'chopsuey.ChopSuey';

  ChopSueyServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListMachinesRequest, $0.ListMachinesReply>(
        'ListMachines',
        listMachines_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListMachinesRequest.fromBuffer(value),
        ($0.ListMachinesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.WakeUpRequest, $0.WakeUpReply>(
        'WakeUp',
        wakeUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.WakeUpRequest.fromBuffer(value),
        ($0.WakeUpReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListMachinesReply> listMachines_Pre($grpc.ServiceCall call, $async.Future<$0.ListMachinesRequest> request) async {
    return listMachines(call, await request);
  }

  $async.Future<$0.WakeUpReply> wakeUp_Pre($grpc.ServiceCall call, $async.Future<$0.WakeUpRequest> request) async {
    return wakeUp(call, await request);
  }

  $async.Future<$0.ListMachinesReply> listMachines($grpc.ServiceCall call, $0.ListMachinesRequest request);
  $async.Future<$0.WakeUpReply> wakeUp($grpc.ServiceCall call, $0.WakeUpRequest request);
}
