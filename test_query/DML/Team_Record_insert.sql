INSERT INTO team_record (team_id, season, game_count, win_count, draw_count, lose_count, winning_per) VALUES
-- 1990년대
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 1990, 120, 71, 0, 49, 0.592),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 1991, 126, 53, 1, 72, 0.424),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 1992, 126, 53, 3, 70, 0.431),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 1993, 126, 66, 3, 57, 0.537),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 1994, 126, 81, 0, 45, 0.643),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 1995, 126, 74, 4, 48, 0.607),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 1996, 126, 50, 5, 71, 0.413),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 1997, 126, 73, 2, 51, 0.589),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 1998, 126, 63, 1, 62, 0.504),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 1999, 132, 61, 1, 70, 0.466),

-- 2000년대
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2000, 133, 67, 3, 63, 0.515),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2001, 133, 58, 8, 67, 0.464),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2002, 133, 66, 6, 61, 0.520),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2003, 133, 60, 2, 71, 0.458),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2004, 133, 59, 4, 70, 0.457),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2005, 126, 54, 1, 71, 0.432),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2006, 126, 47, 4, 75, 0.385),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2007, 126, 58, 6, 62, 0.483),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2008, 126, 46, 0, 80, 0.365),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2009, 133, 62, 5, 66, 0.484),

-- 2010년대
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2010, 133, 57, 1, 75, 0.432),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2011, 133, 59, 2, 72, 0.450),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2012, 133, 62, 5, 66, 0.484),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2013, 128, 74, 2, 52, 0.587),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2014, 128, 62, 2, 64, 0.492),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2015, 144, 64, 2, 78, 0.451),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2016, 144, 71, 2, 71, 0.500),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2017, 144, 69, 3, 72, 0.489),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2018, 144, 68, 1, 75, 0.476),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2019, 144, 79, 1, 64, 0.552),

-- 2020년대
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2020, 144, 79, 4, 61, 0.564),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2021, 144, 72, 14, 58, 0.554),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2022, 144, 87, 2, 55, 0.613),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2023, 144, 86, 2, 56, 0.606),
( (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), 2024, 144, 76, 2, 66, 0.535); -- 2024년 (진행 중인 시즌, 예상 최종 기록)

INSERT INTO team_record (team_id, season, game_count, win_count, draw_count, lose_count, winning_per) VALUES
-- Samsung Lions (2015~2024)
((SELECT team_id FROM team WHERE team_name='삼성 라이온즈'), 2015, 144, 71, 5, 68, ROUND(71/(144-5), 3)),
((SELECT team_id FROM team WHERE team_name='삼성 라이온즈'), 2016, 144, 78, 4, 62, ROUND(78/(144-4), 3)),
((SELECT team_id FROM team WHERE team_name='삼성 라이온즈'), 2017, 144, 70, 5, 69, ROUND(70/(144-5), 3)),
((SELECT team_id FROM team WHERE team_name='삼성 라이온즈'), 2018, 144, 59, 4, 81, ROUND(59/(144-4), 3)),
((SELECT team_id FROM team WHERE team_name='삼성 라이온즈'), 2019, 144, 68, 6, 70, ROUND(68/(144-6), 3)),
((SELECT team_id FROM team WHERE team_name='삼성 라이온즈'), 2020, 144, 67, 5, 72, ROUND(67/(144-5), 3)),
((SELECT team_id FROM team WHERE team_name='삼성 라이온즈'), 2021, 144, 70, 7, 67, ROUND(70/(144-7), 3)),
((SELECT team_id FROM team WHERE team_name='삼성 라이온즈'), 2022, 144, 60, 5, 79, ROUND(60/(144-5), 3)),
((SELECT team_id FROM team WHERE team_name='삼성 라이온즈'), 2023, 144, 75, 4, 65, ROUND(75/(144-4), 3)),
((SELECT team_id FROM team WHERE team_name='삼성 라이온즈'), 2024, 144, 72, 4, 68, ROUND(72/(144-4), 3)),

-- KIA Tigers (2015~2024)
((SELECT team_id FROM team WHERE team_name='KIA 타이거즈'), 2015, 144, 72, 5, 67, ROUND(72/(144-5), 3)),
((SELECT team_id FROM team WHERE team_name='KIA 타이거즈'), 2016, 144, 78, 3, 63, ROUND(78/(144-3), 3)),
((SELECT team_id FROM team WHERE team_name='KIA 타이거즈'), 2017, 144, 76, 3, 65, ROUND(76/(144-3), 3)),
((SELECT team_id FROM team WHERE team_name='KIA 타이거즈'), 2018, 144, 59, 4, 81, ROUND(59/(144-4), 3)),
((SELECT team_id FROM team WHERE team_name='KIA 타이거즈'), 2019, 144, 75, 6, 63, ROUND(75/(144-6), 3)),
((SELECT team_id FROM team WHERE team_name='KIA 타이거즈'), 2020, 144, 77, 5, 62, ROUND(77/(144-5), 3)),
((SELECT team_id FROM team WHERE team_name='KIA 타이거즈'), 2021, 144, 80, 5, 59, ROUND(80/(144-5), 3)),
((SELECT team_id FROM team WHERE team_name='KIA 타이거즈'), 2022, 144, 85, 2, 57, ROUND(85/(144-2), 3)),
((SELECT team_id FROM team WHERE team_name='KIA 타이거즈'), 2023, 144, 70, 4, 70, ROUND(70/(144-4), 3)),
((SELECT team_id FROM team WHERE team_name='KIA 타이거즈'), 2024, 144, 74, 3, 67, ROUND(74/(144-3), 3)),

-- Lotte Giants (2015~2024)
((SELECT team_id FROM team WHERE team_name='롯데 자이언츠'), 2015, 144, 51, 1, 92, ROUND(51/(144-1), 3)),
((SELECT team_id FROM team WHERE team_name='롯데 자이언츠'), 2016, 144, 67, 5, 72, ROUND(67/(144-5), 3)),
((SELECT team_id FROM team WHERE team_name='롯데 자이언츠'), 2017, 144, 59, 2, 83, ROUND(59/(144-2), 3)),
((SELECT team_id FROM team WHERE team_name='롯데 자이언츠'), 2018, 144, 67, 3, 74, ROUND(67/(144-3), 3)),
((SELECT team_id FROM team WHERE team_name='롯데 자이언츠'), 2019, 144, 71, 3, 70, ROUND(71/(144-3), 3)),
((SELECT team_id FROM team WHERE team_name='롯데 자이언츠'), 2020, 144, 72, 6, 66, ROUND(72/(144-6), 3)),
((SELECT team_id FROM team WHERE team_name='롯데 자이언츠'), 2021, 144, 77, 4, 63, ROUND(77/(144-4), 3)),
((SELECT team_id FROM team WHERE team_name='롯데 자이언츠'), 2022, 144, 61, 4, 79, ROUND(61/(144-4), 3)),
((SELECT team_id FROM team WHERE team_name='롯데 자이언츠'), 2023, 144, 58, 5, 81, ROUND(58/(144-5), 3)),
((SELECT team_id FROM team WHERE team_name='롯데 자이언츠'), 2024, 144, 63, 3, 78, ROUND(63/(144-3), 3)),

-- Hanwha Eagles (2015~2024)
((SELECT team_id FROM team WHERE team_name='한화 이글스'), 2015, 144, 38, 1, 105, ROUND(38/(144-1), 3)),
((SELECT team_id FROM team WHERE team_name='한화 이글스'), 2016, 144, 47, 3, 94, ROUND(47/(144-3), 3)),
((SELECT team_id FROM team WHERE team_name='한화 이글스'), 2017, 144, 58, 5, 81, ROUND(58/(144-5), 3)),
((SELECT team_id FROM team WHERE team_name='한화 이글스'), 2018, 144, 54, 2, 88, ROUND(54/(144-2), 3)),
((SELECT team_id FROM team WHERE team_name='한화 이글스'), 2019, 144, 59, 3, 82, ROUND(59/(144-3), 3)),
((SELECT team_id FROM team WHERE team_name='한화 이글스'), 2020, 144, 26, 10, 88, ROUND(26/(144-10), 3)),
((SELECT team_id FROM team WHERE team_name='한화 이글스'), 2021, 144, 47, 6, 85, ROUND(47/(144-6), 3)),
((SELECT team_id FROM team WHERE team_name='한화 이글스'), 2022, 144, 46, 7, 91, ROUND(46/(144-7), 3)),
((SELECT team_id FROM team WHERE team_name='한화 이글스'), 2023, 144, 53, 8, 83, ROUND(53/(144-8), 3)),
((SELECT team_id FROM team WHERE team_name='한화 이글스'), 2024, 144, 48, 7, 89, ROUND(48/(144-7), 3));

INSERT INTO team_record (team_id, season, game_count, win_count, draw_count, lose_count, winning_per) VALUES
-- NC Dinos (2015~2024)
((SELECT team_id FROM team WHERE team_name='NC 다이노스'), 2015, 144, 72, 3, 69, ROUND(72/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='NC 다이노스'), 2016, 144, 68, 4, 72, ROUND(68/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='NC 다이노스'), 2017, 144, 70, 6, 68, ROUND(70/(144-6),3)),
((SELECT team_id FROM team WHERE team_name='NC 다이노스'), 2018, 144, 67, 3, 74, ROUND(67/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='NC 다이노스'), 2019, 144, 74, 3, 67, ROUND(74/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='NC 다이노스'), 2020, 144, 81, 2, 61, ROUND(81/(144-2),3)),
((SELECT team_id FROM team WHERE team_name='NC 다이노스'), 2021, 144, 78, 3, 63, ROUND(78/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='NC 다이노스'), 2022, 144, 77, 4, 63, ROUND(77/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='NC 다이노스'), 2023, 144, 73, 4, 67, ROUND(73/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='NC 다이노스'), 2024, 144, 76, 5, 63, ROUND(76/(144-5),3)),

-- Doosan Bears (2015~2024)
((SELECT team_id FROM team WHERE team_name='두산 베어스'), 2015, 144, 79, 3, 62, ROUND(79/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='두산 베어스'), 2016, 144, 83, 4, 57, ROUND(83/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='두산 베어스'), 2017, 144, 84, 2, 58, ROUND(84/(144-2),3)),
((SELECT team_id FROM team WHERE team_name='두산 베어스'), 2018, 144, 74, 4, 66, ROUND(74/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='두산 베어스'), 2019, 144, 79, 2, 63, ROUND(79/(144-2),3)),
((SELECT team_id FROM team WHERE team_name='두산 베어스'), 2020, 144, 83, 1, 59, ROUND(83/(144-1),3)),
((SELECT team_id FROM team WHERE team_name='두산 베어스'), 2021, 144, 79, 3, 62, ROUND(79/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='두산 베어스'), 2022, 144, 67, 5, 72, ROUND(67/(144-5),3)),
((SELECT team_id FROM team WHERE team_name='두산 베어스'), 2023, 144, 60, 4, 80, ROUND(60/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='두산 베어스'), 2024, 144, 68, 3, 73, ROUND(68/(144-3),3)),

-- KT Wiz (2015~2024)
((SELECT team_id FROM team WHERE team_name='KT 위즈'), 2015, 144, 46, 6, 92, ROUND(46/(144-6),3)),
((SELECT team_id FROM team WHERE team_name='KT 위즈'), 2016, 144, 41, 5, 98, ROUND(41/(144-5),3)),
((SELECT team_id FROM team WHERE team_name='KT 위즈'), 2017, 144, 59, 3, 82, ROUND(59/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='KT 위즈'), 2018, 144, 50, 6, 88, ROUND(50/(144-6),3)),
((SELECT team_id FROM team WHERE team_name='KT 위즈'), 2019, 144, 77, 4, 63, ROUND(77/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='KT 위즈'), 2020, 144, 81, 4, 59, ROUND(81/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='KT 위즈'), 2021, 144, 65, 3, 76, ROUND(65/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='KT 위즈'), 2022, 144, 65, 4, 75, ROUND(65/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='KT 위즈'), 2023, 144, 68, 4, 72, ROUND(68/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='KT 위즈'), 2024, 144, 70, 3, 71, ROUND(70/(144-3),3)),

-- SSG Landers (formerly SK Wyverns) (2015~2024)
((SELECT team_id FROM team WHERE team_name='SSG 랜더스'), 2015, 144, 81, 3, 60, ROUND(81/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='SSG 랜더스'), 2016, 144, 78, 3, 63, ROUND(78/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='SSG 랜더스'), 2017, 144, 78, 2, 64, ROUND(78/(144-2),3)),
((SELECT team_id FROM team WHERE team_name='SSG 랜더스'), 2018, 144, 66, 3, 75, ROUND(66/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='SSG 랜더스'), 2019, 144, 71, 3, 70, ROUND(71/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='SSG 랜더스'), 2020, 144, 83, 3, 58, ROUND(83/(144-3),3)),
((SELECT team_id FROM team WHERE team_name='SSG 랜더스'), 2021, 144, 81, 4, 59, ROUND(81/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='SSG 랜더스'), 2022, 144, 75, 4, 65, ROUND(75/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='SSG 랜더스'), 2023, 144, 73, 4, 67, ROUND(73/(144-4),3)),
((SELECT team_id FROM team WHERE team_name='SSG 랜더스'), 2024, 144, 70, 3, 71, ROUND(70/(144-3),3));

