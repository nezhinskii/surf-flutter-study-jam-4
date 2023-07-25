import 'package:bloc/bloc.dart';
import 'package:surf_practice_magic_ball/domain/model/prediction.dart';
import 'package:surf_practice_magic_ball/domain/repositories/magic_ball_repository.dart';

part 'magic_ball_state.dart';

class MagicBallCubit extends Cubit<MagicBallState> {
  MagicBallCubit(this.magicBallRepository) : super(MagicBallInitial());

  MagicBallRepository magicBallRepository;

  void getPrediction() async {
    if (state is MagicBallLoading){
      return;
    }
    emit(MagicBallLoading());
    try{
      Prediction prediction = await magicBallRepository.getPrediction();
      emit(MagicBallLoaded(prediction));
    } on Exception catch(_){
      emit(MagicBallError());
    }
  }

}
