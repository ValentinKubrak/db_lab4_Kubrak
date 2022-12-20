-- Виклик функції
select * from statistic;
select * from players;
select check_by_score(1.24);

-- Виклик процедури
call players_from_team('Natus Vincere');
select * from players;
select * from teams;

-- Виклкик тригеру
delete from statistic where stat_id = 8;
select * from statistic;
insert into statistic values ('8', '8', '1.21', '01.01.1992')