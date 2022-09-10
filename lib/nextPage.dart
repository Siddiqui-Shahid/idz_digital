import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  final String name;
  final String age;
  final String salary;

  const NextPage(
      {Key? key, required this.name, required this.age, required this.salary})
      : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Employee Details",
          style: TextStyle(fontSize: 24.0),
        ),
        backgroundColor: const Color(0xff111111),
      ),
      backgroundColor: const Color(0xff111111),
      body: Center(
        child: Container(
          child: Text(
            '${widget.name}\n${widget.age}\n${widget.salary}',
            style: const TextStyle(color: Colors.white, fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}
