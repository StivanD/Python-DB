SELECT
	CONCAT(
		c.first_name,
		' ',
		c.last_name
	) AS full_name,
	c.email,
	MAX(bg.rating) AS rating
FROM
	creators as c
JOIN
	creators_board_games AS cbg
ON
	cbg.creator_id = c.id
JOIN
	board_games AS bg
ON
	cbg.board_game_id = bg.id
WHERE
	c.email LIKE '%.com'
GROUP BY
	full_name,
	c.email
ORDER BY
	full_name
LIMIT
	3;