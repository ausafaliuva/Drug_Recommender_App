import 'package:flutter/material.dart';
import 'patientRecord.dart';

class PatientForm extends StatefulWidget {
  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for each field
  final encounterIdController = TextEditingController();
  final patientNbrController = TextEditingController();
  final raceController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final admissionTypeIdController = TextEditingController();
  final dischargeDispositionIdController = TextEditingController();
  final admissionSourceIdController = TextEditingController();
  final timeInHospitalController = TextEditingController();
  final payerCodeController = TextEditingController();
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
    encounterIdController.dispose();
    patientNbrController.dispose();
    raceController.dispose();
    genderController.dispose();
    ageController.dispose();
    admissionTypeIdController.dispose();
    dischargeDispositionIdController.dispose();
    admissionSourceIdController.dispose();
    timeInHospitalController.dispose();
    payerCodeController.dispose();
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
            TextFormField(
              controller: encounterIdController,
              decoration: InputDecoration(labelText: 'Encounter ID'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: patientNbrController,
              decoration: InputDecoration(labelText: 'Patient Number'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: raceController,
              decoration: InputDecoration(labelText: 'Race'),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: genderController,
              decoration: InputDecoration(labelText: 'Gender'),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: genderController,
              decoration: InputDecoration(labelText: 'Gender'),
              keyboardType: TextInputType.text,
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
              controller: payerCodeController,
              decoration: InputDecoration(labelText: 'Payer Code'),
              keyboardType: TextInputType.text,
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

            // ... [other TextFormFields]
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Create a new PatientRecord from the input
                  PatientRecord newRecord = PatientRecord(
                    encounterId: int.parse(encounterIdController.text),
                    patientNbr: int.parse(patientNbrController.text),
                    race: raceController.text,
                    gender: genderController.text,
                    age: ageController.text,
                    admissionTypeId: int.parse(admissionTypeIdController.text),
                    dischargeDispositionId:
                        int.parse(dischargeDispositionIdController.text),
                    admissionSourceId:
                        int.parse(admissionSourceIdController.text),
                    timeInHospital: int.parse(timeInHospitalController.text),
                    payerCode: payerCodeController.text,
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
                    maxGluSerum: maxGluSerumController.text,
                    a1Cresult: a1CresultController.text,
                    change: changeController.text,
                    diabetesMed: diabetesMedController.text,
                    readmitted: readmittedController.text,
                  );

                  // Use the newRecord object as needed, e.g., save to database or send to an API
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
