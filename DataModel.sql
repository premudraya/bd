CREATE TABLE dream ( 
	date timestamp,
	duration integer,
	dream text,
	id_physical_state bigint NOT NULL
)
;

CREATE TABLE general_user_state ( 
	id_physical_state bigint NOT NULL,
	id_psychological_state bigint NOT NULL,
	id_mental_statement bigint NOT NULL,
	id_general_user_state bigint NOT NULL,
	id_user bigint NOT NULL,
	date integer
)
;

CREATE TABLE mental_statement ( 
	date timestamp,
	mental_state integer,
	day_rate integer,
	physical_state integer,
	id_mental_statement bigint NOT NULL,
	id_general_user_state bigint NOT NULL
)
;

CREATE TABLE notification ( 
	id_notification bigint NOT NULL,
	information text,
	date timestamp,
	id_user bigint NOT NULL
)
;

CREATE TABLE physical_state ( 
	fatigue integer,
	concentration loss integer,
	mood shifts integer,
	ailment integer,
	dream bigint NOT NULL,
	id_general_user_state bigint NOT NULL,
	id_physical_state bigint NOT NULL,
	date integer
)
;

CREATE TABLE psychologica_ state ( 
	stress integer,
	tension integer,
	agression integer,
	irritability integer,
	neuroses_and_OCD's text,
	general_user_state bigint NOT NULL,
	date integer
)
;

CREATE TABLE support_service ( 
	information text,
	name text,
	id_support_service bigint NOT NULL,
	id_user bigint NOT NULL
)
;

CREATE TABLE test_results ( 
	outcome1 text,
	outcome2 integer,
	outcome3 text,
	id bigint NOT NULL
)
;

CREATE TABLE user ( 
	date_of_birth timestamp NOT NULL,
	gender text,
	id_user bigint NOT NULL
)
;

CREATE TABLE user ( 
	date_of_birth timestamp,
	gender text,
	id_user bigint NOT NULL
)
;


ALTER TABLE dream ADD CONSTRAINT PK_dream 
	PRIMARY KEY (id_physical_state)
;


ALTER TABLE general_user_state ADD CONSTRAINT PK_general_user_state 
	PRIMARY KEY (id_general_user_state, id_user)
;


ALTER TABLE mental_statement ADD CONSTRAINT PK_mental_statement 
	PRIMARY KEY (id_mental_statement, id_general_user_state)
;


ALTER TABLE notification ADD CONSTRAINT PK_notification 
	PRIMARY KEY (id_notification, id_user)
;


ALTER TABLE physical_state ADD CONSTRAINT PK_physical_state 
	PRIMARY KEY (id_physical_state)
;


ALTER TABLE support_service ADD CONSTRAINT PK_support_service 
	PRIMARY KEY (id_support_service, id_user)
;


ALTER TABLE test_results ADD CONSTRAINT PK_test_results 
	PRIMARY KEY (id)
;


ALTER TABLE user ADD CONSTRAINT PK_user 
	PRIMARY KEY (id_user)
;




ALTER TABLE dream ADD CONSTRAINT FK_dream_physical_state 
	FOREIGN KEY (id_physical_state) REFERENCES physical_state (id_physical_state)
;

ALTER TABLE mental_statement ADD CONSTRAINT FK_mental_statement_general_user_state 
	FOREIGN KEY (id_general_user_state) REFERENCES general_user_state (id_general_user_state, id_user)
;

ALTER TABLE physical_state ADD CONSTRAINT FK_physical_state_general_user_state 
	FOREIGN KEY (id_general_user_state) REFERENCES general_user_state (id_general_user_state, id_user)
;

ALTER TABLE psychologica_ state ADD CONSTRAINT FK_psychologica_ state_general_user_state 
	FOREIGN KEY (general_user_state) REFERENCES general_user_state (id_general_user_state, id_user)
;
