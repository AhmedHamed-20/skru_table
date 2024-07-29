import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skru_table/features/player/presentation/cubit/player_cubit.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class TableControllersWidget extends StatelessWidget {
  const TableControllersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final playerBloc = BlocProvider.of<PlayerCubit>(context);
    final TextEditingController playerNameController = TextEditingController();
    return BlocBuilder<PlayerCubit, PlayerState>(
      builder: (context, state) => Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.purple.withOpacity(0.5),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    state.users.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          playerBloc.removePlayer(index);
                        },
                        child: Row(
                          children: [
                            Text(
                              'Delete ${state.users[index].userName}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Form(
                  key: formKey,
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                    controller: playerNameController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Player Name',
                      hintText: 'Enter Player Name',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      playerBloc.addNewPlayer(playerNameController.text);
                      playerNameController.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: const Text(
                      'Add New Player',
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
