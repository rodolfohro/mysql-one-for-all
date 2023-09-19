SELECT N.names AS pessoa_usuaria,
    COUNT(H.id_songs) AS musicas_ouvidas,
    ROUND(SUM(S.duration) /60, 2) AS total_minutos
FROM SpotifyClone.`history` AS H
INNER JOIN SpotifyClone.`users` AS N
ON H.id_users = N.id_users
INNER JOIN SpotifyClone.songs AS S
ON H.id_songs = S.id_songs
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;