package com.reyhan.hotel.repository;

import com.reyhan.hotel.entity.Bus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

/**
 * رابط دسترسی به داده‌های اتوبوس
 */
public interface BusRepository extends JpaRepository<Bus, Long> {
    /**
     * جستجوی اتوبوس بر اساس مبدأ، مقصد، تاریخ و نوع
     */
    @Query("""
                SELECT b FROM Bus b 
                WHERE (:origin IS NULL OR LOWER(b.origin) LIKE LOWER(CONCAT('%', :origin, '%')))
                  AND (:destination IS NULL OR LOWER(b.destination) LIKE LOWER(CONCAT('%', :destination, '%')))
                  AND (:date IS NULL OR b.departureDate = :date)
                  AND (:busType IS NULL OR b.busType = :busType)
                  AND b.availableSeats > 0
                ORDER BY b.price ASC
            """)
    List<Bus> searchBuses(@Param("origin") String origin,
                          @Param("destination") String destination,
                          @Param("date") LocalDate date,
                          @Param("busType") String busType);

    /**
     * دریافت اتوبوس‌های پرطرفدار (با بیشترین صندلی‌های خالی و قیمت مناسب)
     */
    @Query("""
                SELECT b FROM Bus b 
                WHERE b.availableSeats > 0 
                ORDER BY b.availableSeats DESC, b.price ASC
            """)
    List<Bus> findPopularBuses();
}

