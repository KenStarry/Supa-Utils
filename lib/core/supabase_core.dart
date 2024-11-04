part of '../supa_utils.dart';

/// Initialize Supabase
Future<void> initializeSupabase(
    {required String url, required String anonKey}) async =>
    await Supabase.initialize(url: url, anonKey: anonKey);

class SupabaseCore with SupabaseLogin, SupabaseSignUp, SupabaseAdd {

}
