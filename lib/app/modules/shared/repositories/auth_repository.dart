import 'package:flutter_app_slidy/app/modules/shared/repositories/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future getEmailPasswordLogin() {
    // TODO: implement getEmailPasswordLogin
    return null;
  }

  @override
  Future getFacebookLogin() {
    // TODO: implement getFacebookLogin
    return null;
  }

  @override
  Future<FirebaseUser> getGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    return null;
  }

  @override
  Future<FirebaseUser> getUser() {
    // TODO: implement getUser
    return FirebaseAuth.instance.currentUser();
  }

  @override
  Future getLogout() {
    return _auth.signOut();
  }
}
