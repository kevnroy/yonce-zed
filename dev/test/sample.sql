-- Top tracks by play count
WITH ranked AS (
  SELECT t.id, t.title, COUNT(p.id) AS plays
  FROM tracks AS t
  LEFT JOIN plays AS p ON p.track_id = t.id
  WHERE t.explicit = FALSE AND t.title LIKE 'F%'
  GROUP BY t.id, t.title
)
SELECT title, plays,
       RANK() OVER (ORDER BY plays DESC) AS rank
FROM ranked
WHERE plays > 0
ORDER BY plays DESC
LIMIT 10;
