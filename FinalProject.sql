-- #1 Create the databse
CREATE DATABASE RPG;
GO

-- #2 Switch to RPG database
USE RPG;
GO

-- #3 Create Schema
CREATE SCHEMA game_data;
GO

-- #4 Create classes table
CREATE TABLE game_data.classes (
  class_id integer PRIMARY KEY,
  name varchar(30),
  description text
);

-- #5 Create players table
CREATE TABLE game_data.players (
  player_id integer PRIMARY KEY,
  username varchar(30) NOT NULL,
  level integer DEFAULT (0),
  class_id integer NOT NULL,
  CONSTRAINT fk_class_id
  FOREIGN KEY (class_id)
  REFERENCES game_data.classes(class_id)
);

-- #6 Create items table
CREATE TABLE game_data.items (
  item_id integer PRIMARY KEY,
  item_name varchar(30) NOT NULL,
  item_type varchar(30),
  value decimal
);

-- #7 Create inventories table
CREATE TABLE game_data.inventories (
  player_id integer NOT NULL,
  item_id integer NOT NULL,
  quantity integer DEFAULT(1),
  CONSTRAINT fk_player_id
  FOREIGN KEY (player_id)
  REFERENCES game_data.players(player_id),
  CONSTRAINT fk_item_id
  FOREIGN KEY(item_id) 
  REFERENCES game_data.items(item_id),
  PRIMARY KEY (player_id, item_id)
);

-- #8 Create skills table
CREATE TABLE game_data.skills (
  skill_id integer PRIMARY KEY,
  name varchar(30) NOT NULL,
  type varchar(30),
  description text,
  class_id integer NOT NULL,
  CONSTRAINT fk_class_id_2
  FOREIGN KEY (class_id)
  REFERENCES game_data.classes(class_id)
);
GO
