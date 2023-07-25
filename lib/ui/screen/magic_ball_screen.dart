import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/ui/screen/cubit/magic_ball_cubit.dart';
import 'package:surf_practice_magic_ball/ui/screen/widgets/magic_ball.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ballSize = MediaQuery.of(context).size.shortestSide * 0.8;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 25, 12, 50), Colors.black]
        )
      ),
      child: Scaffold(
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                ),
                child: Text("Нажмите на шар\nили потрясите телефон",
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
