import 'package:collection/collection.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class SchemeData {
  SchemeData({
//    @required this.uuid,
    this.licenseServerUrl,
    required this.mimeType,
    this.data,
    this.requiresSecureDecryption,
  });

//  /// The uuid of the DRM scheme, or null if the data is universal (i.e. applies to all schemes).
//  final String uuid;

  /// The URL of the server to which license requests should be made. May be null if unknown.
  final String? licenseServerUrl;

  /// The mimeType of [data].
  final String mimeType;

  /// The initialization base data.
  /// you should build pssh manually for use.
  final Uint8List? data;

  /// Whether secure decryption is required.
  final bool? requiresSecureDecryption;

  SchemeData copyWithData(Uint8List? data) => SchemeData(
//        uuid: uuid,
        licenseServerUrl: licenseServerUrl,
        mimeType: mimeType,
        data: data,
        requiresSecureDecryption: requiresSecureDecryption,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SchemeData &&
        other.runtimeType == runtimeType &&
        other.licenseServerUrl == licenseServerUrl &&
        other.mimeType == mimeType &&
        other.requiresSecureDecryption == requiresSecureDecryption &&
        const ListEquality<int>().equals(data, other.data);
  }

  @override
  int get hashCode {
    final dataHash = const ListEquality<int>().hash(data);

    return Object.hash(
      licenseServerUrl,
      mimeType,
      dataHash,
      requiresSecureDecryption,
    );
  }
}
