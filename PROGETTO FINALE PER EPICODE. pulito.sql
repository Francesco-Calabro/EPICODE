CREATE DATABASE IF NOT EXISTS elezioni_europee_2019;
USE elezioni_europee_2019;
CREATE TABLE IF NOT EXISTS partiti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);
INSERT INTO partiti (id, nome) VALUES
(1, 'estrema destra'),
(2, 'destra'),
(3, 'centro-destra'),
(4, 'centro'),
(5, 'centro-sinistra'),
(6, 'sinistra'),
(7, 'estrema sinistra')
ON DUPLICATE KEY UPDATE id = id;
CREATE TABLE IF NOT EXISTS primo_partito_elezioni_2019 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    partito_id INT,
    seggi INT,
    FOREIGN KEY (partito_id) REFERENCES partiti(id)
);
INSERT INTO primo_partito_elezioni_2019 (partito_id, seggi) VALUES 
(1, 3),    -- estrema destra
(2, 3),    -- destra
(3, 11),   -- centro-destra
(4, 5),    -- centro
(5, 6),    -- centro-sinistra
(6, 0),    -- sinistra
(7, 0);    -- estrema sinistra

CREATE DATABASE IF NOT EXISTS elezioni_europee_2024;
USE elezioni_europee_2024;

CREATE TABLE IF NOT EXISTS partiti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);
INSERT INTO partiti (id, nome) VALUES
(1, 'estrema destra'),
(2, 'destra'),
(3, 'centro-destra'),
(4, 'centro'),
(5, 'centro-sinistra'),
(6, 'sinistra'),
(7, 'estrema sinistra')
ON DUPLICATE KEY UPDATE id = id;

CREATE TABLE IF NOT EXISTS primo_partito_elezioni_2024 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    partito_id INT,
    seggi INT,
    FOREIGN KEY (partito_id) REFERENCES partiti(id)
);

INSERT INTO primo_partito_elezioni_2024 (partito_id, seggi) VALUES 
(1, 3),    -- estrema destra
(2, 3),    -- destra
(3, 11),    -- centro-destra
(4, 4),    -- centro
(5, 6),    -- centro-sinistra
(6, 0),    -- sinistra
(7, 0);    -- estrema sinistra

USE elezioni_europee_2019;

CREATE TABLE IF NOT EXISTS seggi_parlamento_europeo_2019 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    gruppo VARCHAR(50),
    seggi INT
);

INSERT INTO seggi_parlamento_europeo_2019 (gruppo, seggi) VALUES 
('PPE', 182),
('SED', 154),
('RE', 108),
('VERDI', 74),
('ID', 73),
('ECR', 62),
('GUE', 41),
('NI', 57);

USE elezioni_europee_2024;
CREATE TABLE IF NOT EXISTS seggi_parlamento_europeo_2024 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    gruppo VARCHAR(50),
    seggi INT
);

INSERT INTO seggi_parlamento_europeo_2024 (gruppo, seggi) VALUES 
('PPE', 189),
('SED', 136),
('ECR', 83),
('RE', 74),
('ID', 58),
('VERDI', 51),
('GUE', 39),
('NI', 45),
('ALTRI', 45);

USE elezioni_europee_2019;
CREATE TABLE IF NOT EXISTS gruppi_parlamentari_in_percentuale_del_2019 (
    gruppo VARCHAR(50) PRIMARY KEY,
    seggi INT,
    percentuale DECIMAL(5,2)
);

INSERT INTO gruppi_parlamentari_in_percentuale_del_2019 (gruppo, seggi, percentuale)
VALUES 
    ('PPE', 182, 28.89),
    ('SED', 154, 24.44),
    ('RE', 108, 17.14),
    ('VERDI', 74, 11.75),
    ('ID', 73, 11.59),
    ('ECR', 62, 9.84),
    ('GUE', 41, 6.51),
    ('NI', 57, 9.05);
    
    USE elezioni_europee_2024;
    CREATE TABLE IF NOT EXISTS gruppi_parlamentari_in_percentuale_del_2024 (
    gruppo VARCHAR(50) PRIMARY KEY,
    seggi INT,
    percentuale DECIMAL(5,2)
);

INSERT INTO gruppi_parlamentari_2024 (gruppo, seggi, percentuale) VALUES
    ('PPE', 189, 32.30),
    ('SED', 136, 23.28),
    ('ECR', 83, 14.18),
    ('RE', 74, 12.64),
    ('ID', 58, 9.91),
    ('VERDI', 51, 8.71),
    ('GUE', 39, 6.67),
    ('NI', 45, 7.69),
    ('ALTRI', 45, 7.69);
    
    CREATE DATABASE IF NOT EXISTS analisi_variazioni_equilibri_europei;
    USE analisi_variazioni_equilibri_europei;
    CREATE TABLE IF NOT EXISTS variazioni_seggi_2019_2024 (
    gruppo VARCHAR(50) PRIMARY KEY,
    variazione_percentuale DECIMAL(5,2) NOT NULL
);

INSERT INTO variazioni_seggi_2019_2024 (gruppo, variazione_percentuale) VALUES
    ('PPE', 3.85),
    ('SED', -11.69),
    ('RE', -31.48),
    ('VERDI', -31.08),
    ('ID', -20.55),
    ('ECR', 33.87),
    ('GUE', -4.88),
    ('NI', -21.05),
    ('ALTRI', NULL);
    
    SELECT * FROM variazioni_seggi_2019_2024;
    
    CREATE DATABASE IF NOT EXISTS analisi_variazioni_equilibri_europei;
    USE analisi_variazioni_equilibri_europei;
    
    CREATE TABLE IF NOT EXISTS ripartizione_gruppi_per_appartenenza (
    periodo VARCHAR(10) PRIMARY KEY,
    gruppi_di_destra DECIMAL(5,2),
    gruppi_di_sinistra DECIMAL(5,2),
    centro DECIMAL(5,2),
    non_iscritti DECIMAL(5,2),
    altri DECIMAL(5,2)
);

INSERT INTO ripartizione_gruppi_per_appartenenza (periodo, gruppi_di_destra, gruppi_di_sinistra, centro, non_iscritti, altri) VALUES
    ('2019', 42.14, 35.75, 14,38, 7.59, NULL),
    ('2024', 45.83, 31.39, 10.28, 6.25, 6.25);
    
    SELECT * FROM ripartizione_gruppi_per_appartenenza;
    
    CREATE DATABASE IF NOT EXISTS analisi_variazioni_equilibri_europei;
    USE analisi_variazioni_equilibri_europei;
    
    CREATE TABLE IF NOT EXISTS variazione_appartenenza_politica_tra_2019_e_2024 (
    gruppo_politico VARCHAR(50) PRIMARY KEY,
    variazione_percentuale DECIMAL(5,2)
);

INSERT INTO variazione_appartenenza_politica_tra_2019_e_2024 (gruppo_politico, variazione_percentuale) VALUES
    ('Gruppi di Destra', 8.72),
    ('Gruppi di Sinistra', -12.01),
    ('Centro', -28.55),
    ('Non Iscritti', -17,77),
    ('Altri', NULL);
    
    SELECT * FROM variazione_appartenenza_politica_tra_2019_e_2024;
    
    CREATE DATABASE IF NOT EXISTS analisi_variazioni_equilibri_europei;
    USE analisi_variazioni_equilibri_europei;
    
    CREATE TABLE IF NOT EXISTS variazioni_primo_partito_per_appartenenza (
    gruppo_politico VARCHAR(50) PRIMARY KEY,
    volte_2019 INT,
    volte_2024 INT,
    variazione_percentuale DECIMAL(5,2)
);

INSERT INTO variazioni_primo_partito_per_appartenenza (gruppo_politico, volte_2019, volte_2024, variazione_percentuale) VALUES
    ('Estrema Destra', 3, 3, 0.00),
    ('Destra', 3, 3, 0.00),
    ('Centro Destra', 11, 11, 0.00),
    ('Centro', 5, 4, -20.00),
    ('Centro Sinistra', 6, 6, 0.00),
    ('Sinistra', 0, 0, 0.00),            
    ('Estrema Sinistra', 0, 0, 0.00);
    
    SELECT * FROM variazioni_primo_partito_per_appartenenza;
    
    
    
