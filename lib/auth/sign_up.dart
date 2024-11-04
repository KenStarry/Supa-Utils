part of '../supa_utils.dart';

mixin SupabaseSignUp {
  final supabase = Supabase.instance.client;

  /// Sign Up User
  Future<AuthResponse> signUp(
      {required String email, required String password}) async {
    try {
      final AuthResponse response =
          await supabase.auth.signUp(email: email, password: password);

      return response;
    } catch (error) {
      throw Exception(error);
    }
  }
}
