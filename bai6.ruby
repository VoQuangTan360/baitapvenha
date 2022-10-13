class HocSinh
    attr_accessor :hoTen
    attr_accessor :tuoi
    attr_accessor :queQuan
    attr_accessor :lop

    def initialize(hoTen, tuoi, queQuan, lop)
        @hoTen= hoTen
        @tuoi = tuoi
        @queQuan = queQuan
        @lop = lop
    end
end
class QuanLyHocSinh
    def initialize
    end

    def themMoi(hocSinhS, hocSinh)
        hocSinhS.push(hocSinh)
    end

    def hienThiDanhSach(hocSinhS)
        for i in 0..(hocSinhS.length()-1) do
            puts("*Học sinh #{i+1}: - Họ tên: #{hocSinhS[i].hoTen} - Tuổi: #{hocSinhS[i].tuoi} - Quê quán: #{hocSinhS[i].queQuan} - Lớp: #{hocSinhS[i].lop}")
        end
    end

    def hienThiHocSinh20t(hocSinhS)
        hs = hocSinhS.select{|hocSinh| hocSinh.tuoi == 20}
        if (hs.length() != 0)
            for i in 0..(hs.length()-1) do
                if(hs[i].tuoi == 20)
                    puts("*Học sinh #{i+1}: - Họ tên: #{hs[i].hoTen} - Tuổi: #{hs[i].tuoi} - Quê quán: #{hs[i].queQuan} - Lớp: #{hs[i].lop}")
                end
            end
        else
            puts("Không tồn tại sinh viên nào!")
        end
        
    end

    def hienThiHocSinh23t(hocSinhS)
        dem = hocSinhS.select{|hocSinh| hocSinh.queQuan.include?("Da Nang") && hocSinh.tuoi == 23}.size
        puts("Số lượng học sinh 23 tuổi và quê ở Đà Nẵng: #{dem}")
    end
end
quanLyHocSinh = QuanLyHocSinh.new
hocSinhS = []

while(true)
    puts("---- QUẢN LÝ HỌC SINH ----")
    puts("1. Thêm mới học sinh")
    puts("2. Hiển thị thông tin của tất cả học sinh")
    puts("3. Hiển thị thông tin của học sinh 20 tuổi")
    puts("4. Hiển thị số lượng các học sinh có tuổi là 23 và quê ở Đà Nẵng")
    puts("5. Thoát khỏi chương trình")
    puts("-- Chọn công việc: ")
    cv = gets.to_i

    case cv
        when 1
            puts("== 1. Thêm mới học sinh ==")
            puts("*Nhập họ và tên: ")
            hoTen = gets.to_s
            puts("*Nhập tuổi: ")
            tuoi = gets.to_i
            puts("*Nhập quê quán: ")
            queQuan = gets.to_s
            puts("*Nhập lớp: ")
            lop = gets.to_s
            hocSinh = HocSinh.new(hoTen, tuoi, queQuan, lop)
            quanLyHocSinh.themMoi(hocSinhS, hocSinh)
        when 2
            puts("== 2. Hiển thị thông tin của tất cả học sinh ==")
            if(hocSinhS.length != 0)
                puts("** Danh sách học sinh **")
                quanLyHocSinh.hienThiDanhSach(hocSinhS)
            else
                puts("Không có học sinh nào!")
            end
        when 3 
            puts("== 3. Hiển thị thông tin của học sinh 20 tuổi ==")
            quanLyHocSinh.hienThiHocSinh20t(hocSinhS)
        when 4
            puts("== 4. Hiển thị số lượng học sinh 23 tuổi và quê quán ở Đà Nẵng ==")
            quanLyHocSinh.hienThiHocSinh23t(hocSinhS)
        when 5
            puts("== 5. Thoát khỏi chương trình ==")
            puts("Hẹn gặp lại!")
            return
        else
            puts("Không hợp lệ!")
    end
end