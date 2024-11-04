part of '../supa_utils.dart';

mixin SupabaseInsert {
  final supabase = Supabase.instance.client;

  /// Insert a Record
  Future<void> insertSingleRecord(
      {required String tableName, required Map<String, dynamic> value}) async {
    final data = await supabase.from(tableName).insert(value);

    return data;
  }
}
