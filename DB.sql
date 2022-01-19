
SET NAMES latin1;
SET FOREIGN_KEY_CHECKS = 0;

BEGIN;
CREATE DATABASE IF NOT EXISTS SmartMobility;
COMMIT;



-- ---------------------------------- --
--  Table structure for ACCETTAZIONE  --
-- ---------------------------------- --
DROP TABLE IF EXISTS ACCETTAZIONE;
CREATE TABLE ACCETTAZIONE (
  CodiceFruitore CHAR(50) NOT NULL,
  Conferma CHAR(50) NOT NULL,
  DataInizio DATE NOT NULL,
  DataFine DATE NOT NULL,
  CodiceProponente CHAR(50) NOT NULL,
  PRIMARY KEY (CodiceFruitore, DataInizio, DataFine),
  
  CONSTRAINT FK_Accettazione_Fruitore
  FOREIGN KEY (CodiceFruitore) REFERENCES FRUITORE(CodiceFiscale)
  ON UPDATE CASCADE ON DELETE NO ACTION,
  
  CONSTRAINT FK_Accettazione_Proponente
  FOREIGN KEY (CodiceProponente) REFERENCES PROPONENTE(CodiceFiscale)
  ON UPDATE CASCADE ON DELETE NO ACTION,
  
  CONSTRAINT FK_Accettazione_Prenotazione_Di_Noleggio1
  FOREIGN KEY (DataInizio, DataFine) REFERENCES PRENOTAZIONE_DI_NOLEGGIO(DataInizio, DataFine)
  ON UPDATE CASCADE ON DELETE NO ACTION
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


BEGIN ;
INSERT INTO ACCETTAZIONE
VALUES
('pier1', 'si', '2013-03-01', '2013-03-08', 'nico1'),
-- SU TRACKING
('pave2', 'si', '2014-04-15', '2014-04-27', 'nico1'),
('marc3', 'si', '2014-07-01', '2014-07-31', 'nico1'),
('tomm6', 'si', '2017-08-10', '2017-08-20', 'jack2'),
('tomm6', 'no', '2013-03-05', '2013-03-06', 'nico1'); -- conflitto con la prima tupla CodiceFruitore
COMMIT ;



-- ---------------------------------- --
--    Table structure for ACCOUNT     --
-- ---------------------------------- --
DROP TABLE IF EXISTS ACCOUNT;
CREATE TABLE ACCOUNT (
  Password CHAR(50) NOT NULL,
  NomeUtente CHAR(50) NOT NULL,
  Domanda CHAR(100) NOT NULL,
  Risposta CHAR(100) NOT NULL,
  PRIMARY KEY (Password, NomeUtente)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO ACCOUNT
VALUES
-- fruitori
( 'reip1', 'pier','Metti il tuo nome', 'pierfrancesco'), -- pier
( 'evap2', 'pave', 'Metti il tuo cognome', 'priesnuoghwgvichhhh'), -- pavel
( 'cram3', 'marc', 'Nome del cane', 'fiamma'),-- marco
('varf4', 'frav', 'Nome del gatto', 'chicco'),-- fra
('naig5', 'gian', 'Quanti anni hai', '21'),-- gianno
('mmot6', 'tomm', 'Colore Preferito', 'rosa'),-- tomma
('llep7', 'pell', 'Colore Preferito', ' bianconero'),-- pelle
('erut8', 'ture', 'Quanti anni hai', '21'),-- ture

-- proponenti
('ocin1', 'nico', 'Il tuo compleanno', '18 ottobre 1996'),-- nicola
('kcaj2', 'jack', 'Il tuo compleanno', '12 marzo 1996'),-- giacomo
('ttiv7', 'vitt', 'Film preferito', 'pulp fiction'),-- vitti
('griv8', 'virg', 'Libro preferito', 'io e te');-- virgi
COMMIT ;



-- ----------------------------------- --
--   Table structure for Autovettura   --
-- ----------------------------------- --
DROP TABLE IF EXISTS AUTOVETTURA;
CREATE TABLE AUTOVETTURA (
    Targa CHAR(50) NOT NULL,
	Modello CHAR(50) NOT NULL,
	Velocita INT(11) NOT NULL,
	AnnoImmatricolazione CHAR(50) NOT NULL,
	Cilindrata INT(11) NOT NULL,
	NumeroPosti INT(11) NOT NULL,
	TipologiaAlimentazione CHAR(50) NOT NULL,
	Stelle INT(11) NOT NULL,
	CostoUsura DOUBLE(6,3) NOT NULL,
	Disponibilita CHAR(50) NOT NULL,
	ExtraUrbano DOUBLE(6,3) NOT NULL,
	CostoOperativo DOUBLE(6,3) NOT NULL,
	CapacitaSerbatoio INT(11) NOT NULL,
	Costi DOUBLE(6,3) NOT NULL,
	Misto DOUBLE(6,3) NOT NULL,
	Urbano DOUBLE(6,3) NOT NULL,
	PRIMARY KEY(Targa)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
 
BEGIN ;
INSERT INTO AUTOVETTURA
VALUES
('EB 100 GX','CLIO','220','2012','1200','5','disel','3','100','si','16','50','100','23.5','12','10'),
('EA 200 AA','CLASSE A','240','2011','1800','5','benzina','4','60','si','14','120','120','42.3','10','8'),
('DT 302 YX','500','190','2009','1200','4','benzina','3','190','no','20','30','100','44','17','15'),
('DA 100 SS','PUNTO','140','2007','1400','5','gas','2','400','no','22','50','120','8.9','19','16'),
('DV 123 AT','DUCATO PANORAMA','200','2011','2000','9','benzina','4','300','no','18','400','150','55','15','12'),
('DS 221 BC','C3','200','2011','1300','5','diesel','3','350','si','20','500','120','50','17','16');
COMMIT ;



-- ---------------------------------------- --
--   Table structure for Nome_Autovettura   --
-- ---------------------------------------- --
DROP TABLE IF EXISTS NOME_AUTOVETTURA;
CREATE TABLE NOME_AUTOVETTURA(
	Modello CHAR(50) NOT NULL,
    CasaProduttrice CHAR(50) NOT NULL,
	PRIMARY KEY(Modello)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO NOME_AUTOVETTURA
VALUES
('CLIO','RENAULT'),
('CLASSE A','MERCEDES'),
('500','FIAT'),
('PUNTO','FIAT'),
('DUCATO PANORAMA','FIAT'),
('C3','CITROEN');
COMMIT ;



-- ---------------------------------------- --
--  Table structure for Autovettura ESTERNA --
-- ---------------------------------------- --
DROP TABLE IF EXISTS AUTOVETTURA_ESTERNA;
CREATE TABLE AUTOVETTURA_ESTERNA(
	Targa CHAR(50) NOT NULL,
    Modello CHAR(50) NOT NULL,
	PRIMARY KEY(Targa)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO AUTOVETTURA_ESTERNA
VALUES
('DA 300 WQ','Q7'),
('FA 454 XC','X');
COMMIT ;



-- ------------------------------------------------ --
--   Table structure for Nome Autovettura Esterna   --
-- ------------------------------------------------ --
DROP TABLE IF EXISTS NOME_AUTOVETTURA_ESTERNA;
CREATE TABLE NOME_AUTOVETTURA_ESTERNA(
	Modello CHAR(50) NOT NULL,
    CasaProduttrice CHAR(50) NOT NULL,
	PRIMARY KEY(Modello)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO NOME_AUTOVETTURA_ESTERNA
VALUES
('Q7','AUDIT'),
('X','TESLA');
COMMIT ;



-- -------------------------------- --
--   Table structure for Chiamata   --
-- -------------------------------- --
DROP TABLE IF EXISTS CHIAMATA;
CREATE TABLE CHIAMATA(
	Codice INT(50) NOT NULL AUTO_INCREMENT,
    Stato CHAR(50) NOT NULL,
	TimestampChiamata TIMESTAMP NOT NULL,
	TimestampRisposta TIMESTAMP NOT NULL,
	CodiceFiscaleFruitore CHAR(50) NOT NULL,
	CodiceFiscaleProponente CHAR(50) NOT NULL,
    Risposta CHAR(50) NOT NULL,
	PRIMARY KEY(Codice),
    
    CONSTRAINT FK_Chiamata_Fruitore
    FOREIGN KEY (CodiceFiscaleFruitore) REFERENCES FRUITORE(CodiceFiscale)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Chiamata_Proponente
    FOREIGN KEY (CodiceFiscaleProponente) REFERENCES PROPONENTE(CodiceFiscale)
    ON UPDATE CASCADE ON DELETE NO ACTION
    
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO CHIAMATA (Stato, TimestampChiamata, TimestampRisposta, CodiceFiscaleFruitore, CodiceFiscaleProponente, Risposta)
VALUES
('accepted','2014-03-03 13:30:00','2014-03-03 13:35:00','tomm6','virg4', 'si'),
('accepted','2014-03-03 13:45:00','2014-03-03 13:47:00','pell7','virg4', 'si' ),
('accepted','2015-07-09 08:30:00','2015-07-09 08:36:00','gian5','jack2', 'si'),
('rejected','2014-03-03 14:30:00','2014-11-30 14:31:08','pier1','virg4', 'no'),
('rejected','2015-07-09 10:00:15','2015-07-09 10:00:17','pave2','jack2', 'no'),
('pending','2019-04-10 14:00:07','2019-04-10 14:00:07','pell4','nico1', 'no');
COMMIT ;



-- -------------------------------- --
--   Table structure for Comfort    --
-- -------------------------------- --
DROP TABLE IF EXISTS COMFORT;
CREATE TABLE COMFORT(
	Descrizione VARCHAR (255) NOT NULL,
	Targa CHAR(50) NOT NULL,
	PRIMARY KEY(Descrizione,Targa),
    
	CONSTRAINT FK_Comfort_Autovettura
    FOREIGN KEY (Targa) REFERENCES AUTOVETTURA(Targa)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Comfort_Optional
    FOREIGN KEY (Descrizione) REFERENCES OPTIONAL(Descrizione)
    ON UPDATE CASCADE ON DELETE NO ACTION
    
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO COMFORT 
VALUES
('cerchi in lega cromati 30332','EB 100 GX'),
('fari antinebbia a led posizionabili','EB 100 GX'),
('sedili riscaldati in eco pelle','EB 100 GX'),
('comandi al volante multipli','EA 200 AA'),
('sensori avanzati dotati di telecamera posteriore','EA 200 AA'),
('navigatore serie 300 omnitel','EA 200 AA'),
('pneumatici riscaldati battistrada 0,4mm','EA 200 AA'),
('fari antinebbia a led posizionabili','EA 200 AA'),
('sedili riscaldati in eco pelle','DT 302 YX'),
('fari antinebbia a led posizionabili','DT 302 YX'),
('sensori di parcheggio modello 205a','DA 100 SS'),
('comandi al volante multipli','DA 100 SS'),
('finestrini oscurati temperati modello 4032','DV 123 AT'),
('pneumatici riscaldati battistrada 0,4mm','DV 123 AT'),
('sensori avanzati dotati di telecamera posteriore','DV 123 AT'),
('sedili riscaldati in eco pelle','DV 123 AT'),
('cambio automatico modello 321gk','DV 123 AT');
COMMIT ;



-- -------------------------------- --
--   Table structure for Documento  --
-- -------------------------------- --
DROP TABLE IF EXISTS DOCUMENTO;
CREATE TABLE DOCUMENTO(
	Numero CHAR (50) NOT NULL,
	Tipologia CHAR(50) NOT NULL,
	Scadenza DATE NOT NULL,
	PRIMARY KEY(Numero)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO DOCUMENTO
VALUES
('AX123','patente','2020-10-10'),
('SX234','patente','2027-11-18'),
('CC456','passaporto','2023-01-22'),
('VV567','carta di identità','2024-12-10'),
('AA678','carta di identità','2023-04-18'),
('SR789','patente','2029-06-15'),
('MP999','carta di identità','2023-07-23'),
('DM669','carta di identità','2024-07-01'),
('SS374','carta di identità','2029-11-07'),
('MI444','carta di identità','2028-09-30'),
('QD134','carta di identità','2028-02-25'),
('DP125','passaporto','2026-05-10');
COMMIT ;



-- ------------------------------------------ --
--   Table structure for TIPOLOGIA_DOCUMENTO  --
-- ------------------------------------------ --
DROP TABLE IF EXISTS TIPOLOGIA_DOCUMENTO;
CREATE TABLE TIPOLOGIA_DOCUMENTO(
	Tipologia CHAR (50) NOT NULL,
	EnteRilascio CHAR(50) NOT NULL,
	PRIMARY KEY(Tipologia)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO TIPOLOGIA_DOCUMENTO
VALUES
('patente','stato'),
('pasaporto','stato'),
('carta di identità','comune');
COMMIT ;



-- ------------------------------------------ --
--        Table structure for STRADA          --
-- ------------------------------------------ --
DROP TABLE IF EXISTS STRADA;
CREATE TABLE STRADA (
	Codice INT(11) NOT NULL AUTO_INCREMENT,
    NumeroSensiMarcia INT(11) NOT NULL,
    IDNumerico INT(11) DEFAULT NULL,
    CodiceTipologia CHAR(50) DEFAULT NULL,
    Nome CHAR(100) DEFAULT NULL,
    PrincipaleSecondaria CHAR(50) DEFAULT NULL,
    ClassificazioneTecnica CHAR(50) NOT NULL,
    NumeroCorsieCarreggiata INT(11) NOT NULL,
    Categorizzazione CHAR(50) DEFAULT NULL, 
    NumeroCarreggiate INT(11) NOT NULL,
    Lunghezza INT(11) NOT NULL,
	PRIMARY KEY(Codice)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO STRADA (NumeroSensiMarcia, IDNumerico, CodiceTipologia, Nome, PrincipaleSecondaria, ClassificazioneTecnica, NumeroCorsieCarreggiata, Categorizzazione, NumeroCarreggiate, Lunghezza)
VALUES
('2', null, 'SC', 'VIA 1', null, 'Urbana', '1', null, '2', '8'), 
('2', null, 'SC', 'VIA 2', null, 'Urbana', '1', null, '2', '4'), 
('2', null, 'SC', 'VIA 3', null, 'Urbana', '1', null, '2', '4'), 
('2', null, 'SC', 'VIA 4', null, 'Urbana', '1', null, '2', '4'), 
('1', '5', 'SP', null, 'Secondaria', 'Extraurbana', '1', null, '1', '18'), 
('1', '6', 'SP', null, 'Secondaria', 'Extraurbana', '1', null, '1', '18'), 
('2', null, 'SC', 'VIA 7', null, 'Urbana', '1', null, '2', '4'), 
('2', null, 'SC', 'VIA 8', null, 'Urbana', '1', null, '2', '8'), 
('2', '9', 'SR', null, 'Principale', 'Extraurbana', '1', null, '2', '20'), 
('2', '10', 'SR', null, 'Principale', 'Extrurbana', '1', null, '2', '20'), 
('2', null, 'SC', 'VIA 11', null, 'Urbana', '1', null, '2', '8'), 
('2', null, 'SC', 'VIA 12', null, 'Urbana', '1', null, '2', '8'), 
('2', null, 'SP', 'VIA 13', null, 'Urbana', '1', null, '2', '20'), 
('2', null, 'SC', 'VIA 14', null, 'Urbana', '1', null, '2', '12'), 
('2', '1', null, null, null, 'Autostrada', '2', null, '2', '28'), 
('2', '12', null, null, null, 'Autostrada', '2', null, '2', '28'), 
('2', '10', 'SS', null, 'Principale', 'Extraurbana', '2', null, '2', '30');
COMMIT ;



-- ------------------------------------------ --
--      Table structure for PROPONENTE        --
-- ------------------------------------------ --
DROP TABLE IF EXISTS PROPONENTE;
CREATE TABLE PROPONENTE (
	CodiceFiscale CHAR(50) NOT NULL,
    Nome CHAR(50) NOT NULL,
    Cognome CHAR(50) NOT NULL,
    Stato CHAR(50) NOT NULL,
    DataIscrizione DATE NOT NULL,
    Rank_ DOUBLE(3,2) NOT NULL,
    NumeroTelefono CHAR(100) NOT NULL,
    NumeroDocumentoProponente CHAR(50) NOT NULL,
    PasswordProponente CHAR(100) NOT NULL,
    NomeUtenteProponente CHAR(100) NOT NULL,
	Strada CHAR(100) NOT NULL,
	NumeroCivico CHAR(100) NOT NULL,
    PRIMARY KEY(CodiceFiscale),
    
	CONSTRAINT FK_Proponente_Documeto
    FOREIGN KEY (NumeroDocumentoProponente) REFERENCES DOCUMENTO(Numero)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Proponente_Account
    FOREIGN KEY (PasswordProponente, NomeUtenteProponente) REFERENCES ACCOUNT(Password, NomeUtente)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Proponente_Strada
    FOREIGN KEY (Strada) REFERENCES STARDA(Codice)
    ON UPDATE CASCADE ON DELETE NO ACTION
    
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

DROP TRIGGER IF EXISTS VerificaDocumentoProponente;

delimiter $$

CREATE TRIGGER VerificaDocumentoProponente
AFTER INSERT ON PROPONENTE
FOR EACH ROW
BEGIN

	SELECT D.Scadenza INTO @scadenza
	FROM
		Proponente P 
        INNER JOIN
        Documento D ON P.NumeroDocumentoProponente = D.Numero
	WHERE 
		P.CodiceFiscale = NEW.CodiceFiscale;
        
	IF @scadenza < CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Documento scaduto! ';
	END IF;
    
END $$

delimiter ;

BEGIN ;
INSERT INTO PROPONENTE
VALUES
('nico1', 'nicola', 'pinna', 'attivo', '2013-01-10','4.25', '3349997771', 'SS374', 'ocin1', 'nico','1','2'),
('jack2', 'giacomo', 'sisti', 'attivo', '2013-02-02','4.52', '3231231234', 'MI444', 'kcaj2', 'jack','7','21'),
('vitt3', 'vittoria', 'rossi', 'attivo', '2013-06-15','4.25', '3359877895', 'QD134', 'ttiv7', 'vitt','8','102'),
('virg4', 'virginia', 'torelli', 'attivo', '2013-07-29','3.96', '3462468024', 'DP125', 'griv8', 'virg','12','16');
COMMIT ;



-- -------------------------------- --
--   Table structure for FRUITORE   --
-- -------------------------------- --
DROP TABLE IF EXISTS FRUITORE;
CREATE TABLE FRUITORE(
	CodiceFiscale CHAR(50) NOT NULL,
	Nome CHAR(50) NOT NULL,
	Cognome CHAR(50) NOT NULL,
	Stato CHAR(50) NOT NULL,
	DataIscrizione DATE NOT NULL,
	Rank_ DOUBLE(3,2) NOT NULL,
	NumeroTelefono CHAR(50) NOT NULL,
	Affidabilita CHAR(50) NOT NULL,
	NumeroDocumentoFruitore CHAR(50) NOT NULL,
	PasswordFruitore CHAR(50) NOT NULL,
	NomeUtenteFruitore CHAR(50) NOT NULL,
	Strada CHAR(50) NOT NULL,
	NumeroCivico INT(11) NOT NULL,
	PRIMARY KEY(CodiceFiscale),
    
	CONSTRAINT FK_Fruitore_Documeto
    FOREIGN KEY (NumeroDocumentoFruitore) REFERENCES DOCUMENTO(Numero)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Fruitore_Account
    FOREIGN KEY (PasswordFruitore, NomeUtenteFruitore) REFERENCES ACCOUNT(Password, NomeUtente)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Fruitore_Strada
    FOREIGN KEY (Strada) REFERENCES STARDA(Codice)
    ON UPDATE CASCADE ON DELETE NO ACTION
    
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

DROP TRIGGER IF EXISTS VerificaDocumentoFruitore;

delimiter $$

CREATE TRIGGER VerificaDocumentoFruitore
AFTER INSERT ON FRUITORE
FOR EACH ROW
BEGIN

	SELECT D.Scadenza INTO @scadenza
	FROM
		Fruitore F 
        INNER JOIN
        Documento D ON F.NumeroDocumentoFruitore = D.Numero
	WHERE
		F.CodiceFiscale = NEW.CodiceFiscale;
        
	IF @scadenza < CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Documento scaduto! ';
	END IF;
    
END $$

delimiter ;

BEGIN ;
INSERT INTO FRUITORE 
VALUES
('pier1','pier francesco','bigliazzi','attivo','2013-02-12','4.55','333 3423123','affidabile','AX123','reip1','pier','3','11'),
('pave2','pavel','priesniuc','attivo','2013-02-21','3.6','321 9988654','scarsamente affidabile','SX234','evap2','pave','4','12'), -- ha fatto un incidente
('marc3','marco','ralli','attivo','2013-03-11','5.95','347 0078415','molto affidabile','CC456','cram3','marc','1','1'),
('frav4','francesco','venturini','attivo','2013-03-18','0','354 6654267','0','VV567','varf4','frav','1','13'),
('gian5','niccolo','giannotti','attivo','2013-07-03','5.2','324 5678999','affidabile','AA678','naig9','gian','7','22'),
('tomm6','tommaso','vigiani','attivo','2013-08-30','5.42','377 88998475','non molto affidabile','SR789','mmot6','tomm','11','33'),
('pell7','federico','pellegrini','attivo','2013-11-12','2.7','325 4756987','fortemente affidabile','MP999','llep7','pell','12','14'),
('ture8','matteo','turetti','attivo','2013-04-12','4.39','348 7843218','affidabile','DM669','erut8','ture','11','12');
COMMIT;



-- -------------------------------- --
--   Table structure for OFFERTA    --
-- -------------------------------- --
DROP TABLE IF EXISTS OFFERTA;
CREATE TABLE OFFERTA(
	Autovettura CHAR (50) NOT NULL,
	CodiceFiscaleProponente CHAR(50) NOT NULL,
	Giorno CHAR(50) DEFAULT NULL,
	FasciaOraria CHAR(50) DEFAULT NULL,
	PRIMARY KEY(Autovettura),
    
    CONSTRAINT FK_Offerta_Autovettura
    FOREIGN KEY (Autovettura) REFERENCES AUTOVETTURA(Targa)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Offerta_Proponente
    FOREIGN KEY (CodiceFiscaleProponente) REFERENCES PROPONENTE(CodiceFiscale)
    ON UPDATE CASCADE ON DELETE NO ACTION
    
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO OFFERTA
VALUES
('EB 100 GX','jack2',null,null),
('EA 200 AA','jack2','lunedi-domenica','09:00:00-20:00:00'),
('DT 302 YX','vitt3',null,null),
('DA 100 SS','nico1','lunedi-domeica','08:00:00-21:00:00'),
('DV 123 AT','virg4',null,null),
('DS 221 BC','nico1',null,null);
COMMIT;



-- ----------------------------------- --
--   Table structure for OPTIONAL      --
-- ----------------------------------- --
DROP TABLE IF EXISTS OPTIONAL;
CREATE TABLE OPTIONAL(
	Descrizione VARCHAR (255) NOT NULL,
	Nome CHAR(50) NOT NULL,
	PRIMARY KEY(Descrizione)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO OPTIONAL
VALUES
('cerchi in lega cromati 30332','cerchi in lega'),
('fari antinebbia a led posizionabili','fari antinebbia'),
('sedili riscaldati in eco pelle','sedili pelle'),
('comandi al volante multipli ','comandi volante'),
('sensori avanzati dotati di telecamera posteriore','sensori'),
('navigatore serie 300 omnitel','navigatore satellitare'),
('pneumatici riscaldati battistrada 0,4mm','gomme'),
 ('sedili riscaldati in pelle','DT 3'),
('tavolini pieghevoli posteriori','tavolini'),
('dispositivo per la connessione all interno dell autovettura','bluetooth'),
('cambio automatico modello 321gk','cambio automatico');
COMMIT;



-- ----------------------------------- --
--      Table structure for POOL       --
-- ----------------------------------- --
DROP TABLE IF EXISTS POOL;
CREATE TABLE POOL(
	IDPool CHAR(50) NOT NULL ,
	GiornoArrivo DATE DEFAULT NULL,
	NumeroPasseggeri INT(11) NOT NULL DEFAULT 0, -- AGGIUNTO IL DEFAULT
	GiornoPartenza DATE NOT NULL,
	OrarioPartenza TIME NOT NULL,
	Stato CHAR(50) NOT NULL,
	Flessibilita CHAR(50) NOT NULL,
	Proponente CHAR(50) NOT NULL,
    Automobile CHAR(50) NOT NULL,
	PRIMARY KEY(IDPool),
    
	CONSTRAINT FK_Pool_Proponente
    FOREIGN KEY (Proponente) REFERENCES PROPONENTE(CodiceFiscale)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Pool_Autovettura
    FOREIGN KEY (Automobile) REFERENCES AUTOVETTURA(Targa)
    ON UPDATE CASCADE ON DELETE NO ACTION
  
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

DROP EVENT IF EXISTS stato_partito;

delimiter $$

CREATE EVENT stato_partito
ON SCHEDULE EVERY 1 MINUTE
STARTS '2013-01-02 00:00:01'
DO
BEGIN
	
	UPDATE POOL
    SET Stato = 'partito'
    WHERE 
		GiornoPartenza = CURRENT_DAY
        AND
        OrarioPartenza - INTERVAL 1 HOUR < CURRENT_TIME;
	
END $$

delimiter ;

DROP EVENT IF EXISTS stato_chiuso;

delimiter $$

CREATE EVENT stato_chiuso
ON SCHEDULE EVERY 1 DAY
STARTS '2013-01-02 00:00:01'
DO
BEGIN
	
	UPDATE POOL
    SET Stato = 'chiuso'
    WHERE 
		GiornoPartenza < CURRENT_DAY + 2;
	
END $$

delimiter ;

BEGIN ;
INSERT INTO POOL
VALUES
('p1',null,'2','2015-03-23','10:00:00','partito','alta','vitt3', 'DT 302 YX'), -- 2 fruitori gian e pier che chiede variazione A-2-1
('p2', null,'1','2013-12-22','15:00:00','partito','alta','virg4', 'DV 123 AT'), -- 1 fruitore con variazione, B - via11 o 12 - 1
('p3', '2018-05-19', '3', '2018-05-18','23:00:00','partito','bassa','virg4', 'DV 123 AT'), -- 3 fruitori
('p4', null, '0', '2019-04-12', '10:00:00', 'aperto', 'bassa', 'jack2', 'EB 100 GX'); -- aperto, deve passare a chiuso
COMMIT;



-- ------------------------------------------------ --
--   Table structure for PRENOTAZIONE DI NOLEGGIO   --
-- ------------------------------------------------ --
DROP TABLE IF EXISTS PRENOTAZIONE_DI_NOLEGGIO ;
CREATE TABLE PRENOTAZIONE_DI_NOLEGGIO (
   DataInizio DATE NOT NULL,
   DataFine DATE NOT NULL, 
   CodiceFiscaleFruitore CHAR(50) NOT NULL,
   TargaAutovettura CHAR(50) NOT NULL,
   PRIMARY KEY(DataInizio,DataFine,CodiceFiscaleFruitore),
   
   CONSTRAINT FK_Prenotazione_Di_Noleggio_Fruitore
   FOREIGN KEY (CodiceFiscaleFruitore) REFERENCES FRUITORE(CodiceFiscale)
   ON UPDATE CASCADE ON DELETE NO ACTION,
   
   CONSTRAINT FK_Prenotazione_Di_Noleggio_Autovettura
   FOREIGN KEY (TargaAutovettura) REFERENCES AUTOVETTURA(Targa)
   ON UPDATE CASCADE ON DELETE NO ACTION
	
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO PRENOTAZIONE_DI_NOLEGGIO
VALUES
('2013-03-01','2013-03-08','pier1','DA 100 SS'),
('2014-04-15','2014-04-27','pave2','DA 100 SS'),
('2014-07-01','2014-07-31','marc3','DA 100 SS'),
('2017-08-10','2017-08-20','tomm6','EA 200 AA');
COMMIT ;



-- ----------------------------------- --
--     Table structure for RICERCA     --
-- ----------------------------------- --
DROP TABLE IF EXISTS RICERCA;
CREATE TABLE RICERCA (
	CodiceFiscaleFruitore CHAR(50) NOT NULL,
    IDPool CHAR(50) NOT NULL,
    PRIMARY KEY (CodiceFiscaleFruitore, IDPool),
    
    CONSTRAINT FK_Ricerca_Fruitore
    FOREIGN KEY (CodiceFiscaleFruitore) REFERENCES FRUITORE(CodiceFiscale)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Ricerca_Pool
    FOREIGN KEY (IDPool) REFERENCES POOL(IDPool)
    ON UPDATE CASCADE ON DELETE NO ACTION
  
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO RICERCA
VALUES
('pier1', 'p1'),
('gian5', 'p1'),
('ture8', 'p2'),
('tomm6', 'p3'),
('pell7', 'p3'),
('ture8', 'p3');
COMMIT;



-- ----------------------------------- --
--    Table structure for POSIZIONE    --
-- ----------------------------------- --
DROP TABLE IF EXISTS POSIZIONE;
CREATE TABLE POSIZIONE (
	Longitudine DOUBLE(4,2) NOT NULL,
	Latitudine DOUBLE(4,2) NOT NULL,
	PRIMARY KEY(Longitudine, Latitudine)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO POSIZIONE
VALUES
('4', '0'), 
('8', '0'), 
('12', '0'), 
('16', '0'),
('20', '0'), 
('24', '0'), 
('28', '0'),
('28', '4'), 
('28', '8'), 
('28', '12'), 
('28', '16'),
('28', '20'), 
('28', '24'), 
('28', '28'), 
('0', '20'), 
('5', '21.5'), 
('10', '23'), 
('15', '24.5'), 
('20', '26'), 
('25', '27'), 
('-4', '0'), 
('-4', '4'), 
('-4', '8'),
('-4', '-12'),
('4', '-12'),
('3', '-9.5'), 
('6', '-6.8'), 
('9', '-4.2'), 
('12', '-1.7'), 
('28', '-4'),
('32', '0'), 
('36', '0'), 
 ('3', '3'), 
('6', '6'), 
('9', '9'), 
('12', '12'), 
('16', '14'), 
('16', '12'), 
('19', '9'), 
('22', '6'), 
('25', '3'), 
('32', '28'), 
('36', '28'), 
('36', '24'), 
('36', '20'), 
('0', '0'), 
('0', '4'), 
('0', '8'), 
('0', '12'), 
('0', '16'), 
('0', '-4'), 
('0', '-8'), 
('0', '-12');
COMMIT;



-- ----------------------------------- --
--     Table structure for SHARING     --
-- ----------------------------------- --
DROP TABLE IF EXISTS SHARING;
CREATE TABLE SHARING(
	OrarioPartenza TIMESTAMP NOT NULL, -- MODIFICARE IL NOME IN GIORNO???
    CodiceFiscaleProponente CHAR(50) NOT NULL,
    NumeroPasseggeri INT(11) NOT NULL,
    Veicolo CHAR(50) NOT NULL,
    PRIMARY KEY(OrarioPartenza, CodiceFiscaleProponente),
    
    CONSTRAINT FK_Sharing_Proponente
    FOREIGN KEY (CodiceFiscaleProponente) REFERENCES PROPONENTE(CodiceFiscale)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
	CONSTRAINT FK_Sharing_Autovettura
    FOREIGN KEY (Veicolo) REFERENCES AUTOVETTURA(Targa)
    ON UPDATE CASCADE ON DELETE NO ACTION
    
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO SHARING
VALUES
-- con tomm6 e pell7
('2014-03-03 14:00:00', 'virg4', '2', 'DV 123 AT'), -- cerchiamo di mettere due timestamp di fine corsa diversi
-- con gian5
('2015-07-09 10:00:00', 'jack2', '1', 'EB 100 GX'),
-- ancora nessuno
('2019-04-10 15:45:00', 'nico1', '0', 'DS 221 BC');
COMMIT ;



-- ----------------------------------- --
--    Table structure for SINISTRO     --
-- ----------------------------------- --
DROP TABLE IF EXISTS SINISTRO;
CREATE TABLE SINISTRO(
	Orario TIMESTAMP NOT NULL,
    TargaAutovettura CHAR(50) NOT NULL,
    Dinamica VARCHAR(255) NOT NULL,
    LongitudinePosizione DOUBLE(4,2) NOT NULL,
    LatitudinePosizione DOUBLE(4,2) NOT NULL,
    Fruitore CHAR(50) NOT NULL,
	PRIMARY KEY(Orario, TargaAutovettura),
    
    CONSTRAINT FK_Sinsitro_Fruitore
    FOREIGN KEY (Fruitore) REFERENCES FRUITORE(CodiceFiscale)
    ON UPDATE CASCADE ON DELETE NO ACTION,	
    
    CONSTRAINT FK_Sinsitro_Autovettura
    FOREIGN KEY (TargaAutovettura) REFERENCES AUTOVETTURA(Targa)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Sinsitro_Posizione1
    FOREIGN KEY (LongitudinePosizione,LatitudinePosizione) REFERENCES POSIZIONE(Longitudine,Latitudine)
    ON UPDATE CASCADE ON DELETE NO ACTION
    
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO SINISTRO
VALUES
-- Incidente subito da pave2 dalla Q7 nell incrocio fra via 14, via 3 e via 4
('2014-04-16 15:50:00', 'DA 100 SS', 'La autovettura Q7 Audit non ha oltrepassato l incrocio con il semaforo rosso', '0', '-12', 'pave2');

-- SEMMAI AGGIUNGI
COMMIT ;



-- ------------------------------------------------ --
--     Table structure for STATO VEICOLO    --
-- ------------------------------------------------ --
DROP TABLE IF EXISTS STATO_VEICOLO ;
CREATE TABLE STATO_VEICOLO (
   QuantitaCarburante INT(11) NOT NULL DEFAULT 0,
   KmPercorsi CHAR(50) NOT NULL, 
   Targa CHAR(50) NOT NULL,
   PRIMARY KEY(QuantitaCarburante,KmPercorsi,Targa),
   
   CONSTRAINT FK_Stato_Veicolo_Autovettura
   FOREIGN KEY (Targa) REFERENCES AUTOVETTURA(Targa)
   ON UPDATE CASCADE ON DELETE NO ACTION
    
	
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

DROP TRIGGER IF EXISTS ControlloSerbatoio;

delimiter $$
CREATE TRIGGER ControlloSerbatoio
AFTER INSERT ON STATO_VEICOLO
FOR EACH ROW
BEGIN
	SET @quantitaCarburante := (
				SELECT IF(SV.QuantitaCarburante = null, 0, SV.QuantitaCarburante)
				FROM Stato_Veicolo SV
				WHERE SV.Targa = NEW.Targa
	);
    
	IF (@quantitaCarburante >= NEW.QuantitaCarburante) THEN
		UPDATE AUTOVETTURA
        SET Disponibilita = 'si'
        WHERE Targa = NEW.Targa;
	ELSE
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Vai a fare benzina!';
        
	END IF;
    
END $$

delimiter ;

BEGIN ;
INSERT INTO STATO_VEICOLO 
VALUES
('0','120 600','EA 200 AA'),
('0','170 433','DA 100 SS');
COMMIT ;



-- ----------------------------------- --
--   Table structure for VARIAZIONE    --
-- ----------------------------------- --
DROP TABLE IF EXISTS VARIAZIONE;
CREATE TABLE VARIAZIONE (
	Codice CHAR(50) NOT NULL,
    Entita CHAR(50) NOT NULL,
    CodiceFiscaleFruitore CHAR(50) NOT NULL,
    PRIMARY KEY(Codice),
    
    CONSTRAINT FK_Variazione_Fruitore
    FOREIGN KEY (CodiceFiscaleFruitore) REFERENCES FRUITORE(CodiceFiscale)   
    ON UPDATE CASCADE ON DELETE NO ACTION

) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO VARIAZIONE
VALUES
('var1', '1 stella', 'pier1'),
('var2', '1 stella', 'ture8');
COMMIT ;



-- ------------------------------------------------ --
--     Table structure for TEMPI FINE CORSA    --
-- ------------------------------------------------ --
DROP TABLE IF EXISTS TEMPI_FINE_CORSA ;
CREATE TABLE TEMPI_FINE_CORSA  (
   Timestamp_ TIMESTAMP NOT NULL,
   OrarioPartenza TIMESTAMP NOT NULL, 
   Proponente CHAR(50) NOT NULL,
   PRIMARY KEY(Timestamp_),
   
    CONSTRAINT FK_Tempi_Fine_Corsa_Posizione
    FOREIGN KEY (OrarioPartenza) REFERENCES SHARING(OrarioPartenza) 
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Tempi_Fine_Corsa_Proponente
    FOREIGN KEY (Proponente) REFERENCES PROPONENTE(CodiceFiscale) 
    ON UPDATE CASCADE ON DELETE NO ACTION
	
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO TEMPI_FINE_CORSA 
VALUES
('2014-03-03 14:25:33','2014-03-03 14:00:00','virg4'), -- strade 17-13
('2014-03-03 14:30:22','2014-03-03 14:00:00','virg4'), -- strade 17-13
('2015-07-09 11:18:00','2015-07-09 10:00:00','jack2'); -- strade 13-15-17
COMMIT ;



-- ----------------------------------- --
--     Table structure for VETTURA2      --
-- ----------------------------------- --
DROP TABLE IF EXISTS VETTURA2 ;
CREATE TABLE VETTURA2  (
   Targa CHAR(50) NOT NULL,
   Orario CHAR(50) NOT NULL,
   TargaAutovettura CHAR(50) NOT NULL,
	PRIMARY KEY(Targa,Orario,TargaAutovettura),
    
    CONSTRAINT FK_Vettura2_Autovettura
    FOREIGN KEY (Targa) REFERENCES AUTOVETTURA(Targa) 
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Vettura2_Autovettura_Esterna
    FOREIGN KEY (TargaAutovettura) REFERENCES AUTOVETTURA_ESTERNA(Targa) 
    ON UPDATE CASCADE ON DELETE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO VETTURA2 
VALUES
('DA 300 WQ','2014-04-2018 15:50:00','DA 100 SS'),
('FA 454 XC','2015-07-09 10:50:00','EA 200 AA');
COMMIT ;


-- ----------------------------------- --
--   Table structure for VALUTAZIONE   --
-- ----------------------------------- --
DROP TABLE IF EXISTS VALUTAZIONE ;
CREATE TABLE VALUTAZIONE  (
   Codice INT(50) AUTO_INCREMENT,
   StelleSerieta INT(11) NOT NULL,
   StelleComportamento INT(11) NOT NULL,
   StellePersona INT(11) NOT NULL,
   StelleViaggio INT(11) NOT NULL,
   RecensioneTestuale VARCHAR(255) NOT NULL,
   CodiceFiscaleProponente CHAR(50) NOT NULL,
   CodiceFiscaleFruitore CHAR(50) NOT NULL,
   DaFruitore CHAR(50) NOT NULL,
   DaProponente CHAR(50) NOT NULL,
   OrarioPartenzaValutazioneSharing TIMESTAMP DEFAULT NULL,
   CodiceProponenteValutazioneSharing CHAR(50) DEFAULT NULL,
   DataInizioValutazioneNoleggio DATE DEFAULT NULL,
   DataFineValutazioneNoleggio DATE DEFAULT NULL,
   CodiceFruitoreValutazioneNoleggio CHAR(50) DEFAULT NULL,
   IDPoolValutazionePool CHAR(50) DEFAULT NULL,
   PRIMARY KEY(Codice),
    
   CONSTRAINT FK_Valutazione_Proponente
   FOREIGN KEY (CodiceFiscaleProponente) REFERENCES PROPONENTE(CodiceFiscale)
   ON UPDATE CASCADE ON DELETE NO ACTION,
   
   CONSTRAINT FK_Valutazione_Sharing
   FOREIGN KEY (OrarioPartenzaValutazioneSharing, CodiceProponenteValutazioneSharing) REFERENCES SHARING(OrarioPartenza, CodiceFiscaleProponente)
   ON UPDATE CASCADE ON DELETE NO ACTION,
   
   CONSTRAINT FK_Valutazione_Fruitore
   FOREIGN KEY (CodiceFiscaleFruitore) REFERENCES FRUITORE(CodiceFiscale)
   ON UPDATE CASCADE ON DELETE NO ACTION,
   
   CONSTRAINT FK_Valutazione_Prenotazione_Di_Noleggio
   FOREIGN KEY (DataInizioValutazioneNoleggio, DataFineValutazioneNoleggio, CodiceFruitoreValutazioneNoleggio) REFERENCES PRENOTAZIONE_DI_NOLEGGIO(DataInizio, DataFine, CodiceFiscaleFruitore)
   ON UPDATE CASCADE ON DELETE NO ACTION,

   CONSTRAINT FK_Valutazione_Pool
   FOREIGN KEY (IDPoolValutazionePool) REFERENCES POOL(IDPool)
   ON UPDATE CASCADE ON DELETE NO ACTION
  
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO VALUTAZIONE (StelleSerieta, StelleComportamento, StellePersona, StelleViaggio, RecensioneTestuale, CodiceFiscaleProponente,
 CodiceFiscaleFruitore, DaFruitore, DaProponente, OrarioPartenzaValutazioneSharing, CodiceProponenteValutazioneSharing, DataInizioValutazioneNoleggio, 
 DataFineValutazioneNoleggio, CodiceFruitoreValutazioneNoleggio, IDPoolValutazionePool)
VALUES
('2','3','4','5','persona poco seria ritardo 5 10 min,per il resto mi sono trovato bene','virg4','ture8','si','no', null, null, null, null, null, 'p2'),-- pool virg4 con ture8 
('4','4','4','5','mi sono trovato complessivamente bene','virg4','ture8','no','si', null, null, null, null, null, 'p2'),-- pool virg4con ture 8
('4','2','2','5','esclusa la puntualità esperienza da non ripetere','virg4','pell7','si','no', '2014-03-03 14:00:00', 'virg4', null, null, null, null), -- sharing virg4 con tomm6 pell7 --
('4','3','3','4','complessivamnete positivo','virg4','tomm6','si','no', '2014-03-03 14:00:00', 'virg4', null, null, null, null), -- sharing virg4 con tomm6 pell7 --
('4','3','4','5','viaggio tranquillo,persona non molto simpatica','virg4','tomm6','no','si', '2014-03-03 14:00:00', 'virg4', null, null, null, null),-- sharing virg4 con tomm6 pell7 --
('3','3','2','4','esperienza non positiva,persona poco educata e non puntuale','virg4','pell7','no','si', '2014-03-03 14:00:00', 'virg4', null, null, null, null),-- sharing virg4 con tomm6 pell7 --
('2','3','4','5','persona poco seria ritardo 5 10 min,per il resto mi sono trovato bene','vitt3','gian5','si','no', null, null, null, null, null, 'p1'), -- pool vitt3 con pier1 gian5 --
('2','3','4','4','persona poco seria ritardo poco educata,complessivamente positivo','vitt3','pier1','si','no', null, null, null, null, null, 'p1'), -- pool vitt3 con pier1 gian5 --
('5','5','5','5','tutto perfetto','vitt3','pier1','no','si', null, null, null, null, null, 'p1'), -- pool vitt3 con pier1 gian5 --
('3','3','3','5','viaggio complessivamente positivo','vitt3','gian5','no','si', null, null, null, null, null, 'p1'), -- pool vitt3 con pier1 gian5 --
('5','5','5','5','esperienza molto positivaa in tutti gli aspetti','jack2','gian5','si','no', '2015-07-09 10:00:00', 'jack2', null, null, null, null),-- sharing jack2 con gina5
('4','5','5','4','persona cordiale,puntuale,viaggio tranquillo','jack2','gian5','no','si', '2015-07-09 10:00:00', 'jack2', null, null, null, null),-- sharing jack2 con gian5
('1','4','4','4','persona poco seria ritardo 5 10 min,per il resto mi sono trovato bene','virg4','ture8','si','no', null, null, null, null, null, 'p3'),-- pool virg4 con tomm6 pell7 ture8 --
('1','1','1','2','pessima esperienza in tutto','virg4','pell7','si','no', null, null, null, null, null, 'p3'),-- pool virg4 con tomm6 pell7 ture8 --
('5','5','3','3','viaggio un pò lento,per il resto mi sono trovato bene','virg4','tomm6','si','no', null, null, null, null, null, 'p3'),-- pool virg4 con tomm6 pell7 ture8 --
('4','3','3','4','persona poco educata,per il resto mi sono trovato bene','virg4','pell7','no','si', null, null, null, null, null, 'p3'),-- pool virg4 con tomm6 pell7 ture8 --
('5','5','5','5','tutto perfetto','virg4','ture8','no','si', null, null, null, null, null, 'p3'),-- pool virg4 con tomm6 pell7 ture8 --
('4','3','4','5','persona poco seria ritardo 5 10 min,per il resto mi sono trovato bene','virg4','tomm6','no','si', null, null, null, null, null, 'p3'),-- pool virg4 con tomm6 pell7 ture8 --
('3','5','5','2','noleggio positivo anche se la macchina presenta dei graffi sul cerchione posteriore dx','jack2','pier1','si','no', null, null, '2013-03-01', '2013-03-08', 'pier1', null), -- noleggio macchina nico1 da pier
('4','4','4','4','persona cordiale,puntuale,macchina perfetta','jack2','pier1','no','si', null, null, '2013-03-01', '2013-03-08', 'pier1', null),  -- noleggio macchina nico1 da pier
('4','3','2','4','persona poco cordiale, sbrigativa','nico1','pave2','si','no', null, null, '2014-04-15', '2014-04-27', 'pave2', null), -- noleggio macchina nico1 da pave 2
('5','5','5','5','macchina perfetta, proponente simpatico','nico1','pave2','no','si', null, null, '2014-04-15', '2014-04-27', 'pave2', null), -- noleggio macchina nico1 da pave 2
('4','3','5','5','persona cordiale,puntuale,macchina consegnata in perfette condizoni','nico1','marc3','si','no', null, null, '2014-07-01', '2014-07-31', 'marc3', null), -- noleggio macchina nico1 da marc3
('4','3','3','4','persona cordiale,puntuale,viaggio tranquillo','nico1','marc3','no','si', null, null, '2014-07-01', '2014-07-31', 'marc3', null), -- noleggio macchina nico1 da marc3
('5','5','5','5','macchina consegnata in perfette condizioni,puntuale alla consegna, complessivamente ottima esperienza','jack2','tomm6','no','si', null, null, '2017-08-10', '2017-08-20', 'tomm6', null),  -- noleggio macchina jack2 da tomm6
('5','5','5','5','macchina pulita e comoda,persona molto simpatica, ottima esperienza','jack2','tomm6','no','si', null, null, '2017-08-10', '2017-08-20', 'tomm6', null);  -- noleggio macchina jack2 da tomm6
COMMIT ;



-- ------------------------------------------------ --
--     Table structure for PRENOTAZIONE_DI_POOL    --
-- ------------------------------------------------ --
DROP TABLE IF EXISTS PRENOTAZIONE_DI_POOL ;
CREATE TABLE PRENOTAZIONE_DI_POOL (
   Codice CHAR(50) NOT NULL,
   Approvazione CHAR(50) NOT NULL, 
   Pool CHAR(50) NOT NULL,
   CodiceFiscaleFruitore CHAR(50) NOT NULL,
   PRIMARY KEY(Codice),
   
   CONSTRAINT FK_Prenotazione_di_pool_Pool
   FOREIGN KEY (Pool) REFERENCES POOL(IDPool)
   ON UPDATE CASCADE ON DELETE NO ACTION,
   
   CONSTRAINT FK_Prenotazione_di_pool_Fruitore
   FOREIGN KEY (CodiceFiscaleFruitore) REFERENCES FRUITORE(CodiceFiscale)
   ON UPDATE CASCADE ON DELETE NO ACTION
	
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO PRENOTAZIONE_DI_POOL
VALUES
('CP0','si','p1','gian5'),
('CP1','si','p1','pier1'),
('CP2','si','p2','ture8'),
('CP3','no','p2','pave2'),
('CP4','si','p3','tomm6'),
('CP5','si','p3','pell7'),
('CP6','si','p3','ture8'),
('CP7','no','p3','pier1');
COMMIT ;



-- ------------------------------------------------ --
--     Table structure for LIMITE_VELOCITA'   --
-- ------------------------------------------------ --
DROP TABLE IF EXISTS LIMITE_VELOCITA ;
CREATE TABLE LIMITE_VELOCITA (
   Kmh INT(11) NOT NULL,
   CodiceStrada INT(50) NOT NULL, 
   PRIMARY KEY(Kmh,CodiceStrada),
   
   CONSTRAINT FK_Limite_Velocita_Strada
   FOREIGN KEY (CodiceStrada) REFERENCES STRADA(Codice)
   ON UPDATE CASCADE ON DELETE CASCADE
	
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO LIMITE_VELOCITA
VALUES
('30','1'),
('30','2'),
('30','3'),
('30','4'),
('50','5'),
('70','6'),
('30','7'),
('30','8'),
('80','9'),
('50','9'),
('70','10'),
('50','10'),
('30','11'),
('30','12'),
('70','13'),
('80','13'),
('50','13'),
('50','14'),
('90','15'),
('120','15'),
('90','16'),
('120','16'),
('70','17'),
('50','17');
COMMIT ;



-- ------------------------------------------------ --
--          Table structure for PEDAGGIO            --
-- ------------------------------------------------ --
DROP TABLE IF EXISTS PEDAGGIO ;
CREATE TABLE PEDAGGIO (
   Codice CHAR(50) NOT NULL,
   Tariffa DOUBLE(3,2) NOT NULL,
   Km1 INT(11) NOT NULL,
   Km2 INT(11) NOT NULL,
   CodStrada INT(11) NOT NULL,
   PRIMARY KEY(Codice),
 
   CONSTRAINT FK_Pedaggio_Km_Strada1
   FOREIGN KEY (Km1) REFERENCES KM_STRADA(Valore) 
   ON UPDATE CASCADE ON DELETE NO ACTION,
   
   CONSTRAINT FK_Pedaggio_Km_Strada2
   FOREIGN KEY (Km2) REFERENCES KM_STRADA(Valore) 
   ON UPDATE CASCADE ON DELETE NO ACTION,
   
   CONSTRAINT FK_Pedaggio_Strada
   FOREIGN KEY (CodStrada) REFERENCES STRADA(Codice) 
   ON UPDATE CASCADE ON DELETE NO ACTION
  
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO PEDAGGIO
VALUES
('ped0','1', '77', '77', '15'),
('ped1','1.50', '77', '77', '15'),
('ped2','0.30', '12', '12', '16');
COMMIT ;



-- ----------------------------------- --
--    Table structure for TRACKING     --
-- ----------------------------------- --
DROP TABLE IF EXISTS TRACKING;
CREATE TABLE TRACKING (
	Timestamp TIMESTAMP NOT NULL,
    Targa Char(50) NOT NULL, 
    Longitudine DOUBLE(4,2) NOT NULL, 
    Latitudine DOUBLE(4,2) NOT NULL,
    CodiceStrada INT(11) NOT NULL,
    PRIMARY KEY(Timestamp, Targa),
    
    CONSTRAINT FK_Tracking_Autovettura
    FOREIGN KEY (Targa) REFERENCES AUTOVETTURA(Targa)
    ON UPDATE CASCADE ON DELETE NO ACTION,
	
	CONSTRAINT FK_Tracking_Strada
    FOREIGN KEY (CodiceStrada) REFERENCES STRADA(Codice)
    ON UPDATE CASCADE ON DELETE NO ACTION
    
    
    -- -------------------------------------------------------------------------------------------------------------------
) ENGINE = InnoDB DEFAULT CHARSET=latin1;


BEGIN ;
INSERT INTO TRACKING
VALUES

-- TRACKING DELLO SHARING DI virg4 CON tomm6 e pell7
-- PRIMA TRATTA
('2014-03-03 14:00:00', 'DV 123 AT', '28', '28','17'), ('2014-03-03 14:10:00', 'DV 123 AT', '20', '26','17'), ('2014-03-03 14:20:00', 'DV 123 AT', '5', '21.5','17'), 
('2014-03-03 14:01:00', 'DV 123 AT', '28', '28','17'), ('2014-03-03 14:11:00', 'DV 123 AT', '15', '24.5','17'), ('2014-03-03 14:21:00', 'DV 123 AT', '5', '21.5','17'), 
('2014-03-03 14:02:00', 'DV 123 AT', '28', '28','17'), ('2014-03-03 14:12:00', 'DV 123 AT', '15', '24.5',' 17'), ('2014-03-03 14:22:00', 'DV 123 AT', '5', '21.5','17'), 
('2014-03-03 14:03:00', 'DV 123 AT', '25', '27','17'), ('2014-03-03 14:13:00', 'DV 123 AT', '15', '24','17'), ('2014-03-03 14:23:00', 'DV 123 AT', '5', '21.5','17'), 
('2014-03-03 14:04:00', 'DV 123 AT', '25', '27','17'), ('2014-03-03 14:14:00', 'DV 123 AT', '15', '24.5','17'), ('2014-03-03 14:24:00', 'DV 123 AT', '0', '20','17'), 
('2014-03-03 14:05:00', 'DV 123 AT', '25', '27','17'), ('2014-03-03 14:15:00', 'DV 123 AT', '10', '23','17'), ('2014-03-03 14:25:00', 'DV 123 AT', '0', '20','17'), 
('2014-03-03 14:06:00', 'DV 123 AT', '25', '27','17'), ('2014-03-03 14:16:00', 'DV 123 AT', '10', '23','17'), ('2014-03-03 14:26:00', 'DV 123 AT', '0', '20','17'), 
('2014-03-03 14:07:00', 'DV 123 AT', '20', '26','17'), ('2014-03-03 14:17:00', 'DV 123 AT', '10', '23','17'), ('2014-03-03 14:27:00', 'DV 123 AT', '0', '20','17'), 
('2014-03-03 14:08:00', 'DV 123 AT', '20', '26','17'), ('2014-03-03 14:18:00', 'DV 123 AT', '10', '23','17'), ('2014-03-03 14:28:00', 'DV 123 AT', '0', '20','17'), 
('2014-03-03 14:09:00', 'DV 123 AT', '20', '26','17'), ('2014-03-03 14:19:00', 'DV 123 AT', '5', '21.5','17'), ('2014-03-03 14:29:00', 'DV 123 AT', '0', '20','17'), 
-- SECONDA TRATTA
('2014-03-03 14:30:00', 'DV 123 AT', '0', '20','13'), ('2014-03-03 14:40:00', 'DV 123 AT', '0', '12','13'), ('2014-03-03 14:50:00', 'DV 123 AT', '0', '4','13'), 
('2014-03-03 14:31:00', 'DV 123 AT', '0', '20','13'), ('2014-03-03 14:41:00', 'DV 123 AT', '0', '12','13'), ('2014-03-03 14:51:00', 'DV 123 AT', '0', '4','13'), 
('2014-03-03 14:32:00', 'DV 123 AT', '0', '20','13'), ('2014-03-03 14:42:00', 'DV 123 AT', '0', '12','13'), ('2014-03-03 14:52:00', 'DV 123 AT', '0', '4','13'), 
('2014-03-03 14:33:00', 'DV 123 AT', '0', '20','13'), ('2014-03-03 14:43:00', 'DV 123 AT', '0', '12','13'), ('2014-03-03 14:53:00', 'DV 123 AT', '0', '4','13'), 
('2014-03-03 14:34:00', 'DV 123 AT', '0', '16','13'), ('2014-03-03 14:44:00', 'DV 123 AT', '0', '12','13'), ('2014-03-03 14:54:00', 'DV 123 AT', '0', '4','13'), 
('2014-03-03 14:35:00', 'DV 123 AT', '0', '16','13'), ('2014-03-03 14:45:00', 'DV 123 AT', '0', '12','13'), ('2014-03-03 14:55:00', 'DV 123 AT', '0', '0','13'), 
('2014-03-03 14:36:00', 'DV 123 AT', '0', '16','13'), ('2014-03-03 14:46:00', 'DV 123 AT', '0', '8','13'), ('2014-03-03 14:56:00', 'DV 123 AT', '0', '0','13'), 
('2014-03-03 14:37:00', 'DV 123 AT', '0', '16','13'), ('2014-03-03 14:47:00', 'DV 123 AT', '0', '8','13'), ('2014-03-03 14:57:00', 'DV 123 AT', '0', '0','13'), 
('2014-03-03 14:38:00', 'DV 123 AT', '0', '12','13'), ('2014-03-03 14:48:00', 'DV 123 AT', '0', '8','13'), ('2014-03-03 14:58:00', 'DV 123 AT', '0', '0','13'), 
('2014-03-03 14:39:00', 'DV 123 AT', '0', '12','13'), ('2014-03-03 14:49:00', 'DV 123 AT', '0', '8','13'), ('2014-03-03 14:59:00', 'DV 123 AT', '0', '0','13'), 
('2014-03-03 15:00:00', 'DV 123 AT', '0', '0','13'), 

-- TRACKING DEL NOLEGGIO DI pave2 e macchina di nico1 CON INCIDENTE
-- 1° GIORNO PRIMA TRATTA
('2014-04-15 18:00:00', 'DA 100 SS', '-4', '0','2'), ('2014-04-15 18:03:00', 'DA 100 SS', '0', '0','2'), 
('2014-04-15 18:01:00', 'DA 100 SS', '-4', '0','2'), ('2014-04-15 18:04:00', 'DA 100 SS', '0', '0','2'), 
('2014-04-15 18:02:00', 'DA 100 SS', '-4', '0','2'), 
 
-- 1° GIORNO SECONDA TRATTA
('2014-04-15 18:05:00', 'DA 100 SS', '0', '0','14'), ('2014-04-15 18:10:00', 'DA 100 SS', '0', '-4','14'), 
('2014-04-15 18:06:00', 'DA 100 SS', '0', '0','14'), ('2014-04-15 18:11:00', 'DA 100 SS', '0', '-8','14'), 
('2014-04-15 18:07:00', 'DA 100 SS', '0', '0','14'), ('2014-04-15 18:12:00', 'DA 100 SS', '0', '-8','14'), 
('2014-04-15 18:08:00', 'DA 100 SS', '0', '-4','14'), ('2014-04-15 18:13:00', 'DA 100 SS', '0', '-12','14'), 
('2014-04-15 18:09:00', 'DA 100 SS', '0', '-4','14'), ('2014-04-15 18:14:00', 'DA 100 SS', '0', '-12','14'), 

-- 1° GIORNO TERZA TRATTA
('2014-04-15 18:15:00', 'DA 100 SS', '0', '-12','4'), ('2014-04-15 18:17:00', 'DA 100 SS', '0', '-12','4'), 
('2014-04-15 18:16:00', 'DA 100 SS', '0', '-12','4'), ('2014-04-15 18:18:00', 'DA 100 SS', '4', '-12','4'), 

-- 2° GIORNO PRIMA TRATTA CON INCIDENTE
('2014-04-15 15:45:00', 'DA 100 SS', '4', '-12','4'), ('2014-04-15 15:47:00', 'DA 100 SS', '4', '-12','4'), 
('2014-04-15 15:46:00', 'DA 100 SS', '4', '-12','4'), ('2014-04-15 15:48:00', 'DA 100 SS', '4', '-12','4'), 
('2014-04-15 15:49:00', 'DA 100 SS', '0', '-12','4'), 
-- INCIDENTE
('2014-04-15 15:50:00', 'DA 100 SS', '0', '-12','4'), 
('2014-04-15 15:51:00', 'DA 100 SS', '0', '-12','4'), 
('2014-04-15 15:52:00', 'DA 100 SS', '0', '-12','4'), 
('2014-04-15 15:53:00', 'DA 100 SS', '0', '-12','4'), 
('2014-04-15 15:54:00', 'DA 100 SS', '0', '-12','4'), 
('2014-04-15 15:55:00', 'DA 100 SS', '0', '-12','4'), 
('2014-04-15 15:56:00', 'DA 100 SS', '0', '-12','4'), 
('2014-04-15 15:57:00', 'DA 100 SS', '0', '-12','4'), 
('2014-04-15 15:58:00', 'DA 100 SS', '0', '-12','4');
COMMIT ;



-- ------------------------------------------------ --
--            Table structure for SPESA             --
-- ------------------------------------------------ --
DROP TABLE IF EXISTS SPESA ;
CREATE TABLE SPESA (
   IDSpesaPool CHAR(50) NOT NULL,
   CostoAttualeCarburante DOUBLE(4,3) NOT NULL,
   Importo INT(11) NOT NULL,
  
   PRIMARY KEY(IDSPesaPool),
   
   CONSTRAINT FK_Spesa_Pool
   FOREIGN KEY (IDSpesaPool) REFERENCES POOL(IDPool)
   ON UPDATE CASCADE ON DELETE NO ACTION
   
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO SPESA
VALUES
('p1','1.345','50'),
('p2','1.665','70'),
('p3','1.456','80'),
('p4','1.321','90');
COMMIT ;



-- ----------------------------------- --
--    Table structure for MODIFICA     --
-- ----------------------------------- --
DROP TABLE IF EXISTS MODIFICA;
CREATE TABLE MODIFICA (
	CodiceVariazione CHAR(50) NOT NULL,
    Sequenza INT(11) NOT NULL,
    CodiceTratta CHAR(50) NOT NULL,
    Sostituzione INT(11) NOT NULL,
    PRIMARY KEY(CodiceVariazione, Sequenza, CodiceTratta),
    
    CONSTRAINT FK_Modifica_Tratta
    FOREIGN KEY (CodiceTratta,Sequenza) REFERENCES TRATTA(Codice,Sequenza)
    ON UPDATE CASCADE ON DELETE NO ACTION,
  
    CONSTRAINT FK_Modifica_Variazione
    FOREIGN KEY (CodiceVariazione) REFERENCES VARIAZIONE(Codice)
    ON UPDATE CASCADE ON DELETE NO ACTION
	
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO MODIFICA
VALUES
( 'var1', '1', 't8', '0'),
( 'var1', '2', 't8', '0'),
( 'var2', '1', 't9', '0'),
( 'var2', '2', 't9', '0');
COMMIT ;



-- ----------------------------------- --
--     Table structure for TARGET      --
-- ----------------------------------- --
DROP TABLE IF EXISTS TARGET;
CREATE TABLE TARGET (
	IDPool CHAR(50) NOT NULL,
    CodiceVariazione CHAR(50) NOT NULL,
    PRIMARY KEY (IDPool, CodiceVariazione),
    
    CONSTRAINT FK_Target_Tratta
    FOREIGN KEY (IDPool) REFERENCES POOL(IDPool)
    ON UPDATE CASCADE ON DELETE NO ACTION,
  
    CONSTRAINT FK_Target_Variazione
    FOREIGN KEY (CodiceVariazione) REFERENCES VARIAZIONE(Codice)
    ON UPDATE CASCADE ON DELETE NO ACTION
	
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO TARGET
VALUES
('p1', 'var1'), 
('p2', 'var2');
COMMIT ;



-- ----------------------------------- --
--    Table structure for PERCORSO     --
-- ----------------------------------- --
DROP TABLE IF EXISTS PERCORSO;
CREATE TABLE PERCORSO (
	Sequenza INT(11) NOT NULL, 
    CodiceTratta CHAR(50) NOT NULL,
    OrarioDiPartenza TIMESTAMP NOT NULL,
    CodiceProponente CHAR(50) NOT NULL,
    PRIMARY KEY(Sequenza, CodiceTratta, OrarioDiPartenza, CodiceProponente),
    
    CONSTRAINT FK_Percorso_Tratta
    FOREIGN KEY (CodiceTratta,Sequenza) REFERENCES TRATTA(Codice,Sequenza)
    ON UPDATE CASCADE ON DELETE NO ACTION,
  
    CONSTRAINT FK_Percorso_Sharing
    FOREIGN KEY (OrarioDiPartenza,CodiceProponente) REFERENCES SHARING(OrarioPartenza,CodiceFiscaleProponente)
    ON UPDATE CASCADE ON DELETE NO ACTION
	
    
    -- foregin key
    
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO PERCORSO
VALUES
('1', 't5', '2014-03-03 14:00:00', 'virg4'),
('2', 't5', '2014-03-03 14:00:00', 'virg4'),
('1', 't6', '2015-07-09 10:00:00', 'jack2'),
('2', 't6', '2015-07-09 10:00:00', 'jack2'),
('3', 't6', '2015-07-09 10:00:00', 'jack2'),
('1', 't7', '2019-04-10 15:45:00', 'nico1'),
('2', 't7', '2019-04-10 15:45:00', 'nico1'),
('3', 't7', '2019-04-10 15:45:00', 'nico1'),
('4', 't7', '2019-04-10 15:45:00', 'nico1');
COMMIT ;



-- ----------------------------------- --
--    Table structure for STRUTTURA     --
-- ----------------------------------- --
DROP TABLE IF EXISTS STRUTTURA;
CREATE TABLE STRUTTURA (
	IDStruttura CHAR(50) NOT NULL,
    SequenzaStruttura INT(11) NOT NULL,
    CodiceStruttura CHAR(50) NOT NULL,
    PRIMARY KEY(IDStruttura, SequenzaStruttura, CodiceStruttura),
    
	CONSTRAINT FK_Struttura_Tratta
    FOREIGN KEY (CodiceStruttura,SequenzaStruttura) REFERENCES TRATTA(Codice,Sequenza)
    ON UPDATE CASCADE ON DELETE NO ACTION,
  
    CONSTRAINT FK_Struttura_Pool
    FOREIGN KEY (IDStruttura) REFERENCES POOL(IDPOOL)
    ON UPDATE CASCADE ON DELETE NO ACTION

    
    -- foregin key
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO STRUTTURA
VALUES
('p1', '1', 't1'),
('p2', '1', 't2'),
('p2', '2', 't2'),
('p3', '1', 't3'),
('p3', '2', 't3'),
('p3', '3', 't3'),
('p3	', '4', 't3'),
('p4', '1', 't4');
COMMIT ;



-- ----------------------------------- --
--    Table structure for LOCAZIONE     --
-- ----------------------------------- --
DROP TABLE IF EXISTS LOCAZIONE;
CREATE TABLE LOCAZIONE (
	CodiceChiamata INT(11) NOT NULL,
    Longitudine DOUBLE(4,2) NOT NULL, 
    Latitudine DOUBLE (4,2) NOT NULL,
    Desiderata_Attuale CHAR(50) NOT NULL,
    PRIMARY KEY(CodiceChiamata, Longitudine, Latitudine),
    
    CONSTRAINT FK_Locazione_Chiamata
    FOREIGN KEY (CodiceChiamata) REFERENCES CHIAMATA(Codice)
    ON UPDATE CASCADE ON DELETE NO ACTION,
  
    CONSTRAINT FK_Locazione_Posizione
    FOREIGN KEY (Longitudine,Latitudine) REFERENCES POSIZIONE(Longitudine,Latitudine)
    ON UPDATE CASCADE ON DELETE NO ACTION

    
    -- foregin key
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO LOCAZIONE
VALUES
('1', '28', '28', 'attuale'), 
('1', '0', '0', 'desiderata'),  
('2', '28', '28', 'attuale'), 
('2', '0', '0', 'desiderata'), 
('3', '28', '0', 'attuale'), 
('3', '28', '28', 'desiderata'), 
('4', '28', '28', 'attuale'), 
('4', '0', '0', 'desiderata'), 
('5', '28', '0', 'attuale'), 
('5', '28', '28', 'desiderata'), 
('6', '0', '0', 'attuale'), 
('6', '36', '24', 'desiderata');
COMMIT ;


  
-- ----------------------------------- --
--     Table structure for TRATTA      --
-- ----------------------------------- --
DROP TABLE IF EXISTS TRATTA;
CREATE TABLE TRATTA (
    Codice CHAR(50) NOT NULL,
    Sequenza INT(11) NOT NULL,
    KmPercorsi DOUBLE(6,3) NOT NULL,
    Giorno DATE NOT NULL,
    FasciaOraria CHAR(50) NOT NULL,
    Strada INT(50) NOT NULL,
	Longitudine1 DOUBLE(4,2) NOT NULL,
	Latitudine1 DOUBLE(4,2) NOT NULL,
	Longitudine2 DOUBLE(4,2) NOT NULL,
	Latitudine2 DOUBLE(4,2) NOT NULL,
    PRIMARY KEY (Codice, Sequenza),
    
    CONSTRAINT FK_Tratta_Strada
    FOREIGN KEY (Strada) REFERENCES STRADA(Codice)
    ON UPDATE CASCADE ON DELETE NO ACTION,			
	
	CONSTRAINT FK_Tratta_Posizione1
    FOREIGN KEY (Longitudine1,Latitudine1) REFERENCES POSIZIONE(Longitudine, Latitudine) 
    ON UPDATE CASCADE ON DELETE NO ACTION,
   
    CONSTRAINT FK_Tratta_Posizione2
    FOREIGN KEY (Longitudine2,Latitudine2) REFERENCES POSIZIONE(Longitudine, Latitudine) 
    ON UPDATE CASCADE ON DELETE NO ACTION

) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO TRATTA
VALUES
-- POOL
-- pool vitt3 con pier1 e gian5 e variazione
-- VA AGGIUNTO IL TRATTO PRE-ESISTENTE E SOSTITUITO DALLA VARIAZIONE!!!!!!!!!!
-- NON SU TRACKING
('t1', '1', '0.028', '2015-03-23', '10:00-10:30', '15','28','0','0','0'),
('t8', '1', '0.018', '2015-03-23', '10:15-10:35', '5','16','0','0','-12'),
('t8', '2', '0.012', '2015-03-23', '10:35-10:50', '14','0','-12','0','0'),
-- pool virg4 con ture8 e variazione
-- NON SU TRACKING
('t9', '1', '0.004', '2013-12-22', '15:00-15:05', '11','28','28','32','28'),
('t9', '2', '0.004', '2013-12-22', '15:05-15:10', '11','32','28','28','28'),
('t2', '1', '0.030', '2013-12-22', '15:00-15:30', '17','28','28','0','20'), 
('t2', '2', '0.020', '2013-12-22', '15:30-16:00', '13','0','20','0','0'), 
-- pool virg4 con tomm6, pell7 e ture8
-- NON SU TRACKING
('t3', '1', '0.028', '2018-05-18', '23:00-23:30', '16','28','28','28','0'),
('t3', '2', '0.020', '2018-05-18', '23:30-23:59', '10','0','28','16','14'),
('t3', '3', '0.020', '2018-05-19', '0:00-0:20', '9','16','14','0','0'),
('t3', '4', '0.012', '2018-05-19', '00:20-00:30', '14','0','0','0','-12'), 
-- pool aperto di jack2
-- NON SU TRACKING (PER FORZA)
('t4', '1', '0.028', '2019-04-12', '10:00-10:30', '16','28','0','28','28'),

-- SHARING
-- virg4 con tomm6 e pell7
-- TRACKING
('t5', '1', '0.030', '2014-03-03', '14:00-14:30', '17','28','28','0','20'),
('t5', '2', '0.020', '2014-03-03', '14:30-15:00', '13','0','20','0','0'),
-- jack 2 con gian5
-- NON SU TRACKING
('t6', '1', '0.028', '2015-07-09', '10:00-10:30', '15','28','0','0','0'),
('t6', '2', '0.020', '2015-07-09', '10:30-11:00', '13','0','0','0','20'),
('t6', '3', '0.030', '2015-07-09', '11:00-11:30', '17','0','20','28','28'),
-- tragitto di riferimento per lo sharing ancora aperto di nico1
-- NON SU TRACKING TRACKING
('t7', '1', '0.020', '2019-04-10', '15:45-16:10', '13','0','0','0','20'),
('t7', '2', '0.030', '2019-04-10', '16:10-16:40', '17','0','20','28','28'),
('t7', '3', '0.008', '2019-04-10', '16:40_16:50', '11','28','28','36','28'),
('t7', '4', '0.004', '2019-04-10', '16:50-17:00', '12','36','28','36','24');
COMMIT ;


-- ------------------------------------------- --
--     Table structure for LOCALIZZAZIONE      --
-- ------------------------------------------- --
DROP TABLE IF EXISTS LOCALIZZAZIONE ;
CREATE TABLE LOCALIZZAZIONE  (
    Longitudine DOUBLE(4,2) NOT NULL,
    Latitudine DOUBLE(4,2) NOT NULL,
    ValoreKm INT(11) NOT NULL,
    CodiceStrada INT(11) NOT NULL,
	Abitazione CHAR(50) DEFAULT NULL,
	CorsiaUscita CHAR(50) DEFAULT NULL,
	CorsiaImmissione CHAR(50) DEFAULT NULL,
	Raccordo CHAR(50) DEFAULT NULL,
	Incrocio CHAR(50) DEFAULT NULL,
    PRIMARY KEY (Longitudine,Latitudine,ValoreKm,CodiceStrada),
	
	CONSTRAINT FK_Localizzazione_Posizione
    FOREIGN KEY (Longitudine,Latitudine) REFERENCES POSIZIONE(Longitudine, Latitudine) 
    ON UPDATE CASCADE ON DELETE NO ACTION
	
/*	CONSTRAINT FK_Localizzazione_ValoreKm
    FOREIGN KEY (ValoreKm,CodiceStrada) REFERENCES KM_STRADA(Valore, CodiceStrada) 
    ON UPDATE CASCADE ON DELETE NO ACTION
  */ 
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO LOCALIZZAZIONE
VALUES
('4', '0','77','15',null,null,null,null,null), 
('8', '0','77','15',null,null,null,null,null), 
('12', '0','77','15',null,null,null,null,null), 
('16', '0','77','15',null,null,null,null,null),
('20', '0','77','15',null,null,null,null,null), 
('24', '0','77','15',null,null,null,null,null), 
('28', '0','77','15',null,'si','si',null,null),
('28', '0','0','7',null,'si','si',null,null),
('28', '0','12','16',null,'si','si',null,null),
('28', '0','0','8',null,'si','si',null,null),
('28', '4','12','16',null,null,null,null,null), 
('28', '8','12','16',null,null,null,null,null), 
('28', '12','12','16',null,null,null,null,null), 
('28', '16','12','16',null,null,null,null,null),
('28', '20','12','16',null,null,null,null,null), 
('28', '24','12','16',null,null,null,null,null), 
('28', '28','12','16',null,'si','si',null,null), 
('28', '28','0','11',null,'si','si',null,null), 
('28', '28','30','17',null,'si','si',null,null), 
('0', '20','0','13',null,'si','si',null,null), 
('0', '20','30','17',null,'si','si',null,null), 
('5', '21.5','30','13',null,null,null,null,null), 
('10', '23','30','13',null,null,null,null,null), 
('15', '24.5','3','13',null,null,null,null,null), 
('20', '26','30','13',null,null,null,null,null), 
('25', '27','30','13',null,null,null,null,null), 
('-4', '0','0','1','si',null,null,null,'si'),
('-4', '0','0','2',null,null,null,null,'si'),
('-4', '4','0','1','si',null,null,null,null), 
('-4', '8','0','1','si',null,null,null,null),
('-4', '-12','0','3','si',null,null,null,null),
('4', '-12','0','4','si',null,null,null,null),
('3', '-9.5','0','5',null,null,null,null,null),
('3', '-9.5','0','6',null,null,null,null,null), 
('6', '-6.8','0','5',null,null,null,null,null), 
('6', '-6.8','0','6',null,null,null,null,null), 
('9', '-4.2','0','5',null,null,null,null,null),
('9', '-4.2','0','6',null,null,null,null,null),  
('12', '-1.7','0','5',null,null,null,null,null),
('12', '-1.7','0','6',null,null,null,null,null), 
('28', '-4','0','7','si',null,null,null,null),
('32', '0','0','8','si',null,null,null,null), 
('36', '0','0','8','si',null,null,null,null), 
 ('3', '3','22','9',null,null,null,null,null), 
('6', '6','22','9',null,null,null,null,null), 
('9', '9','22','9',null,null,null,null,null), 
('12', '12','22','9',null,null,null,null,null), 
('16', '14','22','9',null,null,null,null,'si'),
('16', '14','8','10',null,null,null,null,'si'),  
('16', '12','8','10',null,null,null,null,null), 
('19', '9','8','10',null,null,null,null,null), 
('22', '6','8','10',null,null,null,null,null), 
('25', '3','8','10',null,null,null,null,null), 
('32', '28','0','11','si',null,null,null,null),  
('36', '24','0','12','si',null,null,null,null), 
('36', '20','0','12','si',null,null,null,null), 
('0', '0','0','2',null,'si','si',null,null),
('0', '0','0','14',null,'si','si',null,null), 
('0', '0','0','13',null,'si','si',null,null), 
('0', '0','77','15',null,'si','si',null,null),  
('0', '0','22','9',null,'si','si',null,null), 
('0', '4','0','13',null,null,null,null,null), 
('0', '8','0','13',null,null,null,null,null), 
('0', '12','0','13',null,null,null,null,null), 
('0', '16','0','13',null,null,null,null,null), 
('0', '-4','0','14',null,null,null,null,null), 
('0', '-8','0','14',null,null,null,null,null),
('0', '-12','0','14',null,null,null,null,'si'),
('0', '-12','0','3',null,null,null,null,'si'),
('0', '-12','0','4',null,null,null,null,'si'),
('0', '-12','0','6',null,null,null,null,'si'),
('0', '-12','0','5',null,null,null,null,'si'); 

COMMIT; 	



-- ----------------------------------- --
--    Table structure for KM_STRADA    --
-- ----------------------------------- --
DROP TABLE IF EXISTS KM_STRADA;
CREATE TABLE KM_STRADA (
    Valore INT(11) NOT NULL,
	Codice INT(11) NOT NULL,
	
    PRIMARY KEY (Valore,Codice),
	
	CONSTRAINT FK_Km_Strada_Strada
    FOREIGN KEY (Codice) REFERENCES STRADA(Codice) 
    ON UPDATE CASCADE ON DELETE NO ACTION
	
	
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
 
BEGIN ;
INSERT INTO KM_STRADA
VALUES
('0','1'),
('0','2'),
('0','3'),
('0','4'),
('0','5'),
('0','6'),
('0','7'),
('0','8'),
('0','11'),
('0','12'),
('0','13'),
('0','14'),
('77','15'),
('12','16'),
('8','10'),
('22','9'),
('30','17');	
COMMIT ;



-- ------------------------------------- --
--  Table structure for INDIVIDUAZIONE   --
-- ------------------------------------- --
DROP TABLE IF EXISTS INDIVIDUAZIONE;
CREATE TABLE INDIVIDUAZIONE(
	CodiceFiscaleFruitore CHAR(50) NOT NULL,
	OrarioSharing TIMESTAMP NOT NULL,
	CodiceFiscaleProponente CHAR(50) NOT NULL,
	PRIMARY KEY(CodiceFiscaleFruitore,OrarioSharing,CodiceFiscaleProponente),
   
    CONSTRAINT FK_Individuazione_Fruitore
    FOREIGN KEY (CodiceFiscaleFruitore) REFERENCES FRUITORE(CodiceFiscale)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Individuazione_Sharing
    FOREIGN KEY (OrarioSharing) REFERENCES SHARING(OrarioPartenza)
    ON UPDATE CASCADE ON DELETE NO ACTION,
    
    CONSTRAINT FK_Individuazione_Proponente
    FOREIGN KEY (CodiceFiscaleProponente) REFERENCES PROPONENTE(CodiceFiscale)
    ON UPDATE CASCADE ON DELETE NO ACTION
  
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

BEGIN ;
INSERT INTO INDIVIDUAZIONE 
VALUES
('tomm6', '2014-03-03 14:00:00', 'virg4'),
('pell7', '2014-03-03 14:00:00', 'virg4'),
('gian5', '2015-07-09 10:00:00', 'jack2');
COMMIT;


 
 
-- ------------------------------------------------------------------------- --
--                        IMPLEMENTAZIONE FUNZIONI                           --
-- ------------------------------------------------------------------------- --


-- NUOVA OPERAZIONE 
DROP PROCEDURE IF EXISTS inserimento_utente_fruitore;

delimiter $$

CREATE PROCEDURE inserimento_utente_fruitore (IN _CodiceFiscale CHAR(50), IN _Nome CHAR(50), IN _Cognome CHAR(50), IN _NumeroTelefono CHAR(50),
IN _NumeroDocumentoFruitore CHAR(50), IN _PasswordFruitore CHAR(50), IN _NomeUtenteFruitore CHAR(50), IN _Strada CHAR(50), IN _NumeroCivico INT(11),
 IN _EnteRilascio CHAR(50), IN _Tipologia CHAR(50), IN _Scadenza DATE, IN _Domanda CHAR(50), IN _Risposta CHAR(50), OUT DataIscrizione_ DATE, OUT Stato_ CHAR(50))
BEGIN

	INSERT INTO FRUITORE
    VALUES (_CodiceFiscale, _Nome, _Cognome, 'inattivo', CURRENT_DATE , '0', _NumeroTelefono, 'affidabile', _NumeroDocumentoFruitore, _PasswordFruitore, _NomeUtenteFruitore, _Strada, _NumeroCivico);

	INSERT INTO DOCUMENTO
    VALUES (_NumeroDocumentoFruitore, _EnteRilascio, _Tipologia, _Scadenza);
    
    INSERT INTO ACCOUNT
    VALUES (_NomeUtenteFruitore, _Password, _Domanda, _Risposta);
    
    SELECT CURRENT_DATE INTO DataIscrizione_;
    SELECT 'inattivo' INTO Stato_;
END $$

delimiter ;



-- NUOVA OPERAZIONE
DROP PROCEDURE IF EXISTS conteggio_servizi_usufruiti;

delimiter $$

CREATE PROCEDURE conteggio_servizi_usufruiti(IN _CodiceFiscaleFruitore CHAR(50), OUT totale_ INT)
BEGIN
	
	
		SET @totalenoleggi = (
							SELECT COUNT(*)
							FROM Accettazione
							WHERE
								CodiceFruitore = _CodiceFiscaleFruitore
								AND
								Conferma = 'si'
							);
			
		
		SET @totalepool = (
							SELECT COUNT(*)
							FROM
								Prenotazione_Di_Pool
							WHERE
								CodiceFiscaleFruitore = _CodiceFiscaleFruitore
								AND
								Approvazione = 'si'
						);
		
		SET @totalesharing = (
							SELECT COUNT(*)
							FROM
								Chiamata
							WHERE
								CodiceFiscaleFruitore = _CodiceFiscaleFruitore
								AND
								Stato = 'accepted'
							);
                            
		SET totale_ = @totalenoleggi + @totalepool + @totalesharing;
END $$

delimiter ;



-- NUOVA OPERZIONE
DROP PROCEDURE IF EXISTS inserimento_sharing;

delimiter $$

CREATE PROCEDURE inserimento_sharing(IN _P1X DOUBLE(4,2), IN _P1Y DOUBLE(4,2), IN _P2X DOUBLE(4,2), IN _P2Y DOUBLE(4,2), IN _OrarioPartenza CHAR(50), 
IN _CodiceProponente CHAR(50), IN _FasciaOraria CHAR(50),IN _CodiceTratta CHAR(50), IN _Sequenza INT(11), 
IN _KM1 INT(11), IN _KM2 INT(11), IN _CodiceStrada INT(11))
BEGIN

	INSERT INTO SHARING
    VALUES (_OrarioPartenza, _CodiceProponente, '0');
    
    INSERT INTO POSIZIONE
    VALUES (_P1X, _P1Y), (_P2X, _P2Y);
	
    SET @diff := _KM2 - _KM1;
    INSERT INTO TRATTA
    VALUES (_CodiceTratta, _Sequenza, @diff, CURRENT_DATE, _FasciaOraria, _CodiceStrada, _P1X, _P1Y, _P2X, _P2Y);
    
    INSERT INTO PERCORSO
    VALUES (_Sequenza, _CodiceTratta, _OrarioPartenza, _CodiceProponente);

	INSERT INTO LOCALIZZAZIONE
    VALUES (_P1X, _P1Y, _KM1, _CodiceStrada, null, null, null, null, null), (_P2X, _P2Y, _KM2, _CodiceStrada, null, null, null, null, null);
END $$

delimiter ;


-- NUOVA OPERAZIONE

-- AGGIUNGERE GROUP CONCAT??




DROP PROCEDURE IF EXISTS ricerca_sharing;

delimiter $$
    
CREATE PROCEDURE ricerca_sharing(IN _CodiceFruitore CHAR(50), IN _AttualeX DOUBLE(4,2), IN _AttualeY DOUBLE(4,2) )
BEGIN

	SET @LongitudineAttuale := _AttualeX;
    SET @LatitudineAttuale := _AttualeY;
    SET @Fruitore := _CodiceFruitore;
    
-- inserimento nuove occorrenze
	INSERT INTO INDIVIDUAZIONE
	SELECT 
		@Fruitore, S.CodiceFiscaleProponente, S.OrarioPartenza
	FROM
		Sharing S
		INNER JOIN
		Percorso P ON P.CodiceProponente = S.CodiceFiscaleProponente
		AND P.OrarioDiPartenza = S.OrarioPartenza
		INNER JOIN
		Tratta T
		ON T.Codice = P.CodiceTratta
		AND T.Sequenza = P.Sequenza
	WHERE
		S.OrarioPartenza > current_timestamp
		AND
		P.Sequenza = 1
		AND
		SQRT(POW((T.Longitudine1 - @LongitudineAttuale), 2) + POW((T.Latitudine1 - @LatitudineAttuale), 2)) < 2000;
	
-- controllo valutazioni
	SELECT
		V.RecensioneTestuale
    FROM (
			SELECT 
			S.CodiceFiscaleProponente, S.OrarioPartenza
			FROM
				Sharing S
				INNER JOIN
				Percorso P ON P.CodiceProponente = S.CodiceFiscaleProponente
						   AND P.OrarioDiPartenza = S.OrarioPartenza
				INNER JOIN
				Tratta T ON T.Codice = P.CodiceTratta
						 AND T.Sequenza = P.Sequenza
			WHERE
				S.OrarioPartenza > current_timestamp
				AND
				P.Sequenza = 1
				AND
				SQRT(POW((T.Longitudine1 - @LongitudineAttuale), 2) + POW((T.Latitudine1 - @LatitudineAttuale), 2)) < 2000
        ) AS ISH
		INNER JOIN
		Valutazione V ON V.CodiceFiscaleProponente = ISH.CodiceFiscaleProponente
    WHERE
		V.DaFruitore = 'si';
	
    
-- mostro i percorsi
	SELECT K.OrarioPartenza, K.CodiceFiscaleProponente, IFNULL(S.Nome, CONCAT(S.CodiceTipologia, S.IDNumerico)) AS TRAGITTO
    FROM (			
            SELECT 
				S.CodiceFiscaleProponente, S.OrarioPartenza
			FROM
				Sharing S
				INNER JOIN
				Percorso P ON P.CodiceProponente = S.CodiceFiscaleProponente
						   AND P.OrarioDiPartenza = S.OrarioPartenza
				INNER JOIN
				Tratta T ON T.Codice = P.CodiceTratta
						 AND T.Sequenza = P.Sequenza
			WHERE
				S.OrarioPartenza > current_timestamp
				AND
				P.Sequenza = 1
				AND
				SQRT(POW((T.Longitudine1 - @LongitudineAttuale), 2) + POW((T.Latitudine1 - @LatitudineAttuale), 2)) < 2000
		) AS K
		INNER JOIN
		Percorso P ON K.OrarioPartenza = P.OrarioDiPartenza
					  AND 
					  K.CodiceFiscaleProponente = P.CodiceProponente
		INNER JOIN
		Tratta TR ON TR.Codice = P.CodiceTratta
					 AND
					 TR.Sequenza = P.Sequenza
        INNER JOIN
        Strada S ON s.Codice = TR.Strada;

END $$

delimiter ;


-- NUOVA OPERAZIONE
DROP FUNCTION IF EXISTS calcolo_media_stelle_fruitore;
DROP PROCEDURE IF EXISTS aggiornamento_post_incidente;

delimiter $$


CREATE FUNCTION calcolo_media_stelle_fruitore (_CodiceUtente CHAR(50))
RETURNS DOUBLE(6,3) DETERMINISTIC

BEGIN
		DECLARE media DOUBLE(6,3) DEFAULT 0;
        
        SET @media_comportamento := (
					SELECT AVG(V.StelleComportamento)
                    FROM Valutazione V
                    WHERE
						V.CodiceFiscaleFruitore = _CodiceUtente
						AND
                        V.DaProponente = 'si'
		);
        
        SET @media_serieta := (
					SELECT AVG(V.StelleSerieta)
                    FROM Valutazione V
                    WHERE
						V.CodiceFiscaleFruitore = _CodiceUtente
						AND
                        V.DaProponente = 'si'
		);
        
        SET @media_persona := (
					SELECT AVG(V.StellePersona)
                    FROM Valutazione V
                    WHERE
						V.CodiceFiscaleFruitore = _CodiceUtente
						AND
                        V.DaProponente = 'si'
		);
        
        SET @media_viaggio := (
					SELECT AVG(V.StelleViaggio)
                    FROM Valutazione V
                    WHERE
						V.CodiceFiscaleFruitore = _CodiceUtente
						AND
                        V.DaProponente = 'si'
		);
        
        SET @totale := (
					SELECT COUNT(*)
                    FROM Valutazione V
                    WHERE
						V.CodiceFiscaleFruitore = _CodiceUtente
                        AND
                        V.DaProponente = 'si'
		);
        
        SET media = (@media_comportamento + @media_persona + @media_serieta + @media_viaggio) / @totale;
        
        RETURN (media);
	
END $$


CREATE PROCEDURE aggiornamento_post_incidente(IN _Orario CHAR(50), IN _TargaAutovettura CHAR(50), IN _Dinamica VARCHAR(255),
IN _LongitudinePosizione DOUBLE(4,2), IN _LatitudinePosizione DOUBLE(4,2), IN _Fruitore CHAR(50), IN _Targa CHAR(50), 
IN _Modello CHAR(50), IN _CasaProduttrice CHAR(50), IN _CodiceFiscaleFruitore CHAR(50), OUT NuovaAffidabilita CHAR(50))

BEGIN
    
    INSERT INTO SINISTRO
    VALUES (_Orario, _TargaAutovettura, _Dinamica, _LongitudinePosizione, _LatitudinePosizione, _CodiceFiscaleFruitore);
    
    INSERT INTO VETTURA2
    VALUES (_Targa, _Orario, _TargaAutovettura);
    
	INSERT INTO AUTOVETTURA_ESTERNA
    VALUES (_Targa, _Modello, _CasaProduttrice);
    
    INSERT INTO POSIZIONE
    VALUES (_LongitudinePosizione, _LatitudinePosizione);
    
    SET @totalesinistri := (
						SELECT COUNT(*)
						FROM Sinistro S
						WHERE S.Fruitore = _CodiceFiscaleFruitore
	);
    
    SELECT calcola_media_stelle_fruitore(_CodiceFiscaleFruitore) INTO @Media;
    
    CASE
		WHEN @Media BETWEEN 0 AND 1.99 THEN
			SET @tmp := bassa;
		WHEN @Media BETWEEN 2 AND 3.99 THEN
			SET @tmp := media;
		WHEN @Media BETWEEN 4 AND 5 THEN
			SET @tmp := alta;
		WHEN @Media < 0 THEN
			BEGIN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Media stelle non coerente';
			END;
		WHEN @Media > 5 THEN
			BEGIN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Media stelle non coerente';
		END;
	END CASE;
    
    CASE
		WHEN @tmp = bassa THEN
			BEGIN
				IF @totalesinistri = 0 THEN
					SET NuovaAffidabilita = 'Scarsamente Affidabile';
				END IF;
				
				IF @totalesinistri = 1 THEN
					SET NuovaAffidabilita = 'Scarsamente Affidabile';
				END IF;
				
				IF @totalesinistri > 1 THEN
					SET NuovaAffidabilita = 'Fortemente Non Affidabile';
				END IF;
			END;
		WHEN @tmp = media THEN
			BEGIN
				IF @totalesinistri = 0 THEN
					SET NuovaAffidabilita = 'Molto Affidabile';
				END IF;
				
				IF @totalesinistri = 1 THEN
					SET NuovaAffidabilita = 'Poco Affidabile';
				END IF;
				
				IF @totalesinistri > 1 THEN
					SET NuovaAffidabilita = 'Poco Affidabile';
				END IF;
			END;
		WHEN @tmp = alta THEN
			BEGIN
				IF @totalesinistri = 0 THEN
					SET NuovaAffidabilita = 'Fortemente Affidabile';
				END IF;
				
				IF @totalesinistri = 1 THEN
					SET NuovaAffidabilita = 'Affidabile';
				END IF;
				
				IF @totalesinistri > 1 THEN
					SET NuovaAffidabilita = 'Non Molto Affidabile';
				END IF;
			END;
	END CASE;

	UPDATE Fruitore F
    SET Affidabilita = NuovaAffidabilita
    WHERE F.CodiceFiscale = _CodiceFiscaleFruitore;
    
END $$

delimiter ;


-- NUOVA OPERAZIONE
DROP PROCEDURE IF EXISTS valutazioni_post_sharing;

delimiter $$

CREATE PROCEDURE valutazioni_post_sharing(IN _StelleSerieta INT(11), IN _StelleComportamento INT(11), IN _StellePersona INT(11), 
IN _StelleViaggio INT(11), IN _Recensione VARCHAR(255),  IN _CodProponente CHAR(50), IN _CodFruitore CHAR(50), IN _Ora TIMESTAMP, OUT CodiceValutazione_ INT(11))
BEGIN
	
		INSERT INTO VALUTAZIONE
        VALUES (_StelleSerieta, _StelleComportamento, _StellePersona, _StelleViaggio, _Recensione, _CodProponente, _CodFruitore, 'si', 'no', 
        _Ora, _CodProponente, null, null, null, null);
        
        SELECT CodiceValutazione
        FROM Valutazione
        WHERE
			StelleSerieta = _StelleSerieta
            AND
            StelleComportamento = _StelleComportamento
            AND
            StellePersona = _StellePersona
            AND
            StelleViaggio = _StelleViaggio
            AND
            RecensioneTestuale = _Recensione
            AND
            CodiceFiscaleProponente = _CodProponente
            AND
            CodiceFiscaleFruitore = _CodFruitore
            AND
            DaFruitore = 'si'
            AND
            DaProponente = 'no'
            AND
            OrarioPartenzaValutazioneSharing = _Ora
            AND
            CodiceProponenteValutazioneSharing = _CodProponente
            AND
            DataInizioValutazioneNoleggio = null
            AND
            DataFineValutazioneNoleggio = null
            AND
            CodiceFruitoreValutazioneNoleggio = null
            AND
            IDPoolValutazionePool = null;
        
END $$

delimiter ;


-- NUOVA OPERAZIONE
DROP VIEW IF EXISTS ChiamateTarget;
DROP EVENT IF EXISTS EliminaVecchieChiamate;

delimiter $$

CREATE OR REPLACE VIEW ChiamateTarget AS
SELECT Ch.Codice
FROM Chiamata Ch
WHERE Ch.TimestampRisposta < YEAR(CURRENT_DATE) - 3;


CREATE EVENT EliminaVecchieChiamate
ON SCHEDULE EVERY 1 YEAR STARTS '2017-01-01'
DO
BEGIN
	DELETE L.*
    FROM Locazione L
    WHERE L.CodiceChiamata IN (
								SELECT *
								FROM ChiamateTarget
							);
	DELETE C.*
    FROM Chiamata C
    WHERE C.Codice IN (
						SELECT *
						FROM ChiamateTarget
					);
END $$

delimiter ;


-- NUOVA OPERAZIONE
DROP PROCEDURE IF EXISTS calcolo_spesa_fruitore;

delimiter $$

CREATE PROCEDURE calcolo_spesa_fruitore(IN _CodiceFruitore CHAR(50), IN _Pool CHAR(50), IN _CostoCarburante INT, OUT importo_ DOUBLE(6,3))
BEGIN

	DECLARE finito INTEGER DEFAULT 0;
    DECLARE tmp INTEGER DEFAULT 0;
	DECLARE ped DOUBLE(3,2) DEFAULT 0;
    DECLARE somma INTEGER DEFAULT 0;
    DECLARE contatore INTEGER DEFAULT 0;
    DECLARE risultato DOUBLE(6,3) DEFAULT 0;
    DECLARE parzialePedaggio DOUBLE(6,3) DEFAULT 0;
    DECLARE distanza DOUBLE(6,3) DEFAULT 0;
    DECLARE prec DOUBLE(3,2) DEFAULT 0;
     
	DECLARE cursoreTratte CURSOR FOR
	( 
    SELECT Tr.KmPercorsi, Pe.Tariffa
    FROM
		Pool P
        INNER JOIN
        Struttura S ON P.IDPool = S.IDStruttura
        INNER JOIN
        Tratta Tr ON Tr.Codice = S.CodiceStruttura
        INNER JOIN 
        Localizzazione L ON Tr.Longitudine1 = L.Longitudine
						 AND Tr.Latitudine1 = L.Latitudine
						 AND Tr.Strada = L.CodStrada
		INNER JOIN
        Localizzazione L2 ON Tr.Longitudine2 = L2.Longitudine
						  AND Tr.Latitudine2 = L2.Latitudine
						  AND Tr.Strada = L2.CodStrada
		INNER JOIN
        Pedaggio Pe ON Tr.Strada = Pe.CodStrada
	WHERE 
		P.IDPool = _Pool
        AND
        L.ValoreKm >= Pe.Km1
        AND
        L2.ValoreKm <= Pe.Km2 
	)
	UNION
    (
    SELECT T2.KmPercorsi, Pe.Tariffa
    FROM
		Pool P
        INNER JOIN
        Target T ON T.IDPool = P.IDPool	
        INNER JOIN 
        Variazione V ON V.Codice = T.CodiceVariazione
        INNER JOIN
        Modifica M ON M.CodiceVariazione = T.CodiceVariazione
        INNER JOIN 
        Tratta T2 ON T2.Codice = M.CodiceTratta
		INNER JOIN 
        Localizzazione L ON T2.Longitudine1 = L.Longitudine
						 AND T2.Latitudine1 = L.Latitudine
						 AND T2.Strada = L.CodStrada
		INNER JOIN
        Localizzazione L2 ON T2.Longitudine2 = L2.Longitudine
						  AND T2.Latitudine2 = L2.Latitudine
						  AND T2.Strada = L2.CodStrada
		INNER JOIN
        Pedaggio Pe ON T2.Strada = Pe.CodStrada
		WHERE 
			P.IDPool = _Pool
			AND
			L.ValoreKm >= Pe.Km1
			AND
			L2.ValoreKm <= Pe.Km2 
	);
        
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET finito = 1;
        
	OPEN cursoreTratte;
    
    preleva: LOOP
		FETCH cursoreTratte INTO tmp, ped;
        IF finito = 1 THEN
			LEAVE preleva;
		END IF;
        
		IF contatore = 0 THEN
			SET prec = 0;
		END IF;
        
        IF ped <> prec THEN
				SET parzialePedaggio = parzialePedaggio + distanza * prec;
				SET distanza = tmp;
                SET prec = ped;
        END IF;
        
        IF ped = prec THEN
			SET distanza = distanza + tmp;
		END IF;
        
        SET somma = somma + tmp;
        SET contatore = contatore + 1;	
	
		
    END LOOP preleva;
    CLOSE cursoreTratte;
    
    
    SELECT 
		A.CostoOperativo, A.CostoUsura, A.Misto, A.Urbano, A.Extraurbano
    INTO 
		@Operativo, @Usura, @Misto, @Urbano, @Extraurbano
    FROM 
		Pool P
        INNER JOIN
        Autovettura A ON P.Automobile = A.Targa
	WHERE
		P.IDPool = _Pool;
	
    SET @consumoMedio := (@Misto + @Urbano + @Extraurbano) / 3;
	SET importo_ := (@Operativo + @Usura + (_CostoCarburante * @consumoMedio * somma) + parzialePedaggio) / 4;
    
END $$

SELECT AVG(Importo)
FROM Prenotazione_Di_Pool;


delimiter ;

-- ANALYTIC FUNCTION RANKING FRUITORI
SELECT 
		C.Fruitore,
        C.MEDIA_STELLE, 
        IF(@init = 1
			,
			IF(@media = C.MEDIA_STELLE,
				@rank := @rank + LEAST(0, @gap := @gap + 1),
				@rank := @rank + GREATEST(@gap, @gap := 1)
							   + LEAST(0, @media := C.MEDIA_STELLE)
				) 
			,
			@rank := 1 + LEAST(0, @init := 1)
					   + LEAST(0, @media := C.MEDIA_STELLE)
					   + LEAST(0, @gap := 1)
		) AS RANKING
FROM 
	(
	SELECT D.Fruitore, (D.Viaggio + D.Serieta + D.Persona + D.Comportamento) / 4 AS MEDIA_STELLE
	FROM 
		(
		SELECT V.CodiceFiscaleFruitore AS Fruitore, AVG(V.StelleSerieta) AS Serieta, AVG(V.StelleComportamento) AS Comportamento, AVG(V.StellePersona) AS Persona, AVG(V.StelleViaggio) AS Viaggio
		FROM Valutazione V
		WHERE V.DaProponente = 'si'
		GROUP BY V.CodiceFiscaleFruitore
		) AS D
	) AS C, (SELECT(@init := '')) AS N
ORDER BY C.MEDIA_STELLE DESC;



-- ANALYTIC FUNCTION RANKING FRUITORI
SELECT 
		C.Proponente,
        C.MEDIA_STELLE, 
        IF(@init = 1
			,
			IF(@media = C.MEDIA_STELLE,
				@rank := @rank + LEAST(0, @gap := @gap + 1),
				@rank := @rank + GREATEST(@gap, @gap := 1)
							   + LEAST(0, @media := C.MEDIA_STELLE)
				) 
			,
			@rank := 1 + LEAST(0, @init := 1)
					   + LEAST(0, @media := C.MEDIA_STELLE)
					   + LEAST(0, @gap := 1)
		) AS RANKING
FROM 
	(
	SELECT D.Proponente, (D.Viaggio + D.Serieta + D.Persona + D.Comportamento) / 4 AS MEDIA_STELLE
	FROM 
		(
		SELECT V.CodiceFiscaleProponente AS Proponente, AVG(V.StelleSerieta) AS Serieta, AVG(V.StelleComportamento) AS Comportamento, AVG(V.StellePersona) AS Persona, AVG(V.StelleViaggio) AS Viaggio
		FROM Valutazione V
		WHERE V.DaProponente = 'no'
		GROUP BY V.CodiceFiscaleProponente
		) AS D
	) AS C, (SELECT(@init := '')) AS N
ORDER BY C.MEDIA_STELLE DESC;


-- MATERIALIZED VIEW e ANALYTIC FUNCTION per tempi attuali
DROP TABLE IF EXISTS MV_TEMPI_DI_PERCORRENZA;
CREATE TABLE MV_TEMPI_DI_PERCORRENZA (
	Strada INT(50) NOT NULL,
    KM1 INT(11) NOT NULL,
    KM2 INT(11) NOT NULL,
    Senso CHAR(50) NOT NULL,
    TempoAttuale DOUBLE(6,3) DEFAULT 0,
    TempoMedio DOUBLE(6,3) DEFAULT 0,
    Criticita CHAR(50) DEFAULT 'standard',
    PRIMARY KEY (Strada, KM1, KM2)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
    
 
CREATE OR REPLACE VIEW TrackingLocalizzato AS
SELECT 
	L.CodiceStrada, CAST(T.Timestamp AS DATE) AS Giorno, T.Timestamp AS Orario, T.Targa, L.ValoreKm
FROM
	Tracking T 
	INNER JOIN 
	Localizzazione L ON T.Longitudine = L.Longitudine
					 AND T.Latitudine = L.Latitudine	
                     AND T.CodiceStrada = L.CodiceStrada;


CREATE OR REPLACE VIEW StradaCompleta AS
SELECT 
	S.Codice, MIN(KS.Valore) AS Inizio, MAX(KS.Valore) AS Fine
FROM
	Strada S
	INNER JOIN 
	Km_Strada KS ON S.Codice = KS.Codice
GROUP BY 
	S.Codice;


INSERT INTO MV_TEMPI_DI_PERCORRENZA
SELECT M.Codice, M.Inizio, M.Fine, M.Percorrenza, 0, AVG(TIMESTAMPDIFF(MINUTE, M.Orario1, M.Orario2)) AS TempoMedio, 'standard'
FROM (
	SELECT X.Codice, X.Inizio, X.Fine, X.Targa, X.Giorno, X.Orario AS Orario1, TL2.Orario AS Orario2, IF(X.KM1 - TL2.ValoreKm < 0, 0, 1) AS Percorrenza
    FROM 
		(
		SELECT 
			SC.Codice, SC.Inizio, SC.Fine, TL.Targa, TL.Giorno, TL.Orario AS Orario, TL.ValoreKm AS KM1
		FROM 
		StradaCompleta SC
		INNER JOIN
		TrackingLocalizzato TL ON SC.Codice = TL.CodiceStrada
		WHERE 
			TL.ValoreKm = SC.Inizio
			OR
			TL.ValoreKm = SC.Fine
		) AS X
	INNER JOIN
	TrackingLocalizzato TL2 ON 
							X.Codice = TL2.CodiceStrada
							AND
							X.Giorno = TL2.Giorno
                            AND
							X.Targa = TL2.Targa 
							AND
							X.Orario < TL2.Orario
	WHERE 
	 X.KM1 <= TL2.ValoreKm
	 AND
     X.KM1 = X.Inizio
     AND 
     TL2.ValoreKm = X.Fine
     AND
	 NOT EXISTS (
				SELECT *
                FROM TrackingLocalizzato TL3
				WHERE 
					TL3.Giorno = X.Giorno
					AND
					TL3.CodiceStrada = X.Codice
					AND 
					TL3.Targa = X.Targa
					AND
					TL3.Orario < TL2.Orario
                    AND
                    TL3.Orario > X.Orario
				) 
	) AS M
GROUP BY M.Codice, M.Percorrenza, M.Inizio, M.Fine;


DROP PROCEDURE IF EXISTS refresh_MV_TEMPI_DI_PERCORRENZA;

delimiter $$

CREATE PROCEDURE refresh_MV_TEMPI_DI_PERCORRENZA(OUT esito INTEGER)
BEGIN

DECLARE esito INTEGER DEFAULT 0;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
    SET esito = 1;
    SELECT 'Errore nel refresh della MV_TEMPI_DI_PERCORRENZA. ';
END;

TRUNCATE TABLE MV_TEMPI_DI_PERCORRENZA;

-- full refresh

INSERT INTO MV_TEMPI_DI_PERCORRENZA
SELECT M.Codice, M.Inizio, M.Fine, M.Percorrenza, 0, AVG(TIMESTAMPDIFF(MINUTE, M.Orario1, M.Orario2)) AS TempoMedio, 'standard'
FROM (
	SELECT X.Codice, X.Inizio, X.Fine, X.Targa, X.Giorno, X.Orario AS Orario1, TL2.Orario AS Orario2, IF(X.KM1 - TL2.ValoreKm < 0, 0, 1) AS Percorrenza
    FROM 
		(
		SELECT 
			SC.Codice, SC.Inizio, SC.Fine, TL.Targa, TL.Giorno, TL.Orario AS Orario, TL.ValoreKm AS KM1
		FROM 
		StradaCompleta SC
		INNER JOIN
		TrackingLocalizzato TL ON SC.Codice = TL.CodiceStrada
		WHERE 
			TL.ValoreKm = SC.Inizio
			OR
			TL.ValoreKm = SC.Fine
		) AS X
	INNER JOIN
	TrackingLocalizzato TL2 ON 
							X.Codice = TL2.CodiceStrada
							AND
							X.Giorno = TL2.Giorno
                            AND
							X.Targa = TL2.Targa 
							AND
							X.Orario < TL2.Orario
	WHERE 
	 X.KM1 <= TL2.ValoreKm
	 AND
     X.KM1 = X.Inizio
     AND 
     TL2.ValoreKm = X.Fine
     AND
	 NOT EXISTS (
				SELECT *
                FROM TrackingLocalizzato TL3
				WHERE 
					TL3.Giorno = X.Giorno
					AND
					TL3.CodiceStrada = X.Codice
					AND 
					TL3.Targa = X.Targa
					AND
					TL3.Orario < TL2.Orario
                    AND
                    TL3.Orario > X.Orario
				) 
	) AS M
GROUP BY M.Codice, M.Percorrenza, M.Inizio, M.Fine;

END $$

delimiter ;


DROP TABLE IF EXISTS TEMPI_DI_PERCORRENZA_LOG;
CREATE TABLE TEMPI_DI_PERCORRENZA_LOG(
	Istante TIMESTAMP NOT NULL,
    Targa CHAR(50) NOT NULL,
    Longitudine DOUBLE(4,2) NOT NULL,
    Latitudine DOUBLE(4,2) NOT NULL,
    Strada INT(11) NOT NULL,
    Senso INT(11) DEFAULT 0,
    PRIMARY KEY(Istante, Targa)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

DROP TRIGGER IF EXISTS Push_TempiDiPercorrenza_Log;

delimiter $$

CREATE TRIGGER Push_TempiDiPercorrenza_Log
AFTER INSERT ON Tracking
FOR EACH ROW
BEGIN

	INSERT INTO TEMPI_DI_PERCORRENZA_LOG
    VALUES
		(NEW.Timestamp, NEW.Targa, NEW.Longitudine, NEW.Latitudine, NEW.CodiceStrada, 0);
END $$

delimiter ;

DROP PROCEDURE IF EXISTS incremental_refresh_MV_TEMPI_DI_PERCORRENZA;
DROP PROCEDURE IF EXISTS CalcoloSensoPercorrenza;
DROP VIEW IF EXISTS ViewPerSenso;

delimiter $$
CREATE OR REPLACE VIEW ViewPerSenso AS
SELECT TDPL.Targa, MIN(TDPL.Istante) AS P1, MAX(TDPL.Istante) AS P2
FROM
	TEMPI_DI_PERCORRENZA_LOG TDPL
	INNER JOIN
	Localizzazione L ON TDPL.Longitudine = L.Longitudine
					 AND TDPL.Latitudine = L.Latitudine
					 AND TDPL.Strada = L.CodiceStrada
GROUP BY TDPL.Targa;


CREATE PROCEDURE CalcoloSensoPercorrenza(IN _targa CHAR(50), OUT senso_ INT(11))
BEGIN

	SET @km_istante_minimo  :=
				(
				SELECT VPS.ValoreKm
				FROM
					ViewPerSenso VPS
					INNER JOIN
					(
					SELECT MIN(TDPL.Istante) AS Minimo
					FROM TEMPI_DI_PERCORRENZA_LOG TDPL
					WHERE TDPL.Targa = _Targa
					) A
					ON VPS.Targa = TDPL.Targa AND VPS.Istante = A.Minimo
                );
                
	SET @km_istante_massimo  :=
				(
				SELECT VPS.ValoreKm
				FROM
					ViewPerSenso VPS
					INNER JOIN
					(
					SELECT MAX(TDPL.Istante) AS Minimo
					FROM
						TEMPI_DI_PERCORRENZA_LOG TDPL
					WHERE TDPL.Targa = _Targa
					) A
					ON VPS.Targa = TDPL.Targa AND VPS.Istante = A.Minimo
                );
                
	IF @km_istante_minimo - @km_istante_massimo < 0 THEN
		SET senso_ = 0;
	ELSE
		SET senso_ = 1;
	END IF;
    
END $$

delimiter ;

delimiter $$
CREATE PROCEDURE incremental_refresh_MV_TEMPI_DI_PERCORRENZA (IN _metodo CHAR(20), OUT esito_ INTEGER)
BEGIN

	DECLARE esito INTEGER DEFAULT 0;
    
	IF metodo = 'rebuild' THEN
		BEGIN
			CALL refresh_MV_TEMPI_DI_PERCORRENZA(@es);
			IF @es = 1 THEN
				SET esito = 1;
			END IF;
		END;
      
	ELSEIF metodo = 'full refresh' THEN
		BEGIN
        
			DECLARE finito INTEGER DEFAULT 0;
			DECLARE targa CHAR(50) DEFAULT '';
			
			DECLARE puntatore_log CURSOR FOR
			SELECT Targa
			FROM TEMPI_DI_PERCORRENZA_LOG;
				
			DECLARE CONTINUE HANDLER 
				FOR NOT FOUND
					SET finito = 1;
				
			OPEN puntatore_log;
			
			preleva: LOOP
				FETCH puntatore_log INTO targa;
				IF finito = 1 THEN
					LEAVE preleva;
				END IF;
				
				CALL CalcoloSensoPercorrenza(targa, @senso);
				
				UPDATE TEMPI_DI_PERCORRENZA_LOG
				SET Senso = @senso
				WHERE Targa = targa;
                
			END LOOP preleva;
			CLOSE puntatore_log;


			REPLACE INTO MV_TEMPI_DI_PERCORRENZA (Strada, KM1, KM2, Senso, TempoAttuale)
			SELECT TEMP.Strada, TEMP.KM1, TEMP.KM2, TEMP.Senso, (TEMP.KM2 - TEMP.KM1) / AVG(TEMP.Attuale)
			FROM 
				(
				SELECT TDPL.Strada, TMP.KM1, TMP.KM2, TDPL.Senso,
					IF(@Strada = TDPL.Strada
						,
						IF(@km1 = TPM.KM1
							,
							IF(@km2 = TPM.KM2
								,
								IF(@targa = TDPL.Targa
									,
									 ( CAST(TDPL.Istante AS TIME) - @ist ) / SQRT(POW(TDPL.Longitudine - @lon, 2) + POW(TDPL.Latitudine - @lan, 2))
										+ LEAST(0, @ist := CAST(TDPL.Istante AS TIME))
										+ LEAST(0, @lon := TDPL.Longitudine)
										+ LEAST(0, @lat := TDPL.Latitudine)
									,
									NULL  + LEAST(0, @ist := CAST(TDPL.Istante AS TIME))
										 + LEAST(0, @lon := TDPL.Longitudine)
										 + LEAST(0, @lat := TDPL.Latitudine)
										 + LEAST(0, @targa := TDPL.Targa)
										
									)
								,	
								NULL + LEAST(0, @km2 := TPM.KM2)
									 + LEAST(0, @ist := CAST(TDPL.Istante AS TIME))
									 + LEAST(0, @lon := TDPL.Longitudine)
									 + LEAST(0, @lat := TDPL.Latitudine)
									 + LEAST(0, @targa := TDPL.Targa)
									
								)
							,
							NULL + LEAST(0, @km1 := TMP.KM1)
								 + LEAST(0, @km2 := TMP.KM2)
								 + LEAST(0, @ist := CAST(TDPL.Istante AS TIME))
								 + LEAST(0, @lon := TDPL.Longitudine)
								 + LEAST(0, @lat := TDPL.Latitudine)
								 + LEAST(0, @targa :=TDPL.Targa)
								 + LEAST(0, @senso := TDPL.Senso)
							)
						,
						NULL + LEAST(0, @strada := TDPL.Strada)
							 + LEAST(0, @km1 := TMP.KM1)
							 + LEAST(0, @km2 := TMP.KM2)
							 + LEAST(0, @ist := CAST(TDPL.Istante AS TIME))
							 + LEAST(0, @lon := TDPL.Longitudine)
							 + LEAST(0, @lat := TDPL.Latitudine)
							 + LEAST(0, @targa := TDPL.Targa)
							 + LEAST(0, @senso := TDPL.Senso)
						) AS Attuale
				FROM
					TEMPI_DI_PERCORRENZA_LOG TDPL 
					INNER JOIN
					Localizzazione L ON TDPL.Longitudine = L.Longitudine
									 AND TDPL.Latitudine = L.Latitudine
									 AND TDPL.Strada = L.CodiceStrada
					INNER JOIN
					MV_TEMPI_DI_PERCORRENZA TMP ON TMP.Strada = TDPL.Strada
												 AND
												 L.ValoreKm >= TMP.KM1
												 AND
												 L.ValoreKm <= TMP.KM2,
					(SELECT (@strada := ''), (@km1 := ''), (@km2 := '')) AS N
				ORDER BY TDPL.Strada, TDPL.Senso, TMP.KM1, TMP.KM2, TDPL.Targa, TDPL.Istante
			) AS TEMP
			GROUP BY TEMP.Strada, TEMP.KM1, TEMP.KM2, TEMP.Senso;

			TRUNCATE TABLE TEMPI_DI_PERCORRENZA_LOG;

			END ;
    
	ELSE
		SET esito = 1;
	END IF;
	
END $$

delimiter ;

DROP TRIGGER IF EXISTS aggiorna_criticita;

delimiter $$

CREATE TRIGGER aggiorna_criticita
BEFORE UPDATE ON MV_TEMPI_DI_PERCORRENZA
FOR EACH ROW
BEGIN

	CASE 
		WHEN NEW.TempoAttuale > 1.05 * NEW.TempoMedio AND NEW.TempoAttuale < 0.95 * NEW.TempoMedio THEN
			SET NEW.criticita = 'standard';
		WHEN NEW.TempoAttuale = 0 THEN
			SET NEW.criticita = 'standard';
		WHEN NEW.TempoAttuale > 1.15 * NEW.TempoMedio THEN
			SET NEW.criticita = 'rallentamento';
		WHEN NEW.TempoAttuale > 0.85 * NEW.TempoMedio THEN
			SET NEW.criticita = 'scorrevole';
		WHEN NEW.TempoAttuale > 1.50 * NEW.TempoMedio THEN
			SET NEW.criticita = 'coda';
		WHEN NEW.TempoAttuale > 0.50 * NEW.TempoMedio THEN
			SET NEW.criticita = 'libero';
	END CASE;
    
END $$

delimiter ;

DROP EVENT IF EXISTS Refresh_MV_TempiPercorrenza;

delimiter $$
CREATE EVENT Refresh_MV_TempiPercorrenza	
ON SCHEDULE EVERY 20 MINUTE
DO
	BEGIN
		SET @esito := 0;
        
        CALL incremental_refresh_MV_TEMPI_DI_PERCORRENZA ('full refresh', @esito);
        
        IF @esito = 1 THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Errore nel refresh della Materialized View Tempi Di Percorrenza';
		END IF;	

    END $$
    
delimiter ;

DROP EVENT IF EXISTS Rebuild_MV_TempiPercorrenza;

delimiter $$
CREATE EVENT Rebuild_MV_TempiPercorrenza	
ON SCHEDULE EVERY 1 DAY
STARTS '2013-02-01 00:01:00'
DO
	BEGIN
		SET @esito := 0;
        
        CALL incremental_refresh_MV_TEMPI_DI_PERCORRENZA ('rebuild', @esito);
        
        IF @esito = 1 THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Errore nel refresh della Materialized View Tempi Di Percorrenza';
		END IF;	

    END $$




