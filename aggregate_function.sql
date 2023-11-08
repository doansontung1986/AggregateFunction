USE sakila;

-- 1. Tính số lượng bản ghi ở bảng actor
SELECT COUNT(*) as 'Số lượng bản ghi' FROM actor;

-- 2. Xác định thời lượng dài nhất và ngắn nhất của các bộ phim trong bảng film
SELECT MIN(rental_duration) as 'Thời lượng ngắn nhất' FROM film;

SELECT MAX(rental_duration) as 'Thời lượng dài nhất' FROM film;

-- 3. Có bao nhiêu bộ phim có rating = R ?
SELECT COUNT(*) as 'Số bộ phim có rating = R' FROM film
WHERE rating = 'R';

-- 4. Trung bình rental_rate của các bộ phim dài hơn 60 phút ?
SELECT AVG(rental_rate) FROM film
WHERE length > 60;