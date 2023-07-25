import 'package:surf_practice_magic_ball/domain/model/prediction.dart';
import 'package:surf_practice_magic_ball/domain/repositories/magic_ball_repository.dart';

class MagicBallRepositoryImpl implements MagicBallRepository{
  @override
  Future<Prediction> getPrediction() async {
    Prediction prediction = await _mockedData();
    return prediction;
  }

  Future<Prediction> _mockedData() =>
      Future.delayed(const Duration(seconds: 1), () => "Сомнительно",);
}