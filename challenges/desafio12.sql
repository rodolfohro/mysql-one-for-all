SELECT
    P.names AS artista,
    CASE
        WHEN COUNT(F.id_songs) >= 5 THEN 'A'
        WHEN COUNT(F.id_songs) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(F.id_songs) BETWEEN 1 AND 2 THEN 'C'
        ELSE '-'
    END AS ranking
FROM
    SpotifyClone.performers AS P
JOIN
    SpotifyClone.album al ON P.id_performer = al.id_performer
JOIN
    SpotifyClone.songs m ON al.id_album = m.id_album
LEFT JOIN
    SpotifyClone.favorites AS  F ON m.id_songs = F.id_songs
GROUP BY
    P.id_performer, P.names
ORDER BY
    COUNT(F.id_songs) DESC, artista ASC;