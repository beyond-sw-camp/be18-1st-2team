-- 계약 시작일과 종료일 검증
ALTER TABLE contract 
ADD CONSTRAINT chk_contract_dates CHECK (contract_start < contract_end);

-- 계약금, 연봉 검증
ALTER TABLE contract
ADD CONSTRAINT chk_contract_amount CHECK (payment >= 0 AND year_salary >= 0);
