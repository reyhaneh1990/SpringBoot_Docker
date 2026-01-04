package com.reyhan.hotel.repository; // پکیج مخازن داده

import com.reyhan.hotel.entity.Hotel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

/**
 * رابط دسترسی به داده‌های هتل
 * این اینترفیس تمام عملیات CRUD (ایجاد، خواندن، به‌روزرسانی، حذف) را
 * برای موجودیت Hotel فراهم می‌کند
 */
public interface HotelRepository extends JpaRepository<Hotel, Long> { // مخزن هتل با کلید Long

    /**
     * جستجوی هتل‌ها بر اساس شهر و نوع
     *
     * @param city شهر هتل (اختیاری - اگر null باشد نادیده گرفته می‌شود)
     * @param type نوع اقامتگاه (hotel, villa, apartment) (اختیاری)
     * @return لیست هتل‌های مطابق معیارها
     */
    @Query("""
            	SELECT h FROM Hotel h 
            	WHERE (:city IS NULL OR LOWER(h.city) LIKE LOWER(CONCAT('%', :city, '%')))
            	  AND (:type IS NULL OR h.type = :type)
            	ORDER BY h.rating DESC, h.reviewCount DESC
            """)
    List<Hotel> searchHotels(@Param("city") String city,
                             @Param("type") String type);

    /**
     * دریافت هتل‌های پرطرفدار بر اساس تعداد نظرات و امتیاز
     *
     * @return لیست هتل‌های پرطرفدار
     */
    @Query("""
            	SELECT h FROM Hotel h 
            	WHERE h.reviewCount > 0 
            	ORDER BY h.reviewCount DESC, h.rating DESC
            """)
    List<Hotel> findPopularHotels();

    /**
     * جستجوی هتل‌های دارای اتاق‌های موجود در بازه زمانی
     *
     * @param city      شهر هتل (اختیاری)
     * @param type      نوع اقامتگاه (اختیاری)
     * @param startDate تاریخ شروع
     * @param endDate   تاریخ پایان
     * @return لیست هتل‌های با اتاق‌های موجود
     */
    @Query("""
            	SELECT DISTINCT h FROM Hotel h 
            	JOIN h.rooms r 
            	WHERE (:city IS NULL OR LOWER(h.city) LIKE LOWER(CONCAT('%', :city, '%')))
            	  AND (:type IS NULL OR h.type = :type)
            	  AND NOT EXISTS (
            	      SELECT res FROM Reservation res 
            	      WHERE res.room = r 
            	        AND res.startDate <= :endDate 
            	        AND res.endDate >= :startDate
            	  )
            	ORDER BY h.rating DESC, h.reviewCount DESC
            """)
    List<Hotel> searchAvailableHotels(@Param("city") String city,
                                      @Param("type") String type,
                                      @Param("startDate") LocalDate startDate,
                                      @Param("endDate") LocalDate endDate);
}


