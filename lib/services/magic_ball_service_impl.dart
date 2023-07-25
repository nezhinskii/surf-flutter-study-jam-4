import 'package:dio/dio.dart';

import 'package:surf_practice_magic_ball/data/services/magic_ball_service.dart';

class MagicBallServiceImpl implements MagicBallService{
  final Dio dio;
  static const _baseUrl = "https://eightballapi.com/api";
  MagicBallServiceImpl(this.dio);

  @override
  Future<String> getPrediction() async {
    final response = await dio.get(_baseUrl);
    return (response.data as Map <String, dynamic>)["reading"];
  }
}