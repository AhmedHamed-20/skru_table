part of 'player_cubit.dart';

@immutable
class PlayerState {
  const PlayerState({
    this.users = const [],
    this.resultsOfFirstRounds = const RoundsModel(
      listOfTheRoundControllers: [],
      resultOfTheRound: [],
    ),
    this.resultsOfFourthRounds = const RoundsModel(
      listOfTheRoundControllers: [],
      resultOfTheRound: [],
    ),
    this.resultsOfSecondRounds = const RoundsModel(
      listOfTheRoundControllers: [],
      resultOfTheRound: [],
    ),
    this.resultsOfThirdRounds = const RoundsModel(
      listOfTheRoundControllers: [],
      resultOfTheRound: [],
    ),
    this.resultsOfFifthRounds = const RoundsModel(
      listOfTheRoundControllers: [],
      resultOfTheRound: [],
    ),
    this.totalPointsListOfEachPlayer = const [],
  });
  final List<UserModel> users;
  final RoundsModel resultsOfFirstRounds;
  final RoundsModel resultsOfSecondRounds;
  final RoundsModel resultsOfThirdRounds;
  final RoundsModel resultsOfFourthRounds;
  final RoundsModel resultsOfFifthRounds;
  final List<DataCell> totalPointsListOfEachPlayer;
  PlayerState copyWith({
    List<UserModel>? users,
    RoundsModel? resultsOfFirstRounds,
    RoundsModel? resultsOfSecondRounds,
    RoundsModel? resultsOfThirdRounds,
    RoundsModel? resultsOfFourthRounds,
    RoundsModel? resultsOfFifthRounds,
    List<DataCell>? totalPointsListOfEachPlayer,
  }) {
    return PlayerState(
      users: users ?? this.users,
      resultsOfFirstRounds: resultsOfFirstRounds ?? this.resultsOfFirstRounds,
      resultsOfSecondRounds:
          resultsOfSecondRounds ?? this.resultsOfSecondRounds,
      resultsOfThirdRounds: resultsOfThirdRounds ?? this.resultsOfThirdRounds,
      resultsOfFourthRounds:
          resultsOfFourthRounds ?? this.resultsOfFourthRounds,
      resultsOfFifthRounds: resultsOfFifthRounds ?? this.resultsOfFifthRounds,
      totalPointsListOfEachPlayer:
          totalPointsListOfEachPlayer ?? this.totalPointsListOfEachPlayer,
    );
  }

  // @override
  // List<Object> get props => [
  //       users,
  //       resultsOfFirstRounds,
  //       resultsOfSecondRounds,
  //       resultsOfThirdRounds,
  //       resultsOfFourthRounds,
  //       resultsOfFifthRounds,
  //     ];
}
