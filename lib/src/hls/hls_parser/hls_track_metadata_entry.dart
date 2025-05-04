import 'package:better_player/src/hls/hls_parser/variant_info.dart';
import 'package:collection/collection.dart';
import 'package:flutter/rendering.dart';

class HlsTrackMetadataEntry {
  HlsTrackMetadataEntry({this.groupId, this.name, this.variantInfos});

  /// The GROUP-ID value of this track, if the track is derived from an EXT-X-MEDIA tag. Null if the
  /// track is not derived from an EXT-X-MEDIA TAG.
  final String? groupId;

  /// The NAME value of this track, if the track is derived from an EXT-X-MEDIA tag. Null if the
  /// track is not derived from an EXT-X-MEDIA TAG.
  final String? name;

  /// The EXT-X-STREAM-INF tags attributes associated with this track. This field is non-applicable (and therefore empty) if this track is derived from an EXT-X-MEDIA tag.
  final List<VariantInfo>? variantInfos;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HlsTrackMetadataEntry &&
        other.runtimeType == runtimeType &&
        other.groupId == groupId &&
        other.name == name &&
        const ListEquality<VariantInfo>()
            .equals(variantInfos, other.variantInfos);
  }

  @override
  int get hashCode {
    final variantInfosHash =
        const ListEquality<VariantInfo>().hash(variantInfos);

    return Object.hash(groupId, name, variantInfosHash);
  }
}
