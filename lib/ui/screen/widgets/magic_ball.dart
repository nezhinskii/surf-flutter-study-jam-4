import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/ui/screen/cubit/magic_ball_cubit.dart';
import 'package:surf_practice_magic_ball/ui/utils/app_colors.dart';

part 'magic_ball_layers.dart';

class MagicBall extends StatelessWidget {
  const MagicBall({required this.size, Key? key}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return _OuterBallLayer(
      size: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const _MediumBallLayer(
            child: _InnerBallLayer(
              child: SizedBox.shrink()
            ),
          ),
          BlocBuilder<MagicBallCubit, MagicBallState>(
            builder: (context, state) {
              return switch (state) {
                MagicBallError() => _BallShadow(
                   color: Colors.red.withOpacity(0.9)
                ),
                _ => const SizedBox.shrink()
              };
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: _Stars(starsCount: 70, radius: size/2 - 20),
          ),
          BlocBuilder<MagicBallCubit, MagicBallState>(
            builder: (context, state) {
              return switch (state) {
                MagicBallLoading() => _BallShadow(
                  color: Colors.black.withOpacity(0.9),
                ),
                MagicBallLoaded(message: String message) => _BallShadow(
                  color: Colors.black.withOpacity(0.9),
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                _ => const SizedBox.shrink()
              };
            },
          ),
        ]
      ),
    );
  }
}

