-- Descomente e altere as linhas abaixo:

CREATE TABLE
    SpotifyClone.favorites(
        favorites_id INTEGER auto_increment PRIMARY KEY NOT NULL,
        id_users INTEGER NOT NULL,
        id_songs INTEGER NOT NULL,
        CONSTRAINT UNIQUE(id_users, id_songs),
        FOREIGN KEY (id_users) REFERENCES SpotifyClone.users (id_users),
        FOREIGN KEY (id_songs) REFERENCES SpotifyClone.songs (id_songs)
    ) engine = InnoDB;

    INSERT INTO
    SpotifyClone.favorites (id_users, id_songs)
VALUES ('1', '3'), ('1', '6'), ('1', '10'), ('2', '4'), ('3', '1'), ('3', '3'), ('4', '7'), ('4', '4'), ('5', '10'), ('5', '2'), ('8', '4'), ('9', '7'), ('10', '3');