// import 'package:flutter/material.dart';
import 'package:flutter_application_2/Cubits/lang_change/changeLangState.dart';
import 'package:flutter_application_2/Model/Shared_preference.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLangCubit extends Cubit<ChangeLangState> {
  ChangeLangCubit() : super(ChangeLangInitState());
  String? lang = 'ar';
  bool trigger = true;
  static ChangeLangCubit get(context) => BlocProvider.of(context);
  void changeLang() async {
    trigger == true ? lang = 'en' : lang = 'ar';
    trigger = !trigger;
    await SharedPref.saveLang(lang!);
    emit(ChangeLanguageState());
  }
}
