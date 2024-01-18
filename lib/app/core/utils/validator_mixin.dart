import 'package:email_validator/email_validator.dart';

mixin ValidatorMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? 'Este campo é obrigatório';
    return null;
  }

  String? passwordValidate(String? value, [String? message]) {
    if (value!.length < 8) return message ?? 'Insira uma senha válida';
    return null;
  }

  String? lengthCheck(String? value, int length, [String? message]) {
    if (value!.length < length) return message ?? 'Insira um valor válido';
    return null;
  }

  String? valueCheck(String? value, int length, [String? message]) {
    if (value!.length < 3) return message ?? 'Insira um valor válido';
    if (value.length > length) return message ?? 'Insira um valor válido';
    return null;
  }

  String? compareEmail(String? email1, String? email2, [String? message]) {
    if (email1 != email2) return message ?? 'Os e-mail não são iguais';
    return null;
  }

  String? compareSenha(String? senha1, String? senha2, [String? message]) {
    if (senha1 != senha2) return message ?? 'As senhas não são iguais';
    return null;
  }

  String? validatorEmail(String? value, [String? message]) {
    if (value!.isNotEmpty) {
      if (!EmailValidator.validate(value)) {
        return message ?? 'Insira um email válido';
      }
    }
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }

  String? validaEmail(String? email, [String? message]) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
    if (!regex.hasMatch(email!)) return message ?? 'Insira um e-mail válido';

    return null;
  }

  String? passwordStrength(String? password, [String? message]) {
    final RegExp regex = RegExp(
        r'^(?!0)(?!([0-9])\1{3})(?!1234|2345|3456|4567|5678|6789|9876|8765|7654|6543|5432|4321)\d{4}(?!(\d)\2+$)$');
    if (!regex.hasMatch(password!)) return message ?? 'Insira uma senha válida';
    return null;
  }

  String? isGreaterThan(String? value, int valueToCompare, [String? message]) {
    if (double.parse(value!) <= valueToCompare) {
      return message ?? 'Insira um valor válido';
    }
    return null;
  }
}
