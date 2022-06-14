import '../../utils/clean_screen.dart';
import '../../utils/read.dart';
import '../../variables/loggedUsers.dart';
import '../../variables/quantBook.dart';
import '../../variables/rentedBooks.dart';
import '../autenticacao/login_user_page.dart';
import '../menu/menu.dart';
import '../books/rent_Book.dart';

void report() {
  int counter = 0;
  int answer = 0;
  print('\n            << Relatório >>');
  bool existentReport = loggedUsers.any((element) => element == loginUser);
  if (existentReport) {
    for (var loginUser in loggedUsers) {
      if (loginUser != "Não logado") {
        print('|Usuário: $loginUser');
        if (quantBook[counter] > 0) {
          print(
              '|Quantidade de livros alugados por $loginUser: ${quantBook[counter]}');
          print('|Livros alugados: ${rentedBooks[counter]["livros"]}');
        } else {
          print('|Quantidade de livros alugados: 0');
        }
        print('');
      }
      counter++;
    }
    print('|Total de livros alugados = $allBooksRented livro(s)\n');
  } else {
    print(
        '|Usuário: Não logado.\n|Para um relatório mais detalhado, faça login em nosso sistema.\n');
  }
  do {
    answer = readInt(message: '[1] Voltar ao menu inicial');
    cleanScreen();
  } while (answer != 1 || answer != 01);
  mainMenu();
}
