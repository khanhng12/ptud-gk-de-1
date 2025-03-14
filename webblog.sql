-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2020 at 06:11 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `baiviet`
--

CREATE TABLE `baiviet` (
  `TieuDeURL` varchar(500) NOT NULL,
  `TieuDe` varchar(500) NOT NULL,
  `NoiDung` varchar(10000) NOT NULL,
  `NgayViet` date NOT NULL,
  `TacGia` varchar(255) NOT NULL,
  `LuotXem` int(11) NOT NULL,
  `LuotThich` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `baiviet`
--

INSERT INTO `baiviet` (`TieuDeURL`, `TieuDe`, `NoiDung`, `NgayViet`, `TacGia`, `LuotXem`, `LuotThich`) VALUES
('dom-html-trong-javascript', 'DOM HTML trong javascript  ', '<p>Sau khi đã tìm kiếm được các thẻ HTML trong javascript thì giờ chúng ta sẽ cùng đi tìm hiểu&nbsp;các hàm tác động vào nó. Cụ thể bài này chúng ta sẽ tìm hiểu các hàm lấy ra giá trị của các thẻ HTML đó.</p><p><strong>Mục Lục</strong></p><p>&nbsp;</p><h2>1, Lấy nội dung trong thẻ HTMl và thay đổi nó.</h2><p>&nbsp;</p><h3>Lấy nội dung</h3><p>-Để lấy nội dung bên trong thẻ HTMl chúng ta sử dụng cú pháp:</p><p>element.innerHTML</p><p>-Trong đó: <strong>element</strong> là các đối tượng HTML (được gọi bằng các phương thức getElement...).</p><p><strong>VD</strong>:</p><p>//lấy nội dung của thẻ có id = hello var content = document.getElementById(\'hello\').innerHTML; //in ra nội dung của thẻ đó. alert(content);</p><p><a href=\"https://toidicode.com/live//?id=74\">Xem Kết Quả</a></p><h3>Thay đổi nội dung</h3><p>-Để thay đổi nội dung cho thẻ HTML đó thì các bạn chỉ sử dụng cú pháp:</p><p>element.innerHTML = \'Giá trị mới\';</p><p>-Trong đó: <strong>element</strong> là các đối tượng HTML (được gọi bằng các phương thức getElement...).</p><p><strong>VD</strong>:</p><p>//thay đổi nội dung của thẻ có id = hello document.getElementById(\'hello\').innerHTML = \'Học javascript cơ bản\';</p><p><a href=\"https://toidicode.com/live//?id=75\">Xem Kết Quả</a></p><h3>Lấy và thay đổi&nbsp;nội dung dưới dạng văn bản.</h3><p>-Nếu như bạn muốn lấy nội dung text, hay thay đổi nội dung dưới dạng dữ liệu thô thì các bạn chỉ cần thay thuộc tính&nbsp;innerHTML thành innerText.</p><p><strong>VD</strong>: Lấy nội dung text của thẻ HTML.</p><p>//lấy nội dung của thẻ có id = hello var content = document.getElementById(\'hello\').innerText; //in ra nội dung của thẻ đó. alert(content);</p><p><a href=\"https://toidicode.com/live//?id=76\">Xem Kết Quả</a></p><p><strong>VD</strong>: Thay đổi nội dung của một thẻ HTML dưới dạng thô.</p><p>//thay đổi nội dung của thẻ có id = hello var content = document.getElementById(\'hello\').innerText = \'&lt;b&gt;Học javascript cơ bản&lt;/b&gt;\';</p><p><a href=\"https://toidicode.com/live//?id=77\">Xem Kết Quả</a></p><h2>2, Tạo và lấy nội&nbsp;dung của&nbsp;các attribute trong thẻ HTML.</h2><p>&nbsp;</p><h3>Tạo ra các attribute cho thẻ HTML</h3><p>-Để tạo ra các attribute có các thẻ HTML chúng ta sử dụng cú pháp:</p><p>element.setAttribute(\'attrName\',\'attrValue\');</p><p><strong>Trong đó</strong>:</p><ul><li><strong>element</strong> là các đối tượng HTML (được gọi bằng các phương thức getElement...).</li><li><strong>attrName</strong> là tên của attribute mà các bạn muốn tạo ra.</li><li><strong>attrValue</strong> là giá tri của attribute các bạn muốn set.</li></ul><p><strong>VD</strong>:tạo ra attribute có tên là data-id và có giá trị = 5.</p><p>&lt;!DOCTYPE html&gt; &lt;html&gt; &lt;head&gt; &nbsp; &nbsp;&lt;meta charset=\"utf-8\"&gt; &nbsp; &nbsp;&lt;meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"&gt; &nbsp; &nbsp;&lt;title&gt;Toidicode.com javascript&lt;/title&gt; &lt;/head&gt; &lt;body&gt; &nbsp; &nbsp;&lt;div id=\"hello\" data-id=\'javascript\'&gt; &nbsp;Chào mừng các bạn đến với &lt;a href=\"http://.com\"&gt;website học lập trình online&lt;/a&gt; &lt;/div&gt; &nbsp; &nbsp;&lt;div class=\"toidicode\"&gt;TOIDICODE.COM &nbsp; &nbsp;&lt;/div&gt; &nbsp; &nbsp; &nbsp; &nbsp;&lt;script type=\"text/javascript\"&gt; &nbsp; &nbsp; &nbsp; &nbsp;//tạo ra data-id cho thẻ có id = hello &nbsp; &nbsp; &nbsp; &nbsp;document.getElementById(\'hello\').setAttribute(\'data-id\',\'5\'); &nbsp; &nbsp;&lt;/script&gt; &lt;/body&gt; &lt;/html&gt;</p><p><a href=\"https://toidicode.com/live//?id=79\">Xem Kết Quả</a></p><h3>Lấy ra giá trị của các attribute</h3><p>-Để lấy ra giá trị của các attribute trong thẻ HTML chúng ta sử dụng cú pháp:</p><p>element.getAttribute(\'AttrName\');</p><p><strong>Trong đó</strong>:</p><ul><li><strong>element</strong> là các đối tượng HTML (được gọi bằng các phương thức getElement...).</li><li><strong>AttrName</strong> là tên của attribute mà các bạn muốn lấy.</li></ul><p><strong>VD</strong>: lấy ra giá trị data-id của thẻ HTML có id= hello.</p><p>&lt;!DOCTYPE html&gt; &lt;html&gt; &lt;head&gt; &nbsp; &nbsp;&lt;meta charset=\"utf-8\"&gt; &nbsp; &nbsp;&lt;meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"&gt; &nbsp; &nbsp;&lt;title&gt;Toidicode.com javascript&lt;/title&gt; &lt;/head&gt; &lt;body&gt; &nbsp; &nbsp;&lt;div id=\"hello\" data-id=\'javascript\'&gt; &nbsp;Chào mừng các bạn đến với &lt;a href=\"http://.com\"&gt;website học lập trình online&lt;/a&gt; &lt;/div&gt; &nbsp; &nbsp;&lt;div class=\"toidicode\"&gt;TOIDICODE.COM &nbsp; &nbsp;&lt;/div&gt; &nbsp; &nbsp; &nbsp; &nbsp;&lt;script type=\"text/javascript\"&gt; &nbsp; &nbsp; &nbsp; &nbsp;//lấy nội dung data-id của thẻ có id = hello &nbsp; &nbsp; &nbsp; &nbsp;var content = document.getElementById(\'hello\').getAttribute(\'data-id\'); &nbsp; &nbsp; &nbsp; &nbsp;//in ra thông nội dung lấy được. &nbsp; &nbsp; &nbsp; &nbsp;alert(content); &nbsp; &nbsp;&lt;/script&gt; &lt;/body&gt; &lt;/html&gt;</p><h2>3, Lời Kết.</h2><p>-Như vậy mình đã giới thiệu xong đến mọi người cơ bản về <strong>DOM HTML trong javascript rồi</strong>, còn các vấn đề liên quan đến series thực hành mình sẽ nói sau.</p><p>Chúc các bạn học tốt!</p>', '2020-09-10', 'admin2', 0, 0),
('dune-tung-trailer-dau-tien', '\'Dune\' tung trailer đầu tiên', '<p>\"Dune\" - bom tấn mới của đạo diễn Denis Villeneuve - tung trailer đầu tiên đậm màu viễn tưởng, phiêu lưu cùng dàn sao đình đám.</p><p>Tối 9/9, hãng Warner Bros. giới thiệu trailer đầu tiên của dự án. Phim chuyển thể từ tiểu thuyết cùng tên (xuất bản tại Việt Nam với tựa đề <i>Xứ cát</i>) của nhà văn Frank Herbert. Kịch bản theo chân công tước Paul Atreides (Timothée Chalamet đóng) trong hành trình sinh tử bảo vệ vận mệnh của cả thiên hà.</p><p>Video Player is loading.</p><p>Dừng</p><p>Hiện tại&nbsp;0:03</p><p>/</p><p>Thời lượng&nbsp;3:05</p><p>Đã tải: 0%</p><p>Tiến trình: 0%</p><p>Bỏ tắt tiếng</p><p>&nbsp;</p><p>Toàn màn hình</p><p>Trailer \"Dune\". Video: <i>CGV</i>.</p><p>Trailer giới thiệu dàn sao đình đám góp mặt trong phim. \"Bạn gái người Nhện\" Zendaya vào vai Chani - thiếu nữ Atreides thường gặp trong những giấc mơ của anh. Minh tinh Charlotte Rampling đóng Mẹ Trí Tôn, huấn luyện Atreides trước khi bước vào sứ mệnh cao cả.</p><p>Josh Brolin (đóng Thanos trong vũ trụ điện ảnh Marvel) hóa thân chuyên gia vũ khí Gurney Halleck, thành viên quan trọng trong đoàn quân hỗ trợ Atreides. \"Aquaman\" Jason Momoa vào vai chiến binh tinh nhuệ Duncan Idaho, người dạy nam chính võ nghệ và giúp đỡ anh hoàn thành sứ mệnh được giao. Tài tử Javier Bardem, từng đoạt Oscar với <i>No Country For Old Man</i>, đóng thủ lĩnh Stilgar, người cưu mang mẹ con Atreides khi anh bị kẻ thù truy đuổi.</p><figure class=\"image\"><img src=\"https://i1-giaitri.vnecdn.net/2020/09/10/Aquaman-8051-1599704918.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=lE2IfokBQYx3sAhJYDBjlw\" alt=\"Tài tử Jason Momoa trong vai Duncan Idaho. Ảnh: Warner Bros.\"></figure><p>&nbsp;</p><p>&nbsp;</p><ul><li>&nbsp;</li><li>&nbsp;</li><li>&nbsp;</li><li>&nbsp;</li></ul><p>Tài tử Jason Momoa trong vai Duncan Idaho. Ảnh: <i>Warner Bros.</i></p><p>Bên cạnh dàn diễn viên đình đám, êkíp <i>Dune</i> quy tụ những nhân vật lão làng của Hollywood, đặc biệt trong dòng phim hành động - viễn tưởng. Đạo diễn Denis Villeneuve từng làm nên thành công cho nhiều bom tấn như <a href=\"https://vnexpress.net/blade-runner-2049-bom-tan-vien-tuong-goi-nhieu-cau-hoi-triet-hoc-3659808.html\"><i>Blade Runner 2049</i></a><i>, Arrival</i> hay <i>Prisoners. </i>Villeneuve giàu kinh nghiệm xử lý những kịch bản ẩn chứa nhiều thông điệp về chính trị, tôn giáo. Đây cũng là lý do Warner Bros. tin tưởng để đạo diễn đảm nhiệm <i>Dune</i>.</p><p>Kịch bản do hai biên kịch Eric Roth (<a href=\"https://vnexpress.net/dan-dien-vien-forrest-gump-ngay-ay-bay-gio-3948773.html\"><i>Forrest Gump</i></a><i>, A Star is Born</i>) và Jon Spaihts (<a href=\"https://vnexpress.net/doctor-strange-duoc-cho-la-co-noi-dung-giong-iron-man-3339149.html\"><i>Doctor Strange</i></a>) viết. Nhà soạn nhạc <a href=\"https://video.vnexpress.net/video/giai-tri/nhac-phim-interstellar-hans-zimmer-3103452.html\">Hans Zimmer</a> từ chối bom tấn <a href=\"https://vnexpress.net/tenet-phuong-trinh-vo-nghiem-ve-dao-nghich-thoi-gian-4154463.html\"><i>Tenet</i></a> để nhận vai trò làm nhạc phim cho <i>Dune</i>. Tác phẩm dự kiến ra rạp tại Việt Nam vào giữa tháng 12.</p>', '2020-09-10', 'admin2', 0, 0),
('fan-tranh cai tinh tiet phim lay danh nghia nguoi nha', 'Fan tranh cãi tình tiết phim \'Lấy danh nghĩa người nhà\' ', '<ul><li><a href=\"https://vnexpress.net/giai-tri\">Giải trí</a></li><li><a href=\"https://vnexpress.net/giai-tri/phim\">Phim</a></li><li><a href=\"https://vnexpress.net/giai-tri/phim/sau-man-anh\">Chuyện màn ảnh</a></li></ul><p>Thứ tư, 19/8/2020, 08:55 (GMT+7)</p><h2><strong>Fan tranh cãi tình tiết phim \'Lấy danh nghĩa người nhà\'</strong></h2><p>Khán giả không đồng tình chi tiết Lăng Tiêu lẫn Hạ Tử Thu du học suốt chín năm, không một lần về thăm bố và em gái.</p><p><i>* Bài viết tiết lộ nội dung phim</i></p><p><a href=\"https://vnexpress.net/lay-danh-nghia-nguoi-nha-phim-gia-dinh-gay-sot-4146346.html\"><i>Lấy danh nghĩa người nhà</i></a> hiện phát sóng tập 13, xoay quanh cuộc sống gia đình khi ba anh em Lăng Tiêu (Tống Uy Long), Hạ Tử Thu (Trương Tân Thành), Lý Tiêm Tiêm (Đàm Tùng Vận) trưởng thành. Ở tập mới nhất, Lăng Tiêu và Hạ Tử Thu trở về nước sau chín năm du học ở nước ngoài khiến cuộc sống Lý Tiêm Tiêm bị đảo lộn. Vốn quen một mình, cô khó chịu và gặp nhiều bất tiện khi có hai anh trai ở bên chăm sóc, trò chuyện.</p><p>Video Player is loading.</p><p>Dừng</p><p>Hiện tại&nbsp;0:13</p><p>/</p><p>Thời lượng&nbsp;1:52</p><p>Đã tải: 0%</p><p>Tiến trình: 0%</p><p>Bỏ tắt tiếng</p><p>&nbsp;</p><p>Toàn màn hình</p><p>Trích đoạn Lăng Tiêu và Hạ Tử Thu trở về sau chín năm. Video: <i>Huace</i>.</p><p>Trên <i>Weibo</i>, chủ đề \"Vì sao Lăng Tiêu và Hạ Tử Thu chín năm không quay về\" đứng thứ tư trong top tìm kiếm hôm 18/8. Theo<i> Sohu</i>, Hạ Tử Thu được cha ruột đưa sang Anh nhưng vợ sau của ông phát hiện. Cuối cùng vì để giữ vị trí trong nhà, hắn bỏ rơi con trai lần nữa. Hạ Tử Thu một mình nơi đất khách, phải vừa học vừa làm, giả vờ sống tốt để cha Lý không lo lắng. Anh sau đó được một đầu bếp giỏi truyền nghề nên ở lại học, phụ việc thành tài rồi mới trở về đoàn tụ gia đình. Trong khi đó Lăng Tiêu sang Singapore học để tiện chăm sóc mẹ nhưng chín năm không về thăm gia đình. Trong khi trước đó bà là người bỏ rơi anh.</p><p>Trên các diễn đàn, mạng xã hội, đa phần đều chỉ trích biên kịch sáng tạo tình tiết vô lý, nhân vật Lăng Tiêu bội bạc tình nghĩa. Tài khoản Huang Hui viết: \"Biên kịch sao có thể để diễn biến phim vô lý như vậy, cậu ấy có thể chăm sóc mẹ ruột nhưng chín năm không về thăm bố và em thì quá vô lý. Lý Hải Triều không nói nhưng Lăng Hòa Bình là bố ruột cậu ấy cơ mà\". Khán giả Mei Mei bình luận: \"Hạ Tử Thu thì tôi không nói vì khoảng cách địa lý và người cha không đáng tin tưởng. Nhưng còn Lăng Tiêu thì sao? Singapore đâu quá xa xôi, trong khi gia đình mẹ đẻ lại có điều kiện như vậy, làm gì đến mức độ đến chín năm không về thăm nhà một lần\".</p><p>Một số ý kiến cho rằng Lăng Tiêu ở bên chăm sóc mẹ chín năm là hợp lý. Tài khoản Gu Bing viết: \"Mẹ Lăng Tiêu bỏ đi khi cậu ấy tầm khoảng tám, chín tuổi. Bây giờ, cậu ấy chăm sóc mẹ chín năm, coi như không ai nợ ai. Từ đó về sau cậu ấy có thể thoải mái sống cuộc đời của mình\", \"Dù Trần Đình có bạc tình thì vẫn là mẹ ruột, việc chăm sóc là bình thường. Hơn nữa, Lăng Tiêu học ngành y, thời gian học ít nhất cũng phải từ 5 năm trở lên. Vì vậy khoảng thời gian đó là hợp lý\".</p><figure class=\"image\"><img src=\"https://i1-giaitri.vnecdn.net/2020/08/19/lay-danh-nghia-nguoi-nha-4591-1597799681.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=R_SgsEi9iWdE1EPoyMe28w\" alt=\"Từ trái qua: Hạ Tử Thu, Lý Tiêm Tiêm, Lăng Tiêu ngại ngùng trong lần đầu gặp nhau sau chín năm xa cách. Ảnh: Weibo.\"></figure><p>Từ trái qua: Hạ Tử Thu, Lý Tiêm Tiêm, Lăng Tiêu ngại ngùng trong lần đầu gặp nhau sau chín năm xa cách. Ảnh: <i>Weibo</i>.</p><p><strong>Những tình tiết liên quan đến quan hệ tình yêu của các nhân vật trong phim cũng gây bàn tán.</strong> Sau khi về nước, người đầu tiên Lăng Tiêu gặp là Minh Nguyệt. Trong tập mới nhất (phát sóng tối 17/8), Minh Nguyệt thừa nhận tình cảm với Lăng Tiêu. Trong khi đó, ở phần giới thiệu đầu, cuối mỗi tập phim, Lăng Tiêu và Lý Tiêm Tiêm có nhiều cảnh hôn tình cảm. Từ khóa \"Minh Nguyệt yêu thầm Lăng Tiêu\" vào top tìm kiếm Weibo với triệu lượt bàn luận xung quanh \"tam giác tình yêu\" của ba người.</p><p>Đa phần khán giả chỉ trích biên kịch đẩy tình tiết phim đi quá xa, không phù hợp với mạch phim vốn có. Tài khoản Xiaoqi viết: \"Tác giả xây dựng tuyến tình cảm nhân vật nhiều vô lý quá. Phim đang rất đẹp đừng mang những tình tiết phi lý, ngược tâm vào để phá vỡ mạch cảm xúc\". Trong khi đó một số khán giả nói việc Minh Nguyệt thầm mến Lăng Tiêu là điều dễ hiểu bởi cậu đẹp trai, tài giỏi và từng trò chuyện, an ủi cô.</p><p>Ngoài ra, trong trailer tập mới nhất (phát sóng tối 18/8) hé lộ cảnh Hạ Tử Thu tỏ tình với Tiêm Tiêm qua câu nói: \"Anh muốn được làm bạn trai của em\". Còn Lăng Tiêu có hành động thân mật, suýt hôn em gái. Trên Weibo, Sina, Douban, Zhizhu... khán giả viết: \"Tên của bộ phim là Lấy danh nghĩa người nhà, tức là dù không có quan hệ huyết thống họ vẫn là anh em. Ở góc độ văn hóa Trung Quốc, việc Lăng Tiêu hay Hứa Tử Thu có quan hệ tình cảm với Lý Tiêm Tiêm thực sự hơi khó chấp nhận\". \"Tình cảm anh em không phải đang rất đẹp sao. Tại sao nhất</p>', '2020-08-19', 'admin2', 0, 0),
('hang-xe dap lon nhat the gioi san xuat khong kip ban', 'Hãng xe đạp lớn nhất thế giới sản xuất không kịp bán    ', '<p>Do Covid-19, các phòng gym đóng cửa, di chuyển bằng xe buýt và tàu điện hạn chế, các phương thức vận động ngoài trời được ưu tiên... khiến doanh số bán xe đạp tăng vọt trên khắp thế giới. Kết quả là xe đạp thiếu hụt khắp nơi. Giant, nhà sản xuất xe đạp lớn nhất thế giới, dự kiến nguồn cung của họ sẽ tiếp tục khan hiếm trong thời gian tới.</p><p>Sau khi Tổng thống Mỹ Donald Trump bắt đầu cuộc chiến thương mại với Trung Quốc vào năm 2018, Giant đã chuyển một số hoạt động sản xuất dành cho thị trường Mỹ từ Trung Quốc đại lục đến trụ sở chính của công ty ở Đài Loan để tránh bị áp thuế. Năm tiếp theo, Liên minh châu Âu áp thuế chống bán phá giá đối với xe đạp điện từ Trung Quốc. Vì vậy, Giant cũng bắt đầu sản xuất xe đạp điện ở Đài Loan.</p><p>Nhưng đại dịch bùng phát khiến nhu cầu về xe đạp tăng vọt, Giant lại phải đảo ngược hoạt động. Vì cơ sở tại Đài Loan quá tải, họ không có lựa chọn nào khác ngoài việc tăng cường sản xuất ở Trung Quốc đại lục, dù điều này khiến công ty phải chịu thêm chi phí thuế quan.</p><p>\"Không có nơi nào khác trên thế giới như Trung Quốc có thể tăng tốc từ 0 lên 100 ngay lập tức như một chiếc ôtô thể thao,\" Bonnie Tu, Chủ tịch của Giant, nhận xét.</p><p>Năm nay, chính quyền Trump đã tạm thời dỡ bỏ thuế quan đối với nhiều loại hàng hóa Trung Quốc được coi là không quan trọng về mặt chiến lược. Xe đạp lọt vào danh sách này, giúp Giant dễ dàng trở lại sản xuất một số mẫu xe đạp của họ cho thị trường Mỹ tại Trung Quốc.</p><figure class=\"image\"><img src=\"https://i1-kinhdoanh.vnecdn.net/2020/08/19/merlin-174895581-ae9ec662-dc68-7376-6582-1597772806.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=6Dn1sXqlKNZbH-63pUgaEQ\" alt=\"Một công nhân đang làm việc trong nhà máy của Giant tại Đài Trung, Đài Loan. Ảnh: NYT\"></figure><p>Một công nhân đang làm việc trong nhà máy của Giant tại Đài Trung, Đài Loan. <i>Ảnh: NYT.</i></p><p>Tuy nhiên, lệnh dừng thuế quan đối với một số loại xe đạp đã hết hạn trong tháng này, nghĩa là Giant lần nữa có thể điều chỉnh lại chuỗi cung ứng. \"Tôi không muốn rời Trung Quốc. Không hề \", bà Tu nói nhưng vấn đề là hiện có quá nhiều rào cản thương mại khiến họ bị mắc kẹt giữa hai cường quốc.</p><p>Giant đã nổi tiếng từ nhiều thập kỷ trước, khi sản xuất xe đạp cho thương hiệu Schwinn mang tính biểu tượng của Mỹ. Sau đó, công ty trở thành một thế lực đúng nghĩa trong ngành xe đạp toàn cầu. Khi Trung Quốc đại lục bắt đầu thay thế Đài Loan trở thành trung tâm sản xuất, Giant mở các nhà máy ở đó trong khi vẫn giữ một nhà máy gần Đài Trung. Ngày nay, công ty điều hành 5 nhà máy ở Trung Quốc, chiếm 70% sản lượng.</p><p>Giant đã đóng cửa các nhà máy ở Trung Quốc trong 1,5 tháng khi Covid-19 bùng phát ở nước này. Sau đó, châu Âu và Mỹ cũng bắt đầu phong tỏa, các nhà nhập khẩu đã hủy đơn đặt hàng.</p>', '2020-08-19', 'admin2', 0, 0),
('lampard-co-the-la-hlv-dau-tien-bi-sa-thai', 'Lampard có thể là HLV đầu tiên bị sa thải  ', '<p>Áp lực từ 260 triệu USD tiền <strong>mua cầu thủ mới</strong> trong hè 2020, theo cựu tiền đạo Chelsea Tony Cascarino, buộc HLV Frank Lampard phải vào top 2.</p><p>\"<a href=\"https://vnexpress.net/chu-de/frank-lampard-227\">Lampard</a> hoàn toàn ý thức được áp lực hiện tại, nhưng đó luôn là thứ đi cùng bất cứ HLV nào dẫn dắt <a href=\"https://vnexpress.net/chu-de/chelsea-110\">Chelsea</a>. Khi ngồi ghế nóng ở Stamford Bridge, bạn cần tự nhắc rằng lúc nào cũng có thể là người đầu tiên bị sa thải trong mùa giải\", cựu tiền đạo Chelsea Tony Cascarino nói với <i>talk Sport </i>hôm 8/9.</p><figure class=\"image\"><img src=\"https://i1-thethao.vnecdn.net/2020/09/08/download-7328-1599567420.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=C6osITbF1qC-nwp25AziiQ\" alt=\"Lampard được kỳ vọng giúp Chelsea có một danh hiệu lớn mùa này. Ảnh: Reuters.\"></figure><p>&nbsp;</p><p>Lampard được kỳ vọng giúp Chelsea có một danh hiệu lớn mùa này. Ảnh: <i>Reuters.</i></p><p>Trong kỷ nguyên <a href=\"https://vnexpress.net/chu-de/roman-abramovich-801\">Roman Abramovich</a>, nếu không đoạt danh hiệu lớn - Champions League hoặc Ngoại hạng Anh, hầu hết các HLV sẽ bị sa thải. Hai ngoại lệ là <a href=\"https://vnexpress.net/chu-de/jose-mourinho-264\">Jose Mourinho</a> mùa 2013-2014 và chính Lampard mùa vừa qua. Nhưng cả hai nhà cầm quân đều đã thỏa thuận về điều này với lãnh đạo Chelsea trước khi nhậm chức.</p><p>Mourinho, sau khi về đích thứ ba mùa 2013-2014 đã vô địch mùa kế tiếp. Theo Cascarino, cựu tiền đạo Chelsea thập niên 1990, đó sẽ là kỳ vọng cho Lampard mùa này. \"Chelsea từng sa thải những HLV có tỷ lệ thắng cao hơn Lampard. Dù hoàn cảnh nhậm chức của Lampard có phần đặc biệt, nguy cơ ấy vẫn hiện hữu\", ông phân tích. \"Tôi không nghĩ Lampard sẽ được cho thêm thời gian, chỉ bởi từng là huyền thoại thời cầu thủ. Hãy nhìn vào cách hành xử của ông chủ Abramovich với các HLV, về cách ông ấy điều hành Chelsea, tôi tin thói quen gần 20 năm qua khó lòng bị phá bỏ\".</p>', '2020-09-10', 'admin2', 0, 0),
('tai-sao-chelsea-co-the-vung-tien-chuyen-nhuong', 'Tại sao Chelsea có thể vung tiền chuyển nhượng?    ', '<p>Chelsea đã đổ 264 triệu USD vào chuyển nhượng hè 2020, xấp xỉ chi phí mua sắm của năm đội còn lại trong top 6 Ngoại hạng Anh.</p><p>Bốn tân binh <a href=\"https://vnexpress.net/kai-havertz-cap-ben-chelsea-4157165.html\">Kai Havertz</a>, Timo Werner, Ben Chilwell và Hakim Ziyech ngốn của <a href=\"https://vnexpress.net/chu-de/chelsea-110\">Chelsea </a>264 triệu USD, theo <i>Transfermarkt</i>. Còn tổng số tiền đã chi cho chuyển nhượng của Liverpool, Man City, Man Utd, Tottenham và Arsenal là 272 triệu USD, khi <a href=\"https://vnexpress.net/chu-de/ngoai-hang-anh-43\">Ngoại hạng Anh </a>chỉ còn hai ngày nữa là khởi tranh. Chelsea thậm chí vẫn muốn bỏ thêm 84 triệu USD để tuyển mộ tiền vệ Declan Rice từ West Ham.</p><figure class=\"image\"><img src=\"https://i1-thethao.vnecdn.net/2020/09/10/havertz-1599713390-4920-1599713957.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=gbIYxuRYd_y0cjz-GGxJHw\" alt=\"Havertz ngốn 95 triệu USD của Chelsea, được kỳ vọng nâng tầm đội bóng trong nhiều năm tới. Ảnh: CFC\"></figure><p>&nbsp;</p><p>Havertz ngốn 95 triệu USD của Chelsea, được kỳ vọng nâng tầm đội bóng trong nhiều năm tới. Ảnh: <i>CFC</i></p><p>Động thái của Chelsea được xem là kỳ lạ, trong bối cảnh Covid-19 vẫn hoành hành. <a href=\"https://vnexpress.net/chu-de/liverpool-114\">Liverpool </a>báo lãi ba mùa liên tiếp, với tổng lợi nhuận 269 triệu USD. Nhưng, họ vẫn đang phải kỳ kèo vài triệu USD để chiêu mộ tiền vệ Thiago Alcantara từ Bayern Munich. <a href=\"https://vnexpress.net/chu-de/manchester-city-115\">Man City</a> cũng chưa muốn chi thêm sáu triệu USD, để đáp ứng đề nghị 89 triệu USD của Napoli cho trung vệ Kalidou Koulibaly. Với Chelsea, các thương vụ lại thường kết thúc chóng vánh.</p><p>Càng bất thường hơn khi năm 2019, Chelsea báo lỗ 125 triệu USD, chiếm 21% doanh thu hoạt động. Chỉ Everton lỗ nặng hơn Chelsea ở châu Âu, với 146 triệu USD.</p><p>Chelsea cũng là đội mất nhiều tiền nhất ở châu Âu để khấu hao cầu thủ, với 218 triệu USD, nhiều hơn 58 triệu USD so với đội thứ hai là <a href=\"https://vnexpress.net/chu-de/juventus-132\">Juventus</a>. Chẳng hạn Chelsea mua Havertz với giá 95 triệu USD, theo hợp đồng năm năm. Phí chuyển nhượng được phân bổ ra năm năm tiếp theo, mỗi năm 19 triệu USD. Khấu hao cầu thủ là tổng số tiền mua cầu thủ chia ra bởi số năm hợp đồng họ ký kết. Khấu hao càng lớn nghĩa là đội bóng càng khó báo lãi mỗi năm.</p><p>Khấu hao ba mùa gần nhất của Chelsea tăng gần 1,5 lần, từ 92 triệu USD lên 218 triệu USD. Khoản này nhiều gấp đôi với với đội thứ hai. Nói cách khác, Chelsea là đội chi nhiều tiền nhất vào chuyển nhượng trong vài năm qua ở châu Âu.</p><figure class=\"image\"><img src=\"https://i1-thethao.vnecdn.net/2020/09/10/lampard-1599713640-1599713650-4362-1599713957.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=bn81zDixc4q2IBmt8AjbMA\" alt=\"Lampard chiếm được lòng tin của Chủ tịch Abramovich. Ảnh: Reuters\"></figure><p>Lampard chiếm được lòng tin của Chủ tịch Abramovich. Ảnh: <i>Reuters</i></p><p><strong>Chủ tịch Roman Abramovich không vung tiền vô tội vạ, bởi ông muốn đưa Chelsea trở lại là đội bóng hàng đầu</strong>. Màn thể hiện của <a href=\"https://vnexpress.net/chu-de/frank-lampard-227\">HLV Frank Lampard</a> mùa trước chiếm trọn niềm tin của Abramovich. Chelsea cán đích trong top 4 với dàn cầu thủ trẻ trung. Vì thế, tỷ phú Nga không ngại vung tiền để Lampard mang về những cầu thủ ưng ý hè này</p><p>Chelsea tiêu tiền theo kiểu \"đói góp, no dồn\". Họ vừa bị UEFA cấm chuyển nhượng hai kỳ liên tiếp, sau đó giảm xuống chỉ còn một kỳ - hè 2019. Trong tháng 1/2020, Chelsea cũng chỉ bỏ 53 triệu USD để mua đứt tiền vệ Mateo Kovacic. Nhờ vậy, khoản khấu hao cầu thủ của họ sẽ giảm đáng kể từ năm 2020.</p><p>Theo chiều ngược lại, trong hai kỳ chuyển nhượng này, họ thu 186 triệu USD từ việc bán cầu thủ. Trong đó họ kiếm 136 triệu USD từ Real Madrid cho thương vụ Eden Hazard. Chưa kể Chelsea đã thu 87 triệu USD từ việc bán cầu thủ hè này, phần lớn đến từ thương vụ tiền đạo Alvaro Morata trở về Atletico Madrid.</p><p>Tuổi trung bình của bốn tân binh mà Chelsea phải trả phí chuyển nhượng là 24 tuổi. Bộ khung Lampard đang có trong tay có thể thi đấu ở đỉnh cao trong gần 10 năm nữa. Lợi thế đó có thể giúp họ không phải vung quá nhiều tiền trong những năm tiếp theo. Kỳ chuyển nhượng hè 2020 sẽ mang tính bản lề cho chiến lược dài hạn của Chelsea.</p><figure class=\"image\"><img src=\"https://i1-thethao.vnecdn.net/2020/09/10/abra-1599713687-8305-1599713957.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Y6yvoQ1hsiBQgo42CYWLdg\" alt=\"Abramovich đầu tư không tính lãi cho Chelsea. Ảnh: AFP\"></figure><p>Abramovich đầu tư không tính lãi cho Chelsea. Ảnh: <i>AFP</i></p><p>Chelsea là đội bóng lớn hiếm hoi vung tiền chuyển nhượng giữa đại dịch, giúp họ dễ dàng chốt hợp đồng hơn, do không có nhiều đối thủ cạnh tranh. Không có đối thủ cũng có nghĩa Chelsea sẽ không bị ép giá. Các đội bóng khác cũng bị áp lực bán cầu thủ để tránh khủng hoảng tài chính. Chilwell, Havertz hay Thiago Silva đều chỉ muốn tới Stamford Bridge.</p><p>Chelsea cũng không nợ nhiều như phần lớn đội bóng lớn, nhờ vào thủ thuật của <a href=\"https://vnexpress.net/chu-de/roman-abramovich-801\">Abramovich</a>. Ông đã bỏ tiền túi vào Chelsea, không tính lãi, nhưng thông qua công ty mẹ Fordstam. Fordstam đang nợ Abramovich 1,5 tỷ USD. Còn báo cáo tài chính của riêng Chelsea cho thấy đội bóng chỉ nợ 103 triệu USD vào năm 2019, trong khi Tottenham nợ tới 855 triệu USD. Chelsea không mất tiền trả lãi vay trong ba năm qua, còn năm đội còn lại trong top 6 trả từ tám triệu đến 69 triệu USD.</p><p>Đội trả lãi vay nhiều nhất chính là <a href=\"https://vnexpress.net/chu-de/manchester-united-116\">Man Utd</a>, khi các ông chủ nhà Glazer tận dụng lợi nhuận của đội bóng để thu hồi vốn. Còn Abramovich, với khối tài sản 12,5 tỷ USD theo <i>Forbes</i>, coi Chelsea như một đam mê.</p>', '2020-09-10', 'admin2', 0, 0),
('tong-hop-thu-thuat-tim-kiem-google-hieu-qua-khong-phai-ai-cung-biet', 'Tổng hợp thủ thuật tìm kiếm google hiệu quả không phải ai cũng biết        ', '<p>Mỗi khi bạn cần tìm kiếm thông tin thì chắc hẳn&nbsp;<strong>Google Search</strong> là công cụ đắc lực nhất mà&nbsp;ai cũng nghĩ đến đầu tiên. <strong>Tuy nhiên</strong>, không phải khi nào kết quả hiển thị cũng trả lời đúng vấn đề bạn cần tìm. Vậy hôm nay mình xin tổng hợp một số thủ thuật giúp bạn có thể tìm kiếm google tốt và chính xác hơn.</p><h2>1.&nbsp;Sử dụng dấu sao *</h2><p>&nbsp;</p><p>- Bạn có thể sử dụng dấu * thay cho những gì bạn không nhớ hoặc chắc chắn. Thủ thuật này rất hữu ích nếu chẳng hạn như bạn không nhớ rõ tên cuốn sách mà bạn muốn tìm mà chỉ nhớ 1 vài từ đầu hoặc từ cuối, thì bạn có thể thay thế nó bằng dấu *.<br>VD: Mình muốn search cuốn sách <strong>Hôm nay tôi thất tình</strong> mà không nhớ một vài từ thì sẽ search như thành <strong>hôm ** thất tình</strong></p><p>&nbsp;</p><h2>2.&nbsp;Sử dụng dấu ngoặc kép “ ”</h2><p>&nbsp;</p><p>- Thông thường nếu như bạn search với từ khóa bình thường thì google sẽ trả về cho bạn tất cả những gì liên quan đến từ khóa bạn tìm mà không phân biệt theo thứ tự hay ngữ nghĩa của cụm từ. Ví dụ như bạn tìm từ \"<strong>lập trình php</strong>\" thì nó sẽ trả về theo kiểu PHP là gì, giới thiệu về lập trình PHP,... mà không tập trung chính xác đến cả cụm từ của bạn.</p><p>- Lúc này bạn muốn google search focus đến cả cụm từ bạn cần tìm kiếm thì bạn chỉ cần đặt nó trong cặp dấu ngoặc kép \"\".</p><h2>3.&nbsp;Sử dụng site: để tìm chính xác trang web.</h2><p>- Đôi khi bạn muốn tìm kiếm một từ khóa nào đó nhưng với điều kiện phải nằm trên một trang web bạn xác định. Lúc này bạn chỉ cần thêm cụm từ site: vào phía trước từ khóa bạn muốn tìm kiếm thì google sẽ hiểu và trả về cho bạn tất cả những gì liên quan đến từ khóa bạn cần tìm của trang web đó.</p><p>VD: Mình sẽ tìm tất cả các bài về PHP trên trang toidicode.com thì sẽ search như sau: <strong>site:toidicode.com PHP</strong></p><p>&nbsp;</p><h2>4. Tìm kiếm những trang web có cùng thể loại</h2><p>- Bạn có thể tìm kiếm những trang web có cùng thể loại với một trang web mà bạn biết bằng cú pháp&nbsp;<strong>related: website_url</strong></p><p><strong>VD:&nbsp;</strong>mình muốn tìm một site có cùng thể loại với site shopee (thương mại điện tử)&nbsp;chẳng hạn thì mình sẽ search với từ khóa như sau: <strong>related: shopee.vn</strong></p><h2><strong>5. </strong>Tìm và tải xuống bất kỳ bộ phim nào.</h2><p>- Ví dụ bạn muốn tìm kiếm và tải xuống một bộ phim nào đó trên google thì bạn chỉ cần search với cú pháp: index of ten_phim. Hoặc nếu không tìm thấy thì bạn có thể thử lại với cú pháp:&nbsp;ten_phim -inurl:(htm|html|php|pls|txt) intitle:index.of “last modified” (mp4|wma|aac|avi)&nbsp;. Trong đó ten_phim chính là tên phim mà bạn muốn tìm.</p><p>VD: Mình muốn tìm kiếm phim joker 2019 chẳng hạn, thì mình sẽ search như sau: <strong>index of joker 2019</strong>.</p><p>&nbsp;</p><h2>&nbsp;</h2>', '2020-08-19', 'admin2', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `baiviet_danhmuc`
--

CREATE TABLE `baiviet_danhmuc` (
  `TieuDeURL` varchar(500) NOT NULL,
  `IdDanhMuc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `baiviet_danhmuc`
--

INSERT INTO `baiviet_danhmuc` (`TieuDeURL`, `IdDanhMuc`) VALUES
('fan-tranh cai tinh tiet phim lay danh nghia nguoi nha', 12),
('fan-tranh cai tinh tiet phim lay danh nghia nguoi nha', 13),
('hang-xe dap lon nhat the gioi san xuat khong kip ban', 4),
('hang-xe dap lon nhat the gioi san xuat khong kip ban', 14),
('lampard-co-the-la-hlv-dau-tien-bi-sa-thai', 13),
('lampard-co-the-la-hlv-dau-tien-bi-sa-thai', 14),
('tai-sao-chelsea-co-the-vung-tien-chuyen-nhuong', 13),
('tai-sao-chelsea-co-the-vung-tien-chuyen-nhuong', 14),
('tong-hop-thu-thuat-tim-kiem-google-hieu-qua-khong-phai-ai-cung-biet', 4),
('tong-hop-thu-thuat-tim-kiem-google-hieu-qua-khong-phai-ai-cung-biet', 11),
('tong-hop-thu-thuat-tim-kiem-google-hieu-qua-khong-phai-ai-cung-biet', 12);

-- --------------------------------------------------------

--
-- Table structure for table `binhluan`
--

CREATE TABLE `binhluan` (
  `IdBinhLuan` int(11) NOT NULL,
  `IdDocGia` int(11) NOT NULL,
  `NoiDung` varchar(500) NOT NULL,
  `TieuDeURL` varchar(500) NOT NULL,
  `NgayViet` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `binhluan`
--

INSERT INTO `binhluan` (`IdBinhLuan`, `IdDocGia`, `NoiDung`, `TieuDeURL`, `NgayViet`) VALUES
(36, 65, 'OK', 'tong-hop-thu-thuat-tim-kiem-google-hieu-qua-khong-phai-ai-cung-biet ', '2020-09-11 06:52:30'),
(38, 66, 'ahi', 'dune-tung-trailer-dau-tien ', '2020-10-18 22:51:16'),
(39, 66, 'bài viết rất hay', 'tai-sao-chelsea-co-the-vung-tien-chuyen-nhuong ', '2020-10-18 22:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc`
--

CREATE TABLE `danhmuc` (
  `IdDanhMuc` int(11) NOT NULL,
  `TenDanhMuc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `danhmuc`
--

INSERT INTO `danhmuc` (`IdDanhMuc`, `TenDanhMuc`) VALUES
(4, 'Php1'),
(10, 'Java'),
(11, 'Python'),
(12, 'CSharp'),
(13, '.NET'),
(14, 'Unity');

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `TaiKhoan` varchar(255) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `Ten` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`TaiKhoan`, `MatKhau`, `Ten`) VALUES
('admin', '123456', 'Supper admin'),
('admin2', '$2a$10$n2CgUM3tEeKptbdrMJkE/OnOEz7rROJykrObg3WsFpkLS.5DOYWSG', 'Hoang Loc'),
('Hoangloc2', '123456', 'LOCOOCO'),
('Hoangloc3', '$2a$10$IuCQs16pgt2cPvf.1XZJxOsyhe1WdOk498RHgM2Furuaiw7tMQuZq', 'LOCOOCO'),
('testdatabase', '123456', 'Hoang Loc');

-- --------------------------------------------------------

--
-- Table structure for table `thongtindocgia`
--

CREATE TABLE `thongtindocgia` (
  `IdDocGia` int(11) NOT NULL,
  `Ten` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `ThongTinThem` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thongtindocgia`
--

INSERT INTO `thongtindocgia` (`IdDocGia`, `Ten`, `Email`, `ThongTinThem`) VALUES
(62, 'Hoa', 'hoa@gmail.com', 'Thong tin them ne'),
(63, 'Hoa', '', 'Thong tin them ne'),
(64, 'Kim', 'kim@gmail.com', 'Thong tin them ne'),
(65, 'Dung', 'dung@gmail.com', 'Thong tin them ne'),
(66, 'Hoang Loc', 'loc123@gmail.com', 'Thong tin them ne'),
(67, 'ahi', 'adhi@gmail.com', 'Thong tin them ne');

-- --------------------------------------------------------

--
-- Table structure for table `traloi`
--

CREATE TABLE `traloi` (
  `IdTraLoi` int(11) NOT NULL,
  `NoiDung` varchar(500) NOT NULL,
  `IdBinhLuan` int(11) NOT NULL,
  `IdDocGia` int(11) NOT NULL,
  `NgayViet` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `traloi`
--

INSERT INTO `traloi` (`IdTraLoi`, `NoiDung`, `IdBinhLuan`, `IdDocGia`, `NgayViet`) VALUES
(17, 'thanks', 39, 67, '2020-10-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`TieuDeURL`),
  ADD KEY `TacGia` (`TacGia`);

--
-- Indexes for table `baiviet_danhmuc`
--
ALTER TABLE `baiviet_danhmuc`
  ADD PRIMARY KEY (`TieuDeURL`,`IdDanhMuc`),
  ADD KEY `IdDanhMuc` (`IdDanhMuc`);

--
-- Indexes for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`IdBinhLuan`),
  ADD KEY `IdDocGia` (`IdDocGia`),
  ADD KEY `TieuDeURL` (`TieuDeURL`);

--
-- Indexes for table `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`IdDanhMuc`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`TaiKhoan`);

--
-- Indexes for table `thongtindocgia`
--
ALTER TABLE `thongtindocgia`
  ADD PRIMARY KEY (`IdDocGia`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `traloi`
--
ALTER TABLE `traloi`
  ADD PRIMARY KEY (`IdTraLoi`),
  ADD KEY `IdBinhLuan` (`IdBinhLuan`),
  ADD KEY `IdDocGia` (`IdDocGia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `IdBinhLuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `IdDanhMuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `thongtindocgia`
--
ALTER TABLE `thongtindocgia`
  MODIFY `IdDocGia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `traloi`
--
ALTER TABLE `traloi`
  MODIFY `IdTraLoi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `baiviet`
--
ALTER TABLE `baiviet`
  ADD CONSTRAINT `baiviet_ibfk_1` FOREIGN KEY (`TacGia`) REFERENCES `taikhoan` (`TaiKhoan`);

--
-- Constraints for table `baiviet_danhmuc`
--
ALTER TABLE `baiviet_danhmuc`
  ADD CONSTRAINT `baiviet_danhmuc_ibfk_1` FOREIGN KEY (`IdDanhMuc`) REFERENCES `danhmuc` (`IdDanhMuc`),
  ADD CONSTRAINT `baiviet_danhmuc_ibfk_2` FOREIGN KEY (`TieuDeURL`) REFERENCES `baiviet` (`TieuDeURL`);

--
-- Constraints for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `binhluan_ibfk_1` FOREIGN KEY (`IdDocGia`) REFERENCES `thongtindocgia` (`IdDocGia`),
  ADD CONSTRAINT `binhluan_ibfk_2` FOREIGN KEY (`TieuDeURL`) REFERENCES `baiviet` (`TieuDeURL`);

--
-- Constraints for table `traloi`
--
ALTER TABLE `traloi`
  ADD CONSTRAINT `traloi_ibfk_1` FOREIGN KEY (`IdBinhLuan`) REFERENCES `binhluan` (`IdBinhLuan`),
  ADD CONSTRAINT `traloi_ibfk_2` FOREIGN KEY (`IdDocGia`) REFERENCES `thongtindocgia` (`IdDocGia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
