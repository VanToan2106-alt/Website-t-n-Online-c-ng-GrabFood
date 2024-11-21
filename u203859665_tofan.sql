-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 08, 2024 at 03:10 AM
-- Server version: 10.11.7-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u203859665_tofan`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Trà sữa', '2024-05-15 11:50:15', '2024-05-23 08:07:44'),
(2, 'Món ăn nhẹ', '2024-05-15 11:50:15', '2024-05-23 16:07:29'),
(3, 'Bánh mì', '2024-05-15 11:50:15', '2024-05-23 16:12:25'),
(38, 'Cà phê', '2024-05-15 10:57:52', '2024-05-23 10:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `fullname`, `phone_number`, `email`, `address`, `note`, `order_date`) VALUES
(143, 'Nguyễn Đăng Thành', '0387578520', 'bossryo68a@gmail.com', '68.65.120.213, viet nam', '', '2021-11-07 08:37:06'),
(144, 'DEMO', '03875723232', 'DEMO@gmail.com', 'DEMO', 'DEMO', '2021-11-07 08:42:16'),
(145, 'tuan duong vip pro', '0909090909', 'tuanduongvippro@gmail.com', 'benh vien tam than da nang', 'ship nhanh cho tao', '2024-05-25 03:02:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `id_user`, `num`, `price`, `status`) VALUES
(149, 143, 2, 7, 3, 35000, 'Đã hủy'),
(150, 143, 4, 7, 1, 25000, 'Đã hủy'),
(151, 143, 12, 7, 1, 30000, 'Đã hủy'),
(152, 143, 14, 7, 1, 35000, 'Đã hủy'),
(153, 144, 12, 8, 11, 30000, 'Đã nhận hàng'),
(154, 145, 2, 59, 1, 35000, 'Đang chuẩn bị'),
(155, 145, 26, 59, 1, 35000, 'Đang chuẩn bị');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `number` float NOT NULL,
  `thumbnail` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `id_category` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `price`, `number`, `thumbnail`, `content`, `id_category`, `created_at`, `updated_at`) VALUES
(1, 'BÁNH SÔ-CÔ-LA', 25000, 20, 'uploads/SOCOLAHL.png', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 44px; padding: 0px;\"><span style=\"color: rgb(0, 0, 0);\">Thức uống chinh phục những thực khách khó tính! Sự kết hợp độc đáo giữa trà Ô long, hạt sen thơm bùi và củ năng giòn tan. Thêm vào chút sữa sẽ để vị thêm ngọt ngào.</span><br></p>', 2, '2024-05-23 08:01:37', '2024-05-23 08:01:37'),
(2, 'Trà Sen Vàng', 35000, 50, 'uploads/TRASENVANG.png', '<font color=\"#000000\">Thức uống chinh phục những thực khách khó tính! Sự kết hợp độc đáo giữa trà Ô long, hạt sen thơm bùi và củ năng giòn tan. Thêm vào chút sữa sẽ để vị thêm ngọt ngào.</font><br>', 1, '2024-05-23 08:01:37', '2024-05-23 08:01:37'),
(4, 'Bánh Mì Thịt Nướng', 25000, 30, 'uploads/BMTHITNUONG.png', 'Đặc sản của Việt Nam! Bánh mì giòn với nhân thịt nướng, rau thơm và gia vị đậm đà, hòa quyện trong lớp nước sốt tuyệt hảo.', 3, '2024-05-23 08:01:37', '2024-05-23 08:01:37'),
(5, 'BÁNH MOUSSE ĐÀO', 35000, 10, 'uploads/MOUSSEDAO.png', '<span style=\"color: rgb(83, 56, 44); font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: justify;\">Một sự kết hợp khéo léo giữa kem và lớp bánh mềm, được phủ lên trên vài lát đào ngon tuyệt.</span><br>', 2, '2021-07-07 18:36:37', '2021-08-15 16:24:51'),
(8, 'Freeze Trà xanh', 50000, 10, 'uploads/270_crop_HLC_New_logo_5.1_Products__COOKIES_FREEZE.jpg', '<font size=\"2\">Freeze Trà Xanh</font>', 1, '2021-07-11 16:07:58', '2024-05-23 03:11:26'),
(9, 'Trà sữa Matcha', 25000, 46, 'uploads/TRATHANHDAO.png', '<p>Trà sữa Matcha<br></p>', 1, '2021-07-11 16:38:58', '2021-08-15 16:02:52'),
(10, 'Cafe Phin Đen Nóng', 50000, 44, 'uploads/AMERICANO.png', '<p><font color=\"#53382c\">Dành cho những tín đồ cà phê đích thực! Hương vị cà phê truyền thống được phối trộn độc đáo tại Highlands. Cà phê đậm đà pha từ Phin, cho thêm 1 thìa đường, mang đến vị cà phê đậm đà chất Phin.</font><br></p>', 38, '2021-07-11 16:12:59', '2021-08-15 16:18:52'),
(12, 'Bạc Xỉu Đá', 30000, 15, 'uploads/HLC_New_logo_5.1_Products__BAC_XIU.jpg', '<p>Nếu Phin Sữa Đá dành cho các bạn đam mê vị đậm đà, thì Bạc Xỉu Đá là một sự lựa chọn nhẹ “đô\" cà phê nhưng vẫn thơm ngon, chất lừ không kém!<br></p>', 38, '2021-07-13 10:20:53', '2024-05-23 03:55:34'),
(13, 'BÁNH CHUỐI', 19000, 20, 'uploads/BANHCHUOI.jpg', '<span style=\"color: rgb(83, 56, 44); font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: justify;\">Bánh chuối truyền thống, sự kết hợp của 100% chuối tươi và nước cốt dừa Việt Nam.</span><br>', 2, '2021-07-07 17:41:08', '2021-08-15 16:40:53'),
(14, 'Bánh Mousse Cacao', 35000, 5, 'uploads/MOUSSECACAO.png', '<span style=\"color: rgb(83, 56, 44); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Bánh Mousse Ca Cao, là sự kết hợp giữa ca-cao Việt Nam đậm đà cùng kem tươi.</span><br>', 2, '2021-07-07 17:41:08', '2021-08-15 16:00:55'),
(16, 'Bánh Mì Xíu Mại', 20000, 30, 'uploads/BMXIUMAI.png', 'Bánh mì Việt Nam giòn thơm, với nhân thịt viên hấp dẫn, phủ thêm một lớp nước sốt cà chua ngọt, cùng với rau tươi và gia vị đậm đà.', 3, '2021-07-07 17:25:47', '2021-08-15 16:17:55'),
(17, 'Bánh Caramel Phô Mai', 35000, 10, 'uploads/CARAMELPHOMAI.jpg', 'Ngon khó cưỡng! Bánh phô mai thơm béo được phủ bằng lớp caramel ngọt ngào.', 2, '2021-07-07 18:36:37', '2021-08-15 16:35:55'),
(18, 'Trà Thạch Đào', 50000, 10, 'uploads/TRATHANHDAO.png', '<p><span style=\"color: rgb(0, 0, 0); font-size: 1rem;\">Vị trà đậm đà kết hợp cùng những miếng đào thơm ngon mọng nước cùng thạch đào giòn dai. Thêm vào ít sữa để gia tăng vị béo</span><br></p><p><br></p>', 1, '2021-07-11 16:07:58', '2021-08-15 16:48:55'),
(19, 'Trà Thạch Vải', 50000, 46, 'uploads/TRATHACHVAI_1.png', '<p>Một sự kết hợp thú vị giữa trà đen, những quả vải thơm ngon và thạch giòn khó cưỡng, mang đến thức uống tuyệt hảo!<br></p>', 1, '2021-07-11 16:38:58', '2021-08-15 16:03:56'),
(20, 'Trà Đào', 50000, 44, 'uploads/TRATHANHDAO (1).png', '<p><span style=\"color: rgb(83, 56, 44); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Một sự kết hợp thú vị giữa trà đen, những quả vải thơm ngon và thạch giòn khó cưỡng, mang đến thức uống tuyệt hảo!</span><br></p>', 1, '2021-07-11 16:12:59', '2021-08-15 16:20:56'),
(21, 'Cà Phê Đá', 30000, 15, 'uploads/CFD.png', '<p>Dành cho những tín đồ cà phê đích thực! Hương vị cà phê truyền thống được phối trộn độc đáo tại Highlands. Cà phê đậm đà pha hoàn toàn từ Phin, cho thêm 1 thìa đường, một ít đá viên mát lạnh, tạo nên Phin Đen Đá mang vị cà phê đậm đà chất Phin.<br></p>', 38, '2021-07-13 10:20:53', '2021-08-15 16:42:56'),
(26, 'Bánh Tiramisu', 35000, 100, 'uploads/TIRAMISU.jpg', '<p>Tiramisu thơm béo, làm từ ca-cao Việt Nam đậm đà, kết hợp với phô mai ít béo, vani và chút rum nhẹ nhàng.<br></p>', 2, '2024-05-23 08:01:37', '2024-05-23 08:01:37'),
(28, 'Chả Lụa Xá Xíu', 20000, 90, 'uploads/BMCHALUAXAXIU.png', '<p>Bánh mì Việt Nam giòn thơm với chả lụa và thịt xá xíu thơm ngon, kết hợp cùng rau và gia vị, hòa quyện cùng nước sốt độc đáo.<br></p>', 3, '2024-05-23 08:01:37', '2024-05-23 08:01:37'),
(29, 'Gà Xé Tương Ớt', 19000, 20, 'uploads/BMGAXE.png', '<p>Bánh mì Việt Nam giòn thơm với nhân gà xé, rau, gia vị hòa quyện cùng nước sốt đặc biệt.<br></p>', 3, '2024-05-23 08:01:37', '2024-05-23 08:01:37'),
(30, 'Cafe Phindi Hồng Trà', 35000, 100, 'uploads/270_crop_PHINDI_Hong_Tra.png', '<p>PhinDi Kem Sữa - Cà phê Phin thế hệ mới với chất Phin êm hơn, lần đầu tiên kết hợp cùng Hồng Trà mang đến hương vị quyện êm, phiên bản giới hạn chỉ trong mùa lễ hội 2020!<br></p>', 38, '2024-05-23 08:01:37', '2024-05-23 08:01:37'),
(31, 'Cafe Phindi Kem Sữa', 35000, 90, 'uploads/270_crop_phindi_kem_sua_new.png', '<p>PhinDi Kem Sữa - Cà phê Phin thế hệ mới với chất Phin êm hơn, kết hợp cùng Kem Sữa béo ngậy mang đến hương vị mới lạ, không thể hấp dẫn hơn!<br></p>', 38, '2024-05-22 10:22:19', '2024-05-23 17:28:01');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `hoten` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(28) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `hoten`, `username`, `password`, `phone`, `email`) VALUES
(7, 'Nguyễn Văn Toàn', 'Admin', 'toan2106', '+84387578520', 'toanngu.2106@gmail.com'),
(8, 'Văn Toàn', 'vantoan', 'toan2106', '0387578520', 'toanngu.2106@gmail.com'),
(59, 'tao la tuan duong', 'tuanduongprovip', '123', '0909090909', 'tuanduongvippro@gmail.com'),
(60, 'Nguyễn Lâm Hoành', 'hoanhng', '123456', '0956254656', 'abc@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
