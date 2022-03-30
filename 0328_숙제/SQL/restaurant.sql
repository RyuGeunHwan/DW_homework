-- Mysql DDL
CREATE TABLE food(
    foodNo INTEGER(4) AUTO_INCREMENT PRIMARY KEY COMMENT '음식 번호',
    foodName VARCHAR(20) NOT NULL COMMENT '음식 이름',
    foodPrice INTEGER(4) NOT NULL COMMENT '음식 가격',
);
    
CREATE TABLE restaurant(
    restaurantNo INTEGER(4) AUTO_INCREMENT PRIMARY KEY COMMENT '레스토랑 번호',
    restaurantName VARCHAR(20) NOT NULL COMMENT '레스토랑 이름',
    foodNo INTEGER(4) NOT NULL COMMENT '음식 번호',
    FOREIGN KEY(foodNo) REFERENCES food(foodNo)
);

SELECT * FROM restaurant WHERE foodNo = 30 AND restaurantName= '빠스타스';
/* 문제 1.
레스토랑 테이블에 데이터가 일일 1000만건 저장된다. 
레스토랑 테이블에서 위에 작성한 select쿼리 호출 시간이 오래 걸리기 시작했다.
가장 먼저해야하는 바람직한 행동은?
답안 작성 => 
1. 인덱스를 생성한다!
    1-1)인덱스 생성
    ALTER TABLE 테이블명 ADD INDEX 인덱스명 ( 컬럼명 );

    1-2)인덱스 추가 생성
    CREATE INDEX 인덱스명 ON 테이블명 ( 컬럼명1, 컬럼명2, ... );

2. 프로시저 생성해서 사용한다!
*/

DELETE FROM food
WHERE foodNo = 30;
/* 문제 2.
음식 테이블에 30번 음식 데이터를 지우려고 한다.
하지만 레스토랑 테이블에 30번 데이터가 있어서 지울 수가 없다. 
음식 테이블에 30번 데이터를 지울 방법은 무엇일까?
답안 작성 =>

음식테이블 = 부모테이블
식당테이블 = 자식 테이블
방법1. on delete cascade 속성생성
 1-1) ALTER TABLE restaurant DROP FOREIGN KEY foodNo;
 1-2) alter table restaurant
      add constraint FOREIGN KEY (foodNo) REFERENCES food(foodNo) on delete cascade
방법2. foreign key 체크해제 -> 음식 테이블에 30번 데이터 삭제 -> foreign key 다시 체크 설정
*/