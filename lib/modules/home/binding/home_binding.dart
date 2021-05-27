import 'package:flutter_infinite_scroll_with_getx/modules/home/controller/home_controller.dart';
import 'package:flutter_infinite_scroll_with_getx/repositories/user_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  
  @override
  void dependencies() {
    // Carregando UserRepository e HomeController para a memória
    Get.lazyPut(() => UserRepository(
      Get.find()
    ));
    Get.lazyPut(() => HomeController(
      Get.find()
    ));
  }

}