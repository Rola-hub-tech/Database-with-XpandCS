create table Patient(
ID int primary key,
patientName varchar(20),
dateOfBirth date,
)

create table Consultant(
ID int primary key,
consultantName varchar(20)
)

create table Drug(
code int primary key,
dosage float
)

create table Drug_Brand(
code int references Drug(code),
brand varchar(20),
primary key (code, brand)
)

create table Nurse(
ID int primary key,
nurseName varchar(20),
nurseAddress varchar(20),
)

create table Ward(
ID int primary key,
wardName varchar(20)
)

create table Patient_Consultant_Examine(
patientID int references Patient(ID),
consultantID int references Consultant(ID),
primary key (patientID, consultantID)
)

alter table Patient
add consultantID int references Consultant(ID)

alter table Ward
add supervisor int references Nurse(ID)

alter table Nurse
add wardID int references Ward(ID)

alter table Patient
add wardID int references Ward(ID)

create table Nurse_Give_Patient_Drug(
patientID int references Patient(ID),
drugCode int references Drug(code),
nurseID int references Nurse(ID),
dosage int,
givingDate date,
givingTime time,
primary key(patientID, drugCode, givingTime)
)
