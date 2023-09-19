SELECT 
P.names AS artista, 
A.names AS album,
COUNT(FA.id_users) AS pessoas_seguidoras
FROM SpotifyClone.performers AS P
JOIN SpotifyClone.album AS A ON A.id_performer = P.id_performer
LEFT JOIN SpotifyClone.following_performers AS FA ON FA.id_performer = P.id_performer
GROUP BY P.id_performer, A.id_album
ORDER BY pessoas_seguidoras DESC, artista, album;