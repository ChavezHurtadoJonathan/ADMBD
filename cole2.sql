/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     02/07/2021 13:37:52                          */
/*==============================================================*/


drop table if exists CALIFICACIONES;

drop table if exists CURSO;

drop table if exists DOCENTE;

drop table if exists ESTUDIANTE;

drop table if exists GENERO;

drop table if exists MATRICULA;

drop table if exists PADRES;

drop table if exists PERIDODOACADEMICO;

/*==============================================================*/
/* Table: CALIFICACIONES                                        */
/*==============================================================*/
create table CALIFICACIONES
(
   IDCALIFICACIONES     int not null,
   NOTA_1               int,
   NOTA_2               int,
   NOTA_RECU            int,
   NOTA_FINAL           int,
   primary key (IDCALIFICACIONES)
);

/*==============================================================*/
/* Table: CURSO                                                 */
/*==============================================================*/
create table CURSO
(
   IDCURSO              int not null,
   IDDOCENTE            int,
   CURSOS               varchar(10),
   PARALELO             varchar(1),
   ID_DE_DOCENTE_TUTOR  int,
   UVICACION            varchar(40),
   primary key (IDCURSO)
);

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
create table DOCENTE
(
   IDDOCENTE            int not null,
   CEDULAD              varchar(11),
   NOMBRED              varchar(50),
   APELLIDOD            varchar(50),
   DIRECCIOND           varchar(50),
   TELEFONOD            int,
   primary key (IDDOCENTE)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE
(
   IDESTUDIANTE         int not null,
   IDCURSO              int,
   IDCALIFICACIONES     int,
   IDPERIODO            int,
   IDGENERO             int,
   IDPADRES             int,
   IDMATRICULA          int,
   CEDULA_E             varchar(11),
   NOMBRE               varchar(50),
   APELLIDOD            varchar(50),
   GENEROS              varchar(10),
   FECHA_N              date,
   DIRECCION_E          varchar(50),
   TELEFONO             int,
   primary key (IDESTUDIANTE)
);

/*==============================================================*/
/* Table: GENERO                                                */
/*==============================================================*/
create table GENERO
(
   IDGENERO             int not null,
   GENEROS              varchar(10),
   primary key (IDGENERO)
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
create table MATRICULA
(
   IDMATRICULA          int not null,
   IDDELESTUDIANTE      int,
   IDDEPERIODOACADEMICO int,
   IDDECURSO            int,
   primary key (IDMATRICULA)
);

/*==============================================================*/
/* Table: PADRES                                                */
/*==============================================================*/
create table PADRES
(
   IDPADRES             int not null,
   PADRECEDULA          varchar(11),
   NOMBRESP             varchar(40),
   APELLIDOSP           varchar(40),
   DIRTRABP             varchar(40),
   TLFTRABP             varchar(10),
   ACTIVOP              varchar(2),
   MADRECEDULA          varchar(11),
   NOMBRESM             varchar(40),
   APELLIDOSM           varchar(40),
   DIRTRABM             varchar(40),
   TLFTRABM             varchar(10),
   ACTIVOM              varchar(2),
   REPRESENTANTE        varchar(40),
   primary key (IDPADRES)
);

/*==============================================================*/
/* Table: PERIDODOACADEMICO                                     */
/*==============================================================*/
create table PERIDODOACADEMICO
(
   IDPERIODO            int not null,
   ANO                  numeric(4,0),
   FINICIO              date,
   FFIN                 date,
   N_ESTUDIANTES_MATRICULADOS int,
   primary key (IDPERIODO)
);

alter table CURSO add constraint FK_EVALUA foreign key (IDDOCENTE)
      references DOCENTE (IDDOCENTE) on delete restrict on update restrict;

alter table ESTUDIANTE add constraint FK_ADQUIERE foreign key (IDCALIFICACIONES)
      references CALIFICACIONES (IDCALIFICACIONES) on delete restrict on update restrict;

alter table ESTUDIANTE add constraint FK_ESTAN foreign key (IDCURSO)
      references CURSO (IDCURSO) on delete restrict on update restrict;

alter table ESTUDIANTE add constraint FK_ESTAN_MATRICULADOS foreign key (IDPERIODO)
      references PERIDODOACADEMICO (IDPERIODO) on delete restrict on update restrict;

alter table ESTUDIANTE add constraint FK_RELATIONSHIP_7 foreign key (IDMATRICULA)
      references MATRICULA (IDMATRICULA) on delete restrict on update restrict;

alter table ESTUDIANTE add constraint FK_SON foreign key (IDGENERO)
      references GENERO (IDGENERO) on delete restrict on update restrict;

alter table ESTUDIANTE add constraint FK_TIENE foreign key (IDPADRES)
      references PADRES (IDPADRES) on delete restrict on update restrict;

