-- patients schema 

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE
);

CREATE TABLE medical_histories(
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(50),
    CONSTRAINT fk_patient FOREIGN KEY (patient_id)
    REFERENCES patients(id)
);


CREATE TABLE treaments(
    id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    name VARCHAR(100)
);

-- combined table treaments and medical_histories 
-- you can break the many-to-many 
-- relationship into two one-to-many 
-- relationships by using a third table, 
-- called a join table.

CREATE TABLE medical_history_treatment(
medical_history_id INT,
treatment_id INT,
CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id)
REFERENCES medical_histories(id),
CONSTRAINT fk_treatment FOREIGN KEY(treatment_id)
REFERENCES treaments(id)
);

CREATE TABLE invoices(
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id)
    REFERENCES medical_histories(id)
);


CREATE TABLE invoice_items(
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT fk_invoices FOREIGN KEY(invoice_id)
    REFERENCES invoices(id),
    CONSTRAINT fk_treatment FOREIGN KEY(treatment_id)
    REFERENCES treaments(id)
)


