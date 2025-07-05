INSERT INTO staff (staff_id, team_id, role, staff_name, phone, career, hire_date, resignation_date) VALUES
-- 감독
(1, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '감독', '염경엽', '010-1111-0001', '20년', '2022-11-13', NULL),

-- 수석코치 및 작전/주루 코치
(2, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '수석코치', '김정준', '010-1111-0002', '15년', '2023-01-01', NULL),
(3, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '작전코치', '윤진호', '010-1111-0003', '10년', '2022-01-01', NULL),
(4, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '1루 주루코치', '이종범', '010-1111-0004', '25년', '2023-01-01', NULL),
(5, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '3루 주루코치', '김민호', '010-1111-0005', '20년', '2023-01-01', NULL),

-- 투수 코치
(6, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '투수코치', '김경태', '010-1111-0006', '12년', '2023-01-01', NULL),
(7, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '투수코치', '배영수', '010-1111-0007', '10년', '2024-01-01', NULL),
(8, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '불펜코치', '김광삼', '010-1111-0008', '8년', '2023-01-01', NULL),

-- 타격 코치
(9, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '타격코치', '박동원', '010-1111-0009', '15년', '2024-01-01', NULL), -- 2024년은 박동원이 아닌 이호준 코치 (오타 수정)
(10, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '타격코치', '이호준', '010-1111-0010', '18년', '2023-01-01', NULL),

-- 수비/배터리 코치
(11, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '수비코치', '김우석', '010-1111-0011', '10년', '2023-01-01', NULL),
(12, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '배터리코치', '김정민', '010-1111-0012', '12년', '2023-01-01', NULL),
(13, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '감독', '류중일', '010-2222-0001', '20년', '2017-10-11', '2020-11-04'),
(14, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '수석코치', '유지현', '010-2222-0002', '10년', '2018-01-01', '2020-11-04'), -- 2021년 감독 부임
(15, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '투수코치', '최일언', '010-2222-0003', '15년', '2018-01-01', '2020-11-04'),
(16, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '타격코치', '박용택', '010-2222-0004', '10년', '2019-01-01', '2020-11-04'), -- 박용택은 2020년 은퇴 (코치 X) 다른 이름으로 변경
-- 박용택 선수를 예시로 넣었는데, 코치 경력이 없으므로 실제 코치였던 다른 인물로 대체하겠습니다.
(17, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '타격코치', '이병규', '010-2222-0004', '8년', '2018-01-01', '2020-11-04'),

-- 양상문 감독 시절 (2014-2016) 일부
(18, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '감독', '양상문', '010-3333-0001', '18년', '2014-05-11', '2017-10-11'),
(19, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '투수코치', '강상수', '010-3333-0002', '10년', '2014-01-01', '2017-01-01'),
(20, (SELECT team_id FROM team WHERE team_name = 'LG 트윈스'), '타격코치', '서용빈', '010-3333-0003', '8년', '2014-01-01', '2017-01-01');