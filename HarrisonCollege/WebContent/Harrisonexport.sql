--------------------------------------------------------
--  File created - Friday-September-11-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table HCLASSENROLLMENTS
--------------------------------------------------------

  CREATE TABLE "TESTDB"."HCLASSENROLLMENTS" 
   (	"CLASSENROLLMENTS_ID" NUMBER, 
	"CLASS_ID" NUMBER, 
	"STUDENT_ID" NUMBER, 
	"GRADE" VARCHAR2(10 BYTE), 
	"ENROLLED" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HCLASSES
--------------------------------------------------------

  CREATE TABLE "TESTDB"."HCLASSES" 
   (	"COURSE_ID" NUMBER, 
	"INSTRUCTOR_ID" NUMBER, 
	"CLASSROOM_ID" NUMBER, 
	"SEMESTER" VARCHAR2(255 BYTE), 
	"YEAR" VARCHAR2(30 BYTE), 
	"DAY" VARCHAR2(30 BYTE), 
	"STARTTIME" VARCHAR2(30 BYTE), 
	"ENDTIME" VARCHAR2(30 BYTE), 
	"ENABLED" VARCHAR2(10 BYTE), 
	"CLASS_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HCLASSROOMS
--------------------------------------------------------

  CREATE TABLE "TESTDB"."HCLASSROOMS" 
   (	"CLASSROOM_ID" NUMBER, 
	"BUILDING" VARCHAR2(255 BYTE), 
	"ROOM_NUMBER" NUMBER, 
	"CAPACITY" NUMBER, 
	"ENABLED" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HCOURSES
--------------------------------------------------------

  CREATE TABLE "TESTDB"."HCOURSES" 
   (	"COURSE_ID" NUMBER, 
	"SUBJECT" VARCHAR2(255 BYTE), 
	"CREDIT_HOURS" NUMBER, 
	"DEPARTMENT_ID" NUMBER, 
	"ENABLED" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HDEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "TESTDB"."HDEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER, 
	"NAME" VARCHAR2(255 BYTE), 
	"CODE" VARCHAR2(255 BYTE), 
	"ENABLED" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HMAJORS
--------------------------------------------------------

  CREATE TABLE "TESTDB"."HMAJORS" 
   (	"MAJOR_ID" NUMBER, 
	"DEPARTMENT_ID" NUMBER, 
	"ENABLED" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HOFFICIALS
--------------------------------------------------------

  CREATE TABLE "TESTDB"."HOFFICIALS" 
   (	"OFFICIAL_ID" NUMBER, 
	"DEPARTMENT_ID" NUMBER, 
	"OFFICE_NUMBER" NUMBER, 
	"TYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HPENDINGADMISSIONS
--------------------------------------------------------

  CREATE TABLE "TESTDB"."HPENDINGADMISSIONS" 
   (	"PENDING_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"PERMISSIONS" VARCHAR2(30 BYTE), 
	"MESSAGE" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HSTUDENTS
--------------------------------------------------------

  CREATE TABLE "TESTDB"."HSTUDENTS" 
   (	"STUDENT_ID" NUMBER, 
	"MAJOR" VARCHAR2(255 BYTE), 
	"ENTRY_YEAR" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HUSERS
--------------------------------------------------------

  CREATE TABLE "TESTDB"."HUSERS" 
   (	"USER_ID" NUMBER, 
	"NAME" VARCHAR2(255 BYTE), 
	"PASSWORD" VARCHAR2(255 BYTE), 
	"PERMISSIONS" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into TESTDB.HCLASSENROLLMENTS
SET DEFINE OFF;
REM INSERTING into TESTDB.HCLASSES
SET DEFINE OFF;
REM INSERTING into TESTDB.HCLASSROOMS
SET DEFINE OFF;
REM INSERTING into TESTDB.HCOURSES
SET DEFINE OFF;
REM INSERTING into TESTDB.HDEPARTMENTS
SET DEFINE OFF;
REM INSERTING into TESTDB.HMAJORS
SET DEFINE OFF;
REM INSERTING into TESTDB.HOFFICIALS
SET DEFINE OFF;
REM INSERTING into TESTDB.HPENDINGADMISSIONS
SET DEFINE OFF;
REM INSERTING into TESTDB.HSTUDENTS
SET DEFINE OFF;
REM INSERTING into TESTDB.HUSERS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index HCLASSENROLLMENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TESTDB"."HCLASSENROLLMENTS_PK" ON "TESTDB"."HCLASSENROLLMENTS" ("CLASSENROLLMENTS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HCLASSES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TESTDB"."HCLASSES_PK" ON "TESTDB"."HCLASSES" ("CLASS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HCLASSROOMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TESTDB"."HCLASSROOMS_PK" ON "TESTDB"."HCLASSROOMS" ("CLASSROOM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HCOURSES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TESTDB"."HCOURSES_PK" ON "TESTDB"."HCOURSES" ("COURSE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HDEPARTMENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TESTDB"."HDEPARTMENTS_PK" ON "TESTDB"."HDEPARTMENTS" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HMAJORS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TESTDB"."HMAJORS_PK" ON "TESTDB"."HMAJORS" ("MAJOR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HOFFICIALS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TESTDB"."HOFFICIALS_PK" ON "TESTDB"."HOFFICIALS" ("OFFICIAL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HPENDINGADMISSIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TESTDB"."HPENDINGADMISSIONS_PK" ON "TESTDB"."HPENDINGADMISSIONS" ("PENDING_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HSTUDENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TESTDB"."HSTUDENTS_PK" ON "TESTDB"."HSTUDENTS" ("STUDENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HUSERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TESTDB"."HUSERS_PK" ON "TESTDB"."HUSERS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table HCLASSENROLLMENTS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HCLASSENROLLMENTS" ADD CONSTRAINT "HCLASSENROLLMENTS_PK" PRIMARY KEY ("CLASSENROLLMENTS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TESTDB"."HCLASSENROLLMENTS" MODIFY ("CLASSENROLLMENTS_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HCLASSES
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HCLASSES" ADD CONSTRAINT "HCLASSES_PK" PRIMARY KEY ("CLASS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TESTDB"."HCLASSES" MODIFY ("CLASS_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HCLASSROOMS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HCLASSROOMS" ADD CONSTRAINT "HCLASSROOMS_PK" PRIMARY KEY ("CLASSROOM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TESTDB"."HCLASSROOMS" MODIFY ("CLASSROOM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HCOURSES
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HCOURSES" ADD CONSTRAINT "HCOURSES_PK" PRIMARY KEY ("COURSE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TESTDB"."HCOURSES" MODIFY ("COURSE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HDEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HDEPARTMENTS" ADD CONSTRAINT "HDEPARTMENTS_PK" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TESTDB"."HDEPARTMENTS" MODIFY ("DEPARTMENT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HMAJORS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HMAJORS" ADD CONSTRAINT "HMAJORS_PK" PRIMARY KEY ("MAJOR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TESTDB"."HMAJORS" MODIFY ("MAJOR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HOFFICIALS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HOFFICIALS" ADD CONSTRAINT "HOFFICIALS_PK" PRIMARY KEY ("OFFICIAL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TESTDB"."HOFFICIALS" MODIFY ("OFFICIAL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HPENDINGADMISSIONS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HPENDINGADMISSIONS" ADD CONSTRAINT "HPENDINGADMISSIONS_PK" PRIMARY KEY ("PENDING_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TESTDB"."HPENDINGADMISSIONS" MODIFY ("PENDING_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HSTUDENTS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HSTUDENTS" ADD CONSTRAINT "HSTUDENTS_PK" PRIMARY KEY ("STUDENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TESTDB"."HSTUDENTS" MODIFY ("STUDENT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HUSERS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HUSERS" ADD CONSTRAINT "HUSERS_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TESTDB"."HUSERS" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table HCLASSENROLLMENTS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HCLASSENROLLMENTS" ADD CONSTRAINT "ENROLLMENTTOCLASS" FOREIGN KEY ("CLASS_ID")
	  REFERENCES "TESTDB"."HCLASSES" ("CLASS_ID") ENABLE;
  ALTER TABLE "TESTDB"."HCLASSENROLLMENTS" ADD CONSTRAINT "ENROLLMENTTOSTUDENT" FOREIGN KEY ("STUDENT_ID")
	  REFERENCES "TESTDB"."HSTUDENTS" ("STUDENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HCLASSES
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HCLASSES" ADD CONSTRAINT "CLASSTOCLASSROOM" FOREIGN KEY ("CLASSROOM_ID")
	  REFERENCES "TESTDB"."HCLASSROOMS" ("CLASSROOM_ID") ENABLE;
  ALTER TABLE "TESTDB"."HCLASSES" ADD CONSTRAINT "CLASSTOCOURSE" FOREIGN KEY ("COURSE_ID")
	  REFERENCES "TESTDB"."HCOURSES" ("COURSE_ID") ENABLE;
  ALTER TABLE "TESTDB"."HCLASSES" ADD CONSTRAINT "CLASSTOINSTRUCTOR" FOREIGN KEY ("INSTRUCTOR_ID")
	  REFERENCES "TESTDB"."HOFFICIALS" ("OFFICIAL_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HCOURSES
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HCOURSES" ADD CONSTRAINT "COURSETODEPT" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "TESTDB"."HDEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HMAJORS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HMAJORS" ADD CONSTRAINT "MAJORTODEPT" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "TESTDB"."HDEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HOFFICIALS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HOFFICIALS" ADD CONSTRAINT "OFFICIALTODEPT" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "TESTDB"."HDEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
  ALTER TABLE "TESTDB"."HOFFICIALS" ADD CONSTRAINT "USERTOOFFICIAL" FOREIGN KEY ("OFFICIAL_ID")
	  REFERENCES "TESTDB"."HUSERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HPENDINGADMISSIONS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HPENDINGADMISSIONS" ADD CONSTRAINT "PENDINGTOUSER" FOREIGN KEY ("USER_ID")
	  REFERENCES "TESTDB"."HUSERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HSTUDENTS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."HSTUDENTS" ADD CONSTRAINT "USERTOSTUDENT" FOREIGN KEY ("STUDENT_ID")
	  REFERENCES "TESTDB"."HUSERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger HUSERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TESTDB"."HUSERS_TRG" 
BEFORE INSERT ON HUSERS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "TESTDB"."HUSERS_TRG" ENABLE;
