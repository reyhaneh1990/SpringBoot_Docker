package com.reyhan.hotel.repository;

import com.reyhan.hotel.entity.Train;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

/**
 * رابط دسترسی به داده‌های قطار
 */
public interface TrainRepository extends JpaRepository<Train, Long> {
    /**
     * جستجوی قطار بر اساس مبدأ، مقصد، تاریخ و کلاس
     */
    @Query("""
                SELECT t FROM Train t 
                WHERE (:origin IS NULL OR LOWER(t.origin) LIKE LOWER(CONCAT('%', :origin, '%')))
                  AND (:destination IS NULL OR LOWER(t.destination) LIKE LOWER(CONCAT('%', :destination, '%')))
                  AND (:date IS NULL OR t.departureDate = :date)
                  AND (:trainClass IS NULL OR t.trainClass = :trainClass)
                  AND t.availableSeats > 0
                ORDER BY t.price ASC
            """)
    List<Train> searchTrains(@Param("origin") String origin,
                             @Param("destination") String destination,
                             @Param("date") LocalDate date,
                             @Param("trainClass") String trainClass);

    /**
     * دریافت قطارهای پرطرفدار (با بیشترین صندلی‌های خالی و قیمت مناسب)
     */
    @Query("""
                SELECT t FROM Train t 
                WHERE t.availableSeats > 0 
                ORDER BY t.availableSeats DESC, t.price ASC
            """)
    List<Train> findPopularTrains();
}

