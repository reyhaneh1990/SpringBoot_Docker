package com.reyhan.hotel.entity; // پکیج موجودیت‌ها

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

/**
 * موجودیت هتل - نمایانگر یک هتل در سیستم
 * این کلاس اطلاعات اصلی هتل را نگهداری می‌کند
 */
@Entity // ثبت کلاس به عنوان جدول دیتابیس
public class Hotel { // تعریف موجودیت هتل
	/**
	 * شناسه یکتای هتل که به صورت خودکار تولید می‌شود
	 */
	@Id // مشخص کردن فیلد به عنوان کلید اصلی
	@GeneratedValue(strategy = GenerationType.IDENTITY) // سپردن تولید شناسه به دیتابیس
	private Long id; // شناسه یکتا هتل

	/**
	 * نام هتل
	 */
	private String name; // نام هتل
	
	/**
	 * شهر محل قرارگیری هتل
	 */
	private String city; // شهر هتل
	
	/**
	 * آدرس دقیق هتل
	 */
	private String address; // آدرس کامل هتل

    /**
     * نوع اقامتگاه (hotel, villa, apartment)
     */
    private String type; // نوع اقامتگاه

    /**
     * آدرس تصویر اصلی هتل
     */
    private String imageUrl; // آدرس تصویر اصلی

    /**
     * لیست آدرس‌های تصاویر بیشتر (ذخیره به صورت کاما جدا شده)
     */
    @Lob // فیلد بزرگ برای ذخیره لیست تصاویر
    private String images; // لیست تصاویر به صورت کاما جدا شده

    /**
     * امتیاز هتل (از 1 تا 5)
     */
    private Double rating; // امتیاز هتل

    /**
     * تعداد نظرات
     */
    private Integer reviewCount; // تعداد نظرات

    /**
     * شماره تلفن هتل
     */
    private String phone; // شماره تلفن

    /**
     * ایمیل هتل
     */
    private String email; // ایمیل هتل

    /**
     * توضیحات هتل
     */
    @Lob // فیلد بزرگ برای توضیحات
    private String description; // توضیحات کامل هتل

	/**
	 * لیست اتاق‌های این هتل
	 * با حذف هتل، تمام اتاق‌های آن نیز حذف می‌شوند (orphanRemoval = true)
	 */
	@OneToMany(mappedBy = "hotel", cascade = CascadeType.ALL, orphanRemoval = true) // رابطه با اتاق‌ها
	private List<Room> rooms = new ArrayList<>(); // لیست اتاق‌های متعلق به هتل

	public Long getId() { // دریافت شناسه
		return id; // بازگرداندن id
	}

	public String getName() { // دریافت نام
		return name; // بازگرداندن نام
	}

	public void setName(String name) { // تنظیم نام
		this.name = name; // ذخیره مقدار
	}

	public String getCity() { // دریافت شهر
		return city; // بازگرداندن شهر
	}

	public void setCity(String city) { // تنظیم شهر
		this.city = city; // ذخیره مقدار
	}

	public String getAddress() { // دریافت آدرس
		return address; // بازگرداندن آدرس
	}

	public void setAddress(String address) { // تنظیم آدرس
		this.address = address; // ذخیره مقدار
	}

	public List<Room> getRooms() { // دریافت لیست اتاق‌ها
		return rooms; // بازگرداندن لیست
	}

	public void setRooms(List<Room> rooms) { // جایگزینی لیست اتاق‌ها
        this.rooms = rooms; // ذخیره لیست جدید
    }

    public String getType() { // دریافت نوع اقامتگاه
        return type; // بازگرداندن نوع
    }

    public void setType(String type) { // تنظیم نوع اقامتگاه
        this.type = type; // ذخیره مقدار
    }

    public String getImageUrl() { // دریافت آدرس تصویر اصلی
        return imageUrl; // بازگرداندن آدرس تصویر
    }

    public void setImageUrl(String imageUrl) { // تنظیم آدرس تصویر اصلی
        this.imageUrl = imageUrl; // ذخیره مقدار
    }

    public String getImages() { // دریافت لیست تصاویر
        return images; // بازگرداندن لیست
    }

    public void setImages(String images) { // تنظیم لیست تصاویر
        this.images = images; // ذخیره مقدار
    }

    public Double getRating() { // دریافت امتیاز
        return rating; // بازگرداندن امتیاز
    }

    public void setRating(Double rating) { // تنظیم امتیاز
        this.rating = rating; // ذخیره مقدار
    }

    public Integer getReviewCount() { // دریافت تعداد نظرات
        return reviewCount; // بازگرداندن تعداد
    }

    public void setReviewCount(Integer reviewCount) { // تنظیم تعداد نظرات
        this.reviewCount = reviewCount; // ذخیره مقدار
    }

    public String getPhone() { // دریافت شماره تلفن
        return phone; // بازگرداندن شماره
    }

    public void setPhone(String phone) { // تنظیم شماره تلفن
        this.phone = phone; // ذخیره مقدار
    }

    public String getEmail() { // دریافت ایمیل
        return email; // بازگرداندن ایمیل
    }

    public void setEmail(String email) { // تنظیم ایمیل
        this.email = email; // ذخیره مقدار
    }

    public String getDescription() { // دریافت توضیحات
        return description; // بازگرداندن توضیحات
    }

    public void setDescription(String description) { // تنظیم توضیحات
        this.description = description; // ذخیره مقدار
	}
}


