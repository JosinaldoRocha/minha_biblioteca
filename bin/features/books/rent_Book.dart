
import '../../utils/clean_screen.dart';
import '../../utils/read.dart';
import '../../variables/books.dart';
import '../../variables/quantBook.dart';
import '../../variables/rentedBooks.dart';
import '../menu/menu.dart';
import '../autenticacao/login_user_page.dart';
late int quantidade;
int allBooksRented = 0;
void rentBook() {
  Map<String, List<String>> rentedBook = {};
  List<String> selectedBook = [];
  int answer = 0;
  quantidade = 0;  
  print('\nOlá, $loginUser! Bem vindo a The book is on the table.\n');
  do {
    int counter = 1;
    print('     ---[ Livros disponíveis ]---');
    print('CÓD | LIVRO                | QUANTIDADE');
    for (var book in books) {
      if (book["quantidade"] > 0) {
        print('----------------------------------------');
        print('${counter++}   | ${book["livro"]} | ${book["quantidade"]}');
      } else {
        print('----------------------------------------');
        print('${counter++}   | ${book["livro"]} | ${book["quantidade"]}');
      }
    }

    print('----------------------------------------');
    int optionBook =
        readInt(message: 'Digita o CÓD do livro que deseja alugar:');
    if (optionBook > 0 && optionBook <= books.length) {
      optionBook -= 1;
      if (books[optionBook]["quantidade"] > 0) {
        quantidade++;
        books[optionBook]["quantidade"] -= 1;
        selectedBook.add(books[optionBook]["livro"]);
      } else {
        print(
            '\nO livro selecionado não está mais disponível, lamentamos muito!\n');
      }
    } else {
      print('\nOpção inválida!\n');
    }
    answer = readInt(
        message: '---------------------------\n'
            '[1] Alugar mais um livro\n[2] Mostrar relatório\n'
            '---------------------------');
    cleanScreen();
  } while (answer == 1 || answer == 01);
  if (answer == 2) {
    rentedBook["livros"] = selectedBook;
    rentedBooks.add(rentedBook);
    quantBook.add(quantidade);
    allBooksRented += quantidade;
    print('\n              << Relatório >>');
    if (quantidade > 0) {
      print('|Usuário: $loginUser');
      print('|Quantidade de livros alugados por $loginUser: $quantidade');
      print('|Livros alugados: ${rentedBook["livros"]}\n');
    } else {
      print('|Usuário: $loginUser');
      print('|Quantidade de livros alugados por $loginUser: $quantidade\n');
    }
  } else {
    do {
      print('Opção inválida!');
      answer = readInt(message: '[1] Voltar ao menu inicial');
      cleanScreen();
    } while (answer != 1 || answer != 01);
    mainMenu();
  }
}
