import 'dart:convert';
import 'dart:ffi';

/// Class representing a reply model.
class ReplyModel {
  Long? _replyId;
  String? _replyContents;
  String? _replyWriter;

  /// Constructor for ReplyModel.
  ReplyModel({Long? replyId, String? replyContents, String? replyWriter})
      : _replyId = replyId,
        _replyContents = replyContents,
        _replyWriter = replyWriter;

  /// Converts ReplyModel object to map.
  ReplyModel toMap() {
    return ReplyModel(
      replyId: _replyId,
      replyContents: _replyContents,
      replyWriter: _replyWriter,
    );
  }

  /// Factory method to create ReplyModel object from map.
  factory ReplyModel.fromMap(Map<String, dynamic> map) {
    return ReplyModel(
      replyId: map['replyId'] as Long,
      replyContents: map['contents'] as String,
      replyWriter: map['writer'] as String,
    );
  }

  /// Converts ReplyModel object to JSON string.
  String toJson() => json.encode(toMap());

  /// Factory method to create ReplyModel object from JSON string.
  factory ReplyModel.fromJson(String source) =>
      ReplyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
