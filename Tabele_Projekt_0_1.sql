create database Przychodnia;
use Przychodnia;

CREATE TABLE Lekarze (
  PWZ int primary key,
  imie_lek varchar(250) not null,
  nazwisko_lek varchar(250) not null
);
CREATE TABLE Gabinety(
  Nr_Gabinetu int primary key,
  zabieg varchar(250) not null,
  PWZ_wGabinecie int not null,
  foreign key (PWZ_wGabinecie) references Lekarze(PWZ)
);
CREATE TABLE Pacjenci(
  Pesel int primary key,
  imie varchar(250) not null,
  nazwisko varchar(250) not null
);
CREATE TABLE Terminy_Umowione(
	TU_ID int auto_increment primary key,
    TU_lek int not null,
    TU_Gab int not null,
    TU_pesel int not null,
    Data_umowienia timestamp default current_timestamp,
    Data_zabiegu date not null,
    foreign key (TU_lek) references Lekarze(PWZ),
    foreign key (TU_Gab) references Gabinety(Nr_Gabinetu),
    foreign key (TU_pesel) references Pacjenci(Pesel)
);

CREATE TABLE Odbyte_wizyty(
	OW_ID int auto_increment primary key,
    OW_tu_id int,
    foreign key (OW_tu_id) references Terminy_Umowione(TU_ID)
);

insert into Lekarze (PWZ, imie_lek, nazwisko_lek) values (44359105, 'Jan', 'Kowalski');
insert into Lekarze (PWZ, imie_lek, nazwisko_lek) values (90608917, 'Maciej', 'Lekarczyk');
insert into Lekarze (PWZ, imie_lek, nazwisko_lek) values (41961459, 'Stefan', 'Prace');
insert into Lekarze (PWZ, imie_lek, nazwisko_lek) values (93717460, 'Jerzy', 'Jabłko');
insert into Lekarze (PWZ, imie_lek, nazwisko_lek) values (25512297, 'Marcin', 'Szczepionka');
