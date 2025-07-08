INSERT INTO player_position (player_id, position_id, is_main_position) VALUES
(3001, 3, TRUE),
(3002, 9, TRUE),
(3003, 8, TRUE),
(3004, 5, TRUE),
(3005, 7, TRUE),
(3006, 4, TRUE),
(3007, 8, TRUE),
(3008, 7, TRUE),
(3009, 9, TRUE),
(3010, 10, TRUE),
(4001, 1, TRUE),
(4002, 1, TRUE),
(4003, 1, TRUE),
(4004, 1, TRUE),
(4005, 1, TRUE),
(4006, 1, TRUE),
(4007, 1, TRUE),
(4008, 1, TRUE),
(4009, 1, TRUE),
(4010, 1, TRUE),
(4011, 1, TRUE),
(4012, 1, TRUE),
(4101, 2, TRUE),
(4102, 2, TRUE),
(4201, 6, TRUE),
(4202, 6, TRUE),
(4203, 3, TRUE),
(4204, 4, TRUE),
(4205, 6, TRUE),
(4206, 10, TRUE);

SELECT
  p.player_id,
  p.player_name,
  pos.position_name
FROM
  player p
JOIN
  player_position pp ON p.player_id = pp.player_id
JOIN
  position pos ON pp.position_id = pos.position_id
ORDER BY
  p.player_id;
