import 'package:flutter_application_2/Cubits/followers_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:path/path.dart';

class FollowersCubit extends Cubit<FollowersStates> {
  FollowersCubit() : super(FollowesInitState());

  static FollowersCubit get(context) => BlocProvider.of(context);
  int followCounter = 0;
  increaseFollwers() {
    followCounter++;
    emit(FollowersIncreaseState());
  }
}
