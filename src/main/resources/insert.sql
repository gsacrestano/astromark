SET SCHEMA 'astromark';

INSERT INTO school (code, phone_number, address, name, email, school_principal_full_name)
VALUES
    ('SS12345', 1234567890, 'Via Roma 1, 00100 Roma', 'Liceo Scientifico Galileo Galilei', 'galileo@example.com', 'Mario Rossi'),
    ('SS67890', 9876543210, 'Via Milano 2, 20100 Milano', 'Istituto Tecnico Leonardo da Vinci', 'leonardo@example.com', 'Anna Verdi'),
    ('SS11223', 3456789012, 'Via Napoli 3, 80100 Napoli', 'Scuola Media Statale Guglielmo Marconi', 'marconi@example.com', 'Luigi Bianchi');

INSERT INTO school_class (school_code, number, letter, year)
VALUES
    ('SS12345', 3, 'A', 2024),
    ('SS12345', 3, 'B', 2024),
    ('SS12345', 3, 'C', 2024),
    ('SS11223', 1, 'C', 2024),
    ('SS11223', 2, 'B', 2024),
    ('SS67890', 5, 'A', 2024),
    ('SS67890', 5, 'BS', 2024);

INSERT INTO communication (school_class_id, title, description, date)
VALUES
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), 'Incontro con i genitori', 'Comunicazione sull''incontro del prossimo mese.', '2024-11-25'),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), 'Avvio corsi di recupero', 'Comunicazione sull''avvio dei corsi di recupero di matematica.', '2024-12-25'),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), 'Gita Scolastica', 'Informazioni sulla gita a Firenze.', '2025-01-25'),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), 'Assemblea di classe', 'Convocazione per l’assemblea di classe del mese.', '2025-02-01'),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'B' AND year = 2024), 'Distribuzione materiale scolastico', 'Comunicazione sulla distribuzione del materiale per il laboratorio.', '2025-02-05'),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), 'Incontro con esperti', 'Conferenza con esperti sul tema delle energie rinnovabili.', '2025-02-10'),
    ((SELECT id FROM school_class WHERE number = 1 AND letter = 'C' AND year = 2024), 'Prova di evacuazione', 'Comunicazione sulla prova di evacuazione programmata.', '2025-02-15'),
    ((SELECT id FROM school_class WHERE number = 2 AND letter = 'B' AND year = 2024), 'Attività sportiva', 'Partecipazione a una giornata di sport interscolastica.', '2025-02-20'),
    ((SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024), 'Simulazione esame di maturità', 'Programmazione della prima simulazione per l’esame di maturità.', '2025-02-25'),
    ((SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024), 'Progetto PCTO', 'Presentazione del progetto di PCTO per l’anno in corso.', '2025-03-01');

INSERT INTO subject (title)
VALUES
    ('Matematica'),
    ('Fisica'),
    ('Geometria'),
    ('Chimica'),
    ('Italiano'),
    ('Inglese'),
    ('Storia'),
    ('Informatica');

INSERT INTO study_plan (school_class_id, title)
VALUES
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), 'Tradizionale'),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'B' AND year = 2024), 'Tradizionale'),
    ((SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024), 'Musicale'),
    ((SELECT id FROM school_class WHERE number = 1 AND letter = 'C' AND year = 2024), 'Linguistico'),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), 'Linguistico'),
    ((SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024), 'Tradizionale');

INSERT INTO study_plan_subject (subject_title, study_plan_school_class_id)
VALUES
    ('Matematica', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024))),
    ('Fisica', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024))),
    ('Chimica', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024))),
    ('Italiano', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024))),
    ('Inglese', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024))),
    ('Storia', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024))),
    ('Informatica', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024))),
    ('Geometria', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024))),
    ('Italiano', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 1 AND letter = 'C' AND year = 2024))),
    ('Storia', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024))),
    ('Matematica', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024))),
    ('Inglese', (SELECT school_class_id FROM study_plan WHERE school_class_id = (SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024)));

INSERT INTO parent (school_code, username, email, password, name, surname, tax_id, birth_date, residential_address, gender, legal_guardian, pending_state)
VALUES
    ('SS12345', 'paolo.verdi', 'paoloverdi@gmail.com', encode(sha512('Verdi123*'::bytea), 'hex'), 'Paolo', 'Verdi', 'VRDPLA80A01H501X', '1980-01-01', 'Via Firenze 4, Roma', true, false, 'NORMAL'),
    ('SS12345', 'laura.bianchi', 'laurabianchi@gmail.com', encode(sha512('Bianchi123*'::bytea), 'hex'), 'Laura', 'Bianchi', 'BNCLRA85B02G479Y', '1985-02-02', 'Via Torino 5, Roma', false, true, 'NORMAL'),
    ('SS12345', 'giulia.neri', 'giulianeri@gmail.com', encode(sha512('Neri123*'::bytea), 'hex'), 'Giulia', 'Neri', 'NRIGLA70F01A123X', '1970-01-01', 'Via Venezia 3, Roma', false, true, 'NORMAL'),
    ('SS12345', 'paolo.rossi', 'paolorossi@gmail.com', encode(sha512('Rossi123*'::bytea), 'hex'), 'Paolo', 'Rossi', 'RSSPLA75M06A003Y', '1975-06-06', 'Via Firenze 15, Roma', true, true, 'NORMAL'),
    ('SS67890', 'roberto.verdi', 'robertoverdi@gmail.com', encode(sha512('Verdi123*'::bytea), 'hex'), 'Roberto', 'Verdi', 'VRDRBT65M01H345Z', '1965-01-01', 'Via Milano 8, Milano', true, true, 'NORMAL'),
    ('SS67890', 'laura.blui', 'laurablui@gmail.com', encode(sha512('Blui123*'::bytea), 'hex'), 'Laura', 'Blui', 'BLULRA80F08C002Z', '1980-08-08', 'Via Bergamo 7, Milano', false, true, 'NORMAL'),
    ('SS11223', 'anna.neri', 'annaneri@gmail.com', encode(sha512('Neri123*'::bytea), 'hex'), 'Anna', 'Neri', 'NRINNA85F09D003X', '1985-09-09', 'Via Napoli 10, Napoli', false, true, 'NORMAL');

INSERT INTO secretary (school_code, username, email, password, name, surname, tax_id, birth_date, residential_address, gender, pending_state)
VALUES
    ('SS12345', 'anna.rossi', 'anna.rossi@gmail.com', encode(sha512('Rossi123*'::bytea), 'hex'), 'Anna', 'Rossi', 'RSSNNA92F15G345T', '1992-05-15', 'Via Milano 12, Roma', false, 'NORMAL'),
    ('SS12345', 'giorgio.neri', 'giorgio.neri@gmail.com', encode(sha512('Neri123*'::bytea), 'hex'), 'Giorgio', 'Neri', 'NRIGRG90C03F205Z', '1990-03-03', 'Via Venezia 6, Roma', true, 'NORMAL'),
    ('SS67890', 'giacomo.bianchi', 'giacomo.bianchi@gmail.com', encode(sha512('Bianchi123*'::bytea), 'hex'), 'Giacomo', 'Bianchi', 'BNCGCM85M10F678V', '1985-10-10', 'Via Napoli 45, Milano', true, 'NORMAL'),
    ('SS12345', 'laura.verdi', 'laura.verdi@gmail.com', encode(sha512('Verdi123*'::bytea), 'hex'), 'Laura', 'Verdi', 'VRDLRA85F03D890U', '1985-03-03', 'Via Trieste 7, Roma', false, 'NORMAL'),
    ('SS67890', 'mario.neri', 'mario.neri@gmail.com', encode(sha512('Neri123*'::bytea), 'hex'), 'Mario', 'Neri', 'NRIMRA78F03D234X', '1978-03-03', 'Via Trieste 6, Roma', true, 'NORMAL'),
    ('SS11223', 'carla.verdi', 'carla.verdi@gmail.com', encode(sha512('Verdi123*'::bytea), 'hex'), 'Carla', 'Verdi', 'VRDCRL88F20B789U', '1988-02-20', 'Via Torino 7, Napoli', false, 'NORMAL'),
    ('SS11223', 'elena.neri', 'elena.neri@gmail.com', encode(sha512('Neri123*'::bytea), 'hex'), 'Elena', 'Neri', 'NRIELN89F03C567X', '1989-03-03', 'Via Roma 16, Napoli', false, 'NORMAL'),
    ('SS11223', 'luigi.marchi', 'luigi.marchi@gmail.com', encode(sha512('Marchi123*'::bytea), 'hex'), 'Luigi', 'Marchi', 'MRCLGI91M05C890U', '1991-05-15', 'Via Duomo 15, Napoli', true, 'NORMAL'),
    ('SS67890', 'giorgio.rossi', 'giorgio.rossi@gmail.com', encode(sha512('Rossi123*'::bytea), 'hex'), 'Giorgio', 'Rossi', 'RSSGRG78M12F567Y', '1978-12-12', 'Via Trieste 9, Milano', true, 'NORMAL'),
    ('SS67890', 'federica.morandi', 'federica.morandi@gmail.com', encode(sha512('Morandi123*'::bytea), 'hex'), 'Federica', 'Morandi', 'MRDFRC87F18G123X', '1987-11-18', 'Via Dante 5, Milano', false, 'NORMAL'),
    ('SS12345', 'andrea.colombo', 'andrea.colombo@gmail.com', encode(sha512('Colombo123*'::bytea), 'hex'), 'Andrea', 'Colombo', 'CLMNDR83M21C456Z', '1983-09-21', 'Via Veneto 10, Roma', true, 'NORMAL'),
    ('SS11223', 'valentina.gori', 'valentina.gori@gmail.com', encode(sha512('Gori123*'::bytea), 'hex'), 'Valentina', 'Gori', 'GRVNTN85F15B789X', '1985-06-15', 'Via Partenope 9, Napoli', false, 'NORMAL'),
    ('SS12345', 'francesco.moretti', 'francesco.moretti@gmail.com', encode(sha512('Moretti123*'::bytea), 'hex'), 'Francesco', 'Moretti', 'MRTFRC79M05C345V', '1979-10-05', 'Via del Corso 3, Roma', true, 'NORMAL'),
    ('SS11223', 'martina.rosselli', 'martina.rosselli@gmail.com', encode(sha512('Rosselli123*'::bytea), 'hex'), 'Martina', 'Rosselli', 'RSSMRT91F12F678T', '1991-03-12', 'Via San Paolo 8, Napoli', false, 'NORMAL'),
    ('SS67890', 'antonio.mazzoni', 'antonio.mazzoni@gmail.com', encode(sha512('Mazzoni123*'::bytea), 'hex'), 'Antonio', 'Mazzoni', 'MZZNTN77M02D890Y', '1977-05-02', 'Via Torino 20, Milano', true, 'NORMAL'),
    ('SS67890', 'luisa.benedetti', 'luisa.benedetti@gmail.com', encode(sha512('Benedetti123*'::bytea), 'hex'), 'Luisa', 'Benedetti', 'BNDLUA88F01C567W', '1988-01-01', 'Via Milano 18, Milano', false, 'NORMAL'),
    ('SS11223', 'silvia.rinaldi', 'silvia.rinaldi@gmail.com', encode(sha512('Rinaldi123*'::bytea), 'hex'), 'Silvia', 'Rinaldi', 'RNLVLA86F23F123X', '1986-08-23', 'Via Toledo 11, Napoli', false, 'NORMAL'),
    ('SS12345', 'alessandro.ricci', 'alessandro.ricci@gmail.com', encode(sha512('Ricci123*'::bytea), 'hex'), 'Alessandro', 'Ricci', 'RCCLSS81M14C567X', '1981-11-14', 'Via Appia 2, Roma', true, 'NORMAL'),
    ('SS12345', 'chiara.bianchi', 'chiara.bianchi@gmail.com', encode(sha512('Bianchi123*'::bytea), 'hex'), 'Chiara', 'Bianchi', 'BNCCRA87F10B123V', '1987-12-10', 'Via Veneto 5, Roma', false, 'NORMAL'),
    ('SS67890', 'luca.verdi', 'luca.verdi@gmail.com', encode(sha512('Verdi123*'::bytea), 'hex'), 'Luca', 'Verdi', 'VRDLCA85M22F678T', '1985-09-22', 'Via Manzoni 6, Milano', true, 'NORMAL'),
    ('SS67890', 'ilaria.marchesi', 'ilaria.marchesi@gmail.com', encode(sha512('Marchesi123*'::bytea), 'hex'), 'Ilaria', 'Marchesi', 'MCHILR84F07C890Y', '1984-06-07', 'Via Dante 8, Milano', false, 'NORMAL'),
    ('SS11223', 'simone.gentile', 'simone.gentile@gmail.com', encode(sha512('Gentile123*'::bytea), 'hex'), 'Simone', 'Gentile', 'GNTSMN83M15B456W', '1983-02-15', 'Via Toledo 9, Napoli', true, 'NORMAL'),
    ('SS11223', 'francesca.fontana', 'francesca.fontana@gmail.com', encode(sha512('Fontana123*'::bytea), 'hex'), 'Francesca', 'Fontana', 'FNTFNC90F04F789X', '1990-03-04', 'Via Riviera 12, Napoli', false, 'NORMAL'),
    ('SS12345', 'giorgia.monti', 'giorgia.monti@gmail.com', encode(sha512('Monti123*'::bytea), 'hex'), 'Giorgia', 'Monti', 'MNTGRG89F20D567T', '1989-07-20', 'Via Aurelia 10, Roma', false, 'NORMAL'),
    ('SS12345', 'davide.ruggeri', 'davide.ruggeri@gmail.com', encode(sha512('Ruggeri123*'::bytea), 'hex'), 'Davide', 'Ruggeri', 'RGRDVD82M12C678Y', '1982-05-12', 'Via Condotti 15, Roma', true, 'NORMAL'),
    ('SS67890', 'paola.colombo', 'paola.colombo@gmail.com', encode(sha512('Colombo123*'::bytea), 'hex'), 'Paola', 'Colombo', 'CLMPAA85F08G345Z', '1985-02-08', 'Via Vittorio 18, Milano', false, 'NORMAL'),
    ('SS67890', 'antonio.moretti', 'antonio.moretti@gmail.com', encode(sha512('Moretti123*'::bytea), 'hex'), 'Antonio', 'Moretti', 'MRTANT80M03H123X', '1980-11-03', 'Via Torino 11, Milano', true, 'NORMAL'),
    ('SS11223', 'roberta.mancini', 'roberta.mancini@gmail.com', encode(sha512('Mancini123*'::bytea), 'hex'), 'Roberta', 'Mancini', 'MNCBRT86F01C890V', '1986-01-01', 'Via San Paolo 3, Napoli', false, 'NORMAL'),
    ('SS11223', 'claudio.rinaldi', 'claudio.rinaldi@gmail.com', encode(sha512('Rinaldi123*'::bytea), 'hex'), 'Claudio', 'Rinaldi', 'RNLCLD78M09F567W', '1978-08-09', 'Via Duomo 7, Napoli', true, 'NORMAL'),
    ('SS12345', 'federica.lombardi', 'federica.lombardi@gmail.com', encode(sha512('Lombardi123*'::bytea), 'hex'), 'Federica', 'Lombardi', 'LMBFRC83F14B123Y', '1983-07-14', 'Via Appia 18, Roma', false, 'NORMAL'),
    ('SS12345', 'luca.marini', 'luca.marini@gmail.com', encode(sha512('Marini123*'::bytea), 'hex'), 'Luca', 'Marini', 'MRNLCA81M20F678Z', '1981-04-20', 'Via Genova 8, Roma', true, 'NORMAL'),
    ('SS67890', 'chiara.ferrari', 'chiara.ferrari@gmail.com', encode(sha512('Ferrari123*'::bytea), 'hex'), 'Chiara', 'Ferrari', 'FRRCRA90F15G234X', '1990-12-15', 'Via Milano 10, Milano', false, 'NORMAL'),
    ('SS67890', 'valerio.benedetti', 'valerio.benedetti@gmail.com', encode(sha512('Benedetti123*'::bytea), 'hex'), 'Valerio', 'Benedetti', 'BNDVLR79M07H890T', '1979-05-07', 'Via Dante 3, Milano', true, 'NORMAL'),
    ('SS11223', 'sara.marchesi', 'sara.marchesi@gmail.com', encode(sha512('Marchesi123*'::bytea), 'hex'), 'Sara', 'Marchesi', 'MCHSRA85F19D123W', '1985-06-19', 'Via Napoli 14, Napoli', false, 'NORMAL'),
    ('SS11223', 'giulia.mazza', 'giulia.mazza@gmail.com', encode(sha512('Mazza123*'::bytea), 'hex'), 'Giulia', 'Mazza', 'MZZGLA87F22C789Y', '1987-08-22', 'Via San Paolo 6, Napoli', false, 'NORMAL'),
    ('SS12345', 'matteo.gori', 'matteo.gori@gmail.com', encode(sha512('Gori123*'::bytea), 'hex'), 'Matteo', 'Gori', 'GRMTTO89M18C678V', '1989-10-18', 'Via Veneto 15, Roma', true, 'NORMAL');

INSERT INTO teacher (school_code, username, email, password, name, surname, tax_id, birth_date, residential_address, gender, pending_state)
VALUES
    ('SS12345', 'marco.gialli', 'marco.gialli@gmail.com', encode(sha512('Gialli123*'::bytea), 'hex'), 'Marco', 'Gialli', 'GLLMRC75D04H703W', '1975-04-04', 'Via Genova 7, Roma', true, 'NORMAL'),
    ('SS12345', 'alessandro.rossi', 'alessandro.rossi@gmail.com', encode(sha512('Rossi123*'::bytea), 'hex'), 'Alessandro', 'Rossi', 'RSSALN80A01H501X', '1980-01-01', 'Via Firenze 20, Roma', true, 'NORMAL'),
    ('SS12345', 'maria.bianchi', 'maria.bianchi@gmail.com', encode(sha512('Bianchi123*'::bytea), 'hex'), 'Maria', 'Bianchi', 'BNCMRA85B02G479Y', '1985-02-02', 'Via Torino 25, Roma', false, 'NORMAL'),
    ('SS67890', 'elena.blui', 'elena.blui@gmail.com', encode(sha512('Blui123*'::bytea), 'hex'), 'Elena', 'Blui', 'BLELNA82E05Z112V', '1982-05-05', 'Via Palermo 8, Milano', false, 'NORMAL'),
    ('SS12345', 'riccardo.blui', 'riccardo.blui@gmail.com', encode(sha512('Blui123*'::bytea), 'hex'), 'Riccardo', 'Blui', 'BLURCD78E04G111W', '1978-04-04', 'Via Palermo 6, Milano', true, 'NORMAL'),
    ('SS12345', 'elisa.gialli', 'elisa.gialli@gmail.com', encode(sha512('Gialli123*'::bytea), 'hex'), 'Elisa', 'Gialli', 'GLLSFA82F01B890T', '1982-01-01', 'Via Firenze 1, Roma', false, 'NORMAL'),
    ('SS67890', 'anna.blui', 'anna.blui@gmail.com', encode(sha512('Blui123*'::bytea), 'hex'), 'Anna', 'Blui', 'BLUANN70M03F456T', '1970-03-03', 'Via Milano 10, Milano', false, 'NORMAL'),
    ('SS12345', 'giorgio.verdi', 'giorgio.verdi@gmail.com', encode(sha512('Verdi123*'::bytea), 'hex'), 'Giorgio', 'Verdi', 'VRDGRG85M15H703Z', '1985-05-15', 'Via Napoli 10, Roma', true, 'NORMAL'),
    ('SS12345', 'laura.bianchi', 'laura.bianchi@gmail.com', encode(sha512('Bianchi123*'::bytea), 'hex'), 'Laura', 'Bianchi', 'BNCGLA88F20L567X', '1988-02-20', 'Via Milano 25, Roma', false, 'NORMAL'),
    ('SS67890', 'andrea.rossi', 'andrea.rossi@gmail.com', encode(sha512('Rossi123*'::bytea), 'hex'), 'Andrea', 'Rossi', 'RSSADR90M10Z889V', '1990-10-10', 'Via Venezia 15, Milano', true, 'NORMAL'),
    ('SS67890', 'sara.morandi', 'sara.morandi@gmail.com', encode(sha512('Morandi123*'::bytea), 'hex'), 'Sara', 'Morandi', 'MRDSRA87F05H123X', '1987-05-05', 'Via Genova 8, Milano', false, 'NORMAL'),
    ('SS11223', 'mario.neri', 'mario.neri@gmail.com', encode(sha512('Neri123*'::bytea), 'hex'), 'Mario', 'Neri', 'NRIMRO80M12N789Y', '1980-12-12', 'Via Firenze 22, Napoli', true, 'NORMAL'),
    ('SS11223', 'giulia.sala', 'giulia.sala@gmail.com', encode(sha512('Sala123*'::bytea), 'hex'), 'Giulia', 'Sala', 'SLAGLA92F18C456W', '1992-08-18', 'Via Roma 16, Napoli', false, 'NORMAL'),
    ('SS11223', 'valerio.rossi', 'valerio.rossi@gmail.com', encode(sha512('Valerio123*'::bytea), 'hex'), 'Valerio', 'Rossi', 'RSSVLR78M09N345Z', '1978-09-09', 'Via Napoli 30, Napoli', true, 'NORMAL'),
    ('SS12345', 'filippo.marchesi', 'filippo.marchesi@gmail.com', encode(sha512('Marchesi123*'::bytea), 'hex'), 'Filippo', 'Marchesi', 'MCHFPP85M15H703Z', '1985-05-15', 'Via Trieste 10, Roma', true, 'NORMAL'),
    ('SS12345', 'marta.ferrari', 'marta.ferrari@gmail.com', encode(sha512('Ferrari123*'::bytea), 'hex'), 'Marta', 'Ferrari', 'FRRMRT90F10H567X', '1990-10-10', 'Via Genova 12, Roma', false, 'NORMAL'),
    ('SS12345', 'davide.lombardi', 'davide.lombardi@gmail.com', encode(sha512('Lombardi123*'::bytea), 'hex'), 'Davide', 'Lombardi', 'LMBDVD78M20G456V', '1978-03-20', 'Via Napoli 15, Roma', true, 'NORMAL'),
    ('SS67890', 'paola.rinaldi', 'paola.rinaldi@gmail.com', encode(sha512('Rinaldi123*'::bytea), 'hex'), 'Paola', 'Rinaldi', 'RNLPLA87F08F890T', '1987-08-08', 'Via Milano 22, Milano', false, 'NORMAL'),
    ('SS67890', 'carlo.fabbri', 'carlo.fabbri@gmail.com', encode(sha512('Fabbri123*'::bytea), 'hex'), 'Carlo', 'Fabbri', 'FBBCLR82M05N111W', '1982-05-05', 'Via Palermo 10, Milano', true, 'NORMAL'),
    ('SS67890', 'luca.damiani', 'luca.damiani@gmail.com', encode(sha512('Damiani123*'::bytea), 'hex'), 'Luca', 'Damiani', 'DMLLCA90M12A123X', '1990-12-12', 'Via Venezia 6, Milano', true, 'NORMAL'),
    ('SS11223', 'simona.mazzoni', 'simona.mazzoni@gmail.com', encode(sha512('Mazzoni123*'::bytea), 'hex'), 'Simona', 'Mazzoni', 'MZZSMN75F30H678T', '1975-01-30', 'Via Firenze 20, Napoli', false, 'NORMAL'),
    ('SS11223', 'giovanni.conti', 'giovanni.conti@gmail.com', encode(sha512('Conti123*'::bytea), 'hex'), 'Giovanni', 'Conti', 'CNTGVN80M18C345Y', '1980-01-18', 'Via Roma 5, Napoli', true, 'NORMAL'),
    ('SS11223', 'valentina.ruggeri', 'valentina.ruggeri@gmail.com', encode(sha512('Ruggeri123*'::bytea), 'hex'), 'Valentina', 'Ruggeri', 'RGRVLN88F22N678X', '1988-06-22', 'Via Napoli 25, Napoli', false, 'NORMAL'),
    ('SS11223', 'antonio.mancini', 'antonio.mancini@gmail.com', encode(sha512('Mancini123*'::bytea), 'hex'), 'Antonio', 'Mancini', 'MNCNTN78M17F999V', '1978-03-17', 'Via Trieste 8, Napoli', true, 'NORMAL'),
    ('SS12345', 'giulia.martini', 'giulia.martini@gmail.com', encode(sha512('Martini123*'::bytea), 'hex'), 'Giulia', 'Martini', 'MRTGLI85F14C789X', '1985-03-14', 'Via del Corso 12, Roma', false, 'NORMAL'),
    ('SS12345', 'federico.rosselli', 'federico.rosselli@gmail.com', encode(sha512('Rosselli123*'::bytea), 'hex'), 'Federico', 'Rosselli', 'RSSFRC82M21L678T', '1982-07-21', 'Via Aurelia 5, Roma', true, 'NORMAL'),
    ('SS12345', 'sara.gallini', 'sara.gallini@gmail.com', encode(sha512('Gallini123*'::bytea), 'hex'), 'Sara', 'Gallini', 'GLLSRA88F09H111Z', '1988-05-09', 'Via Veneto 18, Roma', false, 'NORMAL'),
    ('SS67890', 'paolo.benedetti', 'paolo.benedetti@gmail.com', encode(sha512('Benedetti123*'::bytea), 'hex'), 'Paolo', 'Benedetti', 'BNDPLO80M18G234W', '1980-02-18', 'Via Torino 15, Milano', true, 'NORMAL'),
    ('SS67890', 'antonella.marini', 'antonella.marini@gmail.com', encode(sha512('Marini123*'::bytea), 'hex'), 'Antonella', 'Marini', 'MRNNTL79F14F567V', '1979-09-14', 'Via Manzoni 9, Milano', false, 'NORMAL'),
    ('SS67890', 'giacomo.monti', 'giacomo.monti@gmail.com', encode(sha512('Monti123*'::bytea), 'hex'), 'Giacomo', 'Monti', 'MNTGCM87M22H345X', '1987-08-22', 'Via Roma 10, Milano', true, 'NORMAL'),
    ('SS67890', 'elisa.ruggeri', 'elisa.ruggeri@gmail.com', encode(sha512('Ruggeri123*'::bytea), 'hex'), 'Elisa', 'Ruggeri', 'RGRELS90F11B678Y', '1990-11-11', 'Via Dante 8, Milano', false, 'NORMAL'),
    ('SS11223', 'claudio.gentile', 'claudio.gentile@gmail.com', encode(sha512('Gentile123*'::bytea), 'hex'), 'Claudio', 'Gentile', 'GNTCLD81M08C456W', '1981-03-08', 'Via Mazzini 7, Napoli', true, 'NORMAL'),
    ('SS11223', 'ilaria.colombo', 'ilaria.colombo@gmail.com', encode(sha512('Colombo123*'::bytea), 'hex'), 'Ilaria', 'Colombo', 'CLMILR85F25G789V', '1985-12-25', 'Via Caracciolo 20, Napoli', false, 'NORMAL'),
    ('SS11223', 'simone.romano', 'simone.romano@gmail.com', encode(sha512('Romano123*'::bytea), 'hex'), 'Simone', 'Romano', 'RMNSMN89M19D123X', '1989-06-19', 'Via Toledo 5, Napoli', true, 'NORMAL'),
    ('SS11223', 'margherita.damiani', 'margherita.damiani@gmail.com', encode(sha512('Damiani123*'::bytea), 'hex'), 'Margherita', 'Damiani', 'DMNMRG82F14F890T', '1982-03-14', 'Via Chiaia 6, Napoli', false, 'NORMAL'),
    ('SS11223', 'francesco.fontana', 'francesco.fontana@gmail.com', encode(sha512('Fontana123*'::bytea), 'hex'), 'Francesco', 'Fontana', 'FNTFNC83M16G456Z', '1983-07-16', 'Via Napoli 30, Napoli', true, 'NORMAL'),
    ('SS12345', 'alessia.coppola', 'alessia.coppola@gmail.com', encode(sha512('Coppola123*'::bytea), 'hex'), 'Alessia', 'Coppola', 'CPPLLS90F11C123X', '1990-11-11', 'Via Condotti 3, Roma', false, 'NORMAL'),
    ('SS12345', 'lorenzo.ricci', 'lorenzo.ricci@gmail.com', encode(sha512('Ricci123*'::bytea), 'hex'), 'Lorenzo', 'Ricci', 'RCCLRZ79M09B890Y', '1979-05-09', 'Via Appia 12, Roma', true, 'NORMAL'),
    ('SS12345', 'chiara.barone', 'chiara.barone@gmail.com', encode(sha512('Barone123*'::bytea), 'hex'), 'Chiara', 'Barone', 'BRNCHR88F07C789T', '1988-04-07', 'Via Trastevere 11, Roma', false, 'NORMAL'),
    ('SS67890', 'valerio.moretti', 'valerio.moretti@gmail.com', encode(sha512('Moretti123*'::bytea), 'hex'), 'Valerio', 'Moretti', 'MRTVLR84M05F345Z', '1984-12-05', 'Via Milano 14, Milano', true, 'NORMAL'),
    ('SS67890', 'matteo.gori', 'matteo.gori@gmail.com', encode(sha512('Gori123*'::bytea), 'hex'), 'Matteo', 'Gori', 'GRMTT81M14H567X', '1981-11-14', 'Via Manzoni 17, Milano', true, 'NORMAL'),
    ('SS67890', 'andrea.fiorentino', 'andrea.fiorentino@gmail.com', encode(sha512('Fiorentino123*'::bytea), 'hex'), 'Andrea', 'Fiorentino', 'FRNAND86M01H234W', '1986-07-01', 'Via Vittorio 8, Milano', true, 'NORMAL'),
    ('SS11223', 'giuseppe.mazza', 'giuseppe.mazza@gmail.com', encode(sha512('Mazza123*'::bytea), 'hex'), 'Giuseppe', 'Mazza', 'MZZGPS78M13C890V', '1978-08-13', 'Via Napoli 9, Napoli', true, 'NORMAL'),
    ('SS11223', 'roberta.farina', 'roberta.farina@gmail.com', encode(sha512('Farina123*'::bytea), 'hex'), 'Roberta', 'Farina', 'FRNRBT84F10F123X', '1984-05-10', 'Via Riviera 18, Napoli', false, 'NORMAL');

INSERT INTO teacher_class (teacher_id, school_class_id, coordinator)
VALUES
    ((SELECT id FROM teacher WHERE username = 'marco.gialli'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'marco.gialli'), (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'alessandro.rossi'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'maria.bianchi'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'elena.blui'), (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'riccardo.blui'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'elisa.gialli'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'anna.blui'), (SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'giorgio.verdi'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'B' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'laura.bianchi'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'B' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'andrea.rossi'), (SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'sara.morandi'), (SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'mario.neri'), (SELECT id FROM school_class WHERE number = 1 AND letter = 'C' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'giulia.sala'), (SELECT id FROM school_class WHERE number = 1 AND letter = 'C' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'valerio.rossi'), (SELECT id FROM school_class WHERE number = 2 AND letter = 'B' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'filippo.marchesi'), (SELECT id FROM school_class WHERE number = 2 AND letter = 'B' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'marta.ferrari'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'davide.lombardi'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'paola.rinaldi'), (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'carlo.fabbri'), (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'simona.mazzoni'), (SELECT id FROM school_class WHERE number = 1 AND letter = 'C' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'giovanni.conti'), (SELECT id FROM school_class WHERE number = 1 AND letter = 'C' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'valentina.ruggeri'), (SELECT id FROM school_class WHERE number = 2 AND letter = 'B' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'antonio.mancini'), (SELECT id FROM school_class WHERE number = 2 AND letter = 'B' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'giulia.martini'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'federico.rosselli'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'sara.gallini'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'B' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'paolo.benedetti'), (SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'antonella.marini'), (SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'giacomo.monti'), (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'elisa.ruggeri'), (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'claudio.gentile'), (SELECT id FROM school_class WHERE number = 2 AND letter = 'B' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'ilaria.colombo'), (SELECT id FROM school_class WHERE number = 1 AND letter = 'C' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'simone.romano'), (SELECT id FROM school_class WHERE number = 1 AND letter = 'C' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'margherita.damiani'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'francesco.fontana'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'alessia.coppola'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), false),
    ((SELECT id FROM teacher WHERE username = 'lorenzo.ricci'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'B' AND year = 2024), true),
    ((SELECT id FROM teacher WHERE username = 'chiara.barone'), (SELECT id FROM school_class WHERE number = 3 AND letter = 'B' AND year = 2024), false);

INSERT INTO teaching (subject_title, teacher_id, type_of_activity)
VALUES
    ('Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli'), 'Lezione'),
    ('Geometria', (SELECT id FROM teacher WHERE username = 'marco.gialli'), 'Lezione'),
    ('Fisica', (SELECT id FROM teacher WHERE username = 'alessandro.rossi'), 'Lezione'),
    ('Chimica', (SELECT id FROM teacher WHERE username = 'maria.bianchi'), 'Laboratorio'),
    ('Informatica', (SELECT id FROM teacher WHERE username = 'elena.blui'), 'Laboratorio'),
    ('Storia', (SELECT id FROM teacher WHERE username = 'riccardo.blui'), 'Lezione'),
    ('Italiano', (SELECT id FROM teacher WHERE username = 'elisa.gialli'), 'Lezione'),
    ('Inglese', (SELECT id FROM teacher WHERE username = 'anna.blui'), 'Lezione'),
    ('Storia', (SELECT id FROM teacher WHERE username = 'matteo.gori'), 'Lezione'),
    ('Matematica', (SELECT id FROM teacher WHERE username = 'luca.damiani'), 'Lezione'),
    ('Geometria', (SELECT id FROM teacher WHERE username = 'luca.damiani'), 'Lezione'),
    ('Fisica', (SELECT id FROM teacher WHERE username = 'andrea.rossi'), 'Lezione'),
    ('Chimica', (SELECT id FROM teacher WHERE username = 'antonella.marini'), 'Laboratorio'),
    ('Italiano', (SELECT id FROM teacher WHERE username = 'valerio.moretti'), 'Lezione'),
    ('Inglese', (SELECT id FROM teacher WHERE username = 'andrea.fiorentino'), 'Lezione'),
    ('Storia', (SELECT id FROM teacher WHERE username = 'francesco.fontana'), 'Lezione'),
    ('Matematica', (SELECT id FROM teacher WHERE username = 'antonio.mancini'), 'Lezione'),
    ('Italiano', (SELECT id FROM teacher WHERE username = 'marta.ferrari'), 'Lezione'),
    ('Inglese', (SELECT id FROM teacher WHERE username = 'valentina.ruggeri'), 'Lezione'),
    ('Matematica', (SELECT id FROM teacher WHERE username = 'mario.neri'), 'Lezione'),
    ('Fisica', (SELECT id FROM teacher WHERE username = 'davide.lombardi'), 'Lezione'),
    ('Italiano', (SELECT id FROM teacher WHERE username = 'chiara.barone'), 'Lezione'),
    ('Inglese', (SELECT id FROM teacher WHERE username = 'sara.gallini'), 'Lezione'),
    ('Storia', (SELECT id FROM teacher WHERE username = 'paolo.benedetti'), 'Lezione'),
    ('Matematica', (SELECT id FROM teacher WHERE username = 'paola.rinaldi'), 'Lezione'),
    ('Geometria', (SELECT id FROM teacher WHERE username = 'carlo.fabbri'), 'Lezione'),
    ('Italiano', (SELECT id FROM teacher WHERE username = 'elisa.ruggeri'), 'Lezione'),
    ('Inglese', (SELECT id FROM teacher WHERE username = 'giacomo.monti'), 'Lezione'),
    ('Storia', (SELECT id FROM teacher WHERE username = 'giovanni.conti'), 'Lezione'),
    ('Italiano', (SELECT id FROM teacher WHERE username = 'simona.mazzoni'), 'Lezione'),
    ('Inglese', (SELECT id FROM teacher WHERE username = 'giulia.sala'), 'Lezione'),
    ('Matematica', (SELECT id FROM teacher WHERE username = 'giorgio.verdi'), 'Lezione'),
    ('Geometria', (SELECT id FROM teacher WHERE username = 'giorgio.verdi'), 'Lezione');

INSERT INTO student (school_code, username, email, password, name, surname, tax_id, birth_date, residential_address, gender, pending_state)
VALUES
    ('SS12345', 'pluto.pippo', 'pluto.pippo@gmail.com', encode(sha512('Pluto123!'::bytea), 'hex'), 'Marco', 'Neri', 'PRIMRC10G06Z404T', '2010-06-06', 'Via Venezia 3, Roma', true, 'NORMAL'),
    ('SS12345', 'pl.pi', 'pl.pi@gmail.com', encode(sha512('Pluto123!'::bytea), 'hex'), 'Marco', 'Neri', 'PRIMRC10G36Z404T', '2010-06-06', 'Via Venezia 3, Roma', true, 'NORMAL'),
    ('SS12345', 'pluton.paperino', 'pluton.paperino@gmail.com', encode(sha512('Pluto123!'::bytea), 'hex'), 'Marco', 'Neri', 'PRIMRC10L06Z404T', '2010-06-06', 'Via Venezia 3, Roma', true, 'NORMAL'),
    ('SS12345', 'marco.neri', 'marco.neri@gmail.com', encode(sha512('Neri123*'::bytea), 'hex'), 'Marco', 'Neri', 'NRIMRC10G06Z404T', '2010-06-06', 'Via Venezia 3, Roma', true, 'NORMAL'),
    ('SS12345', 'luca.verdi', 'luca.verdi@gmail.com', encode(sha512('Verdi123*'::bytea), 'hex'), 'Luca', 'Verdi', 'VRDLCA08F06I123U', '2008-06-06', 'Via Firenze 4, Roma', true, 'NORMAL'),
    ('SS12345', 'sofia.bianchi', 'sofia.bianchi@gmail.com', encode(sha512('Bianchi123*'::bytea), 'hex'), 'Sofia', 'Bianchi', 'BNCSFA09L47Z404T', '2009-07-07', 'Via Torino 5, Roma', false, 'NORMAL'),
    ('SS12345', 'giulia.rossi', 'giulia.rossi@gmail.com', encode(sha512('Rossi123*'::bytea), 'hex'), 'Giulia', 'Rossi', 'RSSGLA10F06A002X', '2010-06-06', 'Via Firenze 15, Roma', false, 'NORMAL'),
    ('SS67890', 'elisa.verdi', 'elisa.verdi@gmail.com', encode(sha512('Verdi123*'::bytea), 'hex'), 'Elisa', 'Verdi', 'VRDLSE11F07B002Z', '2011-07-07', 'Via Milano 8, Milano', false, 'NORMAL'),
    ('SS67890', 'franco.blui', 'franco.blui@gmail.com', encode(sha512('Blui123*'::bytea), 'hex'), 'Franco', 'Blui', 'BLUFNC12M08C001Y', '2012-08-08', 'Via Bergamo 7, Milano', true, 'NORMAL'),
    ('SS11223', 'chiara.neri', 'chiara.neri@gmail.com', encode(sha512('Neri123*'::bytea), 'hex'), 'Chiara', 'Neri', 'NRICHR13F09D001Z', '2013-09-09', 'Via Napoli 10, Napoli', false, 'NORMAL'),
    ('SS12345', 'alessia.caputo', 'alessia.caputo@gmail.com', encode(sha512('Caputo123!'::bytea), 'hex'), 'Alessia', 'Caputo', 'CPTALS09F06R015Y', '2009-06-06', 'Via Nazionale 6, Roma', false, 'NORMAL'),
    ('SS67890', 'lorenzo.costa', 'lorenzo.costa@gmail.com', encode(sha512('Costa123!'::bytea), 'hex'), 'Lorenzo', 'Costa', 'CSTLRN11M08S016T', '2011-08-08', 'Via Milano 8, Milano', true, 'NORMAL'),
    ('SS11223', 'michele.pellegrini', 'michele.pellegrini@gmail.com', encode(sha512('Pellegrini123!'::bytea), 'hex'), 'Michele', 'Pellegrini', 'PLLMLC12M09T017U', '2012-09-09', 'Via Mergellina 10, Napoli', true, 'NORMAL'),
    ('SS12345', 'giada.vitali', 'giada.vitali@gmail.com', encode(sha512('Vitali123!'::bytea), 'hex'), 'Giada', 'Vitali', 'VTLGDA09F10U018V', '2009-10-10', 'Via Appia 1, Roma', false, 'NORMAL'),
    ('SS12345', 'matteo.romano', 'matteo.romano@gmail.com', encode(sha512('Romano123!'::bytea), 'hex'), 'Matteo', 'Romano', 'RMMMTT13M11V019Z', '2013-11-11', 'Via del Corso 8, Roma', true, 'NORMAL'),
    ('SS11223', 'valentina.mancini', 'valentina.mancini@gmail.com', encode(sha512('Mancini123!'::bytea), 'hex'), 'Valentina', 'Mancini', 'MNCVLE12F10M010Z', '2012-10-10', 'Via Duomo 3, Napoli', false, 'NORMAL'),
    ('SS12345', 'matteo.fontana', 'matteo.fontana@gmail.com', encode(sha512('Fontana123!'::bytea), 'hex'), 'Matteo', 'Fontana', 'FNTMTT13M11N011V', '2013-11-11', 'Via del Corso 4, Roma', true, 'NORMAL'),
    ('SS12345', 'sofia.russo', 'sofia.russo@gmail.com', encode(sha512('Russo123!'::bytea), 'hex'), 'Sofia', 'Russo', 'RSSSFA10F12O012T', '2010-12-12', 'Via Nazionale 3, Roma', false, 'NORMAL'),
    ('SS67890', 'elisa.gallo', 'elisa.gallo@gmail.com', encode(sha512('Gallo123!'::bytea), 'hex'), 'Elisa', 'Gallo', 'GLLSSE11F07P013U', '2011-07-07', 'Via Bergamo 2, Milano', false, 'NORMAL'),
    ('SS11223', 'davide.marino', 'davide.marino@gmail.com', encode(sha512('Marino123!'::bytea), 'hex'), 'Davide', 'Marino', 'MRNDVD14M08Q014X', '2014-08-08', 'Via Toledo 7, Napoli', true, 'NORMAL'),
    ('SS11223', 'giovanni.ferrari', 'giovanni.ferrari@gmail.com', encode(sha512('Ferrari123!'::bytea), 'hex'), 'Giovanni', 'Ferrari', 'FRRGVN14M12G006U', '2014-12-12', 'Via Mergellina 8, Napoli', true, 'NORMAL'),
    ('SS12345', 'chiara.morini', 'chiara.morini@gmail.com', encode(sha512('Morini123!'::bytea), 'hex'), 'Chiara', 'Morini', 'MRNCHR10F07H007X', '2010-07-07', 'Via Veneto 5, Roma', false, 'NORMAL'),
    ('SS12345', 'andrea.giusti', 'andrea.giusti@gmail.com', encode(sha512('Giusti123!'::bytea), 'hex'), 'Andrea', 'Giusti', 'GSTAND09M08I008T', '2009-08-08', 'Via Appia 2, Roma', true, 'NORMAL'),
    ('SS67890', 'alessandro.rinaldi', 'alessandro.rinaldi@gmail.com', encode(sha512('Rinaldi123!'::bytea), 'hex'), 'Alessandro', 'Rinaldi', 'RNLALE11M09L009Y', '2011-09-09', 'Via Torino 6, Milano', true, 'NORMAL'),
    ('SS12345', 'gianluigi.donnarumma', 'gianluigi.donnarumma@gmail.com', encode(sha512('Donnarumma123*'::bytea), 'hex'), 'Gianluigi', 'Donnarumma', 'DNNGLG06M25B123X', '2006-02-25', 'Via Napoli 10, Roma', true, 'NORMAL'),
    ('SS12345', 'alessandro.bastoni', 'alessandro.bastoni@gmail.com', encode(sha512('Bastoni123*'::bytea), 'hex'), 'Alessandro', 'Bastoni', 'BSTALS07M13D456Z', '2007-01-13', 'Via Milano 8, Roma', true, 'NORMAL'),
    ('SS12345', 'federico.chiesa', 'federico.chiesa@gmail.com', encode(sha512('Chiesa123*'::bytea), 'hex'), 'Federico', 'Chiesa', 'CHSFDR08M24C123U', '2008-10-24', 'Via Torino 6, Roma', true, 'NORMAL'),
    ('SS12345', 'lorenzo.insigne', 'lorenzo.insigne@gmail.com', encode(sha512('Insigne123*'::bytea), 'hex'), 'Lorenzo', 'Insigne', 'NSGLRN08M04E678Y', '2008-06-04', 'Via Firenze 7, Roma', true, 'NORMAL'),
    ('SS12345', 'ciro.immobile', 'ciro.immobile@gmail.com', encode(sha512('Immobile123*'::bytea), 'hex'), 'Ciro', 'Immobile', 'MMBCIR09M20B789V', '2009-09-20', 'Via Palermo 5, Roma', true, 'NORMAL'),
    ('SS12345', 'marco.verratti', 'marco.verratti@gmail.com', encode(sha512('Verratti123*'::bytea), 'hex'), 'Marco', 'Verratti', 'VRRMRC06M15A234Z', '2006-01-15', 'Via Trieste 10, Roma', true, 'NORMAL'),
    ('SS12345', 'nicolo.barella', 'nicolo.barella@gmail.com', encode(sha512('Barella123*'::bytea), 'hex'), 'Nicolò', 'Barella', 'BRLNCL07M09F789X', '2007-09-09', 'Via Bergamo 12, Roma', true, 'NORMAL'),
    ('SS12345', 'sandrom.tonali', 'sandrom.tonali@gmail.com', encode(sha512('Tonali123*'::bytea), 'hex'), 'Sandro', 'Tonali', 'TNLSDR08M15H890V', '2008-05-15', 'Via Venezia 8, Roma', true, 'NORMAL'),
    ('SS12345', 'mattia.zaccagni', 'mattia.zaccagni@gmail.com', encode(sha512('Zaccagni123*'::bytea), 'hex'), 'Mattia', 'Zaccagni', 'ZCCMTT09M19B678T', '2009-07-19', 'Via Napoli 20, Roma', true, 'NORMAL'),
    ('SS12345', 'giacomo.raspadori', 'giacomo.raspadori@gmail.com', encode(sha512('Raspadori123*'::bytea), 'hex'), 'Giacomo', 'Raspadori', 'RSPGCM08M18H234X', '2008-08-18', 'Via Manzoni 14, Roma', true, 'NORMAL'),
    ('SS67890', 'andrea.belotti', 'andrea.belotti@gmail.com', encode(sha512('Belotti123*'::bytea), 'hex'), 'Andrea', 'Belotti', 'BLTAND09M20F123Z', '2009-03-20', 'Via Venezia 6, Milano', true, 'NORMAL'),
    ('SS67890', 'manuel.locatelli', 'manuel.locatelli@gmail.com', encode(sha512('Locatelli123*'::bytea), 'hex'), 'Manuel', 'Locatelli', 'LCTMNL07M07G345V', '2007-03-07', 'Via Trieste 9, Milano', true, 'NORMAL'),
    ('SS67890', 'matteo.pessina', 'matteo.pessina@gmail.com', encode(sha512('Pessina123*'::bytea), 'hex'), 'Matteo', 'Pessina', 'PSSMTT08M01F123Y', '2008-07-01', 'Via Bergamo 10, Milano', true, 'NORMAL'),
    ('SS67890', 'giovanni.di_lorenzo', 'giovanni.di_lorenzo@gmail.com', encode(sha512('DiLorenzo123*'::bytea), 'hex'), 'Giovanni', 'Di Lorenzo', 'DILGVN06M05C567X', '2006-02-05', 'Via Napoli 14, Milano', true, 'NORMAL'),
    ('SS67890', 'davide.calabria', 'davide.calabria@gmail.com', encode(sha512('Calabria123*'::bytea), 'hex'), 'Davide', 'Calabria', 'CLBDVD07M28B123T', '2007-12-28', 'Via Manzoni 5, Milano', true, 'NORMAL'),
    ('SS67890', 'mario.pasalic', 'mario.pasalic@gmail.com', encode(sha512('Pasalic123*'::bytea), 'hex'), 'Mario', 'Pasalic', 'PSLMRO08M19A234U', '2008-03-19', 'Via Bergamo 11, Milano', true, 'NORMAL'),
    ('SS67890', 'danilo.cataldi', 'danilo.cataldi@gmail.com', encode(sha512('Cataldi123*'::bytea), 'hex'), 'Danilo', 'Cataldi', 'CTLNDL07M04F789Y', '2007-05-04', 'Via Venezia 13, Milano', true, 'NORMAL'),
    ('SS67890', 'nicolò.zaniolo', 'nicolo.zaniolo@gmail.com', encode(sha512('Zaniolo123*'::bytea), 'hex'), 'Nicolò', 'Zaniolo', 'ZNONCL06M02B456Z', '2006-06-02', 'Via Trieste 12, Milano', true, 'NORMAL'),
    ('SS67890', 'alessio.romagnoli', 'alessio.romagnoli@gmail.com', encode(sha512('Romagnoli123*'::bytea), 'hex'), 'Alessio', 'Romagnoli', 'RMNALS08M13F567T', '2008-05-13', 'Via Napoli 18, Milano', true, 'NORMAL'),
    ('SS11223', 'cristiano.biraghi', 'cristiano.biraghi@gmail.com', encode(sha512('Biraghi123*'::bytea), 'hex'), 'Cristiano', 'Biraghi', 'BRGCRS07M25D123V', '2007-11-25', 'Via Bergamo 16, Napoli', true, 'NORMAL'),
    ('SS11223', 'alex.meret', 'alex.meret@gmail.com', encode(sha512('Meret123*'::bytea), 'hex'), 'Alex', 'Meret', 'MRTLXS08M12A567Y', '2008-04-12', 'Via Manzoni 15, Napoli', true, 'NORMAL'),
    ('SS11223', 'salvatore.esposito', 'salvatore.esposito@gmail.com', encode(sha512('Esposito123*'::bytea), 'hex'), 'Salvatore', 'Esposito', 'ESPSLV09M16B678X', '2009-06-16', 'Via Napoli 11, Napoli', true, 'NORMAL'),
    ('SS11223', 'daniele.rugani', 'daniele.rugani@gmail.com', encode(sha512('Rugani123*'::bytea), 'hex'), 'Daniele', 'Rugani', 'RNGDNL06M24C123Z', '2006-09-24', 'Via Bergamo 17, Napoli', true, 'NORMAL'),
    ('SS11223', 'matteo.politano', 'matteo.politano@gmail.com', encode(sha512('Politano123*'::bytea), 'hex'), 'Matteo', 'Politano', 'PLTMTT07M10A789V', '2007-07-10', 'Via Trieste 16, Napoli', true, 'NORMAL'),
    ('SS11223', 'francesco.acciarini', 'francesco.acciarini@gmail.com', encode(sha512('Acciarini123*'::bytea), 'hex'), 'Francesco', 'Acciarini', 'ACCFRN09M28D123U', '2009-02-28', 'Via Venezia 15, Napoli', true, 'NORMAL'),
    ('SS11223', 'emanuele.naselli', 'emanuele.naselli@gmail.com', encode(sha512('Naselli123*'::bytea), 'hex'), 'Emanuele', 'Naselli', 'NSEMNL08M04A123X', '2008-08-04', 'Via Manzoni 13, Napoli', true, 'NORMAL'),
    ('SS11223', 'simone.giordano', 'simone.giordano@gmail.com', encode(sha512('Giordano123*'::bytea), 'hex'), 'Simone', 'Giordano', 'GIRSMN07M19F123Y', '2007-09-19', 'Via Bergamo 18, Napoli', true, 'NORMAL'),
    ('SS11223', 'giuseppe.rossini', 'giuseppe.rossini@gmail.com', encode(sha512('Rossini123*'::bytea), 'hex'), 'Giuseppe', 'Rossini', 'RSSGPP09M14C789T', '2009-03-14', 'Via Napoli 19, Napoli', true, 'NORMAL');


INSERT INTO delay (student_id, needs_justification, justified, justification_text, date_time)
VALUES
    ((SELECT id FROM student WHERE username = 'luca.verdi'), true, false, null, '2025-01-16 08:10:00'),
    ((SELECT id FROM student WHERE username = 'marco.neri'), true, false, null, '2025-02-10 08:20:00'),
    ((SELECT id FROM student WHERE username = 'giulia.rossi'), false, true, 'Ritardo causato da traffico.', '2025-02-15 08:30:00'),
    ((SELECT id FROM student WHERE username = 'elisa.verdi'), true, false, null, '2025-02-20 08:25:00');

INSERT INTO absence (student_id, needs_justification, justified, justification_text, date)
VALUES
    ((SELECT id FROM student WHERE username = 'sofia.bianchi'), false, true, 'Visita medica.', '2025-01-15'),
    ((SELECT id FROM student WHERE username = 'sofia.bianchi'), true, true, 'Assenza giustificata per malattia.', '2025-01-22'),
    ((SELECT id FROM student WHERE username = 'franco.blui'), true, false, null, '2025-02-05'),
    ((SELECT id FROM student WHERE username = 'chiara.neri'), false, true, 'Gita scolastica.', '2025-02-10');

INSERT INTO note (student_id, description)
VALUES
    ((SELECT id FROM student WHERE username = 'luca.verdi'), 'Non presta attenzione in classe.'),
    ((SELECT id FROM student WHERE username = 'marco.neri'), 'Disturbo continuo durante la lezione di storia.'),
    ((SELECT id FROM student WHERE username = 'sofia.bianchi'), 'Utilizzo non autorizzato del cellulare durante la lezione.'),
    ((SELECT id FROM student WHERE username = 'giulia.rossi'), 'Non ha rispettato le indicazioni fornite dall’insegnante di italiano.'),
    ((SELECT id FROM student WHERE username = 'elisa.verdi'), 'Discussioni accese con i compagni durante il laboratorio di informatica.'),
    ((SELECT id FROM student WHERE username = 'franco.blui'), 'Assenza non giustificata durante un test di matematica.'),
    ((SELECT id FROM student WHERE username = 'chiara.neri'), 'Non ha consegnato i compiti assegnati per la lezione di inglese.');

INSERT INTO mark (student_id, teaching_subject_title, teaching_teacher_id, date, type, mark, description)
VALUES
    ((SELECT id FROM student WHERE username = 'luca.verdi'), 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-22', 'ORAL', 5.75, 'Interrogazione su funzioni.'),
    ((SELECT id FROM student WHERE username = 'sofia.bianchi'), 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-22', 'ORAL', 4.50, 'Interrogazione su funzioni incompleta.'),
    ((SELECT id FROM student WHERE username = 'marco.neri'), 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-25', 'WRITTEN', 6.25, 'Test sulle equazioni.'),
    ((SELECT id FROM student WHERE username = 'marco.neri'), 'Storia', (SELECT id FROM teacher WHERE username = 'riccardo.blui'), '2025-01-24', 'ORAL', 5.0, 'Interrogazione sul Rinascimento.'),
    ((SELECT id FROM student WHERE username = 'sofia.bianchi'), 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-23', 'WRITTEN', 8.0, 'Compito sui sistemi lineari.'),
    ((SELECT id FROM student WHERE username = 'sofia.bianchi'), 'Italiano', (SELECT id FROM teacher WHERE username = 'elisa.gialli'), '2025-01-20', 'ORAL', 6.75, 'Analisi di un testo poetico.'),
    ((SELECT id FROM student WHERE username = 'giulia.rossi'), 'Italiano', (SELECT id FROM teacher WHERE username = 'elisa.gialli'), '2025-01-19', 'WRITTEN', 4.75, 'Tema: il Romanticismo.'),
    ((SELECT id FROM student WHERE username = 'giulia.rossi'), 'Inglese', (SELECT id FROM teacher WHERE username = 'anna.blui'), '2025-01-18', 'ORAL', 7.25, 'Dialogo su un testo letterario.'),
    ((SELECT id FROM student WHERE username = 'elisa.verdi'), 'Inglese', (SELECT id FROM teacher WHERE username = 'anna.blui'), '2025-01-15', 'WRITTEN', 5.50, 'Traduzione di un brano.'),
    ((SELECT id FROM student WHERE username = 'elisa.verdi'), 'Informatica', (SELECT id FROM teacher WHERE username = 'elena.blui'), '2025-01-16', 'WRITTEN', 7.75, 'Progetto: sviluppo di un algoritmo.'),
    ((SELECT id FROM student WHERE username = 'franco.blui'), 'Informatica', (SELECT id FROM teacher WHERE username = 'elena.blui'), '2025-01-17', 'WRITTEN', 3.25, 'Compito sulla programmazione.'),
    ((SELECT id FROM student WHERE username = 'franco.blui'), 'Inglese', (SELECT id FROM teacher WHERE username = 'anna.blui'), '2025-01-14', 'ORAL', 6.0, 'Esposizione di un argomento a scelta.'),
    ((SELECT id FROM student WHERE username = 'chiara.neri'), 'Italiano', (SELECT id FROM teacher WHERE username = 'elisa.gialli'), '2025-01-13', 'WRITTEN', 5.0, 'Analisi di un testo narrativo.'),
    ((SELECT id FROM student WHERE username = 'chiara.neri'), 'Storia', (SELECT id FROM teacher WHERE username = 'riccardo.blui'), '2025-01-12', 'ORAL', 6.50, 'Interrogazione sulla Rivoluzione Francese.');

INSERT INTO semester_report (first_semester, public, passed, year, student_id)
VALUES
    (true, true, true, 2024, (SELECT id FROM student WHERE username = 'luca.verdi')),
    (true, true, true, 2024, (SELECT id FROM student WHERE username = 'marco.neri')),
    (true, true, true, 2024, (SELECT id FROM student WHERE username = 'sofia.bianchi')),
    (true, true, true, 2024, (SELECT id FROM student WHERE username = 'giulia.rossi')),
    (true, true, true, 2024, (SELECT id FROM student WHERE username = 'elisa.verdi')),
    (true, true, true, 2024, (SELECT id FROM student WHERE username = 'franco.blui')),
    (true, true, true, 2024, (SELECT id FROM student WHERE username = 'chiara.neri'));

INSERT INTO semester_report_mark (subject_title, semester_id, mark)
VALUES
    ('Matematica', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'luca.verdi') AND year = 2024 AND first_semester = true), 7),
    ('Italiano', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'luca.verdi') AND year = 2024 AND first_semester = true), 8),
    ('Inglese', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'luca.verdi') AND year = 2024 AND first_semester = true), 9),
    ('Storia', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'luca.verdi') AND year = 2024 AND first_semester = true), 6),
    ('Matematica', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'marco.neri') AND year = 2024 AND first_semester = true), 8),
    ('Italiano', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'marco.neri') AND year = 2024 AND first_semester = true), 7),
    ('Inglese', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'marco.neri') AND year = 2024 AND first_semester = true), 6),
    ('Storia', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'marco.neri') AND year = 2024 AND first_semester = true), 7),
    ('Matematica', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'sofia.bianchi') AND year = 2024 AND first_semester = true), 7),
    ('Italiano', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'sofia.bianchi') AND year = 2024 AND first_semester = true), 8),
    ('Inglese', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'sofia.bianchi') AND year = 2024 AND first_semester = true), 9),
    ('Matematica', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'giulia.rossi') AND year = 2024 AND first_semester = true), 6),
    ('Italiano', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'giulia.rossi') AND year = 2024 AND first_semester = true), 8),
    ('Inglese', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'elisa.verdi') AND year = 2024 AND first_semester = true), 10),
    ('Matematica', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'elisa.verdi') AND year = 2024 AND first_semester = true), 7),
    ('Informatica', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'franco.blui') AND year = 2024 AND first_semester = true), 9),
    ('Italiano', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'chiara.neri') AND year = 2024 AND first_semester = true), 8),
    ('Storia', (SELECT id FROM semester_report WHERE student_id = (SELECT id FROM student WHERE username = 'chiara.neri') AND year = 2024 AND first_semester = true), 7);

INSERT INTO class_timetable (school_class_id, start_validity, end_validity)
VALUES
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), '2024-09-01', '2024-10-05'),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), '2024-10-05', null),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), '2024-09-01', '2024-10-05'),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), '2024-10-06', null),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'B' AND year = 2024), '2024-10-08', null),
    ((SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024), '2024-09-01', null),
    ((SELECT id FROM school_class WHERE number = 1 AND letter = 'C' AND year = 2024), '2024-09-01', null),
    ((SELECT id FROM school_class WHERE number = 2 AND letter = 'B' AND year = 2024), '2024-09-11', null),
    ((SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024), '2024-09-01', '2024-10-06'),
    ((SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024), '2024-10-06', null);

INSERT INTO teaching_timeslot (class_timetable_id, hour, date, teaching_subject_title, teaching_teacher_id)
VALUES
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 1, '2025-01-15', 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 2, '2025-01-15', 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 3, '2025-01-15', 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 1, '2025-01-18', 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'B' AND year = 2024) AND end_validity IS NULL), 4, '2025-01-17', 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 2, '2025-01-19', 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 3, '2025-01-19', 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 1, '2025-01-20', 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 1, '2025-01-21', 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 4, '2025-01-22', 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 6, '2025-01-23', 'Matematica', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 3, '2025-01-20', 'Fisica', (SELECT id FROM teacher WHERE username = 'alessandro.rossi')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 2, '2025-01-21', 'Fisica', (SELECT id FROM teacher WHERE username = 'alessandro.rossi')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 3, '2025-01-22', 'Fisica', (SELECT id FROM teacher WHERE username = 'alessandro.rossi')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 4, '2025-01-23', 'Fisica', (SELECT id FROM teacher WHERE username = 'alessandro.rossi')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 4, '2025-01-20', 'Chimica', (SELECT id FROM teacher WHERE username = 'maria.bianchi')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 3, '2025-01-21', 'Chimica', (SELECT id FROM teacher WHERE username = 'maria.bianchi')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 5, '2025-01-22', 'Chimica', (SELECT id FROM teacher WHERE username = 'maria.bianchi')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 2, '2025-01-23', 'Chimica', (SELECT id FROM teacher WHERE username = 'maria.bianchi')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024) AND end_validity IS NULL), 1, '2025-01-15', 'Storia', (SELECT id FROM teacher WHERE username = 'riccardo.blui')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024) AND end_validity IS NULL), 3, '2025-01-17', 'Storia', (SELECT id FROM teacher WHERE username = 'riccardo.blui')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024) AND end_validity IS NULL), 4, '2025-01-17', 'Storia', (SELECT id FROM teacher WHERE username = 'riccardo.blui')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024) AND end_validity IS NULL), 5, '2025-01-17', 'Storia', (SELECT id FROM teacher WHERE username = 'riccardo.blui')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024) AND end_validity IS NULL), 4, '2025-01-16', 'Italiano', (SELECT id FROM teacher WHERE username = 'elisa.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024) AND end_validity IS NULL), 5, '2025-01-16', 'Italiano', (SELECT id FROM teacher WHERE username = 'elisa.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024) AND end_validity IS NULL), 2, '2025-01-15', 'Italiano', (SELECT id FROM teacher WHERE username = 'elisa.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024) AND end_validity IS NULL), 3, '2025-01-15', 'Italiano', (SELECT id FROM teacher WHERE username = 'elisa.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024) AND end_validity IS NULL), 4, '2025-01-15', 'Italiano', (SELECT id FROM teacher WHERE username = 'elisa.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024) AND end_validity IS NULL), 2, '2025-01-18', 'Italiano', (SELECT id FROM teacher WHERE username = 'elisa.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 2, '2025-01-16', 'Inglese', (SELECT id FROM teacher WHERE username = 'anna.blui')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), 4, '2025-01-18', 'Inglese', (SELECT id FROM teacher WHERE username = 'anna.blui')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024) AND end_validity IS NULL), 2, '2025-01-18', 'Informatica', (SELECT id FROM teacher WHERE username = 'elena.blui')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024) AND end_validity IS NULL), 3, '2025-01-18', 'Informatica', (SELECT id FROM teacher WHERE username = 'elena.blui')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024) AND end_validity IS NULL), 3, '2025-01-21', 'Geometria', (SELECT id FROM teacher WHERE username = 'marco.gialli')),
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 5 AND letter = 'BS' AND year = 2024) AND end_validity IS NULL), 3, '2025-01-23', 'Geometria', (SELECT id FROM teacher WHERE username = 'marco.gialli'));

INSERT INTO signed_hour (teaching_timeslot_id, teacher_id, time_sign, substitution)
VALUES
    ((SELECT id FROM teaching_timeslot WHERE hour = 1 AND date = '2025-01-15' AND teaching_subject_title = 'Matematica'), (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-15 08:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-15' AND teaching_subject_title = 'Matematica'), (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-15 09:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-15' AND teaching_subject_title = 'Matematica'), (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-15 10:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 1 AND date = '2025-01-18' AND teaching_subject_title = 'Matematica'), (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-18 08:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 4 AND date = '2025-01-17' AND teaching_subject_title = 'Matematica'), (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-17 11:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-19' AND teaching_subject_title = 'Matematica'), (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-19 09:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 1 AND date = '2025-01-21' AND teaching_subject_title = 'Matematica'), (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-21 08:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-22' AND teaching_subject_title = 'Fisica'), (SELECT id FROM teacher WHERE username = 'alessandro.rossi'), '2025-01-22 10:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-21' AND teaching_subject_title = 'Fisica'), (SELECT id FROM teacher WHERE username = 'alessandro.rossi'), '2025-01-21 09:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 5 AND date = '2025-01-22' AND teaching_subject_title = 'Chimica'), (SELECT id FROM teacher WHERE username = 'maria.bianchi'), '2025-01-22 12:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-23' AND teaching_subject_title = 'Chimica'), (SELECT id FROM teacher WHERE username = 'maria.bianchi'), '2025-01-23 09:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 1 AND date = '2025-01-15' AND teaching_subject_title = 'Storia'), (SELECT id FROM teacher WHERE username = 'riccardo.blui'), '2025-01-15 08:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-17' AND teaching_subject_title = 'Storia'), (SELECT id FROM teacher WHERE username = 'riccardo.blui'), '2025-01-17 10:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 4 AND date = '2025-01-17' AND teaching_subject_title = 'Storia'), (SELECT id FROM teacher WHERE username = 'riccardo.blui'), '2025-01-17 11:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 5 AND date = '2025-01-17' AND teaching_subject_title = 'Storia'), (SELECT id FROM teacher WHERE username = 'riccardo.blui'), '2025-01-17 12:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 4 AND date = '2025-01-16' AND teaching_subject_title = 'Italiano'), (SELECT id FROM teacher WHERE username = 'elisa.gialli'), '2025-01-16 11:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 5 AND date = '2025-01-16' AND teaching_subject_title = 'Italiano'), (SELECT id FROM teacher WHERE username = 'elisa.gialli'), '2025-01-16 12:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-15' AND teaching_subject_title = 'Italiano'), (SELECT id FROM teacher WHERE username = 'elisa.gialli'), '2025-01-15 09:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-15' AND teaching_subject_title = 'Italiano'), (SELECT id FROM teacher WHERE username = 'elisa.gialli'), '2025-01-15 10:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 4 AND date = '2025-01-15' AND teaching_subject_title = 'Italiano'), (SELECT id FROM teacher WHERE username = 'elisa.gialli'), '2025-01-15 11:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-18' AND teaching_subject_title = 'Italiano'), (SELECT id FROM teacher WHERE username = 'elisa.gialli'), '2025-01-18 09:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-16' AND teaching_subject_title = 'Inglese'), (SELECT id FROM teacher WHERE username = 'anna.blui'), '2025-01-16 09:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 4 AND date = '2025-01-18' AND teaching_subject_title = 'Inglese'),  (SELECT id FROM teacher WHERE username = 'anna.blui'), '2025-01-18 11:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-18' AND teaching_subject_title = 'Informatica'), (SELECT id FROM teacher WHERE username = 'elena.blui'), '2025-01-18 09:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-18' AND teaching_subject_title = 'Informatica'), (SELECT id FROM teacher WHERE username = 'elena.blui'), '2025-01-18 10:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-21' AND teaching_subject_title = 'Geometria'), (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-21 10:15', false),
    ((SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-23' AND teaching_subject_title = 'Geometria'), (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-01-23 10:15',  false);

INSERT INTO reception_timetable(teacher_id, text_info_reception, start_validity)
VALUES
    ((SELECT id FROM teacher WHERE username = 'marco.gialli'), 'Ricevimento per genitori.', '2024-10-12'),
    ((SELECT id FROM teacher WHERE username = 'elena.blui'), 'Ricevimento per i progetti di informatica.', '2024-11-01'),
    ((SELECT id FROM teacher WHERE username = 'riccardo.blui'), 'Ricevimento per discussione di storia.', '2024-11-01'),
    ((SELECT id FROM teacher WHERE username = 'elisa.gialli'), 'Ricevimento per italiano e letteratura.', '2024-11-01'),
    ((SELECT id FROM teacher WHERE username = 'anna.blui'), 'Ricevimento per inglese e approfondimenti.', '2024-11-01');

INSERT INTO reception_timeslot(reception_timetable_id, hour, date, capacity, booked, mode)
VALUES
    ((SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'marco.gialli')), 3, '2025-02-17', 4, 1, 'In presenza'),
    ((SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'marco.gialli')), 4, '2025-02-18', 6, 0, 'Online'),
    ((SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'elena.blui')), 1, '2025-01-20', 5, 1, 'Online'),
    ((SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'elena.blui')), 2, '2025-01-21', 3, 1, 'In presenza'),
    ((SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'riccardo.blui')), 3, '2025-01-22', 4, 1, 'In presenza'),
    ((SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'riccardo.blui')), 4, '2025-01-23', 5, 1, 'Online'),
    ((SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'elisa.gialli')), 1, '2025-01-24', 4, 0, 'Online'),
    ((SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'elisa.gialli')), 2, '2025-01-25', 3, 0, 'In presenza'),
    ((SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'anna.blui')), 1, '2025-01-26', 5, 0, 'In presenza'),
    ((SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'anna.blui')), 2, '2025-01-27', 6, 0, 'Online');

INSERT INTO reception_booking(parent_id, reception_timeslot_id, booking_order, confirmed)
VALUES
    ((SELECT id FROM parent WHERE username = 'paolo.verdi'), (SELECT id FROM reception_timeslot WHERE reception_timetable_id = (SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'marco.gialli')) AND date = '2025-02-17' AND hour = 3), 1, false),
    ((SELECT id FROM parent WHERE username = 'paolo.verdi'), (SELECT id FROM reception_timeslot WHERE reception_timetable_id = (SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'elena.blui')) AND date = '2025-01-20' AND hour = 1),1, true),
    ((SELECT id FROM parent WHERE username = 'laura.bianchi'), (SELECT id FROM reception_timeslot WHERE reception_timetable_id = (SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'elena.blui')) AND date = '2025-01-21' AND hour = 2), 1, false),
    ((SELECT id FROM parent WHERE username = 'giulia.neri'), (SELECT id FROM reception_timeslot WHERE reception_timetable_id = (SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'riccardo.blui')) AND date = '2025-01-22' AND hour = 3), 1, true),
    ((SELECT id FROM parent WHERE username = 'roberto.verdi'), (SELECT id FROM reception_timeslot WHERE reception_timetable_id = (SELECT id FROM reception_timetable WHERE teacher_id = (SELECT id FROM teacher WHERE username = 'riccardo.blui')) AND date = '2025-01-23' AND hour = 4), 1, false);

INSERT INTO class_activity (signed_hour_teaching_timeslot_id, title, description)
VALUES
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-15' AND teaching_subject_title = 'Matematica')), 'Lezione di Matematica', 'Approfondimento sulle funzioni quadratiche.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 1 AND date = '2025-01-18' AND teaching_subject_title = 'Matematica')), 'Lezione di Matematica', 'Ripasso sulle equazioni di secondo grado.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-19' AND teaching_subject_title = 'Matematica')), 'Approfondimento su funzioni lineari', 'Discussione sui concetti fondamentali delle funzioni lineari.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 1 AND date = '2025-01-21' AND teaching_subject_title = 'Matematica')), 'Ripasso di geometria', 'Esercizi e teoria sui poligoni regolari e circonferenze.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-22' AND teaching_subject_title = 'Fisica')), 'Lezione su moto rettilineo uniforme', 'Analisi teorica e risoluzione di problemi sul moto rettilineo uniforme.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-21' AND teaching_subject_title = 'Fisica')), 'Esercizi su velocità e accelerazione', 'Problemi pratici per calcolare velocità, accelerazione e tempi di percorrenza.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 5 AND date = '2025-01-22' AND teaching_subject_title = 'Chimica')), 'Introduzione alla tavola periodica', 'Analisi degli elementi chimici e delle loro proprietà.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-23' AND teaching_subject_title = 'Chimica')), 'Esperimento: elettrolisi dell’acqua', 'Dimostrazione pratica dell’elettrolisi per separare idrogeno e ossigeno.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-18' AND teaching_subject_title = 'Informatica')), 'Laboratorio di Informatica', 'Sviluppo di un programma semplice in Python.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-17' AND teaching_subject_title = 'Storia')), 'Lezione di Storia', 'Discussione sulle principali invenzioni.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 5 AND date = '2025-01-17' AND teaching_subject_title = 'Storia')), 'Lezione di Storia', 'Analisi degli eventi della Seconda Guerra Mondiale.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 5 AND date = '2025-01-16' AND teaching_subject_title = 'Italiano')), 'Lezione di Italiano', 'Introduzione alla Divina Commedia di Dante Alighieri.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-16' AND teaching_subject_title = 'Inglese')), 'Lezione di Inglese', 'Approfondimento sulla grammatica.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 4 AND date = '2025-01-18' AND teaching_subject_title = 'Inglese')), 'Lezione di Inglese', 'Studio e analisi di un testo letterario inglese.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-21' AND teaching_subject_title = 'Geometria')),'Esercizi sulla Circonferenza','Spiegazone sulla circonferenza.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-23' AND teaching_subject_title = 'Geometria')),'Ripasso sulla Circonferenza','Esercizi avanzati sulla circonferenza.');

INSERT INTO homework (signed_hour_teaching_timeslot_id, due_date, title, description)
VALUES
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 1 AND date = '2025-01-18' AND teaching_subject_title = 'Matematica')), '2025-02-25', 'Esercizi sulle equazioni', 'Risolvere gli esercizi da 1 a 10 a pagina 50 del libro di testo.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-19' AND teaching_subject_title = 'Matematica')), '2025-02-25', 'Esercizi su funzioni lineari', 'Completare gli esercizi 1-10 a pagina 45 del libro di testo.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 1 AND date = '2025-01-21' AND teaching_subject_title = 'Matematica')), '2025-02-28', 'Ripasso di geometria', 'Disegnare i principali poligoni e calcolare le loro aree e perimetri.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-22' AND teaching_subject_title = 'Fisica')), '2025-02-27', 'Problemi sul moto rettilineo uniforme', 'Risolvere i problemi 5-8 a pagina 120 del libro di testo.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-21' AND teaching_subject_title = 'Fisica')), '2025-02-27', 'Esercizi su velocità', 'Calcolare la velocità media in diversi scenari.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 5 AND date = '2025-01-22' AND teaching_subject_title = 'Chimica')), '2025-02-28', 'Ripasso sulla tavola periodica', 'Memorizzare i gruppi e i periodi principali della tavola periodica.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 2 AND date = '2025-01-23' AND teaching_subject_title = 'Chimica')), '2025-02-17', 'Relazione sull’elettrolisi', 'Scrivere una breve relazione sull’esperimento condotto in classe.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 5 AND date = '2025-01-17' AND teaching_subject_title = 'Storia')), '2025-02-24', 'Esercizi Rivoluzione Francese', 'Completa le domande a pagina 150.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 4 AND date = '2025-01-18' AND teaching_subject_title = 'Inglese')), '2025-02-15', 'Scrivi un saggio', 'Scrivi un saggio di 500 parole.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-21' AND teaching_subject_title = 'Geometria')),'2025-02-28','Esercizi sulla circonferenza','Completa gli esercizi 1-10 del capitolo 3.'),
    ((SELECT teaching_timeslot_id FROM signed_hour WHERE teaching_timeslot_id = (SELECT id FROM teaching_timeslot WHERE hour = 3 AND date = '2025-01-23' AND teaching_subject_title = 'Geometria')),'2025-02-20','Proprietà Circonferenza','Risolvi i problemi 5-8 a pagina 85.');

INSERT INTO homework_chat (homework_signed_hour_teaching_timeslot_id, title, student_id)
VALUES
    ((SELECT signed_hour_teaching_timeslot_id FROM homework WHERE title = 'Esercizi sulle equazioni'), 'Dubbio esercizio 3', (SELECT id FROM student WHERE username = 'luca.verdi')),
    ((SELECT signed_hour_teaching_timeslot_id FROM homework WHERE title = 'Esercizi Rivoluzione Francese'), 'Chiarimenti compito', (SELECT id FROM student WHERE username = 'marco.neri')),
    ((SELECT signed_hour_teaching_timeslot_id FROM homework WHERE title = 'Esercizi Rivoluzione Francese'), 'Dubbi su un esercizio', (SELECT id FROM student WHERE username = 'luca.verdi')),
    ((SELECT signed_hour_teaching_timeslot_id FROM homework WHERE title = 'Esercizi Rivoluzione Francese'), 'Scrivi un saggio', (SELECT id FROM student WHERE username = 'elisa.verdi'));

INSERT INTO ticket (parent_id, teacher_id, title, category, datetime, closed, solved)
VALUES
    (null, (SELECT id FROM teacher WHERE username = 'marco.gialli'), 'Problema con la piattaforma', 'Piattaforma', '2025-01-15 10:00:00', false, false),
    (null, (SELECT id FROM teacher WHERE username = 'marco.gialli'), 'Chiarimento sulle lezioni', 'Didattica', '2025-03-20 14:00:00', false, false),
    ((SELECT id FROM parent WHERE username = 'paolo.verdi'), null, 'Richiesta informazioni sulla gita', 'Gite scolastiche', '2025-01-17 10:32:46', false, false),
    ((SELECT id FROM parent WHERE username = 'giulia.neri'), null, 'Problema iscrizione', 'Iscrizione', '2025-02-01 10:00:00', false, false),
    ((SELECT id FROM parent WHERE username = 'roberto.verdi'), null, 'Richiesta documenti', 'Documenti', '2025-02-02 11:30:00', false, false);

INSERT INTO message (ticket_id, homework_chat_id, parent_id, secretary_id, student_id, teacher_id, date_time, text)
VALUES
    (null, (SELECT id FROM homework_chat WHERE title = 'Chiarimenti compito'), null, null, (SELECT id FROM student WHERE username = 'marco.neri'), null, '2025-02-05 14:30:00', 'Non capisco la domanda 3.'),
    (null, (SELECT id FROM homework_chat WHERE title = 'Chiarimenti compito'), null, null, null, (SELECT id FROM teacher WHERE username = 'riccardo.blui'), '2025-02-05 14:35:00', 'Quale parte non ti è chiara?'),
    (null, (SELECT id FROM homework_chat WHERE title = 'Chiarimenti compito'), null, null, (SELECT id FROM student WHERE username = 'marco.neri'), null, '2025-02-05 14:40:00', 'Il modo in cui calcolare il determinante.'),
    (null, (SELECT id FROM homework_chat WHERE title = 'Dubbi su un esercizio'), null, null, (SELECT id FROM student WHERE username = 'luca.verdi'), null, '2025-02-06 09:00:00', 'Ho difficoltà con l’esercizio 5.'),
    (null, (SELECT id FROM homework_chat WHERE title = 'Dubbi su un esercizio'), null, null, null, (SELECT id FROM teacher WHERE username = 'riccardo.blui'), '2025-02-06 09:15:00', 'Prova a dividere il problema in piccoli passi.'),
    (null, (SELECT id FROM homework_chat WHERE title = 'Dubbi su un esercizio'), null, null, (SELECT id FROM student WHERE username = 'luca.verdi'), null, '2025-02-06 09:20:00', 'Grazie, ora è più chiaro!'),
    (null, (SELECT id FROM homework_chat WHERE title = 'Scrivi un saggio'), null, null, (SELECT id FROM student WHERE username = 'elisa.verdi'), null, '2025-02-08 10:00:00', 'Il formato del saggio è obbligatorio?'),
    (null, (SELECT id FROM homework_chat WHERE title = 'Scrivi un saggio'), null, null, null, (SELECT id FROM teacher WHERE username = 'anna.blui'), '2025-02-08 10:10:00', 'Sì, segui le linee guida della pagina 12 del libro.'),
    ((SELECT id FROM ticket WHERE title = 'Problema con la piattaforma'), null, null, null, null, (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-03-15 10:05:00', 'Buongiorno, sto riscontrando problemi nell’accedere alla piattaforma.'),
    ((SELECT id FROM ticket WHERE title = 'Problema con la piattaforma'), null, null, (SELECT id FROM secretary WHERE username = 'giorgio.neri'), null, null, '2025-03-15 10:10:00', 'Buongiorno, siamo a conoscenza del problema. È dovuto a un aggiornamento in corso.'),
    ((SELECT id FROM ticket WHERE title = 'Problema con la piattaforma'), null, null, null, null, (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-03-15 10:15:00', 'Grazie per l’informazione. Quanto tempo richiederà la risoluzione?'),
    ((SELECT id FROM ticket WHERE title = 'Problema con la piattaforma'), null, null, (SELECT id FROM secretary WHERE username = 'giorgio.neri'), null, null, '2025-03-15 10:20:00', 'Il problema dovrebbe essere risolto entro un’ora. Grazie per la pazienza.'),
    ((SELECT id FROM ticket WHERE title = 'Chiarimento sulle lezioni'), null, null, null, null, (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-03-20 14:10:00', 'Buongiorno, ho bisogno di chiarimenti sull’organizzazione delle lezioni.'),
    ((SELECT id FROM ticket WHERE title = 'Chiarimento sulle lezioni'), null, null, (SELECT id FROM secretary WHERE username = 'giorgio.neri'), null, null, '2025-03-20 14:15:00', 'Buongiorno Professore, quali aspetti vorrebbe chiarire?'),
    ((SELECT id FROM ticket WHERE title = 'Chiarimento sulle lezioni'), null, null, null, null, (SELECT id FROM teacher WHERE username = 'marco.gialli'), '2025-03-20 14:20:00', 'Mi servirebbero informazioni sulle date dei prossimi incontri di recupero.'),
    ((SELECT id FROM ticket WHERE title = 'Richiesta informazioni sulla gita'), null,  (SELECT id FROM parent WHERE username = 'paolo.verdi'), null, null, null, '2025-01-17 09:10:00', 'Vorrei sapere maggiori dettagli sull''organizzazione della gita.'),
    ((SELECT id FROM ticket WHERE title = 'Problema iscrizione'), null, (SELECT id FROM parent WHERE username = 'giulia.neri'), null, null,  null, '2025-02-01 10:05:00', 'Non riesco a completare la procedura di iscrizione.'),
    ((SELECT id FROM ticket WHERE title = 'Problema iscrizione'), null, null, (SELECT id FROM secretary WHERE username = 'laura.verdi'), null, null, '2025-02-01 10:10:00', 'Può fornirmi ulteriori dettagli sul problema?'),
    ((SELECT id FROM ticket WHERE title = 'Problema iscrizione'), null, (SELECT id FROM parent WHERE username = 'giulia.neri'), null, null, null, '2025-02-01 10:15:00', 'Il sistema restituisce un errore durante il pagamento.'),
    ((SELECT id FROM ticket WHERE title = 'Richiesta documenti'), null, (SELECT id FROM parent WHERE username = 'roberto.verdi'), null, null, null, '2025-02-02 11:35:00', 'Avrei bisogno di una copia del certificato di frequenza.'),
    ((SELECT id FROM ticket WHERE title = 'Richiesta documenti'), null, null, (SELECT id FROM secretary WHERE username = 'mario.neri'), null, null, '2025-02-02 11:40:00', 'La sua richiesta è stata inoltrata, riceverà una risposta a breve.'),
    ((SELECT id FROM ticket WHERE title = 'Richiesta documenti'), null, (SELECT id FROM parent WHERE username = 'roberto.verdi'), null, null, null, '2025-02-02 11:45:00', 'Grazie mille!');

INSERT INTO student_parent (student_id, parent_id)
VALUES
    ((SELECT id FROM student WHERE username = 'luca.verdi'), (SELECT id FROM parent WHERE username = 'paolo.verdi')),
    ((SELECT id FROM student WHERE username = 'sofia.bianchi'), (SELECT id FROM parent WHERE username = 'laura.bianchi')),
    ((SELECT id FROM student WHERE username = 'marco.neri'), (SELECT id FROM parent WHERE username = 'giulia.neri')),
    ((SELECT id FROM student WHERE username = 'giulia.rossi'), (SELECT id FROM parent WHERE username = 'paolo.rossi')),
    ((SELECT id FROM student WHERE username = 'elisa.verdi'), (SELECT id FROM parent WHERE username = 'roberto.verdi')),
    ((SELECT id FROM student WHERE username = 'franco.blui'), (SELECT id FROM parent WHERE username = 'laura.blui')),
    ((SELECT id FROM student WHERE username = 'chiara.neri'), (SELECT id FROM parent WHERE username = 'anna.neri'));

INSERT INTO red_date (class_timetable_id, date)
VALUES
    ((SELECT id FROM class_timetable WHERE school_class_id = (SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024) AND end_validity IS NULL), '2024-12-25');

INSERT INTO student_school_class (school_class_id, student_id)
VALUES
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), (SELECT id FROM student WHERE username = 'marco.neri')),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), (SELECT id FROM student WHERE username = 'luca.verdi')),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'A' AND year = 2024), (SELECT id FROM student WHERE username = 'sofia.bianchi')),
    ((SELECT id FROM school_class WHERE number = 3 AND letter = 'C' AND year = 2024), (SELECT id FROM student WHERE username = 'giulia.rossi')),
    ((SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024), (SELECT id FROM student WHERE username = 'elisa.verdi')),
    ((SELECT id FROM school_class WHERE number = 5 AND letter = 'A' AND year = 2024), (SELECT id FROM student WHERE username = 'franco.blui')),
    ((SELECT id FROM school_class WHERE number = 2 AND letter = 'B' AND year = 2024), (SELECT id FROM student WHERE username = 'chiara.neri'));
