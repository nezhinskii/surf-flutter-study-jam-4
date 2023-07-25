import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/data/repositories/magic_ball_repositor_impl.dart';
import 'package:surf_practice_magic_ball/domain/repositories/magic_ball_repository.dart';
import 'package:surf_practice_magic_ball/ui/screen/cubit/magic_ball_cubit.dart';
import 'package:surf_practice_magic_ball/ui/screen/magic_ball_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MagicBallRepository>(
          create: (_) => MagicBallRepositoryImpl(),
        )
      ],
      child: const MyApp()
    )
  );
}

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            color: Color.fromARGB(255, 114, 114, 114),
            fontSize: 15,
          ),
          bodyLarge: TextStyle(
            color: Color.fromARGB(255, 110, 250, 255),
            fontSize: 22
          )
        )
      ),
      home: BlocProvider<MagicBallCubit>(
        create: (ctx) => MagicBallCubit(ctx.read<MagicBallRepository>()),
        child: const MagicBallScreen()
      ),
    );
  }
}
