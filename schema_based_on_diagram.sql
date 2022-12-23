create table patients(id serial primary key , name varchar(50) , date_of_birth date);

create table invoices(
    id serial primary key , 
    total_amount decimal , 
    generated_at timestamp ,
    payed_at timestamp,
    medical_history_id int,
    constraint fk 
    foreign key medical_history_id 
    references medical_histories(id) 
    on delete cascade
    );

    create table medical_histories(
        id serial primary key ,
        admitted_at timestamp,
        patient_id int,
        status varchar default active,
        constraint fk 
       foreign key patient_id
       references patients(id)
    );

    create table invoice_items(
        id serial primary key,
        unit_price decimal,
        quantity int,
        total_price decimal,
        invoice_id int,
        treatment_id int
        constraint fk foreign key invoice_id references invoices(id)on delete cascade,
        constraint fk foreign key treatment_id references treatments(id)on delete cascade
        );

    create table treatments(
        id serial primary key,
        type varchar(10),
        name varchar(20),
        );    

    CREATE TABLE medical_histories_has_treatments (
       medical_history_id int refrences medical_histories(id),
       treatment_id int refrences treatments(id),
    );    

   create index patient_id_medical_histories on medical_histories(patient_id);
    create index invoices_medical_histories on invoices(medical_history_id);
    create index invoice_items_treatment_id on invoice_items(treatment_id);