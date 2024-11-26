import 'dien_thoai.dart';
import 'validation_exception.dart';

class HoaDon {
  String _maHD;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _sdtKhachHang;

  HoaDon(this._maHD, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._sdtKhachHang) {
    validateData();
  }

  // Getters
  String get maHD => _maHD;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoai => _dienThoai;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get sdtKhachHang => _sdtKhachHang;

  // Setters với validation
  set maHD(String value) {
    if (!RegExp(r'^HD-\d{3}$').hasMatch(value)) {
      throw ValidationException('Mã hóa đơn phải có định dạng HD-XXX');
    }
    _maHD = value;
  }

  set ngayBan(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw ValidationException('Ngày bán không được sau ngày hiện tại');
    }
    _ngayBan = value;
  }

  set soLuongMua(int value) {
    if (value <= 0) {
      throw ValidationException('Số lượng mua phải lớn hơn 0');
    }
    if (value > _dienThoai.tonKho) {
      throw ValidationException('Số lượng mua vượt quá tồn kho');
    }
    _soLuongMua = value;
  }

  set giaBanThucTe(double value) {
    if (value <= 0) {
      throw ValidationException('Giá bán thực tế phải lớn hơn 0');
    }
    _giaBanThucTe = value;
  }

  set tenKhachHang(String value) {
    if (value.isEmpty) {
      throw ValidationException('Tên khách hàng không được rỗng');
    }
    _tenKhachHang = value;
  }

  set sdtKhachHang(String value) {
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      throw ValidationException('Số điện thoại không hợp lệ');
    }
    _sdtKhachHang = value;
  }

  void validateData() {
    maHD = _maHD;
    ngayBan = _ngayBan;
    soLuongMua = _soLuongMua;
    giaBanThucTe = _giaBanThucTe;
    tenKhachHang = _tenKhachHang;
    sdtKhachHang = _sdtKhachHang;
  }

  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  double tinhLoiNhuanThucTe() {
    return (_giaBanThucTe - _dienThoai.giaNhap) * _soLuongMua;
  }

  @override
  String toString() {
    return '''
    Mã HD: $_maHD
    Ngày bán: $_ngayBan
    Điện thoại: ${_dienThoai.tenDT}
    Số lượng: $_soLuongMua
    Giá bán: $_giaBanThucTe
    Khách hàng: $_tenKhachHang
    SĐT: $_sdtKhachHang
    Tổng tiền: ${tinhTongTien()}
    ''';
  }
}