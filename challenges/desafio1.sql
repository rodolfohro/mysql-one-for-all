DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE IF NOT EXISTS SpotifyClone.subscriptions (
    id_subscription INT NOT NULL AUTO_INCREMENT,
    names VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_subscription)
) engine = InnoDB;

INSERT INTO SpotifyClone.subscriptions (names, price)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);


CREATE TABLE IF NOT EXISTS SpotifyClone.performers (
    id_performer INT NOT NULL AUTO_INCREMENT,
    names VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_performer)
) engine = InnoDB;

INSERT INTO SpotifyClone.performers (names)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');


CREATE TABLE IF NOT EXISTS SpotifyClone.users (
    id_users  INT NOT NULL AUTO_INCREMENT,
    names VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    id_subscription INT NOT NULL,
    date_subscription DATE NOT NULL,
    PRIMARY KEY (id_users),
        FOREIGN KEY (id_subscription) REFERENCES SpotifyClone.subscriptions(id_subscription)
) engine = InnoDB;

INSERT INTO SpotifyClone.users (names, age, id_subscription, date_subscription)
VALUES
	('Barbara Liskov', 82, 1, '2019-10-20'),
	('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

CREATE TABLE IF NOT EXISTS SpotifyClone.album (
    id_album INT NOT NULL AUTO_INCREMENT,
    names VARCHAR(200) NOT NULL,
    id_performer INT NOT NULL,
    release_date YEAR NOT NULL,
    PRIMARY KEY (id_album),
      FOREIGN KEY (id_performer) REFERENCES SpotifyClone.performers(id_performer)
) engine = InnoDB;

INSERT INTO SpotifyClone.album (names, id_performer, release_date)
VALUES
	('Renaissance', 1, 2022),
	('Jazz', 2, 1978),
	('Hot Space', 2, 1982),
	('Falso Brilhante', 3, 1998),
	('Vento de Maio', 3, 2001),
	('QVVJFA?', 4, 2003),
	('Somewhere Far Beyond', 5, 2007),
	('I Put A Spell On You', 6, 2012);

CREATE TABLE IF NOT EXISTS SpotifyClone.songs (
    id_songs INT NOT NULL AUTO_INCREMENT,
    names VARCHAR(200) NOT NULL,
    id_album INT NOT NULL,
    duration INT NOT NULL,
    release_date YEAR NOT NULL,
    PRIMARY KEY (id_songs),
     FOREIGN KEY (id_album) REFERENCES SpotifyClone.album(id_album)
) engine = InnoDB;

INSERT INTO SpotifyClone.songs (names, id_album, duration, release_date)
VALUES
	('BREAK MY SOUL', 1, 279, 2022),
	("VIRGO\'S GROOVE", 1, 369, 2022),
	('ALIEN SUPERSTAR', 1, 116, 2022),
	("Don\'t Stop Me Now", 2, 203, 1978),
	('Under Pressure', 3, 152, 1982),
	('Como Nossos Pais', 4, 105, 1998),
	('O Medo de Amar é o Medo de Ser Livre', 5, 207, 2001),
	('Samba em Paris', 6, 267, 2003),
	("The Bard\'s Song", 7, 244, 2007),
	('Feeling Good', 8, 100, 2012);


CREATE TABLE IF NOT EXISTS SpotifyClone.history (
    id_songs INT NOT NULL,
    id_users INT NOT NULL,
    date_played DATETIME NOT NULL,
    PRIMARY KEY (id_songs, id_users),
    UNIQUE (id_users, id_songs, date_played),
     FOREIGN KEY (id_songs) REFERENCES SpotifyClone.songs(id_songs),
     FOREIGN KEY (id_users) REFERENCES SpotifyClone.users(id_users)
) engine = InnoDB;

INSERT INTO SpotifyClone.history (id_songs, id_users, date_played)
VALUES
	(8, 1, '2022-02-28 10:45:55'),
	(2, 1, '2020-05-02 05:30:35'),
	(10, 1, '2020-03-06 11:22:33'),
	(10, 2, '2022-08-05 08:05:17'),
	(7, 2, '2020-01-02 07:40:33'),
	(10, 3, '2020-11-13 16:55:13'),
	(2, 3, '2020-12-05 18:38:30'),
	(8, 4, '2021-08-15 17:10:10'),
	(8, 5, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(7, 6, '2017-01-24 00:31:17'),
	(1, 6, '2017-10-12 12:35:20'),
	(4, 7, '2011-12-15 22:30:49'),
	(4, 8, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(3, 10, '2015-12-13 08:30:22');


CREATE TABLE IF NOT EXISTS SpotifyClone.following_performers (
    id_users INT NOT NULL,
    id_performer INT NOT NULL,
    PRIMARY KEY(id_users, id_performer),
    FOREIGN KEY (id_performer) REFERENCES SpotifyClone.performers(id_performer),
        FOREIGN KEY (id_users) REFERENCES SpotifyClone.users(id_users)
) engine = InnoDB;

INSERT INTO SpotifyClone.following_performers (id_users, id_performer)
VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 1),
	(7, 6),
	(9, 3),
	(10, 2);
