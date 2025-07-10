SELECT W.id, WP.age, W.coins_needed, W.power
FROM Wands W
JOIN Wands_Property WP ON W.code = WP.code
WHERE WP.is_evil = 0
  AND W.coins_needed = (
    SELECT MIN(W2.coins_needed)
    FROM Wands W2
    JOIN Wands_Property WP2 ON W2.code = WP2.code
    WHERE WP2.is_evil = 0
      AND W2.power = W.power
      AND WP2.age = WP.age
)
ORDER BY W.power DESC, WP.age DESC;
