SELECT u.names AS pessoa_usuaria,
    CASE WHEN MAX(h.date_played) >= '2021-01-01'
			THEN 'Ativa'
      ELSE 'Inativa'
      END
		AS status_pessoa_usuaria
FROM  SpotifyClone.users AS u 
JOIN SpotifyClone.history AS h ON h.id_users = u.id_users
GROUP BY u.names
ORDER BY pessoa_usuaria;