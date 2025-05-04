import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

import 'scheme_data.dart';

class DrmInitData {
  DrmInitData({this.schemeType, this.schemeData = const []});

  final List<SchemeData> schemeData;
  final String? schemeType;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DrmInitData &&
        other.runtimeType == runtimeType &&
        other.schemeType == schemeType &&
        const ListEquality<SchemeData>().equals(schemeData, other.schemeData);
  }

  @override
  int get hashCode {
    final schemeDataHash = const ListEquality<SchemeData>().hash(schemeData);
    return Object.hash(schemeType, schemeDataHash);
  }
}
