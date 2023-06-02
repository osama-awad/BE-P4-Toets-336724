    -- Step: 01
    -- Goal: Create a new database mvc-2209c-P4-toets
    -- **********************************************************************************
    -- Version       Date:           Author:                     Description:
    -- *******       **********      ****************            ******************
    -- 01            02-06-2023      Osama Awad            New
    -- **********************************************************************************/

    -- Check if the database exists
    DROP DATABASE IF EXISTS `Mvc-2209c-P4-toets`;

    -- Create a new Database
    CREATE DATABASE IF NOT EXISTS `Mvc-2209c-P4-toets`;

    -- Use database Mvc-2209c-P4-toets
    Use `Mvc-2209c-P4-toets`;

    -- Step: 02
    -- Goal: Create a new table Examen
    -- **********************************************************************************
    -- Version       Date:           Author:                     Description:
    -- *******       **********      ****************            ******************
    -- 01            02-06-2023      Osama Awad            New
    -- **********************************************************************************/

    -- Drop table Examen
    DROP TABLE IF EXISTS Examen;

    CREATE TABLE IF NOT EXISTS Examen
    (
        Id                  INT UNSIGNED        NOT NULL    AUTO_INCREMENT
        ,StudentId          INT                  NOT NULL
        ,Rijschool          VARCHAR(50)          NOT NULL
        ,Stad               VARCHAR(50)          NOT NULL
        ,Rijbewijscategorie VARCHAR(12)          NOT NULL
        ,Datum              DATE                 NOT NULL
        ,Uitslag            VARCHAR(20)          NOT NULL
        ,IsActief           BIT                  NOT NULL    DEFAULT 1


    ,CONSTRAINT  PK_Examen_Id   PRIMARY KEY CLUSTERED(Id)
    ) ENGINE=InnoDB;


    -- Step: 03
    -- Goal: Fill table Examen with data
    -- **********************************************************************************
    -- Version       Date:           Author:                     Description:
    -- *******       **********      ****************            ******************
    -- 01            04-04-2023      Osama Awad            New
    -- 02            04-04-2023      Osama Awad            Added more records
    -- **********************************************************************************/

    INSERT INTO Examen
    (
        StudentId
        ,Rijschool
        ,Stad
        ,Rijbewijscategorie
        ,Datum
        ,Uitslag
        ,IsActief
    )
    VALUES
        ('100234', 'VolGasVooruit', 'Rotterdam', 'B', '2023-04-03', 'Geslaagd',1)
        ,('123432', 'InZijnVierDoorDeBocht', 'Sliedrecht', 'C', '2023-03-01', 'Geslaagd',1)
        ,('103234', 'LinksomRechtsom', 'Dodrecht', 'D', '2023-05-15', 'Geslaagd',1)
        ,('106452', 'OpDeVluchtStrook', 'Zwijndrecht', 'AM', '2023-05-08', 'Gezakt',1)
        ,('104546', 'RechtDoorEnGaan', 'Rotterdam', 'B', '2023-04-17', 'Gezakt',1)
        ,('100333', 'AltijdGeslaagd', 'Dodrecht', 'B', '2023-05-12', 'Geslaagd',1)
        ,('124444', 'RijlesVoorJou', 'Rotterdam', 'B', '2023-04-12', 'Geslaagd',1);




    -- Step: 04
    -- Goal: Create a new table ExamenPerExaminator
    -- **********************************************************************************
    -- Version       Date:           Author:                     Description:
    -- *******       **********      ****************            ******************
    -- 01            13-04-2023      Osama Awad            New
    -- **********************************************************************************/

    -- Drop table ExamenPerExaminator
    DROP TABLE IF EXISTS ExamenPerExaminator;

    CREATE TABLE IF NOT EXISTS ExamenPerExaminator
    (
        Id                   TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
    ,ExamenId         INT            UNSIGNED        NOT NULL
    ,ExaminatorId       INT          UNSIGNED        NOT NULL
    ,IsActief             BIT                             NOT NULL    DEFAULT 1
    

    ,CONSTRAINT  PK_ExamenPerExaminator_Id   PRIMARY KEY CLUSTERED(Id)
 ,CONSTRAINT FK_ExamenPerExaminator_ExamenId_Examen FOREIGN KEY (ExamenId) REFERENCES Examen (Id)
  ,CONSTRAINT FK_ExamenPerExaminator_ExaminatorId_Examinator FOREIGN KEY (ExaminatorId) REFERENCES Examinator (Id)
   
    ) ENGINE=InnoDB;


    -- Step: 05
    -- Goal: Fill table ExamenPerExaminator with data
    -- **********************************************************************************
    -- Version       Date:           Author:                     Description:
    -- *******       **********      ****************            ******************
    -- 01            13-04-2023      Osama Awad            New
    -- **********************************************************************************/

    INSERT INTO ExamenPerExaminator
    (
        ExamenId,
        ExaminatorId,
        IsActief
    )
    VALUES
        (1, 3, 1),
        (3, 3, 1),
        (2, 2, 1),
        (4, 1, 1),
        (7, 3, 1),
        (6, 2, 1),
        (5, 4, 1);



    -- Step: 06
    -- Goal: Create a new table Examinator
    -- **********************************************************************************
    -- Version       Date:           Author:                     Description:
    -- *******       **********      ****************            ******************
    -- 01            13-04-2023      Osama Awad            New
    -- **********************************************************************************/

    -- Drop table Examinator
    DROP TABLE IF EXISTS Examinator;

    CREATE TABLE IF NOT EXISTS Examinator
    (
        Id                   INT         UNSIGNED        NOT NULL    AUTO_INCREMENT
    ,Voornaam             VARCHAR(20)                     NOT NULL
    ,Tussenvoegsel                 VARCHAR(30)                      NULL
    ,Acternaam             VARCHAR(20)                               NOT NULL
    ,Mobiel            VARCHAR(12)                     NOT NULL
    ,IsActief             BIT                             NOT NULL    DEFAULT 1


    ,CONSTRAINT      PK_Examinator_Id   PRIMARY KEY CLUSTERED(Id)
    ) ENGINE=InnoDB;


    -- Step: 07
    -- Goal: Fill table Examinator with data
    -- **********************************************************************************
    -- Version       Date:           Author:                     Description:
    -- *******       **********      ****************            ******************
    -- 01            13-04-2023      Osama Awad            New
    -- **********************************************************************************/

    INSERT INTO Examinator
    (
        Voornaam
        ,Tussenvoegsel
        ,Acternaam
        ,Mobiel
        ,IsActief

    )
    VALUES
        ('Manuel', 'van', 'Meerkeren', '06-28493823', 1 )
        ,('Lissette', 'den', 'Dongen', '06-2438299', 1 )
        ,('Jurswailly', '', 'Luciano', '06-48293846', 1 )
        ,('Naswha', '', 'Salawi', '06-34291219', 1 );
    
