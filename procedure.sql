-- Виводить імена гравців з команди, назву якої було введено
DROP PROCEDURE IF EXISTS players_from_team(varchar(50));
CREATE OR REPLACE PROCEDURE players_from_team(team_name_arg varchar(50))
LANGUAGE 'plpgsql'
AS $$
DECLARE record_name players.player_name%TYPE;
DECLARE record_team teams.team_name%TYPE;

BEGIN
    SELECT player_name, team_name INTO record_name, record_team FROM teams 
	NATURAL JOIN players 
	WHERE team_name = team_name_arg;
    RAISE INFO 'Players_name: %,  Team_name: %', TRIM(record_name), TRIM(record_team);
END;
$$;