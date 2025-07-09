-- permission 테이블 (사용자 권한)
CREATE TABLE `permission` (
  `permission_id` INT NOT NULL COMMENT '권한 ID',
  `perimission_name` VARCHAR(20) NOT NULL COMMENT '권한명',
  PRIMARY KEY (`permission_id`)
);
