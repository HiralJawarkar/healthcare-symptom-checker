% ===== Knowledge Base - Edit this to add/remove diseases and symptoms =====
disease(flu,          [fever, cough, sore_throat]).
disease(common_cold,  [runny_nose, sneezing, mild_fever]).
disease(asthma,       [wheezing, shortness_of_breath, chest_tightness]).

% ===== Ask Symptoms - edit prompts or add new symptoms =====
symptom(Patient, fever) :-
    format('Does ~w have a fever? (y/n): ', [Patient]),
    read(Response), Response == y.

symptom(Patient, cough) :-
    format('Does ~w have a cough? (y/n): ', [Patient]),
    read(Response), Response == y.

symptom(Patient, sore_throat) :-
    format('Does ~w have a sore throat? (y/n): ', [Patient]),
    read(Response), Response == y.

symptom(Patient, runny_nose) :-
    format('Does ~w have a runny nose? (y/n): ', [Patient]),
    read(Response), Response == y.

symptom(Patient, sneezing) :-
    format('Is ~w sneezing? (y/n): ', [Patient]),
    read(Response), Response == y.

symptom(Patient, mild_fever) :-
    format('Does ~w have mild fever? (y/n): ', [Patient]),
    read(Response), Response == y.

symptom(Patient, wheezing) :-
    format('Is ~w wheezing? (y/n): ', [Patient]),
    read(Response), Response == y.

symptom(Patient, shortness_of_breath) :-
    format('Is ~w experiencing shortness of breath? (y/n): ', [Patient]),
    read(Response), Response == y.

symptom(Patient, chest_tightness) :-
    format('Does ~w feel chest tightness? (y/n): ', [Patient]),
    read(Response), Response == y.

% ===== Diagnosis Logic - modify symptom combinations =====
hypothesis(Patient, Disease) :-
    disease(Disease, Symptoms),
    has_all_symptoms(Patient, Symptoms).

has_all_symptoms(_, []).
has_all_symptoms(Patient, [Symptom|Rest]) :-
    symptom(Patient, Symptom),
    has_all_symptoms(Patient, Rest).

% ===== Recommendations - customize for diseases =====
recommendation(flu, 'Rest and drink plenty of fluids. Visit a doctor if symptoms worsen.').
recommendation(common_cold, 'Rest, hydration, and over-the-counter medications.').
recommendation(asthma, 'Use inhaler as prescribed and avoid triggers. Seek emergency help if needed.').

% ===== Main program flow =====

start_diagnosis :-
    write('Enter patient name: '), read(Patient),
    ( hypothesis(Patient, Disease) ->
        format('Diagnosis for ~w: ~w~n', [Patient, Disease]),
        recommendation(Disease, Advice),
        format('Recommendation: ~w~n', [Advice])
    ; write('No clear diagnosis could be made based on the symptoms.'), nl
    ).

