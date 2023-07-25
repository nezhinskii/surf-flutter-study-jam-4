part of 'magic_ball_cubit.dart';

sealed class MagicBallState {}

class MagicBallInitial implements MagicBallState {}

class MagicBallLoading implements MagicBallState {}

class MagicBallError implements MagicBallState {}

class MagicBallLoaded implements MagicBallState {
  final Prediction message;
  MagicBallLoaded(this.message);
}
