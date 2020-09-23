DROP DATABASE IF EXISTS REVUE;

CREATE DATABASE IF NOT EXISTS REVUE;
USE REVUE;
# -----------------------------------------------------------------------------
#       TABLE : ARTICLES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ARTICLES
 (
   CODEARTICLE BIGINT(4) NOT NULL  ,
   CODEREVUE BIGINT(4) NOT NULL  ,
   LIBELLEARTICLE CHAR(32) NULL  ,
   RESUME VARCHAR(255) NULL  ,
   DATEARTICLE DATE NULL  ,
   AUTEURARTICLE CHAR(32) NULL
   , PRIMARY KEY (CODEARTICLE)
 )
 ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ARTICLES
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ARTICLES_REVUES
     ON ARTICLES (CODEREVUE ASC);

# -----------------------------------------------------------------------------
#       TABLE : MODULES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MODULES
 (
   CODEMODULE BIGINT(4) NOT NULL  ,
   LIBELLEMODULE CHAR(32) NULL
   , PRIMARY KEY (CODEMODULE)
 )
 ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       TABLE : REVUES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REVUES
 (
   CODEREVUE BIGINT(4) NOT NULL  ,
   LIBELLEREVUE CHAR(32) NULL  ,
   DOMAINE CHAR(32) NULL  ,
   DATEREVUE DATE NULL
   , PRIMARY KEY (CODEREVUE)
 )
 ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       TABLE : APPARTIENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS APPARTIENT
 (
   CODEMODULE BIGINT(4) NOT NULL  ,
   CODEARTICLE BIGINT(4) NOT NULL
   , PRIMARY KEY (CODEMODULE,CODEARTICLE)
 )
 ENGINE=InnoDB;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE APPARTIENT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_APPARTIENT_MODULES
     ON APPARTIENT (CODEMODULE ASC);

CREATE  INDEX I_FK_APPARTIENT_ARTICLES
     ON APPARTIENT (CODEARTICLE ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE ARTICLES
  ADD FOREIGN KEY FK_ARTICLES_REVUES (CODEREVUE)
      REFERENCES REVUES (CODEREVUE) ;


ALTER TABLE APPARTIENT
  ADD FOREIGN KEY FK_APPARTIENT_MODULES (CODEMODULE)
      REFERENCES MODULES (CODEMODULE) ;


ALTER TABLE APPARTIENT
  ADD FOREIGN KEY FK_APPARTIENT_ARTICLES (CODEARTICLE)
      REFERENCES ARTICLES (CODEARTICLE) ;
