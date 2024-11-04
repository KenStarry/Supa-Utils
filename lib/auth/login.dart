import 'package:supabase_flutter/supabase_flutter.dart';

mixin SupabaseLogin {
  final supabase = Supabase.instance.client;

  /// Sign In User with Email and Password
  Future<AuthResponse> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final AuthResponse response =
      await supabase.auth.signInWithPassword(email: email, password: password);

      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// Google Sign In
}

