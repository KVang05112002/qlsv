class SinhVienModel {
  SinhVienModel({
    int? mssv,
    String? hoten,
    String? lop,}){
    _mssv = mssv;
    _hoten = hoten;
    _lop = lop;
  }

  SinhVienModel.fromJson(dynamic json) {
    _mssv = json['mssv'];
    _hoten = json['hoten'];
    _lop = json['lop'];
  }
  int? _mssv;
  String? _hoten;
  String? _lop;

  int? get mssv => _mssv;
  String? get hoten => _hoten;
  String? get lop => _lop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mssv'] = _mssv;
    map['hoten'] = _hoten;
    map['lop'] = _lop;
    return map;
  }

  SinhVienModel copyWith({
    int? mssv,
    String? hovaten,
    String? lop,
  }) {
    return SinhVienModel(
      mssv: mssv ?? this._mssv,
      hoten: hovaten ?? this._hoten,
      lop: lop ?? this._lop,
    );
  }

  @override
  String toString() {
    return 'SinhVienModel{_mssv: $_mssv, _hovaten: $_hoten, _lop: $_lop}';
  }
}