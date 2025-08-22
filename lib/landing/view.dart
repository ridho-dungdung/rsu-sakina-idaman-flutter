import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LandingLogic(),
      builder: (c) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Image.asset('assets/images/logo.png', width: 200,),
                 Text('Sakinah Idaman',
                   style: TextStyle(
                    fontSize: 26, color: Colors.green.shade800
                  ),
                 )
               ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Jl. Nyi Condro Loekito No. 60 Sleman Yogyakarta 55222',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
