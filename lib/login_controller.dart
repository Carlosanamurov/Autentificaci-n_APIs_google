import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final _googleSignin = GoogleSignIn();
  var googleAcocount = Rx<GoogleSignInAccount?>(null);
  login() async {
    googleAcocount.value = await _googleSignin.signIn();
  }

  logout() async {
    googleAcocount.value = await _googleSignin.signOut();
  }
}
