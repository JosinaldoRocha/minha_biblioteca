import '../../utils/clean_screen.dart';
import '../../utils/read.dart';
import '../../variables/books.dart';
import '../menu/menu.dart';

void registerBook() {
  int answer = 0;
  do {
    Map<String, dynamic> book = {};
    String bookAdd = readString('Digite o nome do livro que deseja adicionar:');
    int quantBook = readInt(message: 'Quantos livros deseja adicionar?');
    cleanScreen();

    book["livro"] = bookAdd;
    book["quantidade"] = quantBook;
    books.add(book);

    answer = readInt(message: '\n[1] Cadastrar novo livro\n[2] Menu inicial');
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