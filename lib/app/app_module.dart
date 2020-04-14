import 'package:flutter_app_slidy/app/modules/login/login_module.dart';
import 'package:flutter_app_slidy/app/pages/splash/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_slidy/app/app_controller.dart';
import 'package:flutter_app_slidy/app/pages/splash/splash_page.dart';
import 'package:flutter_app_slidy/app/utils/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_slidy/app/app_widget.dart';
import 'package:flutter_app_slidy/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_,args) => SplashPage()),
        Router('/login', module: LoginModule()),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
