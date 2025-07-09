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
  UNIQUE KEY (`phone`), -- 전화번호 중복금지
  CONSTRAINT `FK_staff_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
);