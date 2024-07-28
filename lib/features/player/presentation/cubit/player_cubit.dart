import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:skru_table/features/player/data/models/rounds_model.dart';
import 'package:skru_table/features/player/data/models/user_model.dart';
import 'package:skru_table/features/player/presentation/widgets/cell_widget.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(const PlayerState());

  void addNewPlayer(String playerName) {
    // Adding a new DataColumn for the new player
    List<UserModel> updatedUsers = [
      ...state.users,
      UserModel(userName: playerName)
    ];

    // Adding a new TextEditingController for each round
    List<TextEditingController> newFirstRoundControllers = [
      ...state.resultsOfFirstRounds.listOfTheRoundControllers,
      TextEditingController(text: '0'),
    ];
    List<TextEditingController> newSecondRoundControllers = [
      ...state.resultsOfSecondRounds.listOfTheRoundControllers,
      TextEditingController(text: '0'),
    ];
    List<TextEditingController> newThirdRoundControllers = [
      ...state.resultsOfThirdRounds.listOfTheRoundControllers,
      TextEditingController(text: '0'),
    ];
    List<TextEditingController> newFourthRoundControllers = [
      ...state.resultsOfFourthRounds.listOfTheRoundControllers,
      TextEditingController(text: '0'),
    ];
    List<TextEditingController> newFifthRoundControllers = [
      ...state.resultsOfFifthRounds.listOfTheRoundControllers,
      TextEditingController(text: '0'),
    ];

    // Updating the state
    emit(state.copyWith(
      users: updatedUsers,
      resultsOfFirstRounds: RoundsModel(
        resultOfTheRound: [
          ...state.resultsOfFirstRounds.resultOfTheRound,
          DataCell(CellWidget(
            textEditingController: newFirstRoundControllers.last,
            onValueChanged: (value) => onValueChangedTextField(value),
          )),
        ],
        listOfTheRoundControllers: newFirstRoundControllers,
      ),
      resultsOfSecondRounds: RoundsModel(
        resultOfTheRound: [
          ...state.resultsOfSecondRounds.resultOfTheRound,
          DataCell(CellWidget(
            textEditingController: newSecondRoundControllers.last,
            onValueChanged: (value) => onValueChangedTextField(value),
          )),
        ],
        listOfTheRoundControllers: newSecondRoundControllers,
      ),
      resultsOfThirdRounds: RoundsModel(
        resultOfTheRound: [
          ...state.resultsOfThirdRounds.resultOfTheRound,
          DataCell(CellWidget(
            textEditingController: newThirdRoundControllers.last,
            onValueChanged: (value) => onValueChangedTextField(value),
          )),
        ],
        listOfTheRoundControllers: newThirdRoundControllers,
      ),
      resultsOfFourthRounds: RoundsModel(
        resultOfTheRound: [
          ...state.resultsOfFourthRounds.resultOfTheRound,
          DataCell(CellWidget(
            textEditingController: newFourthRoundControllers.last,
            onValueChanged: (value) => onValueChangedTextField(value),
          )),
        ],
        listOfTheRoundControllers: newFourthRoundControllers,
      ),
      resultsOfFifthRounds: RoundsModel(
        resultOfTheRound: [
          ...state.resultsOfFifthRounds.resultOfTheRound,
          DataCell(CellWidget(
            textEditingController: newFifthRoundControllers.last,
            onValueChanged: (value) => onValueChangedTextField(value),
          )),
        ],
        listOfTheRoundControllers: newFifthRoundControllers,
      ),
    ));

    // Calculate totals after adding new player
    calculateTotalPointsForEachPlayer();
  }

  removePlayer(int index) {
    // print(state.resultsOfFirstRounds[0].child);
    emit(
      state.copyWith(
        users: state.users..removeAt(index),
        resultsOfFirstRounds: RoundsModel(
          resultOfTheRound: state.resultsOfFirstRounds.resultOfTheRound
            ..removeAt(index),
          listOfTheRoundControllers:
              state.resultsOfFirstRounds.listOfTheRoundControllers
                ..removeAt(index),
        ),
        resultsOfSecondRounds: RoundsModel(
          resultOfTheRound: state.resultsOfSecondRounds.resultOfTheRound
            ..removeAt(index),
          listOfTheRoundControllers:
              state.resultsOfSecondRounds.listOfTheRoundControllers
                ..removeAt(index),
        ),
        resultsOfThirdRounds: RoundsModel(
          resultOfTheRound: state.resultsOfThirdRounds.resultOfTheRound
            ..removeAt(index),
          listOfTheRoundControllers:
              state.resultsOfThirdRounds.listOfTheRoundControllers
                ..removeAt(index),
        ),
        resultsOfFourthRounds: RoundsModel(
          resultOfTheRound: state.resultsOfFourthRounds.resultOfTheRound
            ..removeAt(index),
          listOfTheRoundControllers:
              state.resultsOfFourthRounds.listOfTheRoundControllers
                ..removeAt(index),
        ),
        resultsOfFifthRounds: RoundsModel(
          resultOfTheRound: state.resultsOfFifthRounds.resultOfTheRound
            ..removeAt(index),
          listOfTheRoundControllers:
              state.resultsOfFifthRounds.listOfTheRoundControllers
                ..removeAt(index),
        ),
      ),
    );
    calculateTotalPointsForEachPlayer();
  }

  void removeAllPlayers() {
    emit(state.copyWith(
      users: const [],
      resultsOfFirstRounds: const RoundsModel(
        resultOfTheRound: [],
        listOfTheRoundControllers: [],
      ),
      resultsOfSecondRounds: const RoundsModel(
        resultOfTheRound: [],
        listOfTheRoundControllers: [],
      ),
      resultsOfThirdRounds: const RoundsModel(
        resultOfTheRound: [],
        listOfTheRoundControllers: [],
      ),
      resultsOfFourthRounds: const RoundsModel(
        resultOfTheRound: [],
        listOfTheRoundControllers: [],
      ),
      resultsOfFifthRounds: const RoundsModel(
        resultOfTheRound: [],
        listOfTheRoundControllers: [],
      ),
      totalPointsListOfEachPlayer: const [],
    ));
  }

  void calculateTotalPointsForEachPlayer() {
    List<DataCell> totalPointsList = List.generate(state.users.length, (index) {
      int resultOfEachPlayer = 0;
      resultOfEachPlayer += int.parse(
          state.resultsOfFirstRounds.listOfTheRoundControllers[index].text);
      resultOfEachPlayer += int.parse(
          state.resultsOfSecondRounds.listOfTheRoundControllers[index].text);
      resultOfEachPlayer += int.parse(
          state.resultsOfThirdRounds.listOfTheRoundControllers[index].text);
      resultOfEachPlayer += int.parse(
          state.resultsOfFourthRounds.listOfTheRoundControllers[index].text);
      resultOfEachPlayer += int.parse(
          state.resultsOfFifthRounds.listOfTheRoundControllers[index].text);
      return DataCell(Center(
        child: Text(
          resultOfEachPlayer.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ));
    });

    emit(state.copyWith(totalPointsListOfEachPlayer: totalPointsList));
  }

  onValueChangedTextField(String value) {
    if (value.isEmpty) {
      return;
    } else {
      calculateTotalPointsForEachPlayer();
    }
  }
}
