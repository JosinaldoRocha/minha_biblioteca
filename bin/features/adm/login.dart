import '../../utils/clean_screen.dart';
import '../../utils/read.dart';
import '../menu/menu.dart';

void loginAdm() {
  List<Map<String, dynamic>> admins = [
    {"admin": "Naldo", "pin": 1234},
    {"admin": "Sam", "pin": 4567},
    {"admin": "Bia", "pin": 7890},
    {"admin": "Fran", "pin": 1010}
  ];
  int answer = 0;
  print('~~~~~~~~~~~~~~~~~~ Atenção! ~~~~~~~~~~~~~~~~~\n'
      'Acesso permitido, apenas para administradores\n'
      '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  while (answer <= 0 || answer > admins.length) {
    print('Fazer login como:');
    int counter = 1;
    for (var element in admins) {
      print('[${counter++}] ${element["admin"]}');
    }
    answer = readInt(message: 'Digite uma opção:');
  }
  answer -= 1;
  print('                  [ Login Adm ]                   ');
  print(
      'Olá, ${admins[answer]["admin"]}!\nDigite seu PIN númerico para acessar nosso sistema.');
  int pinAdm = readInt(message: 'PIN:');
  cleanScreen();

  bool loggedAdm = admins.any((element) =>
      (element["admin"] == admins[answer]["admin"] &&
          element["pin"] == pinAdm));
  if (loggedAdm) {
    mainMenu();
  } else {
    print('                    --- PIN inválido! ---\n'
        'O código PIN, digitado não corresponde ao usuário escolhido.');
  }
}