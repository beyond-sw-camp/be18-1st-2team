-- 훈련 정보 인서트 문
INSERT INTO train (player_id, date, location, content) 
VALUES 
((SELECT player_id FROM player WHERE player_name = '홍창기')
, '2025-06-01', '잠실야구장', '기초 체력 훈련'),
((SELECT player_id FROM player WHERE player_name = '오스틴 딘')
, '2025-06-02', '잠실야구장', '타격 연습'),
((SELECT player_id FROM player WHERE player_name = '신민재')
, '2025-06-03', '잠실야구장', '수비 포지션 훈련'),
((SELECT player_id FROM player WHERE player_name = '오지환')
, '2025-06-04', '잠실야구장', '주루 훈련'),
((SELECT player_id FROM player WHERE player_name = '요니치리노스')
, '2025-06-05', '잠실야구장', '스트레칭 및 웜업'),
((SELECT player_id FROM player WHERE player_name = '문보경')
, '2025-06-06', '잠실야구장', '타격 자세 교정'),
((SELECT player_id FROM player WHERE player_name = '김진성')
, '2025-06-07', '잠실야구장', '피칭 훈련'),
((SELECT player_id FROM player WHERE player_name = '오지환')
, '2025-06-08', '잠실야구장', '실전 연습 경기'),
((SELECT player_id FROM player WHERE player_name = '홍창기')
, '2025-06-09', '잠실야구장', '수비 시나리오 훈련'),
((SELECT player_id FROM player WHERE player_name = '김현수')
, '2025-06-10', '잠실야구장', '전술 브리핑');




