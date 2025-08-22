import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rsu_sakina_idaman/models/patient_queue.dart';
import 'package:rsu_sakina_idaman/network/client.dart';
import 'package:flutter/services.dart' show rootBundle;

class PatientQueueListLogic extends GetxController {
  Timer? timer;
  RxBool isLoading = false.obs;
  RefreshController refreshCtrl = RefreshController(
    initialRefresh: false,
  );
  RxList<PatientQueue> patients = <PatientQueue>[].obs;
  Rx<FlutterTts> flutterTts = FlutterTts().obs;
  Rx<PatientQueue> patientOnGo = PatientQueue().obs;
  RxBool statusOffline = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    isLoading.value = true;
    refreshCtrl.isLoading;
    print("ARGUMENT COG ${Get.arguments['data']}");
    bool statusOfflineArgument = Get.arguments['statusOffline'];
    if(!statusOfflineArgument) {
      patients.value.add(Get.arguments['data']);
    } else {
      patients.add(PatientQueue.fromJson(data.first));
      statusOffline.value = true;
    }

    await flutterTts.value.setLanguage("id-ID");
    await flutterTts.value.setPitch(0.1);
    await flutterTts.value.setSpeechRate(0.4);
    update();
    refreshCtrl.loadComplete();
    isLoading.value = false;

    timer = Timer.periodic(Duration(seconds: 10), (time) {
      onRefresh();
    });

    super.onInit();
  }

   void onRefresh() async {
    if(patients.isEmpty) patients = <PatientQueue>[].obs;
    if(!statusOffline.value) {
      await DioClient().get('/patient-queue/${patients.length+1}').then((res) {
        // patients.value = List.from(res['data'].map((json) => PatientQueue.fromJson(json)));
        if(res['data'] != null) {
          patients.value.add(PatientQueue.fromJson(res['data']));
        } else {
          timer?.cancel();
        }
      }).catchError((error) {
        statusOffline.value = true;
      });
    } else {
      patients.add(PatientQueue.fromJson(data[patients.length]));
    }
    refreshCtrl.refreshCompleted();
    isLoading.value = false;
    update();
  }

  void onLoading() {
    print('ONLOADing');
  }

  void readQueue() async {
    String text = '';
    patientOnGo.value = patients.firstWhere((data) => data.noRegister == ((patientOnGo.value.noRegister??0)+1));
    text = 'nomer antrian ${patientOnGo.value.noRegister}';
    await flutterTts.value.speak(text);
    update();
  }

  readConfig(context) async {
    String text = '';
    String textFromFile = await rootBundle.loadString('assets/files/Conf.txt');
    text = textFromFile.substring(5);
    await flutterTts.value.speak(text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.up,
        duration: Duration(milliseconds: 1000),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height-180,
          left: 14,
          right: 14
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green.shade600,
        content: Text(text.replaceAll(' ', ''),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
    ));
  }
}
