SELECT
    A.names AS album,
    COUNT(F.id_songs) AS favoritadas
FROM
    SpotifyClone.album AS A
JOIN
    SpotifyClone.songs AS M  ON A.id_album = M.id_album
LEFT JOIN
    SpotifyClone.favorites AS F ON M.id_songs = F.id_songs
GROUP BY
    A.id_album, A.names
ORDER BY
    favoritadas DESC, album ASC
LIMIT 3;