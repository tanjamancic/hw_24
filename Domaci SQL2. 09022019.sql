-- Zadatak 1.
select Odsek.Naziv, count (*) as "Broj kurseva"
from Odsek, Kurs
where Odsek.SifO = Kurs.SifO
group by Odsek.SifO

-- Zadatak 2.
select Kurs.Naziv, count (*) as "Kursevi koje pohadja vise od 3 studenta"
from Kurs, Pohadja, Raspored
where Kurs.SifK = Raspored.SifK and Pohadja.SifR = Raspored.SifR
group by Kurs.SifK
having count (*) > 3

-- Zadatak 3.
select sum (Raspored.BrPrijaveljenih) / count(DISTINCT(Raspored.SifK))
from Raspored

-- Zadatak 4.
select Kurs.Naziv
from Kurs, Student, Raspored, Pohadja
where Student.SifS = 1 and Student.SifS = Pohadja.SifS and Pohadja.SifR = Raspored.SifR and Raspored.SifK = Kurs.SifK

-- Zadatak 5.
select Student.Ime, count(*) as "Broj predmeta"
from Student, Pohadja, Raspored
where Student.SifS = Pohadja.SifS and Pohadja.SifR = Raspored.SifR
group by Student.SifS
having count(*)>2

-- Zadatak 6.
select DISTINCT Student.Ime
from Student, Pohadja, Raspored
where Student.SifS = Pohadja.SifS and Pohadja.SifR = Raspored.SifR and Raspored.SifU = 111 and Raspored.Dan = "Pon"

-- Zadatak 7.
select Kurs.Naziv, max(Raspored.BrPrijaveljenih) as "Broj prijavljenih"
from Kurs, Profesor, Raspored
where Kurs.SifK = Raspored.SifK and Profesor.SifP = Raspored.SifP and Profesor.SifP = 7

-- Zadatak 8.
select Kurs.Naziv
from Kurs, Preduslov
where Preduslov.SifK = 4 and Kurs.SifK = Preduslov.SifKP

-- Zadatak 9.
select Kurs.Naziv, count (*) as "Broj kurseva kao preduslov"
from Kurs, Preduslov
where Kurs.SifK = Preduslov.SifK
group by Preduslov.SifK

-- Zadatak 10.
select Profesor.Ime, sum(Raspored.BrPrijaveljenih) as "Broj studenata"
from Profesor, Raspored
where Raspored.SifP = Profesor.SifP and Raspored.Dan = "Pon"
group by Raspored.SifP
