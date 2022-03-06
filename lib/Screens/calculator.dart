import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import '../Utils/widgets.dart';

class ThemeCalc extends StatelessWidget {
  const ThemeCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

enum Sauce {without, spicy, sweetAndSour, cheesy}


class _CalculatorState extends State<Calculator> {



  bool _slimDough = false;  // Переменная толщины теста
  void _doughThickness (bool? val){
    setState(() {
      _slimDough=!_slimDough;
      _totalPrice();
    });
  }

  double _pizzaSize = 40;//Переменная диаметра теста

  Sauce? _sauce = Sauce.without;// Переменная выбора соуса
  void _choiceOfSauce (Sauce? value) {
    setState(() {
      _sauce = value;
      _totalPrice();

    });
  }

  bool _cheese = false;// Переменная выбора дополнительного сыра
  void _cheesePlus (bool? val){
    setState(() {
      _cheese=!_cheese;
      _totalPrice();
    });
  }

  int _price = 200;// Переменная итоговой цены

  _totalPrice(){
    _price = _pizzaSize.round()*5;
    if(_slimDough==true) _price += 50;
    if(_cheese==true) _price += 30;
    switch (_sauce){

      case Sauce.cheesy:_price += 10; break;
      case Sauce.spicy:_price += 15; break;
      case Sauce.sweetAndSour:_price += 20; break;
      default: _sauce = Sauce.without; break;
    }
    return _price;
  }


  final ShapeBorder? _sauceDivider = const Border(
    bottom: BorderSide(
      color: Color(0xFFE8E8E8),
      width: 2.0,
    ),
  );
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();


  @override
  Widget build(BuildContext context) {
    // final _messengerKey = GlobalKey<ScaffoldMessengerState>();
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.amber,
        ),
      ),
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        body: Container (
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  SizedBox(width:232, height:123,
                    child: Image(
                      image: AssetImage('assets/pizza.jpg'),
                    ),
                  ),
                ],
              ),// Изображение пиццы
              const SizedBox(width:103, height:33,),
              const Text('Калькулятор пиццы',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:30,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),// Text "Калькулятор пиццы"
              const SizedBox(width:103, height:9,),
              const Text('Выберите параметры:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:16,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),// Text "Выберите параметры"
              const SizedBox(width:103, height:30,),
              SlidingSwitch(
                value: false,
                width: 300,
                onChanged: _doughThickness,
                height : 34,
                animationDuration : const Duration(milliseconds: 400),
                onTap:(){},
                onDoubleTap:(){},
                onSwipe:(){},
                textOff : "Обычное тесто",
                textOn : "Тонкое тесто",
                colorOn : const Color(0xffFFFFFF),
                colorOff : const Color(0xffFFFFFF),
                background : const Color(0xffECEFF1),
                buttonColor : Theme.of(context).colorScheme.primary,
                inactiveColor : const Color(0x60000000),
              ),// Кнопка выбора теста
              const SizedBox(width:103, height:30,),
              Row(
                children: const [
                  Text('Размер:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:18,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),// Text "Размер"
              SizedBox(
                width: 350,
                child: Slider(
                  value: _pizzaSize,
                  min: 35,
                  max: 45,
                  divisions: 2,
                  label: '${_pizzaSize.round().toString()} см',
                  onChanged: (double value) {
                    setState(() {
                      _pizzaSize = value;
                      _totalPrice();
                    });
                  },
                ),
              ),// Слайдер выбора размера
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('mini',
                      style: TextStyle(
                      fontSize:16,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  SizedBox(width:95),
                  Text('standard',
                    style: TextStyle(
                      fontSize:16,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  SizedBox(width:95),
                  Text('maxi',
                    style: TextStyle(
                      fontSize:16,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ],
              ),// подпись слайдера
              const SizedBox(width:103, height:30,),
              Row(
                children: const [
                  Text('Соус:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:18,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),// Text "Соус:"
              RadioListTile<Sauce>(
                shape: _sauceDivider,
                activeColor: const Color(0xff0079D0),
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('Без соуса'),
                value: Sauce.without,
                groupValue: _sauce,
                onChanged: _choiceOfSauce,
              ),// Радиокнопка "Без соуса"
              RadioListTile<Sauce>(
                shape: _sauceDivider,
                activeColor: const Color(0xffF8C316),
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('Сырный'),
                value: Sauce.cheesy,
                groupValue: _sauce,
                onChanged: _choiceOfSauce,
              ),// Радиокнопка "Сырный"
              RadioListTile<Sauce>(
                shape: _sauceDivider,
                activeColor: Colors.red,
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('Острый'),
                value: Sauce.spicy,
                groupValue: _sauce,
                onChanged: _choiceOfSauce,
              ),// Радиокнопка "Острый соус"
              RadioListTile<Sauce>(
                shape: _sauceDivider,
                activeColor: Colors.green,
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('Кисло-сладкий'),
                value: Sauce.sweetAndSour,
                groupValue: _sauce,
                onChanged: _choiceOfSauce,
              ),// Радиокнопка "Кисло-сладкий соус"
              const SizedBox(width:103, height:30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:30.0),
                child: Card(
                  color: const Color(0xffECEFF1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:
                      SwitchListTile(
                        autofocus: true,
                        title: const Text('Дополнительный сыр', textAlign: TextAlign.center),
                        secondary: const Image(image: AssetImage('assets/cheese.png'),),
                        activeColor: const Color(0xffF8C316),
                        value: _cheese,
                        onChanged: _cheesePlus,
                      ),
                  ),
                ), // Поле "Дополнительный сыр"
              const SizedBox(width:103, height:30,),
              Row(
                children: const [
                  Text('Стоимость заказа:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:18,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),// Text "Стоимость заказа:"
              const SizedBox(width:103, height:10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Card(
                    color: const Color(0xffECEFF1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('$_price',
                          style: const TextStyle(
                          fontSize:25,
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.w600,
                          ),),
                          const SizedBox(width:20, height:50,),
                          const Text('Руб.',
                            style: TextStyle(
                              fontSize:25,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w600,
                            ),),
                        ],
                      ),
                ), ),// Поле вывода стоимости
              const SizedBox(width:103, height:30,),
              SizedBox(width:154, height:42,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Заказать',
                    style: TextStyle(
                      fontSize:16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0)),
                  ),
                ),
              ),// Кнопка "Заказать"
              const SizedBox(width:103, height:30,),
            ],),
          ),
        ),
        appBar: appBar(context),
        drawer: navDrawer(context),
      ),
    );
  }
}

