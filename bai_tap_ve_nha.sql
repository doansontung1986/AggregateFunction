-- 1. Lấy danh sách tên các diễn viên (actors) có họ bắt đầu bằng chữ “S”.
SELECT * FROM actor
WHERE last_name LIKE 'S%';

-- 2. Lấy danh sách các bộ phim (films) được phát hành trong khoảng từ năm 2000 đến năm 2010.
SELECT title, release_year FROM film
WHERE release_year BETWEEN '2000' AND '2010';

-- 3. Lấy danh sách các bộ phim (films) có rating là “PG” hoặc “PG-13”.
SELECT title, rating FROM film
WHERE rating LIKE 'PG' OR rating LIKE 'PG-13';

-- 4. Lấy danh sách diễn viên (actors) và số lượng bộ phim (films) mà họ tham gia, sắp xếp theo số lượng bộ phim giảm dần.
SELECT actor.first_name, actor.last_name, COUNT(film.film_id) as 'Số lượng bộ phim đã tham gia'
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
GROUP BY actor.first_name, actor.last_name;

-- 5. Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng.
SELECT film.title, category.name
FROM film
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON category.category_id = film_category.category_id;

-- 6. Lấy danh sách các bộ phim (films) và tổng số diễn viên (actors) tham gia trong mỗi bộ phim, sắp xếp theo tổng số diễn viên giảm dần.
SELECT film.title, COUNT(actor.actor_id) as 'Tổng số diễn viên tham gia'
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
GROUP BY film.title
ORDER BY COUNT(actor.actor_id) DESC;

-- 7. Lấy danh sách các diễn viên (actors) có số lượng bộ phim (films) tham gia lớn hơn 30.
SELECT actor.first_name, actor.last_name, COUNT(film.film_id) as 'Số lượng bộ phim đã tham gia'
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
GROUP BY actor.first_name, actor.last_name
HAVING COUNT(film.film_id) > 30;

-- 8. Lấy danh sách các diễn viên (actors) không tham gia trong bất kỳ bộ phim nào.
SELECT actor.first_name, actor.last_name, COUNT(film.film_id)
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
GROUP BY actor.actor_id
HAVING COUNT(film.film_id) = 0;

-- 9. Lấy danh sách bộ phim (films) và tổng doanh thu (revenue) của từng bộ phim, sắp xếp theo tổng doanh thu giảm dần.
SELECT film_id, title, SUM(rental_duration * rental_rate) as revenue 
FROM film
GROUP BY film_id, title
ORDER BY revenue DESC;

-- 10. Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng, với điều kiện mỗi bộ phim thuộc thể loại “Horror”.
SELECT f.title, c.name
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON c.category_id = fc.category_id
WHERE c.name = 'Horror';