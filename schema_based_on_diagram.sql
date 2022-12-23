create index patient_id_medical_histories on medical_histories(patient_id);
create index invoices_medical_histories on invoices(medical_history_id);
create index invoice_items_treatment_id on invoice_items(treatment_id);