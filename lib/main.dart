import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:surf_practice_magic_ball/data/repositories/magic_ball_repositor_impl.dart';
import 'package:surf_practice_magic_ball/data/services/magic_ball_service.dart';
import 'package:surf_practice_magic_ball/domain/repositories/magic_ball_repository.dart';
import 'package:surf_practice_magic_ball/services/magic_ball_service_impl.dart';
import 'package:surf_practice_magic_ball/ui/screens/magic_ball/magic_ball_screen.dart';
import 'package:surf_practice_magic_ball/ui/utils/theme.dart';
import 'ui/screens/magic_ball/cubit/magic_ball_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MagicBallService>(
          create: (_) => MagicBallServiceImpl(dio),
        ),

        RepositoryProvider<MagicBallRepository>(
          create: (context) => MagicBallRepositoryImpl(context.read<MagicBallService>()),
        ),

        ChangeNotifierProvider<AppTheme>(
          create: (_) => AppTheme(),
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MaterialApp(
      theme: context.watch<AppTheme>().theme,
      home: BlocProvider<MagicBallCubit>(
        create: (ctx) => MagicBallCubit(ctx.read<MagicBallRepository>()),
        child: const MagicBallScreen()
      ),
    );
  }
}
