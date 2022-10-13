class Document 
    attr_accessor :id, :nxb, :number
    def initialize(id, nxb, number)
        @id = id
        @nxb = nxb
        @number = number
    end
    def showInfor
        "Mã sách: #{@id}, Nhà xuất bản: #{@nxb}, Số bản phát hành: #{@number}"
    end
end
class Book < Document
    attr_accessor :id, :nxb, :number, :author, :numerPage
    def initialize(id, nxb, number, author, numerPage)
        super(id, nxb, number)
        @author = author
        @numerPage = numerPage
    end
    def showInfor 
        "Mã sách: #{@id}, Nhà xuất bản: #{@nxb}, Số bản phát hành: #{@number}, Tên tác giả: #{@author}, Số trang: #{@numerPage}"
    end
end
class Journal < Document
    attr_accessor :id, :nxb, :number, :issueNumber, :monthIssue
    def initialize(id, nxb, number, issueNumber, monthIssue)
        super(id, nxb, number)
        @issueNumber = issueNumber
        @monthIssue = monthIssue
    end
    def showInfor
        "Mã sách: #{@id}, Nhà xuất bản: #{@nxb}, Số bản phát hành: #{@number}, Số phát hành: #{@issueNumber}, Tháng phát hành: #{@monthIssue}"
    end
end
class Newspaper < Document
    attr_accessor :id, :nxb, :number, :dayIssue
    def initialize(id, nxb, number, dayIssue)
        super(id, nxb, number)
        @dayIssue = dayIssue
    end
    def showInfor
        "Mã sách: #{@id}, Nhà xuất bản: #{@nxb}, Số bản phát hành: #{@number}, Ngày phát hành: #{@dayIssue}"
    end
end
class ManagerDocument 
    def addDocuments(arrayDocuments,documents)
        arrayDocuments.push(documents)
    end
    def searchByBook(arrayDocuments)
        for document in arrayDocuments do
            if document.instance_of? Book
                document.showInfor
            end
        end 
    end
    def searchByNewspaper(arrayDocuments)
        for document in arrayDocuments do
            if document.instance_of? Newspaper
                document.showInfor
            end
        end 
    end
    def searchByJournal(arrayDocuments)
        for document in arrayDocuments do
            if document.instance_of? Journal
                document.showInfor
            end
        end 
    end
    def showInfor(arrayDocuments)
        for document in arrayDocuments do
            document.showInfor
        end
    end
    def deleteDocument(id,arrayDocuments)
        for document in arrayDocuments do
            if(document.id == id) 
                arrayDocuments.delete(document)
                puts("Xoá Thành Công")
            end
        end
    end
end
arrayDocuments = Array.new
managerDocument = ManagerDocument.new
while true
    puts "Application Manager Document"
    puts "Enter 1: To insert document"
    puts "Enter 2: To search document by category "
    puts "Enter 3: To show information documents"
    puts "Enter 4: To remove document by id"
    puts "Enter 5: To exit"
    line = gets.to_i
    case line
    when 1
        puts "Enter 1: to insert Book"
        puts "Enter 2: to insert Newspaper"
        puts "Enter 3: to insert Journal"
        type = gets.to_i
        case type
        when 1
            puts "Enter ID: "
            id = gets.to_s
            puts "Enter nxb:"
            nxb = gets.to_s
            puts "Enter number: "
            number = gets.to_i
            puts "Enter author: "
            author = gets.to_s
            puts "Enter page number: "
            pageNumber = gets.to_i
            book = Book.new(id, nxb, number, author, pageNumber)
            managerDocument.addDocuments(arrayDocuments,book)
            puts book.showInfor
            break
        when 2
            puts "Enter ID: "
            id = gets.to_s
            puts "Enter nxb:"
            nxb = gets.to_s
            puts "Enter number: "
            number = gets.to_i
            puts "Enter Day issue: "
            dayIssue = gets.to_i
            newspaper = Newspaper.new(id, nxb, number, dayIssue)
            managerDocument.arrayDocuments(arrayDocuments,newspaper)
            puts newspaper.to_s           
            break    
        when 3
            puts "Enter ID: "
            id = gets.to_s
            puts "Enter nxb:"
            nxb = gets.to_s
            puts "Enter number: "
            number = gets.to_i
            puts "Enter issue number : "
            issueNumber = gets.to_i
            puts "Enter issue month : "
            issueMonth = gets.to_i
            journal =  Journal.new(id, nxb, number, issueNumber, issueMonth)
            managerDocument.arrayDocuments(arrayDocuments,journal)
            puts journal.to_s
            break 
        else
            break
        end 
    when 2
        puts "Enter 1 to search book"
        puts "Enter 2 to search newspaper"
        puts "Enter 3 to search journal"
        choise = gets.to_i
        case choise
        when 1
            managerDocument.searchByBook
            break   
        when 2
            managerDocument.searchByNewspaper
            break 
        when 3
            managerDocument.searchByJournal
            break
        else
            puts "Invalid"
            break
        end
    when 3 
        managerDocument.showInfor
    break
    when 4
        puts "Enter id to remove: "
        id = gets.to_s
        puts managerDocument.deleteDocument(id) ? "Success" : "Fail"
    break
    when 5
        return
    else
        puts "Invalid"
        next
    end
end