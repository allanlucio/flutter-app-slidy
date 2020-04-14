import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_slidy/app/modules/shared/repositories/auth_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  FirebaseUser user;

  @observable
  AuthStatus status = AuthStatus.loading;

  @action
  setUser(FirebaseUser value) {
    user = value;
    status = user == null ? AuthStatus.logout : AuthStatus.login;
  }

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }
  @action
  Future loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
  }

  @action
  Future logOut() {
    return _authRepository.getLogout();
  }
}

enum AuthStatus { loading, login, logout }
