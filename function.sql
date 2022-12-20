-- Виводить імена гравців, бали яких більше або дорівнюють значенню в аргументі 
DROP FUNCTION IF EXISTS check_by_score(float);
CREATE OR REPLACE FUNCTION check_by_score(score_arg float) 
    RETURNS TABLE (player_nickname varchar, player_score float)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        SELECT player_name::varchar, score::float
		FROM players NATURAL JOIN statistic 
		WHERE score >= score_arg;
END;
$$;