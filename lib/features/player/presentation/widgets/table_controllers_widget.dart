import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skru_table/features/player/presentation/cubit/player_cubit.dart';

class TableControllersWidget extends StatelessWidget {
  const TableControllersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final playerBloc = BlocProvider.of<PlayerCubit>(context);
    return BlocBuilder<PlayerCubit, PlayerState>(
      builder: (context, state) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      state.users.length,
                      (index) => IconButton(
                          onPressed: () {
                            playerBloc.removePlayer(index);
                          },
                          icon: Row(
                            children: [
                              Text('Delete ${index + 1}'),
                            ],
                          ))),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    playerBloc.addNewPlayer('firstPlayer');
                  },
                  child: Text('Add New Player')),
            ],
          ),
        ),
      ),
    );
  }
}
