CREATE SEQUENCE listing_image_id_seq START WITH 1 MINVALUE 1 INCREMENT BY 1;

CREATE SEQUENCE audit_data_id_seq START WITH 1 MINVALUE 1 INCREMENT BY 1;

CREATE SEQUENCE listing_abuse_id_seq START WITH 1 MINVALUE 1 INCREMENT BY 1;

CREATE SEQUENCE listing_attribute_value_id_seq START WITH 1 MINVALUE 1 INCREMENT BY 1;

CREATE SEQUENCE user_id_seq START WITH 1 MINVALUE 1 INCREMENT BY 1;

CREATE SEQUENCE private_messages_id_seq START WITH 1 MINVALUE 1 INCREMENT BY 1;

CREATE SEQUENCE category_attribute_id_seq START WITH 1 MINVALUE 1 INCREMENT BY 1;

CREATE SEQUENCE listing_id_seq START WITH 1 MINVALUE 1 INCREMENT BY 1;

CREATE SEQUENCE category_id_seq START WITH 1 MINVALUE 1 INCREMENT BY 1;

CREATE TABLE es1_listing_image (
  id NUMBER(10) NOT NULL,
  listing_id NUMBER(10) DEFAULT NULL NULL,
  image_url CLOB DEFAULT NULL NULL,
  PRIMARY KEY(id)
);

CREATE INDEX IDX_806ED2D7D4619D1A ON es1_listing_image (listing_id);

CREATE TABLE es1_audit_data (
  id NUMBER(10) NOT NULL,
  user_id NUMBER(10) DEFAULT NULL NULL,
  table_name VARCHAR2(255) NOT NULL,
  record_id NUMBER(10) NOT NULL,
  event VARCHAR2(255) DEFAULT NULL NULL,
  created_at TIMESTAMP(0) NOT NULL,
  ip_address VARCHAR2(255) DEFAULT NULL NULL,
  old_value CLOB DEFAULT NULL NULL,
  new_value CLOB DEFAULT NULL NULL,
  PRIMARY KEY(id)
);

CREATE INDEX IDX_D2E8AE51A76ED395 ON es1_audit_data (user_id);


CREATE TABLE es1_listing_abuse (
  id NUMBER(10) NOT NULL,
  reported_by_id NUMBER(10) DEFAULT NULL NULL,
  listing_id NUMBER(10) DEFAULT NULL NULL,
  reason CLOB DEFAULT NULL NULL,
  created_at TIMESTAMP(0) DEFAULT NULL NULL,
  PRIMARY KEY(id)
);

CREATE INDEX IDX_DDFC55B971CE806 ON es1_listing_abuse (reported_by_id);

CREATE INDEX IDX_DDFC55B9D4619D1A ON es1_listing_abuse (listing_id);


CREATE TABLE es1_listing_attribute_value (
  id NUMBER(10) NOT NULL,
  listing_id NUMBER(10) DEFAULT NULL NULL,
  attribute_id NUMBER(10) DEFAULT NULL NULL,
  text1 CLOB DEFAULT NULL NULL,
  float1 DOUBLE PRECISION DEFAULT NULL NULL,
  bool1 NUMBER(1) DEFAULT NULL NULL,
  date1 TIMESTAMP(0) DEFAULT NULL NULL,
  PRIMARY KEY(id)
);

CREATE INDEX IDX_A11A643FD4619D1A ON es1_listing_attribute_value (listing_id);

CREATE INDEX IDX_A11A643FB6E62EFA ON es1_listing_attribute_value (attribute_id);


CREATE TABLE es1_user (
  id NUMBER(10) NOT NULL,
  username VARCHAR2(255) NOT NULL,
  email VARCHAR2(255) DEFAULT NULL NULL,
  is_active NUMBER(1) DEFAULT NULL NULL,
  password_hash VARCHAR2(255) DEFAULT NULL NULL,
  phone_number VARCHAR2(255) DEFAULT NULL NULL,
  created_at TIMESTAMP(0) DEFAULT NULL NULL,
  roles CLOB DEFAULT NULL NULL,
  PRIMARY KEY(id)
);


CREATE TABLE es1_private_messages (
  id NUMBER(10) NOT NULL,
  from_id NUMBER(10) DEFAULT NULL NULL,
  chat_id NUMBER(10) DEFAULT NULL NULL,
  listing_id NUMBER(10) DEFAULT NULL NULL,
  message CLOB DEFAULT NULL NULL,
  created_at TIMESTAMP(0) DEFAULT NULL NULL,
  PRIMARY KEY(id)
);

CREATE INDEX IDX_50CE8BEB78CED90B ON es1_private_messages (from_id);

CREATE INDEX IDX_50CE8BEB1A9A7125 ON es1_private_messages (chat_id);

CREATE INDEX IDX_50CE8BEBD4619D1A ON es1_private_messages (listing_id);

CREATE TABLE es1_category_attribute (
  id NUMBER(10) NOT NULL,
  category_id NUMBER(10) DEFAULT NULL NULL,
  code VARCHAR2(255) NOT NULL,
  label CLOB DEFAULT NULL NULL,
  sort_order NUMBER(10) DEFAULT NULL NULL,
  is_recursive NUMBER(1) DEFAULT NULL NULL,
  type VARCHAR2(255) DEFAULT NULL NULL,
  PRIMARY KEY(id)
);

CREATE INDEX IDX_2A2B7C0012469DE2 ON es1_category_attribute (category_id);

CREATE TABLE es1_listing (
  id NUMBER(10) NOT NULL,
  category_id NUMBER(10) DEFAULT NULL NULL,
  user_id NUMBER(10) DEFAULT NULL NULL,
  title VARCHAR2(255) NOT NULL,
  status VARCHAR2(255) NOT NULL,
  description CLOB DEFAULT NULL NULL,
  created_at TIMESTAMP(0) NOT NULL,
  updated_at TIMESTAMP(0) DEFAULT NULL NULL,
  PRIMARY KEY(id)
);

CREATE INDEX IDX_B45A175C12469DE2 ON es1_listing (category_id);

CREATE INDEX IDX_B45A175CA76ED395 ON es1_listing (user_id);


CREATE TABLE es1_category (
  id NUMBER(10) NOT NULL,
  parent_id NUMBER(10) DEFAULT NULL NULL,
  slug VARCHAR2(255) NOT NULL,
  title VARCHAR2(255) DEFAULT NULL NULL,
  description CLOB DEFAULT NULL NULL,
  PRIMARY KEY(id)
);

CREATE INDEX IDX_E550488C727ACA70 ON es1_category (parent_id);

ALTER TABLE
  es1_listing_image
ADD
  CONSTRAINT FK_806ED2D7D4619D1A FOREIGN KEY (listing_id) REFERENCES es1_listing (id);

ALTER TABLE
  es1_audit_data
ADD
  CONSTRAINT FK_D2E8AE51A76ED395 FOREIGN KEY (user_id) REFERENCES es1_user (id);

ALTER TABLE
  es1_listing_abuse
ADD
  CONSTRAINT FK_DDFC55B971CE806 FOREIGN KEY (reported_by_id) REFERENCES es1_user (id);

ALTER TABLE
  es1_listing_abuse
ADD
  CONSTRAINT FK_DDFC55B9D4619D1A FOREIGN KEY (listing_id) REFERENCES es1_listing (id);

ALTER TABLE
  es1_listing_attribute_value
ADD
  CONSTRAINT FK_A11A643FD4619D1A FOREIGN KEY (listing_id) REFERENCES es1_listing (id);

ALTER TABLE
  es1_listing_attribute_value
ADD
  CONSTRAINT FK_A11A643FB6E62EFA FOREIGN KEY (attribute_id) REFERENCES es1_category_attribute (id);

ALTER TABLE
  es1_private_messages
ADD
  CONSTRAINT FK_50CE8BEB78CED90B FOREIGN KEY (from_id) REFERENCES es1_user (id) ON DELETE
SET
  NULL;


ALTER TABLE
  es1_private_messages
ADD
  CONSTRAINT FK_50CE8BEB1A9A7125 FOREIGN KEY (chat_id) REFERENCES es1_user (id) ON DELETE
SET
  NULL;

ALTER TABLE
  es1_private_messages
ADD
  CONSTRAINT FK_50CE8BEBD4619D1A FOREIGN KEY (listing_id) REFERENCES es1_listing (id) ON DELETE
SET
  NULL;

ALTER TABLE
  es1_category_attribute
ADD
  CONSTRAINT FK_2A2B7C0012469DE2 FOREIGN KEY (category_id) REFERENCES es1_category (id);

ALTER TABLE
  es1_listing
ADD
  CONSTRAINT FK_B45A175C12469DE2 FOREIGN KEY (category_id) REFERENCES es1_category (id);

ALTER TABLE
  es1_listing
ADD
  CONSTRAINT FK_B45A175CA76ED395 FOREIGN KEY (user_id) REFERENCES es1_user (id);

ALTER TABLE
  es1_category
ADD
  CONSTRAINT FK_E550488C727ACA70 FOREIGN KEY (parent_id) REFERENCES es1_category (id) ON DELETE CASCADE;

