class Nguoi
    attr_accessor :hoTen, :tuoi, :ngheNghiep, :cmnd

    def initialize(hoTen, tuoi, ngheNghiep, cmnd)
        @hoTen = hoTen
        @tuoi = tuoi
        @ngheNghiep = ngheNghiep
        @cmnd = cmnd
    end

    def hienThiThongTin()
        puts("- Họ và tên: #{@hoTen} - Tuổi: #{@tuoi} - Nghề nghiệp: #{@ngheNghiep} - CMND: #{@cmnd}")
    end
end
class HoGiaDinh
    attr_accessor :soNha

    def initialize(soNha, nguoiS)
        @soNha = soNha
        @nguoiS = nguoiS
    end

    def hienThiThongTin()
        for nguoi in @nguoiS do
            puts("- Số nhà: #{@soNha}")
            nguoi.hienThiThongTin
        end
    end
end
class KhuPho
    attr_accessor :hoGiaDinhS

    def initialize(hoGiaDinhS)
        @hoGiaDinhS = hoGiaDinhS
    end

    def themMoi(hoGiaDinhS, hoGiaDinh)
        @hoGiaDinhS.push(hoGiaDinh)
    end

    def hienThiThongTin()
        puts("== Danh sách hộ dân ==")
        hoGiaDinhS.each do |hoGiaDinh|
            puts("----------------------")
            hoGiaDinh.hienThiThongTin
          end
    end
end
hoGiaDinhS = []

puts("== QUẢN LÝ CÁC HỘ DÂN CƯ ==")
puts("*Nhập số hộ dân: ")
n = gets.to_i

for i in 1..n do
    puts("-- Nhập thông tin hộ dân số #{i} --")
    puts("- Nhập số nhà: ")
    soNha = gets.to_s
    puts("*Nhập số thành viên trong gia đình: ")
    tv = gets.to_i

    dsThanhVien = []
    for a in 1..tv do
        puts("-- Nhập thông tin cá nhân thành viên #{a} --")
        puts("- Nhập họ và tên: ")
        hoTen = gets.to_s
        puts("- Nhập tuổi: ")
        tuoi = gets.to_i
        puts("- Nhập nghề nghiệp: ")
        ngheNghiep = gets.to_s
        puts("- Nhập CMND: ")
        cmnd = gets.to_s
        thanhVien = Nguoi.new(hoTen, tuoi, ngheNghiep, cmnd)
        dsThanhVien.push(thanhVien)
    end
    hoGiaDinh = HoGiaDinh.new(soNha, dsThanhVien)
    khuPho = KhuPho.new(hoGiaDinhS)
    khuPho.themMoi(hoGiaDinhS, hoGiaDinh)
end
khuPho.hienThiThongTin