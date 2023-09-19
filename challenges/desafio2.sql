SELECT
(SELECT COUNT(*) FROM SpotifyClone.songs) AS cancoes ,
(SELECT COUNT(*)  FROM SpotifyClone.performers) AS artistas,
(SELECT COUNT(*)  FROM SpotifyClone.album) AS albuns;