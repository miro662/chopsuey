//
//  Generated code. Do not modify.
//  source: proto/chopsuey.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Machine extends $pb.GeneratedMessage {
  factory Machine({
    $core.String? identifier,
  }) {
    final $result = create();
    if (identifier != null) {
      $result.identifier = identifier;
    }
    return $result;
  }
  Machine._() : super();
  factory Machine.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Machine.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Machine', package: const $pb.PackageName(_omitMessageNames ? '' : 'chopsuey'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'identifier')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Machine clone() => Machine()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Machine copyWith(void Function(Machine) updates) => super.copyWith((message) => updates(message as Machine)) as Machine;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Machine create() => Machine._();
  Machine createEmptyInstance() => create();
  static $pb.PbList<Machine> createRepeated() => $pb.PbList<Machine>();
  @$core.pragma('dart2js:noInline')
  static Machine getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Machine>(create);
  static Machine? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get identifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set identifier($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => clearField(1);
}

class ListMachinesRequest extends $pb.GeneratedMessage {
  factory ListMachinesRequest() => create();
  ListMachinesRequest._() : super();
  factory ListMachinesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListMachinesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListMachinesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chopsuey'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListMachinesRequest clone() => ListMachinesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListMachinesRequest copyWith(void Function(ListMachinesRequest) updates) => super.copyWith((message) => updates(message as ListMachinesRequest)) as ListMachinesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListMachinesRequest create() => ListMachinesRequest._();
  ListMachinesRequest createEmptyInstance() => create();
  static $pb.PbList<ListMachinesRequest> createRepeated() => $pb.PbList<ListMachinesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListMachinesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMachinesRequest>(create);
  static ListMachinesRequest? _defaultInstance;
}

class ListMachinesReply extends $pb.GeneratedMessage {
  factory ListMachinesReply({
    $core.Iterable<Machine>? machines,
  }) {
    final $result = create();
    if (machines != null) {
      $result.machines.addAll(machines);
    }
    return $result;
  }
  ListMachinesReply._() : super();
  factory ListMachinesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListMachinesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListMachinesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'chopsuey'), createEmptyInstance: create)
    ..pc<Machine>(1, _omitFieldNames ? '' : 'machines', $pb.PbFieldType.PM, subBuilder: Machine.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListMachinesReply clone() => ListMachinesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListMachinesReply copyWith(void Function(ListMachinesReply) updates) => super.copyWith((message) => updates(message as ListMachinesReply)) as ListMachinesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListMachinesReply create() => ListMachinesReply._();
  ListMachinesReply createEmptyInstance() => create();
  static $pb.PbList<ListMachinesReply> createRepeated() => $pb.PbList<ListMachinesReply>();
  @$core.pragma('dart2js:noInline')
  static ListMachinesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMachinesReply>(create);
  static ListMachinesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Machine> get machines => $_getList(0);
}

class WakeUpRequest extends $pb.GeneratedMessage {
  factory WakeUpRequest({
    Machine? machine,
  }) {
    final $result = create();
    if (machine != null) {
      $result.machine = machine;
    }
    return $result;
  }
  WakeUpRequest._() : super();
  factory WakeUpRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WakeUpRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WakeUpRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chopsuey'), createEmptyInstance: create)
    ..aOM<Machine>(1, _omitFieldNames ? '' : 'machine', subBuilder: Machine.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WakeUpRequest clone() => WakeUpRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WakeUpRequest copyWith(void Function(WakeUpRequest) updates) => super.copyWith((message) => updates(message as WakeUpRequest)) as WakeUpRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WakeUpRequest create() => WakeUpRequest._();
  WakeUpRequest createEmptyInstance() => create();
  static $pb.PbList<WakeUpRequest> createRepeated() => $pb.PbList<WakeUpRequest>();
  @$core.pragma('dart2js:noInline')
  static WakeUpRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WakeUpRequest>(create);
  static WakeUpRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Machine get machine => $_getN(0);
  @$pb.TagNumber(1)
  set machine(Machine v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMachine() => $_has(0);
  @$pb.TagNumber(1)
  void clearMachine() => clearField(1);
  @$pb.TagNumber(1)
  Machine ensureMachine() => $_ensure(0);
}

class WakeUpReply extends $pb.GeneratedMessage {
  factory WakeUpReply() => create();
  WakeUpReply._() : super();
  factory WakeUpReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WakeUpReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WakeUpReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'chopsuey'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WakeUpReply clone() => WakeUpReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WakeUpReply copyWith(void Function(WakeUpReply) updates) => super.copyWith((message) => updates(message as WakeUpReply)) as WakeUpReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WakeUpReply create() => WakeUpReply._();
  WakeUpReply createEmptyInstance() => create();
  static $pb.PbList<WakeUpReply> createRepeated() => $pb.PbList<WakeUpReply>();
  @$core.pragma('dart2js:noInline')
  static WakeUpReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WakeUpReply>(create);
  static WakeUpReply? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
