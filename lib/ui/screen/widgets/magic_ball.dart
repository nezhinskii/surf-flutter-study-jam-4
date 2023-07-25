import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/ui/screen/cubit/magic_ball_cubit.dart';
import 'package:surf_practice_magic_ball/ui/utils/app_colors.dart';

part 'magic_ball_layers.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({required this.size, Key? key}) : super(key: key);
  final double size;

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> with SingleTickerProviderStateMixin {
  late Animation<double> _ballAnimation;
  late Animation<double> _shadowAnimation;
  late AnimationController _animationController;

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    _ballAnimation = Tween(begin: 0.0, end: 20.0).animate(_animationController);
    _shadowAnimation = Tween(begin: 0.92, end: 1.08).animate(_animationController);
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size * 1.4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedBuilder(
              builder: (context, child) {
                return Padding(
                  padding: EdgeInsets.only(top: _ballAnimation.value),
                  child: child,
                );
              },
              animation: _ballAnimation,
              child: _OuterBallLayer(
                size: widget.size,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const _MediumBallLayer(
                      child: _InnerBallLayer(),
                    ),
                    BlocBuilder<MagicBallCubit, MagicBallState>(
                      builder: (context, state) {
                        return switch (state) {
                          MagicBallError() => _BallInnerShadow(
                             color: Colors.red.withOpacity(0.9)
                          ),
                          _ => const SizedBox.shrink()
                        };
                      },
                    ),
                    AnimatedBuilder(
                      animation: _ballAnimation,
                      builder: (context, child) {
                        return Padding(
                          padding: EdgeInsets.only(top: 15 -_ballAnimation.value / 1.7, left: 15),
                          child: child,
                        );
                      },
                      child: _Stars(starsCount: 70, radius: widget.size/2 - 20)
                    ),
                    BlocBuilder<MagicBallCubit, MagicBallState>(
                      builder: (context, state) {
                        return switch (state) {
                          MagicBallLoading() => _BallInnerShadow(
                            color: Colors.black.withOpacity(0.9),
                          ),
                          MagicBallLoaded(message: String message) => _BallInnerShadow(
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
              ),
            ),
          ),
          BlocBuilder<MagicBallCubit, MagicBallState>(
            builder: (context, state) {
              late Color color;
              switch (state) {
                case MagicBallError():
                  color = Colors.red;
                default:
                  color = AppColors.outerBallColor;
              }
              return Padding(
                padding:  EdgeInsets.only(top: widget.size * 1.3),
                child: _BallBottomShadow(animation: _shadowAnimation , color: color),
              );
            },
          ),
        ],
      ),
    );
  }
}

