import 'dart:io';

import '../../utils/clean_screen.dart';
import '../adm/report.dart';
import '../autenticacao/login_user_page.dart';
import '../autenticacao/register_User.dart';
import '../books/register_Book.dart';
void mainMenu() {
  print('                       << Menu inicial >>');
  print('------------------------------------------------------------------');
  print('[1] Adicionar livro à biblioteca       [2] Cadastrar novo usuário\n'
      '[3] Login usuário                      [4] Mostrar relatório\n'
      '[5] Sair');
  print('------------------------------------------------------------------');
  print('Digite uma opção:');
  String? answerText = stdin.readLineSync();
  int answer = int.tryParse(answerText ?? "5") ?? 5;
  cleanScreen();
  if (answer == 1 || answer == 01) {
    registerBook();
  } else if (answer == 2 || answer == 02) {
    registeredUser();
  } else if (answer == 3 || answer == 03) {
    loginUserPage();
  } else if (answer == 4 || answer == 04) {
    report();
  } else if (answer == 5 || answer == 05) {
  } else {
    print('\nOpção inválida!');
    mainMenu();
  }
}