DELIMITER $$

CREATE TRIGGER trg_staff_before_insert
BEFORE INSERT ON staff
FOR EACH ROW
BEGIN
    DECLARE coach_count INT;
    DECLARE existing_same_person INT;

    -- 1. 같은 이름+폰번호가 이미 있으면 거부
    SELECT COUNT(*) INTO existing_same_person
    FROM staff
    WHERE staff_name = NEW.staff_name
      AND phone = NEW.phone
      AND team_id = NEW.team_id
      AND resignation_date IS NULL;

    IF existing_same_person > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '동일한 이름과 전화번호를 가진 스태프가 이미 존재합니다. 해당 스태프를 해고처리하세요.';
    END IF;

    -- 2. 역할별 정책 분기
    IF NEW.role = '감독' THEN
    SELECT COUNT(*) INTO existing_same_person
    FROM staff
    WHERE resignation_date IS NULL;
    
    if existing_same_person > 0 THEN
    	  SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '감독이 이미 있습니다. 감독을 해고처리 하하세요.';
    END IF;
      

    END IF;
END$$

DELIMITER ;