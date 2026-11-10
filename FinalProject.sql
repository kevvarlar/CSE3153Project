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
  class_name varchar(30),
  class_description text
);

-- #5 Create players table
CREATE TABLE game_data.players (
  player_id integer PRIMARY KEY,
  username varchar(30) NOT NULL,
  player_level integer DEFAULT (0),
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
  item_quantity integer DEFAULT(1),
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
  skill_name varchar(30) NOT NULL,
  skill_type varchar(30),
  skill_description text,
  class_id integer NOT NULL,
  CONSTRAINT fk_class_id_2
  FOREIGN KEY (class_id)
  REFERENCES game_data.classes(class_id)
);
GO

-- #9 Insert sample data into classes
INSERT INTO game_data.classes (class_id, class_name, class_description)
VALUES
(1, 'Rogue', 'Specializes in stealth and precision'),
(2, 'Mage', 'Specializes in magic'),
(3, 'Archer', 'Specializes in ranged attacks');


-- #10 Insert sample data into players
INSERT INTO game_data.players (player_id, username, player_level, class_id)
VALUES
(1, 'CheeseDip', 11, 1),
(2, 'LarpMaster', 15, 2),
(3, 'Ryuu', 8, 3);

-- #11 Insert sample data into items
INSERT INTO game_data.items (item_id, item_name, item_type, value)
VALUES
(1, 'Rusty Dagger', 'Weapon', 30.00),
(2, 'Lapis Staff', 'Weapon', 75.00),
(3, 'Lesser Healing Potion', 'Consumable', 10.00);


-- #12 Insert sample data into inventories
INSERT INTO game_data.inventories (player_id, item_id, item_quantity)
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 6);

-- #13 Insert sample data into skills
INSERT INTO game_data.skills (skill_id, skill_name, skill_type, skill_description, class_id)
VALUES
(1, 'Backstab', 'Attack', 'Stealth attack from behind', 1),
(2, 'Fireball', 'Magic', 'Summons and throws a ball of fire at an enemy', 2),
(3, 'Rain of Arrows', 'Attack', 'A barrage of arrows shot in the air towards the enemy', 3);

