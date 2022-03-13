import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:qlsv/sinhvien/SinhVienModel.dart';
import 'package:qlsv/sinhvien/sinhvienenvents.dart';
import 'package:qlsv/sinhvien/sinhvienrepository.dart';
import 'package:qlsv/sinhvien/sinhvienstates.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

class SinhVienBloc extends Bloc<SinhVienEvent, SinhVienState> {
  static const _thoigian = Duration(seconds: 1);

  SinhVienBloc(SinhVienState initialState) : super(initialState) {
    on<SinhVienGetAllEvent>(_onSinhVienGetAll,
        transformer: blockevent(_thoigian));
  }
  EventTransformer<E> blockevent<E>(Duration duration) {
    return (events, mapper) {
      return droppable<E>().call(events.throttle(duration), mapper);
    };
  }

  final SinhVienRepository _repository = SinhVienRepository();

  Future<void> _onSinhVienGetAll(
      SinhVienGetAllEvent event, Emitter<SinhVienState> emit) async {
    try {
      final List<SinhVienModel> lstSinhVien = await _repository.getAll();
      emit(SinhVienSuccessState(lstSinhVien));
    }
    catch (exception)
    {
      emit(SinhVienFailureState(exception.toString()));
    }
  }
}