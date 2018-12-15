CREATE TABLE SUBSCRIBER (
   s_id INTEGER NOT NULL PRIMARY KEY,
   sub_nbr VARCHAR(15) NOT NULL UNIQUE,
   bit_1 BYTE,
   bit_2 BYTE,
   bit_3 BYTE,
   bit_4 BYTE,
   bit_5 BYTE,
   bit_6 BYTE,
   bit_7 BYTE,
   bit_8 BYTE,
   bit_9 BYTE,
   bit_10 BYTE,
   hex_1 BYTE,
   hex_2 BYTE,
   hex_3 BYTE,
   hex_4 BYTE,
   hex_5 BYTE,
   hex_6 BYTE,
   hex_7 BYTE,
   hex_8 BYTE,
   hex_9 BYTE,
   hex_10 BYTE,
   byte2_1 SMALLINT,
   byte2_2 SMALLINT,
   byte2_3 SMALLINT,
   byte2_4 SMALLINT,
   byte2_5 SMALLINT,
   byte2_6 SMALLINT,
   byte2_7 SMALLINT,
   byte2_8 SMALLINT,
   byte2_9 SMALLINT,
   byte2_10 SMALLINT,
   msc_location INTEGER,
   vlr_location INTEGER
);

CREATE TABLE ACCESS_INFO (
   s_id INTEGER NOT NULL,
   ai_type BYTE NOT NULL,
   data1 SMALLINT,
   data2 SMALLINT,
   data3 VARCHAR(3),
   data4 VARCHAR(5),
   PRIMARY KEY(s_id, ai_type),
   FOREIGN KEY (s_id) REFERENCES SUBSCRIBER (s_id)
);

CREATE TABLE SPECIAL_FACILITY (
   s_id INTEGER NOT NULL,
   sf_type BYTE NOT NULL,
   is_active BYTE NOT NULL,
   error_cntrl SMALLINT,
   data_a SMALLINT,
   data_b VARCHAR(5),
   PRIMARY KEY (s_id, sf_type),
   FOREIGN KEY (s_id) REFERENCES SUBSCRIBER (s_id)
);

CREATE TABLE CALL_FORWARDING (
   s_id INTEGER NOT NULL,
   sf_type BYTE NOT NULL,
   start_time BYTE NOT NULL,
   end_time BYTE,
   numberx VARCHAR(15),
   PRIMARY KEY (s_id, sf_type, start_time),
   FOREIGN KEY (s_id, sf_type) REFERENCES SPECIAL_FACILITY(s_id, sf_type)
);
CREATE INDEX IDX_CF ON CALL_FORWARDING (S_ID);
