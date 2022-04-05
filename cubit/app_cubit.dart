import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/home/Home.dart';
import '../../modules/search/search.dart';
import '../../modules/settings/settings.dart';
import '../../shared/network/cache_helper.dart';
import 'appstates.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialApp());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;

  void changeAppMode({bool? Dark}) {
    if (Dark != null) {
      isDark = Dark;
      emit(NewsChangeAppTheme());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', val: isDark).then((value) {
        emit(NewsChangeAppTheme());
      });
    }
  }
}
