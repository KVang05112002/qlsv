import 'dart:convert';

import 'package:qlsv/sinhvien/SinhVienModel.dart';

import '../service/service.dart';

class SinhVienRepository{
  static SinhVienRepository? _instance;
  final apiURL = 'api/read.php';
  SinhVienRepository._();

  factory SinhVienRepository() => _instance ??= SinhVienRepository._();
  Future<List<SinhVienModel>> getAll() async {

    try {
      var result = await getData(apiURL);
      final data = json.decode(result) as List;
      return data.map((raw) {
        return SinhVienModel(
          mssv: raw['mssv'] as int?,
          hoten: raw['hoten'] as String?,
          lop: raw['lop'] as String?,
        );
      }).toList();
    } catch (exception) {
      throw Exception(exception.toString() + "(getAll)");
    }
  }
}