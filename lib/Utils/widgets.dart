import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _messengerKey = GlobalKey<ScaffoldMessengerState>();

Widget navDrawer(context) => Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: const Text('Место для картинки'),
                ),
                const Text('Панель Drawer'),
              ],
            ),
          )),
      ListTile(
        leading: const Icon(Icons.account_circle),
        title: const Text('Главный экран'),
        onTap: (){
          Navigator.pushNamed(context, '/main_screen');
          _messengerKey.currentState!.showSnackBar(
              const SnackBar(
                  duration: Duration(seconds: 5),
                  content: Text('Переход на главный экран')));
        },
      ),// Кнопка перехода на главный экран
      const Divider(),
      ListTile(
        leading: const Icon(CupertinoIcons.circle_grid_3x3_fill),
        title: const Text('Калькулятор'),
        onTap: (){
          Navigator.pushNamed(context, '/nav_calculator');
          _messengerKey.currentState!.showSnackBar(
              const SnackBar(
                  duration: Duration(seconds: 5),
                  content: Text('Переход в калькулятор')));
        },
      ),// Кнопка перехода на экран калькулятора
      const Divider(),
      ListTile(
        leading: const Icon(CupertinoIcons.add_circled),
        title: const Text('Счетчик'),
        onTap: (){
          Navigator.pushNamed(context, '/counter');
          _messengerKey.currentState!.showSnackBar(
              const SnackBar(
                  duration: Duration(seconds: 5),
                  content: Text('Переход в счетчик')));
        },
      ),// Кнопка перехода на экран счетчика
    ],
  ),
);

PreferredSizeWidget appBar(context) => AppBar(
  actions: <Widget>[
    IconButton(
      tooltip: 'Переход на главный экран',
      onPressed: (){Navigator.pushNamed(context, '/main_screen');},
      icon: const Icon(Icons.account_circle),),// Кнопка перехода на главный экран
    IconButton(
      tooltip: 'Переход в калькулятор',
      onPressed: (){Navigator.pushNamed(context, '/nav_calculator');},
      icon: const Icon(CupertinoIcons.circle_grid_3x3_fill),),// Кнопка перехода в калькулятор
    IconButton(
      tooltip: 'Переход в счетчик',
      onPressed: (){Navigator.pushNamed(context, '/counter');},
      icon: const Icon(CupertinoIcons.add_circled),),// Кнопка перехода в счетчик

  ],
  // title: const Text('Калькулятор'),
);// Панель с

