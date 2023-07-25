part of 'magic_ball.dart';

class _BallBottomShadow extends StatelessWidget {
  const _BallBottomShadow({
    Key? key,
    required this.animation,
    required this.color,
  }) : super(key: key);
  final Animation<double> animation;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateX(math.pi / 1.8),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: color,
                      spreadRadius: 40 * animation.value
                  ),
                  BoxShadow(
                      blurRadius: 40,
                      color: context.colors.innerBallColor.withOpacity(0.5),
                      spreadRadius: 100 * animation.value
                  )
                ]
            ),
          );
        },
      ),
    );
  }
}


class _BallInnerShadow extends StatelessWidget{
  const _BallInnerShadow({
    super.key,
    this.child,
    required this.color
  });
  final Widget? child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              color: color,
              spreadRadius: -10
            ),
          ],
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Center(child: child)
    );
  }
}

class _Stars extends StatelessWidget {
  _Stars({Key? key, required this.starsCount, required this.radius}) : super(key: key){
    _stars = List.generate(starsCount,
      (_) {
        final angle = _random.nextDouble() * 2 * math.pi;
        final r = _random.nextDouble() * radius;
        final x = r * math.cos(angle) + radius;
        final y = r * math.sin(angle) + radius;
        return Positioned(
          top: y,
          left: x,
          child: const _Star(),
        );
      }
    );
  }
  final int starsCount;
  final double radius;
  final _random = math.Random();
  late final List<Widget> _stars;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: _stars
    );
  }
}

class _Star extends StatelessWidget {
  const _Star({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final random = math.Random();
    late final Color color;
    late final double size;
    late final bool isLarge;
    if (random.nextDouble() > 0.90){
      isLarge = true;
      color = Colors.white;
      size = random.nextDouble() * 5 + 3;
    } else {
      isLarge = false;
      color = context.colors.starColors[random.nextInt(context.colors.starColors.length)];
      size = random.nextInt(3) + 2;
    }
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isLarge ? Colors.transparent:color,
        shape: BoxShape.circle,
        boxShadow: isLarge ? [
          BoxShadow(
            blurRadius: 5,
            color: color,
            spreadRadius: size
          ),
          BoxShadow(
            blurRadius: 4,
            color: context.colors.innerBallColor,
            spreadRadius: size + 5,
            blurStyle: BlurStyle.outer
          )
        ]:null
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
          border: Border(
              left: BorderSide(width: 7, color: context.colors.outerBallColor),
              right: BorderSide(width: 2, color: context.colors.outerBallColor),
              top: BorderSide(width: 3, color: context.colors.outerBallColor),
              bottom: BorderSide(width: 3, color: context.colors.outerBallColor)
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: context.colors.outerBallColor.withOpacity(0.5),
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
              context.colors.mediumLayerBallColor.withOpacity(0.5),
              Colors.black.withOpacity(0.5),
              context.colors.mediumLayerBallColor.withOpacity(0.5)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: context.colors.mediumLayerBallColor,
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            context.colors.innerBallColor.withOpacity(0.6),
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.3),
            context.colors.innerBallColor.withOpacity(0.6)
          ],
          begin: const Alignment(-1, 0.4),
          end: const Alignment(1, -0.4),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: context.colors.innerBallColor,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
    );
  }
}

