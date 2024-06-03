import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skru_table/features/player/presentation/cubit/player_cubit.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerState>(
      builder: (context, state) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: <DataColumn>[
            const DataColumn(
              label: Text(
                'Rounds',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...state.users,
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                const DataCell(
                  Text('1'),
                ),
                ...state.resultsOfFirstRounds!.resultOfTheRound,
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(
                  Text('2'),
                ),
                ...state.resultsOfSecondRounds!.resultOfTheRound,
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(
                  Text('3'),
                ),
                ...state.resultsOfThirdRounds!.resultOfTheRound,
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(
                  Text('4'),
                ),
                ...state.resultsOfFourthRounds!.resultOfTheRound,
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(
                  Text('5'),
                ),
                ...state.resultsOfFifthRounds!.resultOfTheRound,
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(
                  Text('Total'),
                ),
                ...state.totalPointsListOfEachPlayer,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
