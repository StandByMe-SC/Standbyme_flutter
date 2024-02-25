import 'dart:convert';

import 'package:flutter_sc/Model/Data/Board/BoardCreateDB.dart';

/// Represents a list of BoardCreateDB objects.
class BoardDBList {
  final List<BoardCreateDB>? boardCreateDbs;

  /// Constructor for BoardDBList.
  BoardDBList({this.boardCreateDbs});

  /// Factory method to create a BoardDBList object from JSON string.
  factory BoardDBList.fromJson(String jsonString) {
    List<dynamic> listFromJson = json.decode(jsonString);
    List<BoardCreateDB> boardCreateDBs = <BoardCreateDB>[];

    boardCreateDBs = listFromJson
        .map((boardCreateDb) => BoardCreateDB.fromJson(boardCreateDb))
        .toList();
    return BoardDBList(boardCreateDbs: boardCreateDBs);
  }
}
