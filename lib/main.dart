import 'dart:convert';

import 'package:drug_recommender_app/resultScreen.dart';
import 'package:flutter/material.dart';
import 'patientRecord.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient Record Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PatientForm(),
    );
  }
}

class PatientForm extends StatefulWidget {
  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for each field
  List<String> raceOptions = [
    'Caucasian',
    'AfricanAmerican',
    'Hispanic',
    'Asian',
    'Other'
  ];
  String? selectedRace;

  List<String> genderOptions = ['Male', 'Female', 'Other'];
  String? selectedGender;

  List<String> ageOptions = [
    '[0-10)',
    '[10-20)',
    '[20-30)',
    '[30-40)',
    '[40-50)',
    '[50-60)',
    '[70-80)',
    '[80-90)',
    '[90-100)'
  ];
  String? selectedAge;
  List<int> admissionTypeIdOptions = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
  ];
  int? selectedAdmissionTypeId;
  List<int> dischargeDispositionIdOptions = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
  ];
  int? selectedDischargeDispositionId;

  List<int> admissionoSourceIdOptions = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
  ];
  int? selectedAdmissionSourceId;
  final timeInHospitalController = TextEditingController();
  final numLabProceduresController = TextEditingController();
  final numProceduresController = TextEditingController();
  final numMedicationsController = TextEditingController();
  final numberOutpatientController = TextEditingController();
  final numberEmergencyController = TextEditingController();
  final numberInpatientController = TextEditingController();
  final diag1Controller = TextEditingController();
  final diag2Controller = TextEditingController();
  final diag3Controller = TextEditingController();
  final numberDiagnosesController = TextEditingController();

  List<String> maxGluSerumOptions = ['>200', '>300', 'normal', 'none'];
  String? selectedMaxGluSerum;

  List<String> a1CresultOptions = ['>8', '>7', 'normal', 'none'];
  String? selectedA1Cresult;

  List<String> changeOptions = ['No', 'Ch'];
  String? selectedChange;

  List<String> diabetesMedOptions = ['Yes', 'No'];
  String? selectedDiabetesMed;
  List<String> readmittedOptions = ['>30', '<30', 'NO'];
  String? selectedReadmitted;

  // ... [other controllers]

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.

    timeInHospitalController.dispose();

    numLabProceduresController.dispose();
    numProceduresController.dispose();
    numMedicationsController.dispose();
    numberOutpatientController.dispose();
    numberEmergencyController.dispose();
    numberInpatientController.dispose();
    diag1Controller.dispose();
    diag2Controller.dispose();
    diag3Controller.dispose();
    numberDiagnosesController.dispose();

    super.dispose();
  }

  Future<List<String>> submitPatientRecord(PatientRecord record) async {
    const String apiUrl =
        'http://10.0.2.2:5000/predict'; // Replace <your-api-url> with your actual API URL
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(record.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<String> drugNames = [
          'Metformin',
          'Repaglinide',
          'Nateglinide',
          'Chlorpropamide',
          'Glimepiride',
          'Acetohexamide',
          'Glipizide',
          'Glyburide',
          'Tolbutamide',
          'Pioglitazone',
          'Rosiglitazone',
          'Acarbose',
          'Miglitol',
          'Troglitazone',
          'Tolazamide',
          'Examide',
          'Citoglipton',
          'Insulin',
          'Glyburide-Metformin',
          'Glipizide-Metformin',
          'Glimepiride-Pioglitazone',
          'Metformin-Rosiglitazone',
          'Metformin-Pioglitazone'
        ];

        List<String> predictions = List<String>.from(
            data['prediction'][0].map((item) => item.toString()));
        List<String> results = [];

        predictions.asMap().forEach((index, value) {
          results.add('${drugNames[index]}: $value');
        });

        return results;
      } else {
        return [
          "Error: Server responded with status code ${response.statusCode}"
        ];
      }
    } catch (e) {
      return ["Error sending data: $e"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Record Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            DropdownButtonFormField<String>(
              value: selectedRace,
              decoration: InputDecoration(labelText: 'Race'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedRace = newValue;
                });
              },
              items: raceOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: InputDecoration(labelText: 'Gender'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue;
                });
              },
              items:
                  genderOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButtonFormField<String>(
              value: selectedAge,
              decoration: InputDecoration(labelText: 'Age'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedAge = newValue;
                });
              },
              items: ageOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            DropdownButtonFormField<int>(
              value: selectedAdmissionTypeId,
              decoration: InputDecoration(labelText: 'Admission Type ID'),
              onChanged: (int? newValue) {
                setState(() {
                  selectedAdmissionTypeId = newValue;
                });
              },
              items: admissionTypeIdOptions
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),

            DropdownButtonFormField<int>(
              value: selectedDischargeDispositionId,
              decoration:
                  InputDecoration(labelText: 'Discharge Disposition ID'),
              onChanged: (int? newValue) {
                setState(() {
                  selectedDischargeDispositionId = newValue;
                });
              },
              items: dischargeDispositionIdOptions
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),

            DropdownButtonFormField<int>(
              value: selectedAdmissionSourceId,
              decoration: InputDecoration(labelText: 'Admission Source ID'),
              onChanged: (int? newValue) {
                setState(() {
                  selectedAdmissionSourceId = newValue;
                });
              },
              items: admissionoSourceIdOptions
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),

            TextFormField(
              controller: timeInHospitalController,
              decoration: InputDecoration(labelText: 'Time in Hospital'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: numLabProceduresController,
              decoration:
                  InputDecoration(labelText: 'Number of Lab Procedures'),
              keyboardType: TextInputType.number,
            ),

            TextFormField(
              controller: numProceduresController,
              decoration: InputDecoration(labelText: 'Number of Procedures'),
              keyboardType: TextInputType.number,
            ),

            TextFormField(
              controller: numMedicationsController,
              decoration: InputDecoration(labelText: 'Number of Medications'),
              keyboardType: TextInputType.number,
            ),

            TextFormField(
              controller: numberOutpatientController,
              decoration:
                  InputDecoration(labelText: 'Number of Outpatient Visits'),
              keyboardType: TextInputType.number,
            ),

            TextFormField(
              controller: numberEmergencyController,
              decoration:
                  InputDecoration(labelText: 'Number of Emergency Visits'),
              keyboardType: TextInputType.number,
            ),

            TextFormField(
              controller: numberInpatientController,
              decoration:
                  InputDecoration(labelText: 'Number of Inpatient Visits'),
              keyboardType: TextInputType.number,
            ),

            TextFormField(
              controller: diag1Controller,
              decoration:
                  InputDecoration(labelText: 'Primary Diagnosis (diag_1)'),
              keyboardType: TextInputType.text,
            ),

            TextFormField(
              controller: diag2Controller,
              decoration:
                  InputDecoration(labelText: 'Secondary Diagnosis (diag_2)'),
              keyboardType: TextInputType.text,
            ),

            TextFormField(
              controller: diag3Controller,
              decoration:
                  InputDecoration(labelText: 'Additional Diagnosis (diag_3)'),
              keyboardType: TextInputType.text,
            ),

            TextFormField(
              controller: numberDiagnosesController,
              decoration: InputDecoration(labelText: 'Number of Diagnoses'),
              keyboardType: TextInputType.number,
            ),

            DropdownButtonFormField<String>(
              value: selectedMaxGluSerum,
              decoration: InputDecoration(labelText: 'Max Glu Serum'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedMaxGluSerum = newValue;
                });
              },
              items: maxGluSerumOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            DropdownButtonFormField<String>(
              value: selectedA1Cresult,
              decoration: InputDecoration(labelText: 'A1C result'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedA1Cresult = newValue;
                });
              },
              items: a1CresultOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            DropdownButtonFormField<String>(
              value: selectedChange,
              decoration: InputDecoration(labelText: 'Change'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedChange = newValue;
                });
              },
              items:
                  changeOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButtonFormField<String>(
              value: selectedDiabetesMed,
              decoration: InputDecoration(labelText: 'Diabetes Med'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDiabetesMed = newValue;
                });
              },
              items: diabetesMedOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            DropdownButtonFormField<String>(
              value: selectedReadmitted,
              decoration: InputDecoration(labelText: 'Readmitted'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedReadmitted = newValue;
                });
              },
              items: readmittedOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // ... [other TextFormFields]
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Create a new PatientRecord from the input
                  PatientRecord newRecord = PatientRecord(
                    race: selectedRace!,
                    gender: selectedGender!,
                    age: selectedAge!,
                    admissionTypeId: selectedAdmissionTypeId!,
                    dischargeDispositionId: selectedDischargeDispositionId!,
                    admissionSourceId: selectedAdmissionSourceId!,
                    timeInHospital: int.parse(timeInHospitalController.text),
                    numLabProcedures:
                        int.parse(numLabProceduresController.text),
                    numProcedures: int.parse(numProceduresController.text),
                    numMedications: int.parse(numMedicationsController.text),
                    numberOutpatient:
                        int.parse(numberOutpatientController.text),
                    numberEmergency: int.parse(numberEmergencyController.text),
                    numberInpatient: int.parse(numberInpatientController.text),
                    diag1: diag1Controller.text,
                    diag2: diag2Controller.text,
                    diag3: diag3Controller.text,
                    numberDiagnoses: int.parse(numberDiagnosesController.text),
                    maxGluSerum: selectedMaxGluSerum!,
                    a1Cresult: selectedA1Cresult!,
                    change: selectedChange!,
                    diabetesMed: selectedDiabetesMed!,
                    readmitted: selectedReadmitted!,
                  );
                  List<String> result = await submitPatientRecord(newRecord);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(results: result)),
                  );
                }
              }, // Use the newRecord object as needed, e.g., save to database or send to an AP
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
