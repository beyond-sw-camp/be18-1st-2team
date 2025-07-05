CREATE TABLE `staff` (
	`staff_id`	INT	NOT NULL AUTO_INCREMENT COMMENT '스태프 id',
	`team_id`	INT	NOT NULL,
	`role`	VARCHAR(20)	NULL,
	`staff_name`	VARCHAR(20)	NULL,
	`phone`	CHAR(16)	NULL,
	`career`	CHAR(10)	NULL,
	`hire_date`	CHAR(10)	NULL,
	`resignation_date`	CHAR(10)	NULL,
    PRIMARY KEY (`staff_id`) -- 이 줄을 추가하여 staff_id를 PRIMARY KEY로 지정
);

CREATE TABLE `permission` (
	`permission_id`	INT	NOT NULL	COMMENT '권한 ID',
	`perimission_name`	VARCHAR(20)	NOT NULL	COMMENT '권한명'
);

CREATE TABLE `user` (
	`Key`	INT	NOT NULL	COMMENT '사용자 ID',
	`name`	VARCHAR(20)	NOT NULL	COMMENT '사용자명',
	`password`	VARCHAR(30)	NOT NULL	COMMENT '비밀번호',
	`email`	VARCHAR(30)	NULL	COMMENT '이메일',
	`permission_id`	INT	NOT NULL	COMMENT '권한 ID',
	`team_id`	INT	NOT NULL	COMMENT '팀 ID'
);

CREATE TABLE `contract` (
	`contract_id`	INT	NOT NULL	COMMENT '계약ID',
	`payment`	BIGINT	NULL	COMMENT '계약금',
	`year_salary`	BIGINT	NULL	COMMENT '연봉',
	`contract_start`	DATE	NULL	COMMENT '계약시작일자',
	`contract_end`	DATE	NULL	COMMENT '계약종료일자',
	`player_id`	INT	NOT NULL	COMMENT '선수 ID',
	`team_id`	INT	NOT NULL	COMMENT '팀 ID'
);

CREATE TABLE `team_record` (
	`team_record_id`	INT	NOT NULL	AUTO_INCREMENT COMMENT '팀 성적 ID',
	`team_id`	INT	NOT NULL	COMMENT '팀 ID',
	`season`	YEAR	NULL	COMMENT '시즌',
	`game_count`	INT	NULL	COMMENT '경기수',
	`win_count`	INT	NULL	COMMENT '승리수',
	`draw_count`	INT	NULL	COMMENT '무승부수',
	`lose_count`	INT	NULL	COMMENT '패배수',
	`winning_per`	DECIMAL(4,3)	NULL	COMMENT '승률',
    PRIMARY KEY (`team_record_id`)
);

CREATE TABLE `position` (
	`position_id`	INT	NOT NULL	COMMENT '포지션 ID',
	`position_name`	VARCHAR(20)	NULL	COMMENT '포지션명'
);

CREATE TABLE `train` (
	`train_id`	INT	NOT NULL	COMMENT '훈련 ID',
	`player_id`	INT	NOT NULL	COMMENT '선수 ID',
	`date`	DATE	NULL	COMMENT '훈련일자',
	`location`	VARCHAR(20)	NULL	COMMENT '훈련장소',
	`content`	VARCHAR(100)	NULL	COMMENT '훈련내용'
);

CREATE TABLE `game_record_detail` (
	`game_detail_id`	INT	NOT NULL	COMMENT '경기 기록 ID',
	`player_id`	INT	NOT NULL	COMMENT '선수 ID',
	`game_id`	INT	NOT NULL	COMMENT '경기 ID',
	`season`	YEAR	NULL	COMMENT '시즌연도',
	`hitter_g`	INT	NULL	COMMENT '타자/경기수',
	`ab`	INT	NULL	COMMENT '타자/타수',
	`hit`	INT	NULL	COMMENT '타자/안타 수',
	`hr`	INT	NULL	COMMENT '타자/홈런 수',
	`rbi`	INT	NULL	COMMENT '타자/타점',
	`hitter_so`	INT	NULL	COMMENT '타자/삼진 수',
	`hitter_bb`	INT	NULL	COMMENT '타자/볼넷 수',
	`pitcher_g`	INT	NULL	COMMENT '투수/경기수',
	`ip`	DECIMAL(2,1)	NULL	COMMENT '투수/이닝 수',
	`er`	INT	NULL	COMMENT '투수/자책점',
	`pitcher_h`	INT	NULL	COMMENT '투수/피안타 수',
	`pitcher_so`	INT	NULL	COMMENT '투수/삼진',
	`pitcher_bb`	INT	NULL	COMMENT '투수/볼넷 허용',
	`win`	INT	NULL	COMMENT '투수/승',
	`lose`	INT	NULL	COMMENT '투수/패',
	`save`	INT	NULL	COMMENT '투수/세이브',
	`error`	INT	NULL	COMMENT '수비/실책',
	`assist`	INT	NULL	COMMENT '수비/어시스트',
	`dp`	INT	NULL	COMMENT '수비/병살',
	`sb`	INT	NULL	COMMENT '주루/도루성공',
	`cs`	INT	NULL	COMMENT '주루/도루실패'
);

CREATE TABLE `team` (
	`team_id`	INT	NOT NULL	COMMENT '팀 ID',
	`team_name`	VARCHAR(20)	NOT NULL	COMMENT '팀명',
	`region`	VARCHAR(20)	NULL	COMMENT '연고지',
	`found_year`	YEAR	NULL	COMMENT '창단일',
	`stadium`	VARCHAR(20)	NULL	COMMENT '홈구장'
);

CREATE TABLE `player_record` (
	`player_record_id`	INT	NOT NULL	COMMENT '선수기록 ID',
	`player_id`	INT	NOT NULL	COMMENT '선수 ID',
	`season`	YEAR	NULL	COMMENT '시즌연도',
	`era`	DECIMAL(3,2)	NULL	COMMENT '투수/평균자책점',
	`whip`	DECIMAL(3,2)	NULL	COMMENT '투수/이닝당 출루허용률',
	`avg`	DECIMAL(4,3)	NULL	COMMENT '타자/타율',
	`obp`	DECIMAL(4,3)	NULL	COMMENT '타자/출루율',
	`slg`	DECIMAL(4,3)	NULL	COMMENT '타자/장타율',
	`ops`	DECIMAL(4,3)	NULL	COMMENT '타자/출루율+장타율',
	`epct`	DECIMAL(4,3)	NULL	COMMENT '수비/수비율',
	`sba`	DECIMAL(3,1)	NULL	COMMENT '주루/도루성공률'
);

CREATE TABLE `player` (
	`player_id`	INT	NOT NULL	COMMENT '선수 ID',
	`team_id`	INT	NOT NULL	COMMENT '팀 ID',
	`player_name`	VARCHAR(20)	NOT NULL	COMMENT '선수명',
	`birth`	DATE	NULL	COMMENT '생년월일',
	`number`	CHAR(10)	NULL	COMMENT '등번호',
	`phone`	CHAR(16)	NULL	COMMENT '연락처',
	`nation`	VARCHAR(30)	NULL	COMMENT '국적',
	`ent_date`	DATE	NULL	COMMENT '입단일',
	`height`	INT	NULL	COMMENT '키',
	`weight`	INT	NULL	COMMENT '몸무게',
	`absence`	VARCHAR(30)	NULL	COMMENT '부재사유'
);

CREATE TABLE `game` (
	`game_id`	INT	NOT NULL	COMMENT '경기 ID',
	`home`	INT	NULL	COMMENT '홈팀 ID',
	`away`	INT	NULL	COMMENT '원정팀 ID',
	`start_time`	DATETIME	NULL	COMMENT '경기 시작일시',
	`end_time`	DATETIME	NULL	COMMENT '경기 종료일시',
	`win`	INT	NULL	COMMENT '승리팀 ID (NULL: 경기 전, 0: 무승부)',
	`lose`	INT	NULL	COMMENT '패배팀ID',
	`home_score`	INT	NULL	COMMENT '홈팀 점수',
	`lose_score`	INT	NULL	COMMENT '원정팀 점수',
	`stadium`	VARCHAR(20)	NULL	COMMENT '경기장',
	`team_id`	INT	NOT NULL	COMMENT '팀 ID'
);

CREATE TABLE `player_record_detail` (
	`player_record_detail_id`	INT	NOT NULL	COMMENT '선수 기록 상세정보ID',
	`player_id`	INT	NOT NULL	COMMENT '선수 ID',
	`season`	YEAR	NULL	COMMENT '시즌연도',
	`hitter_g`	INT	NULL	COMMENT '타자/경기수',
	`ab`	INT	NULL	COMMENT '타자/타수',
	`hit`	INT	NULL	COMMENT '타자/안타 수',
	`hr`	INT	NULL	COMMENT '타자/홈런 수',
	`rbi`	INT	NULL	COMMENT '타자/타점',
	`hitter_so`	INT	NULL	COMMENT '타자/삼진 수',
	`hitter_bb`	INT	NULL	COMMENT '타자/볼넷 수',
	`pitcher_g`	INT	NULL	COMMENT '투수/경기수',
	`ip`	DECIMAL(2,1)	NULL	COMMENT '투수/이닝 수',
	`er`	INT	NULL	COMMENT '투수/자책점',
	`pitcher_h`	INT	NULL	COMMENT '투수/피안타 수',
	`pitcher_so`	INT	NULL	COMMENT '투수/삼진',
	`pitcher_bb`	INT	NULL	COMMENT '투수/볼넷 허용',
	`win`	INT	NULL	COMMENT '투수/승',
	`lose`	INT	NULL	COMMENT '투수/패',
	`save`	INT	NULL	COMMENT '투수/세이브',
	`error`	INT	NULL	COMMENT '수비/실책',
	`assist`	INT	NULL	COMMENT '수비/어시스트',
	`dp`	INT	NULL	COMMENT '수비/병살',
	`sb`	INT	NULL	COMMENT '주루/도루성공',
	`cs`	INT	NULL	COMMENT '주루/도루실패'
);

CREATE TABLE `player_position` (
	`player_id`	INT	NOT NULL	COMMENT '선수 ID',
	`position_id`	INT	NOT NULL	COMMENT '포지션 ID',
	`is_main_position`	BOOLEAN	NULL
);

ALTER TABLE `staff` ADD CONSTRAINT `PK_STAFF` PRIMARY KEY (
	`staff_id`
);

ALTER TABLE `permission` ADD CONSTRAINT `PK_PERMISSION` PRIMARY KEY (
	`permission_id`
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`Key`
);

ALTER TABLE `contract` ADD CONSTRAINT `PK_CONTRACT` PRIMARY KEY (
	`contract_id`
);

ALTER TABLE `team_record` ADD CONSTRAINT `PK_TEAM_RECORD` PRIMARY KEY (
	`team_record_id`
);

ALTER TABLE `position` ADD CONSTRAINT `PK_POSITION` PRIMARY KEY (
	`position_id`
);

ALTER TABLE `train` ADD CONSTRAINT `PK_TRAIN` PRIMARY KEY (
	`train_id`
);

ALTER TABLE `game_record_detail` ADD CONSTRAINT `PK_GAME_RECORD_DETAIL` PRIMARY KEY (
	`game_detail_id`
);

ALTER TABLE `team` ADD CONSTRAINT `PK_TEAM` PRIMARY KEY (
	`team_id`
);

ALTER TABLE `player_record` ADD CONSTRAINT `PK_PLAYER_RECORD` PRIMARY KEY (
	`player_record_id`
);

ALTER TABLE `player` ADD CONSTRAINT `PK_PLAYER` PRIMARY KEY (
	`player_id`
);

ALTER TABLE `game` ADD CONSTRAINT `PK_GAME` PRIMARY KEY (
	`game_id`
);

ALTER TABLE `player_record_detail` ADD CONSTRAINT `PK_PLAYER_RECORD_DETAIL` PRIMARY KEY (
	`player_record_detail_id`
);

ALTER TABLE `player_position` ADD CONSTRAINT `PK_PLAYER_POSITION` PRIMARY KEY (
	`player_id`,
	`position_id`
);

ALTER TABLE `staff` ADD CONSTRAINT `FK_team_TO_staff_1` FOREIGN KEY (
	`team_id`
)
REFERENCES `team` (
	`team_id`
);

ALTER TABLE `user` ADD CONSTRAINT `FK_permission_TO_user_1` FOREIGN KEY (
	`permission_id`
)
REFERENCES `permission` (
	`permission_id`
);

ALTER TABLE `user` ADD CONSTRAINT `FK_team_TO_user_1` FOREIGN KEY (
	`team_id`
)
REFERENCES `team` (
	`team_id`
);

ALTER TABLE `contract` ADD CONSTRAINT `FK_player_TO_contract_1` FOREIGN KEY (
	`player_id`
)
REFERENCES `player` (
	`player_id`
);

ALTER TABLE `contract` ADD CONSTRAINT `FK_team_TO_contract_1` FOREIGN KEY (
	`team_id`
)
REFERENCES `team` (
	`team_id`
);

ALTER TABLE `team_record` ADD CONSTRAINT `FK_team_TO_team_record_1` FOREIGN KEY (
	`team_id`
)
REFERENCES `team` (
	`team_id`
);

ALTER TABLE `train` ADD CONSTRAINT `FK_player_TO_train_1` FOREIGN KEY (
	`player_id`
)
REFERENCES `player` (
	`player_id`
);

ALTER TABLE `game_record_detail` ADD CONSTRAINT `FK_player_TO_game_record_detail_1` FOREIGN KEY (
	`player_id`
)
REFERENCES `player` (
	`player_id`
);

ALTER TABLE `game_record_detail` ADD CONSTRAINT `FK_game_TO_game_record_detail_1` FOREIGN KEY (
	`game_id`
)
REFERENCES `game` (
	`game_id`
);

ALTER TABLE `player_record` ADD CONSTRAINT `FK_player_TO_player_record_1` FOREIGN KEY (
	`player_id`
)
REFERENCES `player` (
	`player_id`
);

ALTER TABLE `player` ADD CONSTRAINT `FK_team_TO_player_1` FOREIGN KEY (
	`team_id`
)
REFERENCES `team` (
	`team_id`
);

ALTER TABLE `game` ADD CONSTRAINT `FK_team_TO_game_1` FOREIGN KEY (
	`team_id`
)
REFERENCES `team` (
	`team_id`
);

ALTER TABLE `player_record_detail` ADD CONSTRAINT `FK_player_TO_player_record_detail_1` FOREIGN KEY (
	`player_id`
)
REFERENCES `player` (
	`player_id`
);

ALTER TABLE `player_position` ADD CONSTRAINT `FK_player_TO_player_position_1` FOREIGN KEY (
	`player_id`
)
REFERENCES `player` (
	`player_id`
);

ALTER TABLE `player_position` ADD CONSTRAINT `FK_position_TO_player_position_1` FOREIGN KEY (
	`position_id`
)
REFERENCES `position` (
	`position_id`
);

