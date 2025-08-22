import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rsu_sakina_idaman/models/patient_queue.dart';
import 'package:intl/intl.dart';

import 'logic.dart';

class PatientQueueListPage extends StatelessWidget {
  const PatientQueueListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PatientQueueListLogic(),
      builder: (c) => Obx(() => Scaffold(
        appBar: AppBar(
          title: Text( 'Antrian Pasien'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(child: SmartRefresher(
              controller: c.refreshCtrl,
              // onLoading: c.onLoading(),
              onRefresh: c.onRefresh,
              enablePullDown: true,
              // enablePullUp: true,
              child: c.patients.isNotEmpty && c.isLoading.value == false ? ListView.builder(
                  itemCount: c.patients.length,
                  itemBuilder: (context, index) {
                    final PatientQueue patient = c.patients[index];
                    bool antrianAktif = c.patientOnGo.value.noRegister == patient.noRegister;
                    return Card(
                      margin: EdgeInsets.only(top: 14, left: 12, right: 12,
                        bottom: (index+1) == c.patients.length ? 20 : 0
                      ),
                      shadowColor: Colors.green,
                      elevation: 4,
                      shape: antrianAktif ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.green.shade800, width: 4)
                      ) : null,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14,
                            vertical: antrianAktif ? 8 : 6
                        ),
                        child: Column(
                          children: [
                            Text('No Antrian', style: TextStyle(fontSize: 16),),
                            Text(patient.noRegister.toString(),
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Nama : ', style: TextStyle(fontSize: 15)),
                                Text(patient.name!, style: TextStyle(fontSize: 15)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Date : ', style: TextStyle(fontSize: 15)),
                                Text(DateFormat('dd MMMM yyyy').format(DateFormat('yyyy-MM-dd').parse(patient.date!)),
                                    style: TextStyle(fontSize: 15)
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ) : c.isLoading.value == true ? null : Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Pasien tidak ditemukan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey.shade600,
                      ),
                    )
                  ],
                ),
              ),
            )),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 14, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.shade200,
                    blurRadius: 4,
                    offset: Offset(6, -4),
                    spreadRadius: 1
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => c.readQueue(),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          padding: EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.green.shade500, width: 4)
                          )
                      ),
                      child: Text('BACA ANTRIAN',
                        style: TextStyle(color: Colors.black),),
                    ),
                  ),
                  VerticalDivider(width: 10, color: Colors.transparent,),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () => c.readConfig(context),
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.green.shade500, width: 4)
                            )
                        ),
                        child: Text('BACA CONFIG',
                          style: TextStyle(color: Colors.black),)
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ))
    );
  }
}
