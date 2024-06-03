import 'package:flutter/material.dart';

class RoundsModel {
  final List<DataCell> resultOfTheRound;
  final List<TextEditingController> listOfTheRoundControllers;

  RoundsModel(
      {required this.resultOfTheRound,
      required this.listOfTheRoundControllers});
}
