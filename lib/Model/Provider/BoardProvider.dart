import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/Data/Board/BoardModel.dart';

/// Provider class for managing board information.
class BoardProvider with ChangeNotifier {
  BoardModel? _boardModel;

  /// Getter for board model.
  BoardModel? get boardModel => _boardModel;

  /// Setter for board model.
  set boardModel(BoardModel? boardModel) {
    _boardModel = boardModel;
    notifyListeners();
  }

  /// Update the board model with a new one.
  void updateBoardModel(BoardModel newBoardModel) {
    _boardModel = newBoardModel;
    notifyListeners();
  }
}
