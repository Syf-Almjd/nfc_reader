import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfc_reader/src/presentation/Shared/Components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blue
        ),
        child: Center(
          child: Column(
            children: [
              logoContainer(context, 300, 100, Colors.blueGrey),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        //TODO go to api
                      },
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                         color: Colors.white
                        ),
                        child: const Center(child: Text("QR CHECK IN"),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        //TODO go to api
                      },
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: const Center(child: Text("NFC CHECK IN"),),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}