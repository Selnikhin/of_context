import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TopScreen(child: MainScreen())));

class MainScreen extends StatefulWidget {
  @override
  State createState() => MainScreenState();
} //MainScreen

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            child: Text('red'),
            color: Colors.red,
            onPressed: () {
              TopScreen.of(context)!._color = Colors.red; // Изменяем цвет фона напрямую.
              // ВНИМАНИЕ: Изменять параметр объекта напрямую не правильно для ООП!
              // в реализации лучше сделать сеттер или метод для изменения.
              TopScreen.of(context)!.setState(() {}); // Вызов метода смены состояния родительского виджета.
            },
          ),
          MaterialButton( // Все тоже самое что и для кнопки выше.
            child: Text('green'),
            color: Colors.green,
            onPressed: () {
              TopScreen.of(context)!._color = Colors.green;
              TopScreen.of(context)!.setState(() {});
            },
          ),
          MaterialButton( // Все тоже самое что и для кнопки выше.
            child: Text('blue'),
            color: Colors.blue,
            onPressed: () {
              TopScreen.of(context)!._color = Colors.blue;
              TopScreen.of(context)!.setState(() {});
            },
          ),
        ],
      ),
    );
  } //build
} //MainScreenStat

class TopScreen extends StatefulWidget {
  final Widget child; // дочерний виджет

  TopScreen({required this.child});

  @override
  State createState() => _TopScreenState();

  static _TopScreenState? of(BuildContext context) {
    // Эта конструкция нужна, чтобы можно было обращаться к нашему виджету
    // через: TopScreen.of(context)
    assert(context != null);
    final _TopScreenState? result =
    context.findAncestorStateOfType<_TopScreenState>();
    return result;
  }
}

class _TopScreenState extends State<TopScreen> {
  Color _color = Colors.green; // цвет фона
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedContainer( // используем это виджет для анимации цвета фона
          child: widget.child, // обращение к дочернему виджету TopScreen через widget.child
          color: _color,
          duration: Duration(milliseconds: 500), // длительность анимации
        ));
  }
}
