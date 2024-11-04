import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'models/google_sign_in_response_model.dart';

mixin SupabaseLogin {
  final supabase = Supabase.instance.client;

  /// Sign In User with Email and Password
  Future<AuthResponse> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final AuthResponse response = await supabase.auth
          .signInWithPassword(email: email, password: password);

      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// Google Sign In
  Future<GoogleSignInResponseModel> signInWithGoogle(
      {String? webClientID, String? iosClientID}) async {
    try {
      final GoogleSignIn googleSignIn =
          GoogleSignIn(serverClientId: webClientID, clientId: iosClientID);

      final googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final accessToken = googleAuth.accessToken;
        final idToken = googleAuth.idToken;

        if (accessToken == null) {
          throw 'No Access Token found';
        }

        if (idToken == null) {
          throw 'No ID Token Token found';
        }

        final AuthResponse response = await supabase.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: idToken,
            accessToken: accessToken);

        return GoogleSignInResponseModel(
            response: response,
            auth: googleAuth,
            accessToken: accessToken,
            idToken: idToken);
      } else {
        throw 'Google User is null';
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
