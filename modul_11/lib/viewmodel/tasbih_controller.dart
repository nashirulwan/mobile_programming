import 'package:get/get.dart'; // <-- INI SUDAH ADA DAN BENAR

class TasbihController extends GetxController {
  // <-- INI JUGA SUDAH BENAR
  var counter = 0.0.obs;
  var progress = 0.0.obs;
  final double maxCount = 33;

  void incrementCounter() {
    if (counter.value < maxCount) {
      counter.value++;
      progress.value = (counter.value / maxCount) * 100;
    }
  }

  void resetCounter() {
    counter.value = 0;
    progress.value = 0;
  }
}
