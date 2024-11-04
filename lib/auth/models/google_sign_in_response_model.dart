import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleSignInResponseModel {
  final AuthResponse response;
  final GoogleSignInAuthentication auth;
  final String? accessToken;
  final String? idToken;

  GoogleSignInResponseModel(
      {required this.response,
      required this.auth,
      required this.accessToken,
      required this.idToken});
}
