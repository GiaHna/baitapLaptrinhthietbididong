import 'dien_thoai.dart';
import 'hoa_don.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDT;
  List<HoaDon> _danhSachHD;

  CuaHang(this._tenCuaHang, this._diaChi)
      : _danhSachDT = [],
        _danhSachHD = [];

  // Quản lý điện thoại
  void themDienThoai(DienThoai dt) {
    if (_danhSachDT.any((d) => d.maDT == dt.maDT)) {
      throw Exception('Mã điện thoại đã tồn tại');
    }
    _danhSachDT.add(dt);
  }

  void capNhatDienThoai(DienThoai dt) {
    var index = _danhSachDT.indexWhere((d) => d.maDT == dt.maDT);
    if (index == -1) {
      throw Exception('Không tìm thấy điện thoại');
    }
    _danhSachDT[index] = dt;
  }

  void ngungKinhDoanh(String maDT) {
    var dt = _danhSachDT.firstWhere((d) => d.maDT == maDT);
    dt.dangKinhDoanh = false;
  }

  List<DienThoai> timKiemDienThoai({String? maDT, String? ten, String? hang}) {
    return _danhSachDT.where((dt) {
      if (maDT != null && dt.maDT != maDT) return false;
      if (ten != null && !dt.tenDT.toLowerCase().contains(ten.toLowerCase())) {
        return false;
      }
      if (hang != null && !dt.hangSX.toLowerCase().contains(hang.toLowerCase())) {
        return false;
      }
      return true;
    }).toList();
  }

  // Quản lý hóa đơn
  void taoHoaDon(HoaDon hd) {
    // Kiểm tra và cập nhật tồn kho
    var dt = hd.dienThoai;
    if (!dt.coTheBan()) {
      throw Exception('Điện thoại không thể bán');
    }
    dt.tonKho -= hd.soLuongMua;
    _danhSachHD.add(hd);
  }

  List<HoaDon> timKiemHoaDon({
    String? maHD,
    DateTime? ngay,
    String? tenKH,
  }) {
    return _danhSachHD.where((hd) {
      if (maHD != null && hd.maHD != maHD) return false;
      if (ngay != null &&
          !hd.ngayBan.isAtSameMomentAs(DateTime(ngay.year, ngay.month, ngay.day))) {
        return false;
      }
      if (tenKH != null &&
          !hd.tenKhachHang.toLowerCase().contains(tenKH.toLowerCase())) {
        return false;
      }
      return true;
    }).toList();
  }

  // Thống kê
  double tinhDoanhThu(DateTime from, DateTime to) {
    return _danhSachHD
        .where((hd) =>
            hd.ngayBan.isAfter(from) &&
            hd.ngayBan.isBefore(to.add(Duration(days: 1))))
        .fold(0, (sum, hd) => sum + hd.tinhTongTien());
  }

  double tinhLoiNhuan(DateTime from, DateTime to) {
    return _danhSachHD
        .where((hd) =>
            hd.ngayBan.isAfter(from) &&
            hd.ngayBan.isBefore(to.add(Duration(days: 1))))
        .fold(0, (sum, hd) => sum + hd.tinhLoiNhuanThucTe());
  }

  List<MapEntry<DienThoai, int>> thongKeTopBanChay() {
    var map = <DienThoai, int>{};
    for (var hd in _danhSachHD) {
      map[hd.dienThoai] = (map[hd.dienThoai] ?? 0) + hd.soLuongMua;
    }
    var list = map.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return list;
  }

  void inThongKeTonKho() {
    print('\nThống kê tồn kho:');
    for (var dt in _danhSachDT) {
      print('${dt.tenDT}: ${dt.tonKho} chiếc');
    }
  }
}