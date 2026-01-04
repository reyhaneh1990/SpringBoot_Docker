package com.reyhan.hotel.repository;

import com.reyhan.hotel.entity.Flight;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

/**
 * رابط دسترسی به داده‌های پرواز
 */
public interface FlightRepository extends JpaRepository<Flight, Long> {
    /**
     * جستجوی پرواز بر اساس مبدأ، مقصد، تاریخ و کلاس
     */
    @Query("""
                SELECT f FROM Flight f 
                WHERE (:origin IS NULL OR LOWER(f.origin) LIKE LOWER(CONCAT('%', :origin, '%')))
                  AND (:destination IS NULL OR LOWER(f.destination) LIKE LOWER(CONCAT('%', :destination, '%')))
                  AND (:date IS NULL OR f.departureDate = :date)
                  AND (:cabinClass IS NULL OR f.cabinClass = :cabinClass)
                  AND f.availableSeats > 0
                ORDER BY f.price ASC
            """)
    List<Flight> searchFlights(@Param("origin") String origin,
                               @Param("destination") String destination,
                               @Param("date") LocalDate date,
                               @Param("cabinClass") String cabinClass);

    /**
     * جستجوی پرواز رفت و برگشت
     */
    @Query("""
                SELECT f FROM Flight f 
                WHERE (:origin IS NULL OR LOWER(f.origin) LIKE LOWER(CONCAT('%', :origin, '%')))
                  AND (:destination IS NULL OR LOWER(f.destination) LIKE LOWER(CONCAT('%', :destination, '%')))
                  AND (:departDate IS NULL OR f.departureDate = :departDate)
                  AND (:returnDate IS NULL OR f.returnDate = :returnDate)
                  AND f.availableSeats > 0
                ORDER BY f.price ASC
            """)
    List<Flight> searchRoundTripFlights(@Param("origin") String origin,
                                        @Param("destination") String destination,
                                        @Param("departDate") LocalDate departDate,
                                        @Param("returnDate") LocalDate returnDate);

    /**
     * دریافت پروازهای پرطرفدار (با بیشترین صندلی‌های خالی و قیمت مناسب)
     */
    @Query("""
                SELECT f FROM Flight f 
                WHERE f.availableSeats > 0 
                ORDER BY f.availableSeats DESC, f.price ASC
            """)
    List<Flight> findPopularFlights();
}

