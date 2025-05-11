CREATE TABLE Lekarze (
  PWZ int primary key,
  imie_lek varchar(250) not null,
  nazwisko_lek varchar(250) not null
);
CREATE TABLE Gabinety(
  Nr_Gabinetu int primary key,
  PWZ_wGabinecie int not null,
  foreign key (PWZ_wGabinecie) references Lekarze(PWZ)
);
CREATE TABLE Pacjenci(
  Pesel char(11) primary key,
  imie varchar(250) not null,
  nazwisko varchar(250) not null
);
CREATE TABLE Terminy_Umowione(
	TU_ID int auto_increment primary key,
    TU_lek int not null,
    TU_Gab int not null,
    TU_pesel char(11) not null,
    Data_umowienia timestamp default current_timestamp,
    Data_zabiegu date not null,
    TU_zabieg varchar(250) not null,
    priority enum('Próba Wysiłkowa','Echo','Holter RR','Holter EKG', 'Wizyta pr') not null,
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
insert into Lekarze (PWZ, imie_lek, nazwisko_lek) values (96489428, 'Jasio', 'Kotek');

insert into Gabinety (Nr_Gabinetu, PWZ_wGabinecie)
  select 10, PWZ
    from Lekarze
      where PWZ = 44359105;
      
insert into Gabinety (Nr_Gabinetu, PWZ_wGabinecie)
  select 11, PWZ
    from Lekarze
      where PWZ = 90608917;
      
insert into Gabinety (Nr_Gabinetu, PWZ_wGabinecie)
  select 20, PWZ
    from Lekarze
      where PWZ = 41961459;
      
insert into Gabinety (Nr_Gabinetu, PWZ_wGabinecie)
  select 21, PWZ
    from Lekarze
      where PWZ = 93717460;
      
insert into Gabinety (Nr_Gabinetu, PWZ_wGabinecie)
  select 22, PWZ
    from Lekarze
      where PWZ = 25512297;
      
insert into Gabinety (Nr_Gabinetu, PWZ_wGabinecie)
  select 31, PWZ
    from Lekarze
      where PWZ = 96489428;
      
insert into Pacjenci (Pesel, imie, nazwisko) values (81010200131, 'Jarosław', 'Kowalski');
insert into Pacjenci (Pesel, imie, nazwisko) values (72033012345, 'Anna', 'Kowalska');
insert into Pacjenci (Pesel, imie, nazwisko) values (70020529715, 'Jakub', 'Kiwior');
insert into Pacjenci (Pesel, imie, nazwisko) values (02070803628, 'Jan', 'Bednarek');
insert into Pacjenci (Pesel, imie, nazwisko) values (91071427765, 'Ewa', 'Znachor');