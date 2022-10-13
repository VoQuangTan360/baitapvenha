class GiaoVien
    attr_accessor :hoTen, attr_accessor :tuoi, attr_accessor :queQuan, attr_accessor :maGiaoVien,attr_accessor :lgCung, attr_accessor :lgThuong, attr_accessor :tienPhat, attr_accessor :lgThucLinh

    def initialize(hoTen, tuoi, queQuan, maGiaoVien, lgCung, lgThuong, tienPhat, lgThucLinh)
        @hoTen = hoTen
        @tuoi = tuoi
        @queQuan = queQuan
        @maGiaoVien = maGiaoVien
        @lgCung = lgCung
        @lgThuong = lgThuong
        @tienPhat = tienPhat
        @lgThucLinh = lgThucLinh
    end

    def hienThiThongTin()
        puts("-- Họ tên: #{@hoTen} - Tuổi: #{@tuoi} - Quê quán: #{@queQuan} - Mã giáo viên: #{@maGiaoVien} - Lương cứng: #{lgCung} - Lương thưởng: #{lgThuong} - Tiền phạt: #{@tienPhat} - Lương thực lĩnh: #{@lgThucLinh}")
    end
end
class QuanLyGiaoVien
    def initialize
    end

    def themMoi(giaoVienS, giaoVien)
        giaoVienS.push(giaoVien)
    end

    def checkMaGiaoVien(giaoVienS, key)
        for giaoVien in giaoVienS do
            if giaoVien.maGiaoVien == key
                return true
            end
        end
    end

    def hienThiDanhSach(giaoVienS)
        a = giaoVienS.uniq {|giaoVien| giaoVien.maGiaoVien}
        for giaoVien in a do
            giaoVien.hienThiThongTin()
        end
    end

    def xoa(giaoVienS, key)
        gv = giaoVienS.select{|giaoVien| giaoVien.maGiaoVien == key}
        if (gv.length != 0)
            giaoVienS.delete_if{|giaoVien| giaoVien.maGiaoVien == key}
            puts("Xóa thành công! Bạn có thể xem lại danh sách tài liệu ở công việc số 3!")      
        else
            puts("Không tìm thấy mã giáo viên phù hợp!")
        end
    end
end
quanLyGiaoVien = QuanLyGiaoVien.new
giaoVienS = []

while(true)
    puts("---- QUẢN LÝ GIÁO VIÊN ----")
    puts("1. Thêm mới thông tin giáo viên")
    puts("2. Xóa thông tin giáo viên theo mã giáo viên")
    puts("3. Hiển thị thông tin giáo viên")
    puts("4. Thoát khỏi chương trình")
    puts("-- Chọn công việc: ")
    cv = gets.to_i

    case cv
        when 1
            puts("== 1. Thêm mới thông tin giáo viên ==")
            puts("*Nhập họ và tên: ")
            hoTen = gets.to_s
            puts("*Nhập tuổi: ")
            tuoi = gets.to_i
            puts("*Nhập quê quán: ")
            queQuan = gets.to_s
            puts("*Nhập mã giáo viên: ")
            maGiaoVien = gets.to_s
            while (quanLyGiaoVien.checkMaGiaoVien(giaoVienS, maGiaoVien) == true)
                puts("Mã giáo viên đã tồn tại! Nhập lại: ")
                maGiaoVien = gets.to_s
            end
            puts("*Nhập lương cứng: ")
            lgCung = gets.to_i
            puts("*Nhập lương thưởng: ")
            lgThuong = gets.to_i
            puts("*Nhập tiền phạt: ")
            tienPhat = gets.to_i
            lgThucLinh = lgCung + lgThuong - tienPhat
            giaoVien = GiaoVien.new(hoTen, tuoi, queQuan, maGiaoVien, lgCung, lgThuong, tienPhat, lgThucLinh)
            quanLyGiaoVien.themMoi(giaoVienS, giaoVien)
        when 2
            puts("== 2. Xóa thông tin giáo viên theo mã giáo viên ==")
            puts("*Nhập mã giáo viên muốn xóa: ")
            key = gets.to_s
            quanLyGiaoVien.xoa(giaoVienS, key)
        when 3
            puts("== 3. Hiển thị thông tin giáo viên ==")
            if(giaoVienS.length != 0)
                puts("** Danh sách giáo viên **")
                quanLyGiaoVien.hienThiDanhSach(giaoVienS)
            else
                puts("Không có giáo viên nào!")
            end
        when 4
            puts("== 4. Thoát khỏi chương trình ==")
            puts("Hẹn gặp lại!")
            return
        else
            puts("Không hợp lệ!")
    end
end