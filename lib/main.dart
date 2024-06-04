import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skru_table/features/player/presentation/cubit/player_cubit.dart';
import 'package:skru_table/features/player/presentation/pages/table_screen.dart';
import 'package:skru_table/theme.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    Wakelock.enable();
  }

  @override
  void dispose() {
    Wakelock.disable();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const MaterialTheme materialTheme = MaterialTheme(TextTheme());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayerCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: materialTheme.light(),
        darkTheme: materialTheme.dark(),
        themeMode: ThemeMode.system,
        home: const TableScreen(),
      ),
    );
  }
}
