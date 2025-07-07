-- contract 테이블 player_id 외래키 추가
ALTER TABLE `contract`
ADD CONSTRAINT `FK_ct_player_id`
FOREIGN KEY (`player_id`) REFERENCES `player`(`player_id`);

-- contract 테이블에 team_id 외래키 추라
ALTER TABLE `contract`
ADD CONSTRAINT `FK_ct_team_id`
FOREIGN KEY (`team_id`) REFERENCES `team`(`team_id`);

-- train 테이블에 player_id 외래키 추가
ALTER TABLE `train`
ADD CONSTRAINT `FK_tr_player_id`
FOREIGN KEY (`player_id`) REFERENCES `player`(`player_id`);

-- 계약 시작일과 종료일 검증
ALTER TABLE contract 
ADD CONSTRAINT chk_contract_dates CHECK (contract_start < contract_end);

-- 계약금, 연봉 검증
ALTER TABLE contract
ADD CONSTRAINT chk_contract_amount CHECK (payment >= 0 AND year_salary >= 0);
