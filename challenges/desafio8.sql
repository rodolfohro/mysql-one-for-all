SELECT
P.names AS artista,
A.names AS album
FROM SpotifyClone.performers AS P
JOIN SpotifyClone.album AS A ON P.id_performer = A.id_performer
WHERE P.names = 'Elis Regina'
ORDER BY album;