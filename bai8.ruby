class SinhVien
    attr_accessor :hoTen, attr_accessor :tuoi, attr_accessor :lop
    
    def initialize(hoTen, tuoi, lop)
        @hoTen = hoTen
        @tuoi = tuoi
        @lop = lop
    end
end
class TheMuon < SinhVien
    attr_accessor :maPhieuMuon
    attr_accessor :ngayMuon
    attr_accessor :hanTra
    attr_accessor :soHieuSach

    def initialize(hoTen, tuoi, lop, maPhieuMuon, ngayMuon, hanTra, soHieuSach)
        super(hoTen, tuoi, lop)
        @maPhieuMuon = maPhieuMuon
        @ngayMuon = ngayMuon
        @hanTra = hanTra
        @soHieuSach = soHieuSach
    end

    def hienThiThongTin()
        puts("-- Họ tên: #{@hoTen} - Tuổi: #{@tuoi} - Lớp: #{lop} - Mã phiếu mượn: #{@maPhieuMuon} - Ngày mượn: #{@ngayMuon} - Hạn trả: #{@hanTra} - Số hiệu sách: #{@soHieuSach}")
    end
end
class QuanLyMuonSach
    def initialize
        
    end

    def themMoi(theMuonS, theMuon)
        theMuonS.push(theMuon)
    end

    def checkMaPhieuMuon(theMuonS, key)
        for theMuon in theMuonS do
            if theMuon.maPhieuMuon == key
                return true
            end
        end
    end

    def xoa(theMuonS, key)
        tm = theMuonS.select{|theMuon| theMuon.maPhieuMuon == key}
        if (tm.length() != 0)
            theMuonS.delete_if{|theMuon| theMuon.maPhieuMuon == key}
            puts("Xóa thành công! Bạn có thể xem lại danh sách thẻ mượn ở công việc 3!")
        else
            puts("Không tồn tại mã phiếu mượn này!")
        end
    end

    def hienThiDanhSach(theMuonS)
        if (theMuonS.length() != 0)
            puts("** Danh sách phiếu mượn **")
            for theMuon in theMuonS do
                theMuon.hienThiThongTin()
            end
        else
            puts("Không có phiếu mượn nào!")
        end
    end
end
quanLyMuonSach = QuanLyMuonSach.new
theMuonS = []

while(true)
    puts("---- QUẢN LÝ THẺ MƯỢN ----")
    puts("1. Thêm mới thẻ mượn")
    puts("2. Xóa thẻ mượn theo mã phiếu mượn")
    puts("3. Hiển thị danh sách phiếu mượn")
    puts("4. Thoát khỏi chương trình")
    puts("-- Chọn công việc: ")
    cv = gets.to_i

    case cv
        when 1
            puts("== 1. Thêm mới thẻ mượn ==")
            puts("*Nhập họ tên người mượn: ")
            hoTen = gets.to_s
            puts("*Nhập tuổi: ")
            tuoi = gets.to_i
            puts("*Nhập lớp: ")
            lop = gets.to_s
            puts("*Nhập mã phiếu mượn: ")
            maPhieuMuon = gets.to_s
            while (quanLyMuonSach.checkMaPhieuMuon(theMuonS, maPhieuMuon) == true)
                puts("Mã phiếu mượn đã tồn tại! Nhập lại: ")
                maPhieuMuon = gets.to_s
            end
            puts("*Nhập ngày mượn: ")
            ngayMuon = gets.to_i
            puts("Nhập hạn trả: ")
            hanTra = gets.to_i
            puts("Nhập số hiệu sách: ")
            soHieuSach = gets.to_s
            theMuon = TheMuon.new(hoTen, tuoi, lop, maPhieuMuon, ngayMuon, hanTra, soHieuSach)
            quanLyMuonSach.themMoi(theMuonS, theMuon)
        when 2
            puts("== 2. Xóa thẻ mượn theo mã phiếu mượn ==")
            puts("*Nhập mã phiếu mượn muốn xóa: ")
            key = gets.to_s
            quanLyMuonSach.xoa(theMuonS, key)
        when 3
            puts("== 3. Hiển thị danh sách phiếu mượn ==")
            quanLyMuonSach.hienThiDanhSach(theMuonS)
        when 4
            puts("== 4. Thoát khỏi chương trình ==")
            puts("Hẹn gặp lại!")
            return
        else
            puts("Không hợp lệ!")

    end
end