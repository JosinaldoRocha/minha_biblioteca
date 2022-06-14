// import '../../biblioteca.dart';
import '../../utils/clean_screen.dart';
import '../../utils/read.dart';
import '../../variables/registeredUsers.dart';
import '../menu/menu.dart';
import 'login_user_page.dart';
late String name; //nome no cadastro de usuário
late String lastName; //sobrenome no cadastro de usuário
late String nameUser; //nome de usuário no cadastro de usuário
late String passwordConfirm; // confirmação da senha no cadastro de usuário

void registeredUser() { 
  int answer = 0;
  print('\n--- Cadastro de usuário ---\n');
  do {
    Map<String, dynamic> registeredUser = {};
    String name = readString('Nome:');
    String lastName = readString('Sobrenome:');
    String nameUser = readString('Nome de usuário: (pode conter letras e números)');
    String password = " ";
    String passwordConfirm = "";
    while (passwordConfirm != password) {
      password = readString('Senha de acesso: (pode conter letras e números)');
      passwordConfirm = readString('Confirme a senha de acesso:');

      if (password != passwordConfirm) {
        print('                       Atenção!'
            '\nA senha de confirmação não confere com a senha de acesso.\n'
            'Por favor, tente novamente com senhas iguais!\n');
      }
    }
    cleanScreen();
    registeredUser["usuário"] = nameUser;
    registeredUser["senha"] = passwordConfirm;
    registeredUsers.add(registeredUser);

    print('\n<< Cadastro ralizado, com sucesso! >>');
    print(
        '|Nome completo: $name $lastName\n|Nome de usuário: $nameUser\n|Senha de acesso: $passwordConfirm');
    answer = readInt(
        message:
            '\n[1] Cadastrar novo usuário\n[2] Fazer login\n[3] Menu inicial');
    cleanScreen();
  } while (answer == 1 || answer == 01);
  if (answer == 2 || answer == 02) {
    loginUserPage();
  } else if (answer == 3 || answer == 03) {
    mainMenu();
  } else {
    do {
      print('Opção inválida!');
      answer = readInt(message: '[1] Voltar ao menu inicial');
      cleanScreen();
    } while (answer != 1 || answer != 01);
    mainMenu();
  }
}