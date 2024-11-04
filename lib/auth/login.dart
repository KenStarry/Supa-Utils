part of '../supa_utils.dart';

mixin SupabaseLogin {
  final supabase = Supabase.instance.client;

  /// Initialize Supabase
  Future<void> initializeSupabase(
      {required String url, required String anonKey}) async =>
      await Supabase.initialize(url: url, anonKey: anonKey);

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

  /// Google Sign In on Web, Desktop
  Future<bool> signInWithGoogleWebAndDesktop({String? redirectLink}) async {
    try {
      final bool isSignedIn = await supabase.auth.signInWithOAuth(
          OAuthProvider.google,
          redirectTo: kIsWeb ? null : redirectLink,
          authScreenLaunchMode: kIsWeb
              ? LaunchMode.platformDefault
              : LaunchMode.externalApplication);

      return isSignedIn;
    } catch (error) {
      throw Exception(error);
    }
  }
}
