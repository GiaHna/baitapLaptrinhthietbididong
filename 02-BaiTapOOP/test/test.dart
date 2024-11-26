import '../models/cua_hang.dart';
import '../models/dien_thoai.dart';
import '../models/hoa_don.dart';

void main() {
  // Khởi tạo cửa hàng
  var cuaHang = CuaHang('Mobile Store', '123 Đường ABC');

  try {
    // Test thêm điện thoại
    var dt1 = DienThoai('DT-001', 'iPhone 13', 'Apple', 20000000, 25000000, 10, true);
    var dt2 = DienThoai('DT-002', 'Samsung S21', 'Samsung', 15000000, 19000000, 15, true);
    var dt3 = DienThoai('DT-003', 'Xiaomi 12', 'Xiaomi', 10000000, 13000000, 20, true);

    cuaHang.themDienThoai(dt1);
    cuaHang.themDienThoai(dt2);
    cuaHang.themDienThoai(dt3);
    print('Đã thêm 3 điện thoại thành công\n');

    // Test tìm kiếm điện thoại
    print('Tìm kiếm điện thoại Samsung:');
    var ketQuaTimKiem = cuaHang.timKiemDienThoai(hang: 'Samsung');
    for (var dt in ketQuaTimKiem) {
      print(dt);
    }

    // Test tạo hóa đơn
    var hoaDon1 = HoaDon(
      'HD-001',
      DateTime.now(),
      dt1,
      2,
      24000000,
      'Nguyễn Văn A',
      '0123456789',
    );

    var hoaDon2 = HoaDon(
      'HD-002',
      DateTime.now(),
      dt2,
      1,
      18500000,
      'Trần Thị B',
      '0987654321',
    );

    cuaHang.taoHoaDon(hoaDon1);
    cuaHang.taoHoaDon(hoaDon2);
    print('Đã tạo 2 hóa đơn thành công\n');

    // Test tìm kiếm hóa đơn
    print('Tìm kiếm hóa đơn theo tên khách hàng:');
    var dsHoaDon = cuaHang.timKiemHoaDon(tenKH: 'Nguyễn');
    for (var hd in dsHoaDon) {
      print(hd);
    }

    // Test thống kê
    var now = DateTime.now();
    var startDate = DateTime(now.year, now.month, 1);
    var endDate = DateTime(now.year, now.month + 1, 0);

    print('\nThống kê tháng hiện tại:');
    print('Doanh thu: ${cuaHang.tinhDoanhThu(startDate, endDate)}');
    print('Lợi nhuận: ${cuaHang.tinhLoiNhuan(startDate, endDate)}');

    print('\nTop điện thoại bán chạy:');
    var topBanChay = cuaHang.thongKeTopBanChay();
    for (var entry in topBanChay) {
      print('${entry.key.tenDT}: ${entry.value} chiếc');
    }

    cuaHang.inThongKeTonKho();

    // Test ngừng kinh doanh
    cuaHang.ngungKinhDoanh('DT-001');
    print('\nĐã ngừng kinh doanh iPhone 13');
    print('Có thể bán iPhone 13? ${dt1.coTheBan()}');

  } catch (e) {
    print('Lỗi: $e');
  }

  // Test các trường hợp lỗi
  print('\nTest các trường hợp lỗi:');
  try {
    // Test thêm điện thoại với mã trùng
    var dtLoi = DienThoai('DT-001', 'Test', 'Test', 1000000, 1500000, 5, true);
    cuaHang.themDienThoai(dtLoi);
  } catch (e) {
    print('Lỗi thêm điện thoại trùng mã: $e');
  }

  try {
    // Test tạo điện thoại với giá bán <= giá nhập
    var dtLoi = DienThoai('DT-004', 'Test', 'Test', 1000000, 900000, 5, true);
  } catch (e) {
    print('Lỗi giá bán <= giá nhập: $e');
  }

  try {
    // Test tạo hóa đơn với số lượng > tồn kho
    var dt = cuaHang.timKiemDienThoai(maDT: 'DT-002')[0];
    var hdLoi = HoaDon(
      'HD-003',
      DateTime.now(),
      dt,
      100,  // Số lượng lớn hơn tồn kho
      18500000,
      'Test',
      '0123456789',
    );
    cuaHang.taoHoaDon(hdLoi);
  } catch (e) {
    print('Lỗi số lượng mua > tồn kho: $e');
  }
}