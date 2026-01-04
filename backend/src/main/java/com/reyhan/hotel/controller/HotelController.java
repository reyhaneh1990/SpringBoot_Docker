package com.reyhan.hotel.controller; // پکیج مربوط به کنترلرهای REST

import com.reyhan.hotel.entity.Hotel;
import com.reyhan.hotel.entity.Room;
import com.reyhan.hotel.repository.HotelRepository;
import com.reyhan.hotel.repository.RoomRepository;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

/**
 * کنترلر REST API برای مدیریت هتل‌ها و اتاق‌ها
 * این کلاس endpointهای مربوط به لیست هتل‌ها و اتاق‌ها را فراهم می‌کند
 */
@RestController // مشخص می‌کند پاسخ‌ها JSON است
@RequestMapping("/api/hotels") // مسیر پایه برای تمام متدها
@CrossOrigin // فعال‌سازی CORS برای فرانت‌اند
public class HotelController { // تعریف کلاس کنترلر
	/**
	 * مخزن داده‌های هتل برای دسترسی به اطلاعات هتل‌ها
	 */
	private final HotelRepository hotelRepository; // وابستگی به مخزن هتل
	
	/**
	 * مخزن داده‌های اتاق برای جستجوی اتاق‌های موجود
	 */
	private final RoomRepository roomRepository; // وابستگی به مخزن اتاق

	/**
	 * سازنده کنترلر که وابستگی‌ها را تزریق می‌کند
	 * @param hotelRepository مخزن هتل‌ها
	 * @param roomRepository مخزن اتاق‌ها
	 */
	public HotelController(HotelRepository hotelRepository, RoomRepository roomRepository) { // سازنده با تزریق وابستگی
		this.hotelRepository = hotelRepository; // مقداردهی مخزن هتل
		this.roomRepository = roomRepository; // مقداردهی مخزن اتاق
	}

	/**
	 * دریافت لیست تمام هتل‌های موجود در سیستم
	 * @return لیست تمام هتل‌ها
	 */
	@GetMapping // هندلر GET /api/hotels
	public List<Hotel> listHotels() { // متد بازگرداننده هتل‌ها
		return hotelRepository.findAll(); // خواندن تمام رکوردها از دیتابیس
	}

	/**
	 * دریافت لیست اتاق‌های یک هتل
	 * اگر پارامتر available=true و تاریخ‌ها ارسال شوند، فقط اتاق‌های موجود برگردانده می‌شوند
	 * در غیر این صورت تمام اتاق‌های هتل برگردانده می‌شوند
	 * 
	 * @param id شناسه هتل
	 * @param available اگر true باشد، فقط اتاق‌های موجود را برمی‌گرداند
	 * @param from تاریخ شروع بازه زمانی (برای جستجوی اتاق‌های موجود)
	 * @param to تاریخ پایان بازه زمانی (برای جستجوی اتاق‌های موجود)
	 * @return لیست اتاق‌ها یا 404 اگر هتل پیدا نشود
	 */
	@GetMapping("/{id}/rooms") // هندلر GET برای اتاق‌های یک هتل
	public ResponseEntity<List<Room>> listRooms(@PathVariable Long id, // شناسه هتل از URL
	                                            @RequestParam(required = false) Boolean available, // پارامتر اختیاری وضعیت
	                                            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate from, // تاریخ شروع فیلتر
	                                            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate to) { // تاریخ پایان فیلتر
		if (Boolean.TRUE.equals(available) && from != null && to != null) { // بررسی درخواست اتاق‌های آزاد
			return ResponseEntity.ok(roomRepository.findAvailableRooms(id, from, to)); // بازگرداندن لیست اتاق‌های آزاد
		}
		return hotelRepository.findById(id) // جستجوی هتل با شناسه
			.map(h -> ResponseEntity.ok(h.getRooms())) // تبدیل به پاسخ شامل اتاق‌ها
			.orElse(ResponseEntity.notFound().build()); // در صورت نبود هتل، برگرداندن 404
	}

    /**
     * جستجوی هتل‌ها بر اساس شهر، نوع و تاریخ‌های اقامت
     *
     * @param city     شهر مقصد (اختیاری)
     * @param type     نوع اقامتگاه: hotel, villa, apartment (اختیاری)
     * @param checkin  تاریخ ورود (اختیاری)
     * @param checkout تاریخ خروج (اختیاری)
     * @return لیست هتل‌های مطابق معیارها
     */
    @GetMapping("/search") // هندلر GET /api/hotels/search
    public List<Hotel> searchHotels(@RequestParam(required = false) String city, // شهر مقصد
                                    @RequestParam(required = false) String type, // نوع اقامتگاه
                                    @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkin, // تاریخ ورود
                                    @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkout) { // تاریخ خروج
        if (checkin != null && checkout != null) { // اگر تاریخ‌ها مشخص شده باشند
            return hotelRepository.searchAvailableHotels(city, type, checkin, checkout); // جستجوی هتل‌های با اتاق موجود
        }
        return hotelRepository.searchHotels(city, type); // جستجوی کلی
    }

    /**
     * دریافت هتل‌های پرطرفدار
     *
     * @param limit تعداد هتل‌های بازگشتی (پیش‌فرض: 10)
     * @return لیست هتل‌های پرطرفدار
     */
    @GetMapping("/popular") // هندلر GET /api/hotels/popular
    public List<Hotel> getPopularHotels(@RequestParam(defaultValue = "10") int limit) { // تعداد هتل‌ها
        List<Hotel> hotels = hotelRepository.findPopularHotels(); // دریافت هتل‌های پرطرفدار
        if (hotels.size() > limit) { // اگر بیشتر از limit باشد
            return hotels.subList(0, limit); // برگرداندن فقط limit تای اول
        }
        return hotels; // برگرداندن تمام لیست
    }

    /**
     * دریافت جزئیات یک هتل بر اساس شناسه
     *
     * @param id شناسه هتل
     * @return هتل یا 404 اگر پیدا نشود
     */
    @GetMapping("/{id}") // هندلر GET /api/hotels/{id}
    public ResponseEntity<Hotel> getHotelDetails(@PathVariable Long id) { // شناسه هتل
        return hotelRepository.findById(id) // جستجوی هتل
                .map(ResponseEntity::ok) // تبدیل به ResponseEntity
                .orElse(ResponseEntity.notFound().build()); // در صورت نبود، 404
    }
}


