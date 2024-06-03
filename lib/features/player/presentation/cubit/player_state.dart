part of 'player_cubit.dart';

@immutable
class PlayerState {
  const PlayerState({
    this.users = const [],
    this.resultsOfFirstRounds,
    this.resultsOfFourthRounds,
    this.resultsOfSecondRounds,
    this.resultsOfThirdRounds,
    this.resultsOfFifthRounds,
    this.totalPointsListOfEachPlayer = const [],
  });
  final List<DataColumn> users;
  final RoundsModel? resultsOfFirstRounds;
  final RoundsModel? resultsOfSecondRounds;
  final RoundsModel? resultsOfThirdRounds;
  final RoundsModel? resultsOfFourthRounds;
  final RoundsModel? resultsOfFifthRounds;
  final List<DataCell> totalPointsListOfEachPlayer;
  PlayerState copyWith({
    List<DataColumn>? users,
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
