import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idz_digital/student-model.dart';

import 'nextPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EmployeeDummy",
          style: TextStyle(fontSize: 24.0),
        ),
        backgroundColor: const Color(0xff111111),
      ),
      backgroundColor: const Color(0xff111111),
      body: Center(
        child: FutureBuilder<List<StudentModel>>(
          future: getStudent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    String name = '${snapshot.data?[index].name}' ?? "";
                    String age = '${snapshot.data?[index].age}' ?? "";
                    String salary = '${snapshot.data?[index].salary}' ?? "";
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            '${name}\n${age}\n${salary}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25.0),
                          ),
                          onTap: () {
                            print("The name is" + name);
                            print("The age is" + age);
                            print("The salary is" + salary);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NextPage(
                                      name: name, age: age, salary: salary)),
                            );
                          },
                          // isThreeLine: true,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              print(snapshot.error);
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<List<StudentModel>> getStudent() async {
  //final url = "http://aamras.com/dummy/EmployeeDetails.json";
  final response =
      await http.get(Uri.parse("http://aamras.com/dummy/EmployeeDetails.json"));
  // http.head(url)
  print(response.body);
  if (response.statusCode == 200) {
    List<dynamic> tagObjsJson =
        jsonDecode(response.body.toString())['employees'] as List;
    print("The result of the thing is " + tagObjsJson.toString());
    List<StudentModel> tagObjs =
        tagObjsJson.map((tagJson) => StudentModel.fromJson(tagJson)).toList();
    print(tagObjs);
    return tagObjs;
  } else {
    throw Exception('Failed to load album');
  }
}
