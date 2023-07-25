import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/ui/screens/magic_ball/cubit/magic_ball_cubit.dart';
import 'package:surf_practice_magic_ball/ui/screens/magic_ball/widgets/magic_ball.dart';
import 'package:surf_practice_magic_ball/ui/screens/settings/settings_screen.dart';
import 'package:surf_practice_magic_ball/ui/utils/theme.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  late final ShakeDetector shakeDetector;
  late final bool hasVibrator;

  @override
  void initState() {
    super.initState();
    shakeDetector = ShakeDetector.autoStart(
      shakeThresholdGravity: 2.2,
      onPhoneShake: () {
        HapticFeedback.heavyImpact();
        context.read<MagicBallCubit>().getPrediction();
      }
    );
  }
  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
  }

  @override
  void dispose(){
    shakeDetector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ballSize = min(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.4);
    return Container(
      decoration: BoxDecoration(
        gradient: context.colors.backgroundGradient,
      ),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: IconButton(
          icon: Icon(
            Icons.settings,
            color: context.colors.mainColor,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
              )
            );
          },
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2 - ballSize / 2,
              ),
              GestureDetector(
                onTap: () {
                  context.read<MagicBallCubit>().getPrediction();
                },
                child: MagicBall(
                  size: ballSize,
                ),
              ),
              const SizedBox(height: 40),
              Text("Нажмите на шар\nили потрясите телефон",
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
