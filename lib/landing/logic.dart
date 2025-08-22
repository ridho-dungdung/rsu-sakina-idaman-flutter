import 'dart:async';

import 'package:get/get.dart';
import 'package:rsu_sakina_idaman/models/patient_queue.dart';
import 'package:rsu_sakina_idaman/network/client.dart';

class LandingLogic extends GetxController {
  Timer? timer;
  Rx<PatientQueue> patient = PatientQueue().obs;
  RxBool statusOffline = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await DioClient().get('/patient-queue/1').then((res) {
      if(res['data'] != null) {
        patient.value = PatientQueue.fromJson(res['data']);
      } else {
        statusOffline.value = true;
      }
    }).catchError((err) {
      statusOffline.value = true;
      goToPatientQueueList();
    });

    goToPatientQueueList();
  }

  void goToPatientQueueList() {
    timer = Timer.periodic(Duration(milliseconds: 600), (time) {
      Get.offNamed('/patient_queue_list', arguments: {
        'data': patient.value,
        'statusOffline': statusOffline.value
      });
    });
  }

}
