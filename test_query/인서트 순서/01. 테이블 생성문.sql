-- 데이터베이스 생성
CREATE DATABASE bms_db;

-- 데이터베이스 선택
USE bms_db;

-- team 테이블 (구단 정보)
CREATE TABLE `team` (
  `team_id` INT NOT NULL COMMENT '팀 ID',
  `team_name` VARCHAR(20) NOT NULL COMMENT '팀명',
  `region` VARCHAR(20) COMMENT '연고지',
  `found_year` YEAR COMMENT '창단일'
  `stadium` VARCHAR(20) COMMENT '홈구장',
  PRIMARY KEY (`team_id`)
);

-- permission 테이블 (사용자 권한)
CREATE TABLE `permission` (
  `permission_id` INT NOT NULL COMMENT '권한 ID',
  `perimission_name` VARCHAR(20) NOT NULL COMMENT '권한명',
  PRIMARY KEY (`permission_id`)
);

-- user 테이블 (사용자)
CREATE TABLE `user` (
  `user_id` INT NOT NULL AUTO_INCREMENT COMMENT '사용자 ID',
  `name` VARCHAR(20) NOT NULL COMMENT '사용자명',
  `password` VARCHAR(30) NOT NULL COMMENT '비밀번호',
  `email` VARCHAR(30) COMMENT '이메일',
  `permission_id` INT NOT NULL COMMENT '권한 ID',
  `team_id` INT NOT NULL COMMENT '팀 ID',
  `resident_number` CHAR(14) NOT NULL COMMENT '주민 번호',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_user_permission` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`),
  CONSTRAINT `FK_user_team`       FOREIGN KEY (`team_id`)       REFERENCES `team` (`team_id`),
  UNIQUE KEY unique_resident_number (resident_number)
);

-- staff 테이블 (스태프)
CREATE TABLE `staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT COMMENT '스태프 id',
  `team_id` INT NOT NULL COMMENT '팀 ID',
  `role` VARCHAR(20) COMMENT '역할',
  `staff_name` VARCHAR(20) COMMENT '이름',
  `phone` CHAR(16) COMMENT '연락처',
  `career` CHAR(10) COMMENT '경력',
  `hire_date` CHAR(10) COMMENT '고용일',
  `resignation_date` CHAR(10) COMMENT '퇴사일',
  PRIMARY KEY (`staff_id`),
  CONSTRAINT `FK_staff_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
);

-- position 테이블 (포지션)
CREATE TABLE `position` (
  `position_id` INT NOT NULL COMMENT '포지션 ID',
  `position_name` VARCHAR(20) COMMENT '포지션명',
  PRIMARY KEY (`position_id`)
);

-- player 테이블 (선수)
CREATE TABLE `player` (
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `team_id` INT NOT NULL COMMENT '팀 ID',
  `player_name` VARCHAR(20) NOT NULL COMMENT '선수명',
  `birth` DATE COMMENT '생년월일',
  `number` CHAR(10) COMMENT '등번호',
  `phone` CHAR(16) COMMENT '연락처',
  `nation` VARCHAR(30) COMMENT '국적',
  `ent_date` DATE COMMENT '입단일',
  `height` INT COMMENT '키',
  `weight` INT COMMENT '몸무게',
  `absence` VARCHAR(30) COMMENT '부재사유',
  PRIMARY KEY (`player_id`),
  CONSTRAINT `FK_player_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
);

-- contract 테이블 (계약)
CREATE TABLE `contract` (
  `contract_id` INT NOT NULL AUTO_INCREMENT COMMENT '계약ID',
  `payment` BIGINT COMMENT '계약금',
  `year_salary` BIGINT COMMENT '연봉',
  `contract_start` DATE COMMENT '계약시작일',
  `contract_end` DATE COMMENT '계약종료일',
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `team_id` INT NOT NULL COMMENT '팀 ID',
  PRIMARY KEY (`contract_id`),
  CONSTRAINT `FK_contract_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `FK_contract_team`   FOREIGN KEY (`team_id`)   REFERENCES `team` (`team_id`)
);

-- train 테이블 (훈련)
CREATE TABLE `train` (
  `train_id` INT NOT NULL AUTO_INCREMENT COMMENT '훈련 ID',
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `date` DATE COMMENT '훈련일자',
  `location` VARCHAR(20) COMMENT '훈련장소',
  `content` VARCHAR(100) COMMENT '훈련내용',
  PRIMARY KEY (`train_id`),
  CONSTRAINT `FK_train_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`)
);

-- game 테이블 (경기)
CREATE TABLE `game` (
  `game_id` INT NOT NULL COMMENT '경기 ID',
  `home` INT COMMENT '홈팀 ID',
  `away` INT COMMENT '원정팀 ID',
  `start_time` DATETIME COMMENT '시작일시',
  `end_time` DATETIME COMMENT '종료일시',
  `win` INT COMMENT '승리팀 ID (NULL: 전, 0: 무승부)',
  `lose` INT COMMENT '패배팀 ID',
  `home_score` INT COMMENT '홈팀 점수',
  `away_score` INT COMMENT '원정팀 점수',
  `stadium` VARCHAR(20) COMMENT '경기장',
  PRIMARY KEY (`game_id`),
  CONSTRAINT `FK_game_home` FOREIGN KEY (`home`) REFERENCES `team` (`team_id`),
  CONSTRAINT `FK_game_away` FOREIGN KEY (`away`) REFERENCES `team` (`team_id`)
);

-- player_position 테이블 (선수 포지션)
CREATE TABLE `player_position` (
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `position_id` INT NOT NULL COMMENT '포지션 ID',
  `is_main_position` BOOLEAN COMMENT '주포지션 여부',
  PRIMARY KEY (`player_id`, `position_id`),
  CONSTRAINT `FK_pp_player`   FOREIGN KEY (`player_id`)   REFERENCES `player` (`player_id`),
  CONSTRAINT `FK_pp_position` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`)
);

-- game_record_detail 테이블 (경기 상세 스탯)
CREATE TABLE `game_record_detail` (
  `game_detail_id` INT NOT NULL COMMENT '경기 기록 ID',
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `game_id` INT NOT NULL COMMENT '경기 ID',
  `season` YEAR COMMENT '시즌연도',
  `ab` INT COMMENT '타수',
  `hit` INT COMMENT '안타',
  `hr` INT COMMENT '홈런',
  `rbi` INT COMMENT '타점',
  `hitter_so` INT COMMENT '삼진',
  `hitter_bb` INT COMMENT '볼넷',
  `ip` DECIMAL(2,1) COMMENT '이닝',
  `er` INT COMMENT '자책점',
  `pitcher_h` INT COMMENT '피안타',
  `pitcher_so` INT COMMENT '삼진(투수)',
  `pitcher_bb` INT COMMENT '투수 볼넷',
  `win` INT COMMENT '승',
  `lose` INT COMMENT '패',
  `save` INT COMMENT '세이브',
  `error` INT COMMENT '실책',
  `assist` INT COMMENT '어시스트',
  `dp` INT COMMENT '병살',
  `sb` INT COMMENT '도루성공',
  `cs` INT COMMENT '도루실패',
  PRIMARY KEY (`game_detail_id`),
  CONSTRAINT `FK_grd_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `FK_grd_game`   FOREIGN KEY (`game_id`)   REFERENCES `game` (`game_id`)
);

-- player_record 테이블 (선수 Season 기록)
CREATE TABLE `player_record` (
  `player_record_id` INT NOT NULL COMMENT '선수기록 ID',
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `season` YEAR COMMENT '시즌연도',
  `era` DECIMAL(3,2) COMMENT '평균자책점',
  `whip` DECIMAL(3,2) COMMENT 'WHIP',
  `avg` DECIMAL(4,3) COMMENT '타율',
  `obp` DECIMAL(4,3) COMMENT '출루율',
  `slg` DECIMAL(4,3) COMMENT '장타율',
  `ops` DECIMAL(4,3) COMMENT 'OPS',
  `epct` DECIMAL(4,3) COMMENT '수비율',
  `sba` DECIMAL(3,1) COMMENT '도루성공률',
  PRIMARY KEY (`player_record_id`),
  CONSTRAINT `FK_pr_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`)
);

-- player_record_detail 테이블 (Season별 상세 스탯)
CREATE TABLE `player_record_detail` (
  `player_record_detail_id` INT NOT NULL COMMENT '상세기록 ID',
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `season` YEAR COMMENT '시즌연도',
  `hitter_g` INT COMMENT '타격 경기수',
  `ab` INT COMMENT '타수',
  `hit` INT COMMENT '안타',
  `hr` INT COMMENT '홈런',
  `rbi` INT COMMENT '타점',
  `hitter_so` INT COMMENT '삼진',
  `hitter_bb` INT COMMENT '볼넷',
  `pitcher_g` INT COMMENT '투수 경기수',
  `ip` DECIMAL(2,1) COMMENT '이닝',
  `er` INT COMMENT '자책점',
  `pitcher_h` INT COMMENT '피안타',
  `pitcher_so` INT COMMENT '삼진(투수)',
  `pitcher_bb` INT COMMENT '볼넷(투수)',
  `win` INT COMMENT '승',
  `lose` INT COMMENT '패',
  `save` INT COMMENT '세이브',
  `error` INT COMMENT '실책',
  `assist` INT COMMENT '어시스트',
  `dp` INT COMMENT '병살',
  `sb` INT COMMENT '도루성공',
  `cs` INT COMMENT '도루실패',
  PRIMARY KEY (`player_record_detail_id`),
  CONSTRAINT `FK_prd_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`)
);

-- team_record 테이블 (팀 Season 성적)
CREATE TABLE `team_record` (
  `team_record_id` INT NOT NULL AUTO_INCREMENT COMMENT '팀 성적 ID',
  `team_id` INT NOT NULL COMMENT '팀 ID',
  `season` YEAR COMMENT '시즌',
  `game_count` INT COMMENT '경기수',
  `win_count` INT COMMENT '승',
  `draw_count` INT COMMENT '무',
  `lose_count` INT COMMENT '패',
  `winning_per` DECIMAL(4,3) COMMENT '승률',
  PRIMARY KEY (`team_record_id`),
  CONSTRAINT `FK_tr_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
);
