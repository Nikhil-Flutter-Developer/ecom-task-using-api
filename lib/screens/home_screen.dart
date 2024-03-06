import"package:flutter/material.dart";

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) => Container(
                width: double.infinity,
                height: 100,
                margin:  const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100
                ),
                child: Center(child: const Text("products")),
              ),),
          )
        ],
      ),
    );
  }
}
