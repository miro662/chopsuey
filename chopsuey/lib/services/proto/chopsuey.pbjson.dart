//
//  Generated code. Do not modify.
//  source: proto/chopsuey.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use machineDescriptor instead')
const Machine$json = {
  '1': 'Machine',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 9, '10': 'identifier'},
  ],
};

/// Descriptor for `Machine`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List machineDescriptor = $convert.base64Decode(
    'CgdNYWNoaW5lEh4KCmlkZW50aWZpZXIYASABKAlSCmlkZW50aWZpZXI=');

@$core.Deprecated('Use listMachinesRequestDescriptor instead')
const ListMachinesRequest$json = {
  '1': 'ListMachinesRequest',
};

/// Descriptor for `ListMachinesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMachinesRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0TWFjaGluZXNSZXF1ZXN0');

@$core.Deprecated('Use listMachinesReplyDescriptor instead')
const ListMachinesReply$json = {
  '1': 'ListMachinesReply',
  '2': [
    {'1': 'machines', '3': 1, '4': 3, '5': 11, '6': '.chopsuey.Machine', '10': 'machines'},
  ],
};

/// Descriptor for `ListMachinesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMachinesReplyDescriptor = $convert.base64Decode(
    'ChFMaXN0TWFjaGluZXNSZXBseRItCghtYWNoaW5lcxgBIAMoCzIRLmNob3BzdWV5Lk1hY2hpbm'
    'VSCG1hY2hpbmVz');

@$core.Deprecated('Use wakeUpRequestDescriptor instead')
const WakeUpRequest$json = {
  '1': 'WakeUpRequest',
  '2': [
    {'1': 'machine', '3': 1, '4': 1, '5': 11, '6': '.chopsuey.Machine', '10': 'machine'},
  ],
};

/// Descriptor for `WakeUpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wakeUpRequestDescriptor = $convert.base64Decode(
    'Cg1XYWtlVXBSZXF1ZXN0EisKB21hY2hpbmUYASABKAsyES5jaG9wc3VleS5NYWNoaW5lUgdtYW'
    'NoaW5l');

@$core.Deprecated('Use wakeUpReplyDescriptor instead')
const WakeUpReply$json = {
  '1': 'WakeUpReply',
};

/// Descriptor for `WakeUpReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wakeUpReplyDescriptor = $convert.base64Decode(
    'CgtXYWtlVXBSZXBseQ==');

