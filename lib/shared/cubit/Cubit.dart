// ignore: avoid_web_libraries_in_flutter


//import "package:bottom_navigation_bar/Shared/cubit/states.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cach%20helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

   bool isDark=false;

  void changeAppMode({ bool? fromShared})
  {
    if(fromShared !=null){
      isDark =fromShared;
      emit(AppChangeModeState());
    }
    else{
      isDark =!isDark;
      CachHelper.putBool(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }

  }

}
