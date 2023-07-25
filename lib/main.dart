import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/ui/screen/magic_ball_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
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
          )
        )
      ),
      home: const MagicBallScreen(),
    );
  }
}
