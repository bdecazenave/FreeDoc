# On fait appel à la GEM Faker afin de générer aléatoirement certaines variables
require 'faker'

# Ici on vient supprimer toutes les entrées créées à chaque db:seed. Ce faisant, on évite de créer trop d'entrées en BDD 
City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

# On crée trrois array pour pouvoir y stocker docteurs, patients et villes
doctors = []
patients = []
cities = []
specialities_all_array = []

# On crée 5 villes 
5.times do |i|
    cities << City.create!(name:Faker::Address.city)
  end


# On créé les spécialités
specialities_array = ["Médecine des accidents et urgences","Allergologie","Anesthésie","Cardiologie","Psychiatrie de l'enfant","Biologie clinique","Chimie clinique","Microbiologie clinique","Neurophysiologie clinique","Chirurgie craniofaciale ","Dermatologie","Endocrinologie","Médecine familiale et générale","Chirurgie gastro-entérologique","Gastro-entérologie","Médecine générale","Chirurgie générale","Gériatrie","Hématologie","Immunologie","Infectieux maladies","Médecine interne","Médecine de laboratoire","Néphrologie","Neuropsychiatrie","Neurologie","Neurochirurgie","Médecine nucléaire","Obstétrique et gynécologie","Médecine du travail","Ophtalmologie"," Chirurgie buccale et maxillo-faciale","Orthopédie","Otorhinolaryngologie","Chirurgie pédiatrique","Pédiatrie","Pathologie","Pharmacologie","Médecine physique et réadaptation","Chirurgie plastique","Chirurgie podiatrique","Préventive médecine","Psychiatrie","Santé publique","Radio-oncologie","Radiologie","Médecine respiratoire","Rhumatologie","Stomatologie","Chirurgie thoracique","Médecine tropicale ine","Urologie","Chirurgie vasculaire","Vénéréologie"]
specialities_array.each do |name|
  specialities_all_array << Speciality.create!(name: name)
end


# On crée une boucle qui génére 10 docteurs et 10 patients. Certaines variables sont générées par Faker.
10.times do |i|
  doctors << Doctor.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city: cities.sample.id)
  patients <<  Patient.create!(first_name: Faker::Name.first_name, last_name:  Faker::Name.last_name, city: cities.sample.id)
end

# On créé 20 RDV liés à des ID patients et des ID docteurs
20.times do |i|
  appointments = Appointment.create!(doctor: doctors.sample, patient: patients.sample, date: Faker::Date.forward(days: 23), city: cities.sample)
end


50.times do |i|
specialities_id = specialities_all_array.sample
  join_table_doctors_specialities = JoinTableDoctorsSpeciality.create!(doctor: doctors.sample, speciality: specialities_id)
end





#10.times do |i|  
  #specialities << Speciality.create!(name: ["Médecine des accidents et urgences","Allergologie","Anesthésie","Cardiologie","Psychiatrie de l'enfant","Biologie clinique","Chimie clinique","Microbiologie clinique","Neurophysiologie clinique","Chirurgie craniofaciale ","Dermatologie","Endocrinologie","Médecine familiale et générale","Chirurgie gastro-entérologique","Gastro-entérologie","Médecine générale","Chirurgie générale","Gériatrie","Hématologie","Immunologie","Infectieux maladies","Médecine interne","Médecine de laboratoire","Néphrologie","Neuropsychiatrie","Neurologie","Neurochirurgie","Médecine nucléaire","Obstétrique et gynécologie","Médecine du travail","Ophtalmologie"," Chirurgie buccale et maxillo-faciale","Orthopédie","Otorhinolaryngologie","Chirurgie pédiatrique","Pédiatrie","Pathologie","Pharmacologie","Médecine physique et réadaptation","Chirurgie plastique","Chirurgie podiatrique","Préventive médecine","Psychiatrie","Santé publique","Radio-oncologie","Radiologie","Médecine respiratoire","Rhumatologie","Stomatologie","Chirurgie thoracique","Médecine tropicale ine","Urologie","Chirurgie vasculaire","Vénéréologie"].sample)
  #end
