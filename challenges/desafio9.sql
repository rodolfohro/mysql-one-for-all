SELECT
    COUNT(H.id_songs) AS musicas_no_historico
FROM SpotifyClone.history H
JOIN SpotifyClone.users U ON H.id_users = U.id_users
WHERE U.names = 'Barbara Liskov';