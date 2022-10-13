class Candidate
    attr_accessor :id
    attr_accessor :name
    attr_accessor :address
    attr_accessor :priority
    
    def initialize(id, name, address, priority)
        @id = id
        @name = name
        @address = address
        @priority = priority
    end
end
class CandidateA < Candidate
    MON_TOAN = "Toán"
    MON_LY = "Lý"
    MON_HOA = "Hóa"
    attr_accessor :block
    
    def initialize(id, name, address, priority, block)
        super(id, name, address, priority)
        @block = block
    end

    def showInfor
        puts "ID: #{@id} - Name: #{@name} - Address: #{@address} - Priority: #{@priority} - Subject: #{MON_TOAN} - #{MON_LY} - #{MON_HOA}"
    end
end 
class CandidateB < Candidate
    MON_TOAN = "Toán"
    MON_HOA = "Hóa"
    MON_SINH = "Sinh"
    attr_accessor :block

    def initialize(id, name, address, priority, block)
        super(id, name, address, priority)
        @block = block
    end

    def showInfor
        puts "ID: #{@id} - Name: #{@name} - Address: #{@address} - Priority: #{@priority} - Subject: #{MON_TOAN} - #{MON_HOA} - #{MON_SINH}"
    end
end
class CandidateC < Candidate
    MON_VAN = "Văn"
    MON_SU = "Sử"
    MON_DIA = "Địa"
    attr_accessor :block

    def initialize(id, name, address, priority, block)
        super(id, name, address, priority)
        @block = block
    end

    def showInfor
        puts "ID: #{@id} - Name: #{@name} - Address: #{@address} - Priority: #{@priority} - Subject: #{MON_VAN} - #{MON_SU} - #{MON_DIA}"
    end
end
class ManagerCandidate 
    def initialize

    end

    def add(candidate, candidates)
        candidates.push(candidate)
    end

    def showInfor(candidates)
        for candidate in candidates do
            candidate.showInfor
        end
    end

    def searchById(id, candidates) 
        for candidate in candidates do
            if(candidate.id == id) 
                candidate.showInfor 
            end
        end
    end
end
candidates = []
managerCandidate = ManagerCandidate.new
while(true)
    puts("---------------------------------------")
    puts("Quản lý tuyển sinh")
    puts("1. Thêm mới thí sinh")
    puts("2. Hiển thị thông tin thí sinh")
    puts("3. Tìm kiếm thí sinh theo số báo danh")
    puts("4. Thoát khỏi chương trình")
    print("Chọn chức năng: ")
    n = gets.to_i 

    case n
    when 1
        puts("---------------------------------------")
        puts("Chọn khối thi")
        puts("1. A")
        puts("2. B")
        puts("3. C")
        type = gets.to_i
        
        case type
        when 1
            print("Nhập số báo danh: ")
            id = gets
            print "Nhập họ tên: "
            name = gets
            print "Nhập địa chỉ: "
            address = gets
            print "Nhập mức độ ưu tiên: "
            priority = gets
            block = "A"
            candidateA = CandidateA.new(id, name, address, priority, block)
            managerCandidate.add(candidateA, candidates)
        when 2
            print("Nhập số báo danh: ")
            id = gets
            print "Nhập họ tên: "
            name = gets
            print "Nhập địa chỉ: "
            address = gets
            print "Nhập mức độ ưu tiên: "
            priority = gets
            block = "B"
            candidateB = CandidateB.new(id, name, address, priority, block)
            managerCandidate.add(candidateB, candidates)
        when 3
            print("Nhập số báo danh: ")
            id = gets
            print "Nhập họ tên: "
            name = gets
            print "Nhập địa chỉ: "
            address = gets
            print "Nhập mức độ ưu tiên: "
            priority = gets
            block = "C"
            candidateC = CandidateC.new(id, name, address, priority, block)
            managerCandidate.add(candidateC, candidates)
        end

    when 2
        managerCandidate.showInfor(candidates)
    when 3
        print "Nhập số báo danh: "
        idf = gets
        puts "Thí sinh cần tìm: "
        managerCandidate.searchById(idf, candidates)
    when 4
        return
    end
end
