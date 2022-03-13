import 'package:equatable/equatable.dart';
import 'package:qlsv/sinhvien/SinhVienModel.dart';

abstract class SinhVienState extends Equatable {
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return 'SinhVienState{}';
  }
}

//khoi tao
class SinhVienInitialState extends SinhVienState {
  @override
  String toString() {
    return 'SinhVienInitialState{}';
  }
}

class SinhVienSuccessState extends SinhVienState {
  final List<SinhVienModel> lstSinhVien;
  SinhVienSuccessState(this.lstSinhVien);
}

class SinhVienFailureState extends SinhVienState {
  final String message;

  SinhVienFailureState(this.message);
}
