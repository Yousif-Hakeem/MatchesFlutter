import 'package:flutter_application_2/Cubits/nav_Bar/navBar_States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:path/path.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(NavBarInitState());

  static NavBarCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  switchScreens(int index) {
    currentIndex = index;
    emit(NavBarSwitchState());
  }
}
