import 'package:surf_practice_magic_ball/domain/model/prediction.dart';

abstract interface class MagicBallRepository{
  Future<Prediction> getPrediction();
}