-- GRANT create job, create table, create trigger, create procedure to splunk_test;


CREATE TABLE "SAMPLE_DATA"
   (	"ID" NUMBER NOT NULL ENABLE,
	"CREATED_ON" DATE,
	"RANDOM_NUMBER" NUMBER,
	 CONSTRAINT "RND_NOT_NULL" CHECK (random_number is not null) ENABLE
   ) ;

CREATE SEQUENCE  sample_seq  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER sample_trg
   before insert on sample_data
   for each row
begin
   if inserting then
      if :NEW."ID" is null then
         select sample_seq.nextval into :NEW."ID" from dual;
         :NEW."CREATED_ON" := sysdate;

      end if;
   end if;
end;
/
ALTER TRIGGER sample_trg ENABLE;



BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'sample_job',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN insert into sample_data(random_number) values (round(dbms_random.value(1,10000))); END;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=SECONDLY;INTERVAL=30;',
    enabled         => TRUE);
END;
/
