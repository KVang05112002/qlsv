import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:qlsv/sinhvien/SinhVienModel.dart';

abstract class SinhVienEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SinhVienGetAllEvent extends SinhVienEvent {}

class SinhVienGetEvent extends SinhVienEvent {
  final int mssv;

  SinhVienGetEvent(this.mssv);
}

//cap nhat sua doi chung 1 sk
class SinhVienUpdateCreateEvent extends SinhVienEvent {
  final SinhVienModel item;
  final bool isEdit;
  SinhVienUpdateCreateEvent(this.item, this.isEdit);
}

class SinhVienDeleteEvent extends SinhVienEvent {
  final SinhVienModel item;
  SinhVienDeleteEvent(this.item);
}
