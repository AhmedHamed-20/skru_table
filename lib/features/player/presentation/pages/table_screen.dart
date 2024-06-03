import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skru_table/features/player/presentation/cubit/player_cubit.dart';
import 'package:skru_table/features/player/presentation/widgets/table_controllers_widget.dart';
import 'package:skru_table/features/player/presentation/widgets/table_widget.dart';
import 'package:skru_table/users_and_result_list.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PlayerCubit>(context).addNewPlayer('firstPlayer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CustomScrollView(slivers: [
        SliverToBoxAdapter(child: TableWidget()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        SliverToBoxAdapter(child: Divider()),
        SliverToBoxAdapter(child: TableControllersWidget()),
      ]),
    );
  }
}
