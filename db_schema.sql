

--
-- Table structure for table 'tasks'
--

DROP TABLE IF EXISTS tasks_t;

CREATE TABLE tasks_t (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(45) DEFAULT NULL,
  description varchar(45) DEFAULT NULL,
  category_name varchar(45) DEFAULT NULL,
  date_created datetime DEFAULT NULL,
  finished bit(1) DEFAULT b'0',
  PRIMARY KEY (id)
);

