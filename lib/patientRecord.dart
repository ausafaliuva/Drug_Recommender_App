class PatientRecord {

  String race;
  String gender;
  String age;
  int admissionTypeId;
  int dischargeDispositionId;
  int admissionSourceId;
  int timeInHospital;
  int numLabProcedures;
  int numProcedures;
  int numMedications;
  int numberOutpatient;
  int numberEmergency;
  int numberInpatient;
  String diag1;
  String diag2;
  String diag3;
  int numberDiagnoses;
  String maxGluSerum;
  String a1Cresult;
  String change;
  String diabetesMed;
  String readmitted;

  PatientRecord({


    required this.race,
    required this.gender,
    required this.age,
    required this.admissionTypeId,
    required this.dischargeDispositionId,
    required this.admissionSourceId,
    required this.timeInHospital,
    required this.numLabProcedures,
    required this.numProcedures,
    required this.numMedications,
    required this.numberOutpatient,
    required this.numberEmergency,
    required this.numberInpatient,
    required this.diag1,
    required this.diag2,
    required this.diag3,
    required this.numberDiagnoses,
    required this.maxGluSerum,
    required this.a1Cresult,
    required this.change,
    required this.diabetesMed,
    required this.readmitted,
  });

  factory PatientRecord.fromJson(Map<String, dynamic> json) {
    return PatientRecord(

      race: json['race'],
      gender: json['gender'],
      age: json['age'],
      admissionTypeId: json['admission_type_id'],
      dischargeDispositionId: json['discharge_disposition_id'],
      admissionSourceId: json['admission_source_id'],
      timeInHospital: json['time_in_hospital'],
      numLabProcedures: json['num_lab_procedures'],
      numProcedures: json['num_procedures'],
      numMedications: json['num_medications'],
      numberOutpatient: json['number_outpatient'],
      numberEmergency: json['number_emergency'],
      numberInpatient: json['number_inpatient'],
      diag1: json['diag_1'],
      diag2: json['diag_2'],
      diag3: json['diag_3'],
      numberDiagnoses: json['number_diagnoses'],
      maxGluSerum: json['max_glu_serum'],
      a1Cresult: json['A1Cresult'],
      change: json['change'],
      diabetesMed: json['diabetesMed'],
      readmitted: json['readmitted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'race': race,
      'gender': gender,
      'age': age,
      'admission_type_id': admissionTypeId,
      'discharge_disposition_id': dischargeDispositionId,
      'admission_source_id': admissionSourceId,
      'time_in_hospital': timeInHospital,
      'num_lab_procedures': numLabProcedures,
      'num_procedures': numProcedures,
      'num_medications': numMedications,
      'number_outpatient': numberOutpatient,
      'number_emergency': numberEmergency,
      'number_inpatient': numberInpatient,
      'diag_1': diag1,
      'diag_2': diag2,
      'diag_3': diag3,
      'number_diagnoses': numberDiagnoses,
      'max_glu_serum': maxGluSerum,
      'A1Cresult': a1Cresult,
      'change': change,
      'diabetesMed': diabetesMed,
      'readmitted': readmitted,
    };
  }
}
