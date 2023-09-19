SELECT
    S.names AS cancao,
    COUNT(H.id_users) AS reproducoes
FROM SpotifyClone.history H
INNER JOIN SpotifyClone.songs S 
ON H.id_songs = S.id_songs
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;