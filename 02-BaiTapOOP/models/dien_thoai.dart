import 'validation_exception.dart';

class DienThoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _tonKho;
  bool _dangKinhDoanh;

  DienThoai(this._maDT, this._tenDT, this._hangSX, this._giaNhap, this._giaBan,
      this._tonKho, this._dangKinhDoanh) {
    validateData();
  }

  // Getters
  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get tonKho => _tonKho;
  bool get dangKinhDoanh => _dangKinhDoanh;

  // Setters với validation
  set maDT(String value) {
    if (!RegExp(r'^DT-\d{3}$').hasMatch(value)) {
      throw ValidationException('Mã điện thoại phải có định dạng DT-XXX');
    }
    _maDT = value;
  }

  set tenDT(String value) {
    if (value.isEmpty) {
      throw ValidationException('Tên điện thoại không được rỗng');
    }
    _tenDT = value;
  }

  set hangSX(String value) {
    if (value.isEmpty) {
      throw ValidationException('Hãng sản xuất không được rỗng');
    }
    _hangSX = value;
  }

  set giaNhap(double value) {
    if (value <= 0) {
      throw ValidationException('Giá nhập phải lớn hơn 0');
    }
    _giaNhap = value;
  }

  set giaBan(double value) {
    if (value <= _giaNhap) {
      throw ValidationException('Giá bán phải lớn hơn giá nhập');
    }
    _giaBan = value;
  }

  set tonKho(int value) {
    if (value < 0) {
      throw ValidationException('Số lượng tồn kho không được âm');
    }
    _tonKho = value;
  }

  set dangKinhDoanh(bool value) {
    _dangKinhDoanh = value;
  }

  void validateData() {
    maDT = _maDT;
    tenDT = _tenDT;
    hangSX = _hangSX;
    giaNhap = _giaNhap;
    giaBan = _giaBan;
    tonKho = _tonKho;
  }

  double tinhLoiNhuanDuKien() {
    return _giaBan - _giaNhap;
  }

  bool coTheBan() {
    return _tonKho > 0 && _dangKinhDoanh;
  }

  @override
  String toString() {
    return '''
    Mã ĐT: $_maDT
    Tên: $_tenDT
    Hãng: $_hangSX
    Giá nhập: $_giaNhap
    Giá bán: $_giaBan
    Tồn kho: $_tonKho
    Đang kinh doanh: $_dangKinhDoanh
    ''';
  }
}