# Mostra configuração atual do padrão de formatação de datas (campo DATE)

SELECT @@lc_time_names;

# Muda o padrão de formatação de datas para o formato brasileiro

SET lc_time_names = pt_br;

# Configura para o formato brasileiro de forma global

SET GLOBAL lc_time_names = pt_br;