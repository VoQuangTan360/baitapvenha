class Nguoi
    attr_accessor :hoTen, :tuoi, :cmnd, :loaiPhong, :soNgayThue

    def initialize(hoTen, tuoi, cmnd, loaiPhong, soNgayThue)
        @hoTen = hoTen
        @tuoi = tuoi
        @cmnd = cmnd
        @loaiPhong = loaiPhong
        @soNgayThue = soNgayThue
    end

    def hienThi()
        puts("==================")
        puts("- Họ và tên: #{@hoTen} - Tuổi: #{@tuoi} - CMND: #{@cmnd} - Số ngày thuế: #{@soNgayThue} #{@loaiPhong.hienThi()} ")
    end
end
class Phong
    attr_accessor :loai, :gia

    def initialize(loai, gia)
        @loai = loai
        @gia = gia
    end
end
class PhongA < Phong
    def initialize()
        super("A", 500)
    end

    def hienThi()
        puts("- Phong A: {Loai phong: #{@loai} - Gia phong: #{@gia}}")
    end
end
class PhongB < Phong
    def initialize()
        super("B", 300)
    end

    def hienThi()
        puts("- Phong B: {Loai phong: #{@loai} - Gia phong: #{@gia}}")
    end
end
class PhongC < Phong
    def initialize()
        super("C", 100)
    end

    def hienThi()
        puts("- Phong C: {Loai phong: #{@loai} - Gia phong: #{@gia}}")
    end
end
class KhachSan
    attr_accessor :nguoiS

    def initialize(nguoiS)
        @nguoiS = nguoiS
    end

    def themMoi(nguoiS, nguoi)
        @nguoiS.push(nguoi)
    end

    def hienThiDanhSach()
        if(nguoiS.length() != 0)
            puts("** Danh sách khách hàng **")
            nguoiS.each do |nguoi|
                nguoi.hienThi()
            end
        else
            puts("Không có khách hàng nào!")
        end 
    end

    def xoa(nguoiS, key)
        ng = nguoiS.select{|nguoi| nguoi.cmnd == key}
       
        if (ng.length() != 0)
            nguoiS.delete_if{|nguoi| nguoi.cmnd == key}
            puts("Xóa thành công! Danh sách khách hàng lúc này đã được cập nhật!")
        else
            puts("Không tồn tại CMND này!")
        end
    end

    def tinhTienPhong(nguoiS, key)
        ng = nguoiS.select{|nguoi| nguoi.cmnd == key}
        if (ng.length() != 0)
            for n in ng do
                tien = n.soNgayThue * n.loaiPhong.gia
                puts("-- Tiền thuê phòng của khách hàng này: #{tien}")
            end
        else
            puts("Không tồn tại CMND này!")
        end
    end
end
nguoiS = []

while (true)
    puts("---- QUẢN LÝ KHÁCH SẠN ----")
    puts("1. Thêm mới khách hàng")
    puts("2. Hiển thị thông tin khách hàng")
    puts("3. Xóa khách hàng theo chứng minh nhân dân")
    puts("4. Tính tiền thuê phòng theo chứng minh nhân dân")
    puts("5. Thoát khỏi chương trình")
    puts("-- Chọn công việc: ")
    cv = gets.to_i

    case cv
        when 1
            puts("== 1. Thêm mới khách hàng ==")
            puts("*Nhập họ và tên: ")
            hoTen = gets.to_s
            puts("*Nhập tuổi: ")
            tuoi = gets.to_i
            puts("*Nhập CMND: ")
            cmnd = gets
            puts("*Nhập loại phòng: ")
            puts("1. Phòng loại A")
            puts("2. Phòng loại B")
            puts("3. Phòng loại C")
            a = gets.to_i
            case a
                when 1
                    phong = PhongA.new()
                when 2
                    phong = PhongB.new()
                when 3
                    phong = PhongC.new()
                else
                    puts("Không hợp lệ!")
            end
            puts("*Nhập số ngày thuê: ")
            soNgayThue = gets.to_i
            nguoi = Nguoi.new(hoTen, tuoi, cmnd, phong, soNgayThue)
            khachSan = KhachSan.new(nguoiS)
            khachSan.themMoi(nguoiS, nguoi)
        when 2
            puts("== 2. Hiển thị thông tin khách hàng ==")
            khachSan.hienThiDanhSach()
        when 3
            puts("== 3. Xóa khách hàng theo chứng minh nhân dân ==")
            puts("*Nhập CMND của khách hàng: ")
            key = gets
            khachSan.xoa(nguoiS, key)
        when 4
            puts("== 4. Tính tiền thuê phòng theo chứng minh nhân dân ==")
            puts("*Nhập CMND của khách hàng: ")
            key = gets
            khachSan.tinhTienPhong(nguoiS, key)
        when 5
            puts("== 5. Thoát khỏi chương trình ==")
            return
        else
            puts("Không hợp lệ!")
    end
end