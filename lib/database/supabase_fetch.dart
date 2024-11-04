import 'package:supabase_flutter/supabase_flutter.dart';

mixin SupabaseFetch {
  final supabase = Supabase.instance.client;

  /// Fetch Table Data
  Future<List<Map<String, dynamic>>> fetchAllTableData(
      {required String tableName}) async {
    try {
      final data = await supabase.from(tableName).select();

      return data;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// Fetch Table Data With Filter
  Future<List<Map<String, dynamic>>> fetchTableDataWithFilter(
      {required String tableName,
      required String columnName,
      required String value}) async {
    try {
      final data =
          await supabase.from(tableName).select().eq(columnName, value);

      return data;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// Fetch Table Data With a Limit
  Future<List<Map<String, dynamic>>> fetchTableDataWithLimit(
      {required String tableName, required int count}) async {
    try {
      final data = await supabase.from(tableName).select().limit(count);

      return data;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// Fetch Table Data Within a Range
  Future<List<Map<String, dynamic>>> fetchTableDataWithinRange(
      {required String tableName, required int from, required int to}) async {
    try {
      final data = await supabase.from(tableName).select().range(from, to);

      return data;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// Fetch Table Data with Specific Columns
  Future<List<Map<String, dynamic>>> fetchTableDataFromColumns(
      {required String tableName, required String columns}) async {
    try {
      final data = await supabase.from(tableName).select(columns);

      return data;
    } catch (error) {
      throw Exception(error);
    }
  }
}
