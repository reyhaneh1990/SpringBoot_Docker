-- فایل SQL برای داده‌های تستی
-- این فایل شامل دستورات SQL برای ایجاد و درج داده‌های تستی برای سیستم رزرو هتل است

-- پاک کردن داده‌های قبلی (اختیاری - فقط برای تست)
-- TRUNCATE TABLE reservations;
-- TRUNCATE TABLE rooms;
-- TRUNCATE TABLE hotels;

-- درج هتل‌های تستی
INSERT INTO hotels (name, city, address, type, image_url, images, rating, review_count, phone, email, description)
VALUES
-- هتل‌های تهران
('هتل اسپیناس تهران', 'تهران', 'تهران، میدان ونک، خیابان ملاصدرا', 'hotel',
 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1596436889106-be35e843f974?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.8, 892, '021-88776655', 'info@espinastehran.com',
 'هتل ۵ ستاره اسپیناس تهران با امکانات لوکس و موقعیت عالی در مرکز شهر'),

('هتل آزادی تهران', 'تهران', 'تهران، میدان آزادی', 'hotel',
 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1590490360182-c33d57733427?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1625246333195-78d9c38ad449?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.5, 567, '021-66778899', 'reservation@azadihotel.com',
 'هتل ۴ ستاره آزادی با دسترسی آسان به فرودگاه و مراکز خرید'),

-- هتل‌های اصفهان
('هتل عباسی اصفهان', 'اصفهان', 'اصفهان، خیابان چهارباغ عباسی', 'hotel',
 'https://images.unsplash.com/photo-1564501049418-3c27787d01e8?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.7, 478, '031-32202020', 'info@abbasihotel.com',
 'هتل ۵ ستاره عباسی اصفهان با معماری تاریخی و امکانات مدرن'),

('هتل پارسیان کوثر اصفهان', 'اصفهان', 'اصفهان، خیابان فردوسی', 'hotel',
 'https://images.unsplash.com/photo-1551782450-17144efb9c50?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1596436889106-be35e843f974?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1560077779-5362e96b321c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.6, 345, '031-32224444', 'info@parsian-kowsar.com',
 'هتل ۴ ستاره پارسیان کوثر در نزدیکی مراکز تاریخی اصفهان'),

-- هتل‌های شیراز
('هتل هما شیراز', 'شیراز', 'شیراز، بلوار زند', 'hotel',
 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1564501049418-3c27787d01e8?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.6, 423, '071-32334567', 'reservation@homashiraz.com',
 'هتل ۴ ستاره هما شیراز با فضای زیبا و آرامش‌بخش'),

-- هتل‌های مشهد
('هتل قصر طلایی مشهد', 'مشهد', 'مشهد، میدان شهدا', 'hotel',
 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.7, 756, '051-38555555', 'info@ghasre-talai.com',
 'هتل ۵ ستاره قصر طلایی مشهد در فاصله نزدیک به حرم مطهر'),

-- هتل‌های کیش
('هتل ترنج کیش', 'کیش', 'کیش، بلوار دریا', 'hotel',
 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1596436889106-be35e843f974?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1560077779-5362e96b321c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.9, 1234, '076-44445555', 'reservation@torangekish.com',
 'هتل ۵ ستاره ترنج کیش با منظره دریا و ساحل خصوصی'),

('هتل شایان کیش', 'کیش', 'کیش، بلوار میرمهنا', 'hotel',
 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1564501049418-3c27787d01e8?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.5, 689, '076-44445678', 'info@shayankish.com',
 'هتل ۴ ستاره شایان کیش با امکانات تفریحی و رستوران‌های متنوع'),

-- ویلاها
('ویلا ساحلی کیش', 'کیش', 'کیش، منطقه ساحلی', 'villa',
 'https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.8, 234, '076-44556677', 'villa@kishbeach.com',
 'ویلا لوکس ساحلی با استخر و فضای باز وسیع'),

('ویلا جنگلی شمال', 'مازندران', 'رامسر، جاده جنگلی', 'villa',
 'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1600585154084-4e5fe7c39198?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1600607687644-c7171b42498b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.7, 189, '011-33445566', 'villa@northforest.com',
 'ویلا دنج جنگلی با فضای آرام و طبیعت بکر'),

-- آپارتمان‌ها
('آپارتمان لوکس تهرانپارس', 'تهران', 'تهران، تهرانپارس، خیابان 142', 'apartment',
 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.4, 156, '021-77889900', 'apt@tehranpars.com',
 'آپارتمان مبله و مجهز در منطقه تهرانپارس'),

('آپارتمان اصفهان مرکز', 'اصفهان', 'اصفهان، خیابان آمادگاه', 'apartment',
 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 4.3, 98, '031-33445577', 'apt@esfahancenter.com',
 'آپارتمان زیبا در مرکز شهر اصفهان با دسترسی به مراکز تاریخی');

-- درج اتاق‌ها برای هتل‌ها
-- هتل اسپیناس تهران (ID: 1)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (1, '101', 'Single', 1, 3200000),
       (1, '102', 'Double', 2, 4200000),
       (1, '201', 'Suite', 3, 6500000),
       (1, '202', 'Deluxe', 2, 5500000),
       (1, '301', 'Presidential', 4, 12000000);

-- هتل آزادی تهران (ID: 2)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (2, '101', 'Single', 1, 1800000),
       (2, '102', 'Double', 2, 2800000),
       (2, '201', 'Double', 2, 3000000),
       (2, '202', 'Suite', 3, 4500000);

-- هتل عباسی اصفهان (ID: 3)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (3, '101', 'Single', 1, 2500000),
       (3, '102', 'Double', 2, 3500000),
       (3, '201', 'Double', 2, 3800000),
       (3, '202', 'Suite', 3, 5800000),
       (3, '301', 'Royal Suite', 4, 9500000);

-- هتل پارسیان کوثر اصفهان (ID: 4)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (4, '101', 'Single', 1, 1500000),
       (4, '102', 'Double', 2, 2200000),
       (4, '201', 'Double', 2, 2500000),
       (4, '202', 'Suite', 3, 3800000);

-- هتل هما شیراز (ID: 5)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (5, '101', 'Single', 1, 1400000),
       (5, '102', 'Double', 2, 2000000),
       (5, '201', 'Double', 2, 2300000),
       (5, '202', 'Suite', 3, 3500000);

-- هتل قصر طلایی مشهد (ID: 6)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (6, '101', 'Single', 1, 2800000),
       (6, '102', 'Double', 2, 3800000),
       (6, '201', 'Double', 2, 4000000),
       (6, '202', 'Suite', 3, 6000000),
       (6, '301', 'Royal', 4, 10000000);

-- هتل ترنج کیش (ID: 7)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (7, '101', 'Single', 1, 4500000),
       (7, '102', 'Double', 2, 5800000),
       (7, '201', 'Double', 2, 6200000),
       (7, '202', 'Suite', 3, 8500000),
       (7, '301', 'Beachfront Suite', 4, 15000000);

-- هتل شایان کیش (ID: 8)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (8, '101', 'Single', 1, 3200000),
       (8, '102', 'Double', 2, 4200000),
       (8, '201', 'Double', 2, 4500000),
       (8, '202', 'Suite', 3, 6500000);

-- ویلا ساحلی کیش (ID: 9)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (9, 'Villa 1', 'Entire Villa', 8, 25000000),
       (9, 'Villa 2', 'Entire Villa', 6, 20000000),
       (9, 'Villa 3', 'Entire Villa', 10, 30000000);

-- ویلا جنگلی شمال (ID: 10)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (10, 'Villa A', 'Entire Villa', 6, 12000000),
       (10, 'Villa B', 'Entire Villa', 8, 15000000),
       (10, 'Villa C', 'Entire Villa', 4, 10000000);

-- آپارتمان لوکس تهرانپارس (ID: 11)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (11, 'Apt 101', '2 Bedroom', 4, 2500000),
       (11, 'Apt 102', '1 Bedroom', 2, 1800000),
       (11, 'Apt 201', '3 Bedroom', 6, 3800000);

-- آپارتمان اصفهان مرکز (ID: 12)
INSERT INTO rooms (hotel_id, number, type, capacity, price_per_night)
VALUES (12, 'Apt 101', '1 Bedroom', 2, 1200000),
       (12, 'Apt 102', '2 Bedroom', 4, 2000000),
       (12, 'Apt 201', '2 Bedroom', 4, 2200000);

-- ============================================
-- داده‌های تستی برای قطار، پرواز و اتوبوس
-- ============================================

-- درج قطارهای تستی
INSERT INTO train (origin, destination, departure_date, departure_time, arrival_time, train_name, train_class,
                   available_seats, price, stops, image_url, images, phone, email, description)
VALUES
-- قطارهای تهران - مشهد
('تهران', 'مشهد', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '17:00:00', '05:00:00', 'شهید قاسم سلیمانی', 'کوپه خواب', 12,
 350000,
 'سمنان، شاهرود، نیشابور',
 'https://images.unsplash.com/photo-1581594549595-35f6edc7b762?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91000001', 'info@rai.ir', 'قطار لوکس کوپه خواب با امکانات کامل و پذیرایی مجلل'),

('تهران', 'مشهد', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '21:30:00', '09:30:00', 'امام رضا', 'درجه یک', 20, 380000,
 'سمنان، شاهرود، نیشابور',
 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1581594549595-35f6edc7b762?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91000002', 'reservation@rai.ir', 'قطار درجه یک با صندلی‌های راحت و پذیرایی'),

-- قطارهای تهران - اصفهان
('تهران', 'اصفهان', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '08:30:00', '15:30:00', 'چمران', 'بیزینس', 15, 220000,
 'قم، کاشان',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1581594549595-35f6edc7b762?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91000003', 'info@rai.ir', 'قطار بیزینس با اینترنت رایگان و پذیرایی'),

('تهران', 'اصفهان', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '14:00:00', '21:00:00', 'سعدی', 'درجه یک', 18, 240000,
 'قم، کاشان',
 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91000004', 'reservation@rai.ir', 'قطار درجه یک با امکانات مدرن'),

-- قطارهای تهران - شیراز
('تهران', 'شیراز', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '14:00:00', '04:00:00', 'سعدی', 'درجه یک', 10, 420000,
 'اراک، بروجرد، خرم‌آباد',
 'https://images.unsplash.com/photo-1581594549595-35f6edc7b762?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91000005', 'info@rai.ir', 'قطار درجه یک با پذیرایی و امکانات کامل'),

-- قطارهای اصفهان - مشهد
('اصفهان', 'مشهد', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '10:00:00', '22:00:00', 'شاه عباس', 'اکونومی', 25, 300000,
 'کاشان، تهران، سمنان، شاهرود',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '031-91000006', 'info@rai.ir', 'قطار اکونومی با قیمت مناسب');

-- درج پروازهای تستی
INSERT INTO flight (origin, destination, origin_airport, destination_airport, departure_date, departure_time,
                    arrival_time, airline, flight_number, cabin_class, available_seats, price, is_round_trip, image_url,
                    images, phone, email, description)
VALUES
-- پروازهای تهران - مشهد
('تهران', 'مشهد', 'تهران (IKA)', 'مشهد (MHD)', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '08:30:00', '10:00:00', 'ایران ایر',
 'IR123', 'اکونومی', 20, 1200000, FALSE,
 'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1540962351504-03099e0a754b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1556388158-158ea5ccacbd?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91020001', 'info@iranair.com', 'پرواز مستقیم ایران ایر با پذیرایی و امکانات کامل'),

('تهران', 'مشهد', 'تهران (IKA)', 'مشهد (MHD)', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '14:00:00', '15:30:00', 'ماهان ایر',
 'W5112', 'بیزینس', 8, 2500000, FALSE,
 'https://images.unsplash.com/photo-1540962351504-03099e0a754b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1556388158-158ea5ccacbd?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91020002', 'reservation@mahan.aero', 'پرواز بیزینس ماهان ایر با صندلی‌های راحت'),

-- پروازهای تهران - استانبول
('تهران', 'استانبول', 'تهران (IKA)', 'استانبول (IST)', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '14:45:00', '17:45:00',
 'ترکیش ایرلاینز', 'TK456', 'بیزینس', 10, 3500000, FALSE,
 'https://images.unsplash.com/photo-1556388158-158ea5ccacbd?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1540962351504-03099e0a754b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91020003', 'info@turkishairlines.com', 'پرواز مستقیم ترکیش ایرلاینز با خدمات ۵ ستاره'),

-- پروازهای تهران - دبی
('تهران', 'دبی', 'تهران (IKA)', 'دبی (DXB)', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '22:15:00', '00:30:00', 'امارات',
 'EK972', 'اکونومی', 25, 2800000, FALSE,
 'https://images.unsplash.com/photo-1540962351504-03099e0a754b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1556388158-158ea5ccacbd?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1436491865332-7a61a109cc05?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91020004', 'reservation@emirates.com', 'پرواز مستقیم امارات با امکانات کامل'),

-- پروازهای تهران - اصفهان
('تهران', 'اصفهان', 'تهران (IKA)', 'اصفهان (IFN)', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '07:00:00', '08:15:00',
 'ایران ایر', 'IR456', 'اکونومی', 30, 850000, FALSE,
 'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1540962351504-03099e0a754b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91020005', 'info@iranair.com', 'پرواز کوتاه مدت تهران به اصفهان'),

-- پروازهای تهران - شیراز
('تهران', 'شیراز', 'تهران (IKA)', 'شیراز (SYZ)', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '09:30:00', '11:00:00',
 'ماهان ایر', 'W5215', 'اکونومی', 22, 1100000, FALSE,
 'https://images.unsplash.com/photo-1556388158-158ea5ccacbd?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1540962351504-03099e0a754b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91020006', 'reservation@mahan.aero', 'پرواز مستقیم ماهان ایر با قیمت مناسب');

-- درج اتوبوس‌های تستی
INSERT INTO bus (origin, destination, departure_date, departure_time, arrival_time, company, bus_type, available_seats,
                 price, origin_terminal, destination_terminal, image_url, images, phone, email, description)
VALUES
-- اتوبوس‌های تهران - مشهد
('تهران', 'مشهد', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '22:00:00', '08:00:00', 'شرکت مسافربری آسمان', 'VIP', 15, 180000,
 'ترمینال بیهقی', 'ترمینال امام رضا',
 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1581594549595-35f6edc7b762?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91030001', 'info@aseman-bus.com', 'اتوبوس VIP با صندلی‌های راحت، اینترنت رایگان و پذیرایی'),

('تهران', 'مشهد', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '20:00:00', '06:00:00', 'ایران پیما', 'VIP', 12, 190000,
 'ترمینال بیهقی', 'ترمینال امام رضا',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91030002', 'reservation@iranpima.com', 'اتوبوس VIP با امکانات کامل'),

-- اتوبوس‌های تهران - اصفهان
('تهران', 'اصفهان', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '14:30:00', '20:30:00', 'شرکت سپهر سیر', 'معمولی', 8, 90000,
 'ترمینال جنوب', 'ترمینال کاوه',
 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91030003', 'info@sepahrsir.com', 'اتوبوس معمولی با قیمت اقتصادی'),

('تهران', 'اصفهان', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '08:00:00', '14:00:00', 'شرکت سپهر سیر', 'VIP', 18, 120000,
 'ترمینال جنوب', 'ترمینال کاوه',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91030004', 'reservation@sepahrsir.com', 'اتوبوس VIP با کولر گازی و صندلی راحت'),

-- اتوبوس‌های تهران - شیراز
('تهران', 'شیراز', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '19:00:00', '09:00:00', 'اتوبوسرانی آسان سفر', 'اتوبوس خواب', 5,
 220000,
 'ترمینال غرب', 'ترمینال کاراندیش',
 'https://images.unsplash.com/photo-1581594549595-35f6edc7b762?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80,https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91030005', 'info@asansafar.com', 'اتوبوس خواب با پتو و بالش و صبحانه'),

('تهران', 'شیراز', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '16:00:00', '06:00:00', 'شرکت مسافربری آسمان', 'VIP', 10,
 240000,
 'ترمینال بیهقی', 'ترمینال کاراندیش',
 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91030006', 'reservation@aseman-bus.com', 'اتوبوس VIP با اینترنت و پذیرایی'),

-- اتوبوس‌های تهران - تبریز
('تهران', 'تبریز', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '20:00:00', '07:00:00', 'ایران پیما', 'VIP', 20, 160000,
 'ترمینال بیهقی', 'ترمینال تبریز',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91030007', 'info@iranpima.com', 'اتوبوس VIP با صندلی‌های راحت'),

-- اتوبوس‌های تهران - یزد
('تهران', 'یزد', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '16:00:00', '23:00:00', 'یزد سیر', 'معمولی', 0, 110000,
 'ترمینال جنوب', 'ترمینال یزد',
 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 'https://images.unsplash.com/photo-1550558014-4804c9a89533?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
 '021-91030008', 'info@yazdsir.com', 'اتوبوس معمولی با قیمت مناسب');

