-- Під час додавання нових даних до таблиці statistic,
-- в колонку date буде записуватись дата додавання відповідних даних
DROP TRIGGER IF EXISTS date_trigger ON statistic;
DROP FUNCTION IF EXISTS trigger_func;
CREATE OR REPLACE FUNCTION trigger_func() RETURNS trigger 
LANGUAGE 'plpgsql'
as
$$
	begin
		update statistic
		set date = NOW()
		where statistic.stat_id = new.stat_id;
			return null;
	end;
$$;

create trigger date_trigger
after insert on statistic
for each row execute function trigger_func();