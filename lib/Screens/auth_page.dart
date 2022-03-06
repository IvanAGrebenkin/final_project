import 'package:flutter/material.dart';
import '../Utils/design.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override

  AuthPageState createState() {
    return AuthPageState();
  }
}

class AuthPageState extends State<AuthPage> {
  // String? username;
  // String? password;
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  final formKey = GlobalKey<FormState>();

  void submit() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      performLogin();
    }
  }
  void performLogin() {
    Navigator.pushNamed(context, '/main_screen');
  }


  @override
  Widget build(BuildContext context) {

    String? username;
    String? password;

    return Form(
      key: formKey,
      child: MaterialApp(
        scaffoldMessengerKey: _messengerKey,
          home: Scaffold(
            body: Container (
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/wallpaper1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(width:103, height:81,),
                    const SizedBox(width:103, height:79.42,
                      child: Image(
                        image: AssetImage('assets/dart-logo 1.png'),
                      ),
                    ),// Значок Flutter
                    const SizedBox(width:103, height:18.58,),
                    const Text('Введите логин в виде номера телефона в формате ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:16,
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                    ),// Текст: 'Введите логин в виде номера телефона в формате '
                    const Text('+7 901 234 56 78',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:16,
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                    ),// Текст: '+7 901 234 56 78'
                    const SizedBox(width:103, height:20,),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста введите номер телефона';
                        }
                        // else if (value == username) {
                        //   Navigator.pushNamed(context, '/main_screen');
                        // }
                        // else {
                          return null;
                        // }
                      },
                      onSaved: (value) {username = value;},
                      onFieldSubmitted: (value) {},
                      maxLength: 1,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: '+7 ...',
                        enabledBorder: inputFileBorderStyle,
                        focusedBorder: inputFileBorderStyle,
                        filled: true,
                        fillColor: Color(0xffECEFF1),
                        labelText: 'Телефон',),
                    ),// Поле ввода номера телефона
                    const SizedBox(width:103, height:20,),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста введите пароль';
                        }
                        // Navigator.pushNamed(context, '/main_screen');
                        // }
                      },
                      onSaved: (value) {password = value;},
                      maxLength: 1,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'максимум 6 символов',
                        enabledBorder: inputFileBorderStyle,
                        focusedBorder: inputFileBorderStyle,
                        filled: true,
                        fillColor: Color(0xffECEFF1),
                        labelText: 'Пароль',
                      ),
                    ),// Поле ввода пароля
                    const SizedBox(width:103, height:28,),
                    SizedBox(width:154, height:42,
                      child: ElevatedButton(
                        onPressed: submit,
                        // onPressed: () {
                        //   // if (formKey.currentState!.validate()) {
                        //     // Navigator.pushNamed(context, '/main_screen');
                        //   }},
                        //
                        //
                        //
                        //
                        //   var loginForm = _formKey.currentState;
                        //
                        //   if(password=='a'){Navigator.pushNamed(context, '/main_screen');}
                        //
                        //   if (_telephoneNumber == '1') Navigator.pushNamed(context, '/main_screen');
                        // },
                        child: const Text('Войти'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff0079D0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0)),
                        ),

                      ),
                    ),// Кнопка 'Войти'
                    const SizedBox(width:103, height:68,),
                    InkWell(
                      child: const Text(
                        'Регистрация',
                        style: linkTextStyle,
                      ),
                      onTap: () {},
                    ),// Ссылка 'Регистрация'
                    const SizedBox(width:103, height:19,),
                    InkWell(
                      child: const Text(
                        'Забыли пароль?',
                        style: linkTextStyle,
                      ),
                      onTap: () {
                        _messengerKey.currentState!.showSnackBar(
                            SnackBar(
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                Text('Телефон: 1234567890',
                                  textAlign: TextAlign.left,),
                                SizedBox(width:40, height:40,),
                                Text('Пароль: QWErty',
                                  textAlign: TextAlign.right,),
                                  ],
                                ),));
                      },
                    ),// Ссылка 'Забыли пароль?'
                  ],),
                ),

            ),
          ),

      ),
    );
  }
}
