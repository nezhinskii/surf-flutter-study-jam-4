import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/ui/utils/app_colors.dart';

class MagicBall extends StatelessWidget {
  const MagicBall({required this.size, Key? key}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return _OuterBallLayer(
      size: size,
      child: const _MediumBallLayer(
        child: _InnerBallLayer(
          child: SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _OuterBallLayer extends StatelessWidget {
  const _OuterBallLayer({
    super.key,
    required this.size,
    required this.child
  });
  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: const Border(
          left: BorderSide(width: 7, color: AppColors.outerBallColor),
          right: BorderSide(width: 2, color: AppColors.outerBallColor),
          top: BorderSide(width: 3, color: AppColors.outerBallColor),
          bottom: BorderSide(width: 3, color: AppColors.outerBallColor)
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 25,
            color: AppColors.outerBallColor.withOpacity(0.3),
          ),
        ],
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: child
    );
  }
}

class _MediumBallLayer extends StatelessWidget {
  const _MediumBallLayer({
    super.key,
    required this.child
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.mediumLayerBallColor.withOpacity(0.5),
            Colors.black.withOpacity(0.5),
            AppColors.mediumLayerBallColor.withOpacity(0.5)
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: AppColors.mediumLayerBallColor,
            spreadRadius: 2,
          ),
        ],
      ),
      child: child
    );
  }
}

class _InnerBallLayer extends StatelessWidget {
  const _InnerBallLayer({
    super.key,
    required this.child
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.innerBallColor.withOpacity(0.6),
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.3),
            AppColors.innerBallColor.withOpacity(0.6)
          ],
          begin: const Alignment(-1, 0.4),
          end: const Alignment(1, -0.4),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: AppColors.innerBallColor,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: child,
    );
  }
}
