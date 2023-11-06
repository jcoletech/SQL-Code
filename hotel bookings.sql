CREATE DATABASE hotel_booking;

USE hotel_booking;

-- what is total number of hotel booked for both hotels?
SELECT count(*) hotel
FROM hb;

-- What is the combined count of bookings that have been cancelled and those that have not been cancelled?
SELECT is_canceled, COUNT(*) AS booking_count
FROM hb
GROUP BY is_canceled;

-- What is the overall count of bookings (considering both cancelled and not cancelled) for both resort and city hotels combined?
SELECT hotel,
    CASE is_canceled
        WHEN 0 THEN 'not cancelled'
        WHEN 1 THEN 'cancelled'
    END AS cancellation_status,
    COUNT(*) AS booking_count
FROM hb
GROUP BY hotel, cancellation_status;

-- What is the overall number of bookings for each individual hotel?
SELECT hotel, COUNT(*) AS hotel
FROM hb
GROUP BY hotel;

-- what are the key performace indicators?
SELECT 
    count(hotel) AS bookings,
    AVG(adr) AS average_daily_rate,
    SUM(total_of_special_requests) AS special_requests,
    SUM(is_repeated_guest) AS repeated_guest,
    SUM(babies) AS babies,
    SUM(children) AS children,
    SUM(adults) AS adults,
    COUNT(distinct assigned_room_type) AS room_types,
    COUNT(distinct meal) AS meal_types
FROM hb;

-- What customer types are associated with bookings that are cancelled and not cancelled for both hotel types?
SELECT hotel, customer_type,
    CASE is_canceled
        WHEN 0 THEN 'not cancelled'
        WHEN 1 THEN 'cancelled'
    END AS cancellation_status,
    COUNT(*) AS booking_count
FROM hb
GROUP BY customer_type, hotel, cancellation_status;

-- What types of customers are associated with the hotels?
SELECT hotel, customer_type, COUNT(*) AS customer_type_count
FROM hb
GROUP BY hotel, customer_type;

-- What distribution channels are utilized for both cancelled and non-cancelled bookings?
SELECT 
	distribution_channel, COUNT(*) AS distribution_channel, 
    CASE is_canceled
        WHEN 0 THEN 'not cancelled'
        WHEN 1 THEN 'cancelled'
    END AS cancellation_status,
    COUNT(*) AS booking_count
FROM hb
GROUP BY is_canceled, distribution_channel;

-- What are the patterns of hotel occupancy on a monthly and yearly basis for both hotels?
SELECT
    arrival_date_year,
    arrival_date_month,
    COUNT(*) AS booking_count
FROM hb
GROUP BY arrival_date_year, arrival_date_month
ORDER BY arrival_date_year, arrival_date_month;

-- What are the ten most common weekdays that customers choose to stay overnight at the hotel?
SELECT stays_in_week_nights, COUNT(*) AS stays_in_week_nights
FROM hb
GROUP BY stays_in_week_nights
ORDER BY stays_in_week_nights DESC
LIMIT 10;

  -- What are the ten most frequent weekdays on which customers stay overnight in the hotel without their bookings being cancelled?
SELECT stays_in_week_nights, COUNT(*) AS stays_in_week_nights
FROM hb
where is_canceled = 0
GROUP BY stays_in_week_nights
ORDER BY stays_in_week_nights DESC
LIMIT 10;

-- From which countries do the top 10 guests come?
SELECT country, count(country) AS customer_count
FROM hb
GROUP BY country
ORDER BY customer_count DESC
LIMIT 10;

-- What are the reservation statuses of customers in both hotels?
SELECT hotel, reservation_status, COUNT(*) AS status_count
FROM hb
GROUP BY hotel, reservation_status;

-- What is the reservation status of customers who retained their bookings without cancellation?
SELECT hotel, reservation_status, COUNT(*) AS status_count
FROM hb
WHERE is_canceled = 0
GROUP BY hotel, reservation_status;

-- How many market segments are there among customers who maintained their bookings without any cancellations?
SELECT hotel, market_segment, COUNT(*) AS segment_count
FROM hb
WHERE is_canceled = 0
GROUP BY hotel, market_segment;

-- Which deposit types did customers use for payment in both hotels?
SELECT hotel, deposit_type, COUNT(*) AS deposit_type_count
FROM hb
GROUP BY hotel, deposit_type;

-- What is the number of customers whose room assigned match their reserved room and whose bookings were not canceled?
SELECT hotel, COUNT(*) AS matching_count
FROM hb
WHERE assigned_room_type = reserved_room_type AND is_canceled = 0
GROUP BY hotel;