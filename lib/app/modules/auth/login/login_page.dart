import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:teste/app/core/ui/temas.dart';
import '../../../core/ui/widgets/tbc_button.dart';
import '../../../core/ui/widgets/tbc_input_text.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/tbc_state.dart';
import '../../../core/utils/validator_mixin.dart';
import './login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends TbcState<LoginPage, LoginController> with ValidatorMixin {
  final _key = GlobalKey<FormState>();
  final _cpfEc = TextEditingController();
  final _senhaEc = TextEditingController();
  final FocusNode _senhaFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: Container(
          height: 6,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.5, 0],
              colors: [
                kPrimary,
                kSecondary,
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: responsive.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      right: -(responsive.hp(36)) * .24,
                      top: -(responsive.hp(36)) * .28,
                      child: SizedBox(
                        height: responsive.hp(38),
                        width: responsive.wp(70),
                        child: Image.asset(
                          'assets/images/mapa_poligonal.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: (responsive.dp(36)) * .56,
                      right: (responsive.dp(36)) * .24,
                      child: Image.asset(
                        'assets/images/Logo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: responsive.hp(6),
                      right: responsive.dp(3),
                      left: responsive.dp(3),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            TbcInputText(
                              label: 'CPF',
                              textInputAction: TextInputAction.next,
                              keyBoardType: TextInputType.number,
                              mask: [controller.maskCpf],
                              controller: _cpfEc,
                              validator: (value) => combine(
                                [
                                  () => isNotEmpty(value),
                                  () => lengthCheck(
                                      value, 14, 'Informe um cpf válido!'),
                                ],
                              ),
                              colorInput: Colors.black
                            ),
                            TbcInputText(
                              label: 'Senha',
                              maxLength: 6,
                              focusNode: _senhaFocusNode,
                              controller: _senhaEc,
                              validator: (value) => lengthCheck(value, 6,
                                  'A senha deve ter ao menos 6 dígitos!'),
                              keyBoardType: TextInputType.number,
                              obscureText: controller.showPassWord.value,
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    controller.showPassWord.toggle(),
                                icon: controller.showPassWord.isTrue
                                    ? const Icon(Icons.remove_red_eye_outlined)
                                    : const Icon(Icons.visibility_off_outlined),
                              ),
                              colorInput: Colors.black,
                            ),
                            SizedBox(height: responsive.hp(6)),
                            SizedBox(
                              width: double.infinity,
                              child: TbcButton(
                                label: 'Login',
                                onPress: () {
                                  if (_key.currentState?.validate() ?? false) {
                                    controller.login(_cpfEc.text
                                        .replaceAll('.', '')
                                        .replaceAll('-', '')
                                        .replaceAll(' ', ''));
                                  }
                                },
                                color: Colors.white,
                                size: responsive.dp(1.6),
                              ),
                            ),
                            SizedBox(height: responsive.hp(6)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

