// import '../../biblioteca.dart';
import '../../utils/clean_screen.dart';
import '../../utils/read.dart';
import '../../variables/loggedUsers.dart';
import '../../variables/quantBook.dart';
import '../../variables/registeredUsers.dart';
import '../../variables/rentedBooks.dart';
import '../books/rent_Book.dart';
import '../menu/menu.dart';
import '../autenticacao/register_User.dart';

String loginUser = "";

void loginUserPage() {
  int answer = 0;

  do {
    print('-----------------[ Login usuário ]-----------------');
    loginUser = readString('usuário:');
    String passowordUser = readString('senha:');
    print('---------------------------------------------------');

    bool loggedUser = registeredUsers.any((element) =>
        element["usuário"] == loginUser && element["senha"] == passowordUser);

    if (loggedUser) {
      loggedUsers.add(loginUser);
      rentBook();
    } else {
      Map<String, List<String>> notBooks = {};
      List<String> notBook = ["No book"];
      quantBook.add(0);
      loginUser = "Não logado";
      loggedUsers.add(loginUser);
      notBooks["livro"] = notBook;
      rentedBooks.add(notBooks);
      print('\nUsuário ou senha não cadastrados!\n');
      bool existentRegistration = registeredUsers.any((element) =>
          element["usuário"] == loginUser || element["senha"] == passowordUser);
      if (existentRegistration) {
        print('Seus dados de login são:');
        print(
            'Nome de usuário: $nameUser\nSenha de acesso: $passwordConfirm\n');
      } else {}
    }
    answer = readInt(message: '[1] Login\n[2] Voltar ao menu inicial');
    cleanScreen();
  } while (answer == 1 || answer == 01);
  if (answer < 2 || answer > 2) {
    do {
      print('\nOpção inválida!');
      answer = readInt(message: '[1] Voltar ao menu inicial');
      cleanScreen();
    } while (answer != 1 || answer != 01);
  }
  mainMenu();
}
