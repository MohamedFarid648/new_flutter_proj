import 'package:flutter/material.dart';
import 'package:try_second_one/models/patient.dart';

import '../services/patient.service.dart';

class PatientsView extends StatefulWidget {
  const PatientsView({super.key});

  @override
  State<PatientsView> createState() => _PatientsViewState();
}

class _PatientsViewState extends State<PatientsView> {
  late Future<List<Patient>> futurePatients;

  @override
  void initState() {
    super.initState();
    futurePatients = PatientService().fetchPatients();
    _getData();
  }

  late List<Patient>? _patientModel = [];

  void _getData() async {
    _patientModel = (await PatientService().fetchPatients());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
      ),
      body: _patientModel == null || _patientModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _patientModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_patientModel![index].id.toString()),
                          Text(_patientModel![index].fullName),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_patientModel![index].email),
                          Text(_patientModel![index].doctorId),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
  /*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Patients ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Patients'),
        ),
        body: Center(
          child: FutureBuilder<List<Patient>>(
            future: futurePatients,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data![0].fullName);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

*/
}
