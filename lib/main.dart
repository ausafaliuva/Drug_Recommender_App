import 'dart:convert';

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

  final ageController = TextEditingController();
  final admissionTypeIdController = TextEditingController();
  final dischargeDispositionIdController = TextEditingController();
  final admissionSourceIdController = TextEditingController();
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
  final maxGluSerumController = TextEditingController();
  final a1CresultController = TextEditingController();
  final changeController = TextEditingController();
  final diabetesMedController = TextEditingController();
  final readmittedController = TextEditingController();

  // ... [other controllers]

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.

    ageController.dispose();
    admissionTypeIdController.dispose();
    dischargeDispositionIdController.dispose();
    admissionSourceIdController.dispose();
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
    maxGluSerumController.dispose();
    a1CresultController.dispose();
    changeController.dispose();
    diabetesMedController.dispose();
    readmittedController.dispose();

    super.dispose();
  }

  Future<String> submitPatientRecord(PatientRecord record) async {
    const String apiUrl = 'http://10.0.2.2:5000/predict'; // Replace <your-api-url> with your actual API URL
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(record.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return "Prediction: ${data['prediction']}";
      } else {
        return "Error: Server responded with status code ${response
            .statusCode}";
      }
    } catch (e) {
      return "Error sending data: $e";
    }
  }

  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Record Form'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           padding: EdgeInsets.all(8.0),
//           children: <Widget>[
//             DropdownButtonFormField<String>(
//               value: selectedRace,
//               decoration: InputDecoration(labelText: 'Race'),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedRace = newValue;
//                 });
//               },
//               items: raceOptions.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             TextFormField(
//               controller: genderController,
//               decoration: InputDecoration(labelText: 'Gender'),
//               keyboardType: TextInputType.text,
//             ),
//             TextFormField(
//               controller: ageController,
//               decoration: InputDecoration(labelText: 'Age'),
//               keyboardType: TextInputType.text,
//             ),
//
//             TextFormField(
//               controller: admissionTypeIdController,
//               decoration: InputDecoration(labelText: 'Admission Type ID'),
//               keyboardType: TextInputType.number,
//             ),
//
//             TextFormField(
//               controller: dischargeDispositionIdController,
//               decoration:
//                   InputDecoration(labelText: 'Discharge Disposition ID'),
//               keyboardType: TextInputType.number,
//             ),
//
//             TextFormField(
//               controller: admissionSourceIdController,
//               decoration: InputDecoration(labelText: 'Admission Source ID'),
//               keyboardType: TextInputType.number,
//             ),
//
//             TextFormField(
//               controller: timeInHospitalController,
//               decoration: InputDecoration(labelText: 'Time in Hospital'),
//               keyboardType: TextInputType.number,
//             ),
//             TextFormField(
//               controller: numLabProceduresController,
//               decoration:
//                   InputDecoration(labelText: 'Number of Lab Procedures'),
//               keyboardType: TextInputType.number,
//             ),
//
//             TextFormField(
//               controller: numProceduresController,
//               decoration: InputDecoration(labelText: 'Number of Procedures'),
//               keyboardType: TextInputType.number,
//             ),
//
//             TextFormField(
//               controller: numMedicationsController,
//               decoration: InputDecoration(labelText: 'Number of Medications'),
//               keyboardType: TextInputType.number,
//             ),
//
//             TextFormField(
//               controller: numberOutpatientController,
//               decoration:
//                   InputDecoration(labelText: 'Number of Outpatient Visits'),
//               keyboardType: TextInputType.number,
//             ),
//
//             TextFormField(
//               controller: numberEmergencyController,
//               decoration:
//                   InputDecoration(labelText: 'Number of Emergency Visits'),
//               keyboardType: TextInputType.number,
//             ),
//
//             TextFormField(
//               controller: numberInpatientController,
//               decoration:
//                   InputDecoration(labelText: 'Number of Inpatient Visits'),
//               keyboardType: TextInputType.number,
//             ),
//
//             TextFormField(
//               controller: diag1Controller,
//               decoration:
//                   InputDecoration(labelText: 'Primary Diagnosis (diag_1)'),
//               keyboardType: TextInputType.text,
//             ),
//
//             TextFormField(
//               controller: diag2Controller,
//               decoration:
//                   InputDecoration(labelText: 'Secondary Diagnosis (diag_2)'),
//               keyboardType: TextInputType.text,
//             ),
//
//             TextFormField(
//               controller: diag3Controller,
//               decoration:
//                   InputDecoration(labelText: 'Additional Diagnosis (diag_3)'),
//               keyboardType: TextInputType.text,
//             ),
//
//             TextFormField(
//               controller: numberDiagnosesController,
//               decoration: InputDecoration(labelText: 'Number of Diagnoses'),
//               keyboardType: TextInputType.number,
//             ),
//
//             TextFormField(
//               controller: maxGluSerumController,
//               decoration: InputDecoration(labelText: 'Max Glucose Serum'),
//               keyboardType: TextInputType.text,
//             ),
//
//             TextFormField(
//               controller: a1CresultController,
//               decoration: InputDecoration(labelText: 'A1C Result'),
//               keyboardType: TextInputType.text,
//             ),
//
//             TextFormField(
//               controller: changeController,
//               decoration: InputDecoration(labelText: 'Change'),
//               keyboardType: TextInputType.text,
//             ),
//
//             TextFormField(
//               controller: diabetesMedController,
//               decoration: InputDecoration(labelText: 'Diabetes Medication'),
//               keyboardType: TextInputType.text,
//             ),
//             TextFormField(
//               controller: readmittedController,
//               decoration: InputDecoration(labelText: 'Readmitted Medication'),
//               keyboardType: TextInputType.text,
//             ),
//
//             // ... [other TextFormFields]
//             ElevatedButton(
//               onPressed: () async{
//                 if (_formKey.currentState!.validate()) {
//                   // Create a new PatientRecord from the input
//                   PatientRecord newRecord = PatientRecord(
//                     race: selectedRace!,
//                     gender: genderController.text,
//                     age: ageController.text,
//                     admissionTypeId: int.parse(admissionTypeIdController.text),
//                     dischargeDispositionId:
//                         int.parse(dischargeDispositionIdController.text),
//                     admissionSourceId:
//                         int.parse(admissionSourceIdController.text),
//                     timeInHospital: int.parse(timeInHospitalController.text),
//
//                     numLabProcedures:
//                         int.parse(numLabProceduresController.text),
//                     numProcedures: int.parse(numProceduresController.text),
//                     numMedications: int.parse(numMedicationsController.text),
//                     numberOutpatient:
//                         int.parse(numberOutpatientController.text),
//                     numberEmergency: int.parse(numberEmergencyController.text),
//                     numberInpatient: int.parse(numberInpatientController.text),
//                     diag1: diag1Controller.text,
//                     diag2: diag2Controller.text,
//                     diag3: diag3Controller.text,
//                     numberDiagnoses: int.parse(numberDiagnosesController.text),
//                     maxGluSerum: maxGluSerumController.text,
//                     a1Cresult: a1CresultController.text,
//                     change: changeController.text,
//                     diabetesMed: diabetesMedController.text,
//                     readmitted: readmittedController.text,
//                   );
//                   String result = await submitPatientRecord(newRecord);
//                   showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                             title: Text("Prediction Result"),
//                             content: Text(result),
//                             actions: <Widget>[
//                       TextButton(
//                       onPressed: () {
//                       Navigator.of(context).pop();
//                       },
//                     child: Text('OK'),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               }, // Use the newRecord object as needed, e.g., save to database or send to an AP
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  List<Widget> _buildFormWidgets() {
    return [
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
        items: genderOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      TextFormField(
        controller: ageController,
        decoration: InputDecoration(labelText: 'Age'),
        keyboardType: TextInputType.text,
      ),

      TextFormField(
        controller: admissionTypeIdController,
        decoration: InputDecoration(labelText: 'Admission Type ID'),
        keyboardType: TextInputType.number,
      ),

      TextFormField(
        controller: dischargeDispositionIdController,
        decoration:
        InputDecoration(labelText: 'Discharge Disposition ID'),
        keyboardType: TextInputType.number,
      ),

      TextFormField(
        controller: admissionSourceIdController,
        decoration: InputDecoration(labelText: 'Admission Source ID'),
        keyboardType: TextInputType.number,
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

      TextFormField(
        controller: maxGluSerumController,
        decoration: InputDecoration(labelText: 'Max Glucose Serum'),
        keyboardType: TextInputType.text,
      ),

      TextFormField(
        controller: a1CresultController,
        decoration: InputDecoration(labelText: 'A1C Result'),
        keyboardType: TextInputType.text,
      ),

      TextFormField(
        controller: changeController,
        decoration: InputDecoration(labelText: 'Change'),
        keyboardType: TextInputType.text,
      ),

      TextFormField(
        controller: diabetesMedController,
        decoration: InputDecoration(labelText: 'Diabetes Medication'),
        keyboardType: TextInputType.text,
      ),
      TextFormField(
        controller: readmittedController,
        decoration: InputDecoration(labelText: 'Readmitted Medication'),
        keyboardType: TextInputType.text,
      ),
      //... Add other form widgets in sequence
    ];
  }

  @override
  Widget build(BuildContext context) {
    var formWidgets = _buildFormWidgets();

    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Record Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            formWidgets[_currentStep], // Display the current form widget
            Row(
              children: <Widget>[
                if (_currentStep != 0)
                  ElevatedButton(
                    onPressed: () {
                      if (_currentStep > 0) {
                        setState(() {
                          _currentStep--;
                        });
                      }
                    },
                    child: Text('Previous'),
                  ),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    if (_currentStep < formWidgets.length - 1) {
                      setState(() {
                        _currentStep++;
                      });
                    } else {
                      // This is the last step, handle form submission
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Construct the PatientRecord from form fields
                        PatientRecord newRecord = PatientRecord(
                          race: selectedRace!,
                          gender: selectedGender!,
                          age: ageController.text,
                          admissionTypeId: int.parse(
                              admissionTypeIdController.text),
                          dischargeDispositionId:
                          int.parse(dischargeDispositionIdController.text),
                          admissionSourceId:
                          int.parse(admissionSourceIdController.text),
                          timeInHospital: int.parse(
                              timeInHospitalController.text),

                          numLabProcedures:
                          int.parse(numLabProceduresController.text),
                          numProcedures: int.parse(
                              numProceduresController.text),
                          numMedications: int.parse(
                              numMedicationsController.text),
                          numberOutpatient:
                          int.parse(numberOutpatientController.text),
                          numberEmergency: int.parse(
                              numberEmergencyController.text),
                          numberInpatient: int.parse(
                              numberInpatientController.text),
                          diag1: diag1Controller.text,
                          diag2: diag2Controller.text,
                          diag3: diag3Controller.text,
                          numberDiagnoses: int.parse(
                              numberDiagnosesController.text),
                          maxGluSerum: maxGluSerumController.text,
                          a1Cresult: a1CresultController.text,
                          change: changeController.text,
                          diabetesMed: diabetesMedController.text,
                          readmitted: readmittedController.text,
                        );
                        String result = await submitPatientRecord(newRecord);
                        showDialog(
                          context: context,
                          builder: (context) =>
                              AlertDialog(
                                title: Text("Prediction Result"),
                                content: Text(result),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                        );
                      }
                    }
                  },
                  child: Text(_currentStep < formWidgets.length - 1
                      ? 'Next'
                      : 'Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
