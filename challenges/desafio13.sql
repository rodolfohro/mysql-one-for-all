SELECT
    CASE
        WHEN U.age <= 30 THEN 'Até 30 anos'
        WHEN U.age BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
        WHEN U.age > 60 THEN 'Maior de 60 anos'
    END as faixa_etaria,
    COUNT(DISTINCT U.id_users) AS total_pessoas_usuarias,
    COUNT(F.id_songs) AS total_favoritadas
FROM
    SpotifyClone.users AS U
    LEFT JOIN SpotifyClone.favorites AS F ON U.id_users = F.id_users
GROUP BY faixa_etaria
ORDER BY faixa_etaria;