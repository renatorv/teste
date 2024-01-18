import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teste/app/entrypoint.dart';

import '../../../core/mixins/loader_mixin.dart';

class LoginController extends GetxController with LoaderMixin {
  RxBool isLoading = false.obs;
  final loaderRx = false.obs;

  @override
  void onInit() {
    loaderListener(loaderRx);
    super.onInit();
  }

  final _maskCpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    type: MaskAutoCompletionType.lazy,
  );
  MaskTextInputFormatter get maskCpf => _maskCpf;
  RxBool showPassWord = true.obs;

  void chamaHome() {
    Get.offAllNamed(MainScreen.ROUTE_PAGE);
  }

  void showPassword() {
    showPassWord.value = !showPassWord.value;
  }

  void login(String cpf) async {
    //isLoading.value = true;
    loaderRx.value = true;
    await Future.delayed(const Duration(seconds: 2));
    //isLoading.value = false;
    loaderRx.value = false;
    chamaHome();
  }
}
