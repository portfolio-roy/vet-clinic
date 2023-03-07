CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  status VARCHAR(255) NOT NULL,
  patient_id INT NOT NULL REFERENCES patients(id)
);

CREATE TABLE treatments (
  id INT NOT NULL REFERENCES medical_histories(id) PRIMARY KEY,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE medical_history_treatments (
  medical_history_id INTEGER NOT NULL REFERENCES medical_histories(id),
  treatment_id INTEGER NOT NULL REFERENCES treatments(id),
  PRIMARY KEY (medical_history_id, treatment_id)
);

-- Add foreign key indexes
CREATE INDEX fk_medical_history_treatments_medical_history_id_idx ON medical_history_treatments(medical_history_id);
CREATE INDEX fk_medical_history_treatments_treatment_id_idx ON medical_history_treatments(treatment_id);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INTEGER REFERENCES medical_histories(id)
);


CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INTEGER,
  total_price DECIMAL,
  invoice_id INTEGER REFERENCES invoices(id),
  treatment_id INTEGER REFERENCES treatments(id)
);
