import 'dart:convert';

/// Represents a board model used for displaying data in a ListView.
class BoardModel {
  late int? boardId;
  late String? contents;
  late String? title;
  late String? location;

  /// Constructor for BoardModel.
  BoardModel({
    this.boardId,
    required this.contents,
    required this.title,
    required this.location,
  });

  /// Converts BoardModel object to a map.
  Map<String, dynamic> toMap() {
    return {
      'id': boardId,
      'title': title,
      'contents': contents,
      'region': location,
    };
  }

  /// Constructor to create a BoardModel object from a map.
  BoardModel.fromMap(Map<dynamic, dynamic>? map) {
    boardId = map?['boardId'];
    title = map?['title'];
    contents = map?['contents'];
    location = map?['region'];
  }
}
