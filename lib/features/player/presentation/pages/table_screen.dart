import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skru_table/features/player/presentation/widgets/table_controllers_widget.dart';
import 'package:skru_table/features/player/presentation/widgets/table_widget.dart';

import '../cubit/player_cubit.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  @override
  void initState() {
    super.initState();
    //     BlocProvider.of<PlayerCubit>(context).addNewPlayer('firstPlayer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skru Table'),
        centerTitle: true,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.green.withOpacity(0.5),
              onPressed: () {
                BlocProvider.of<PlayerCubit>(context)
                    .resetAllPlayersScoreToZero();
              },
              child: const Icon(Icons.restart_alt),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.red.withOpacity(0.5),
              onPressed: () {
                BlocProvider.of<PlayerCubit>(context).removeAllPlayers();
              },
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: const Padding(
        padding: EdgeInsets.all(22),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: TableWidget()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(child: TableControllersWidget()),
        ]),
      ),
    );
  }
}
