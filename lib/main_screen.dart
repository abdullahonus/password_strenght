import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
///////////////////////
  ///follow For more ig: @Countrol4offical
  ///@countrolfour@gmail.com
////////////////////////////////////////////

class PasswordStrenght extends StatefulWidget {
  const PasswordStrenght({Key? key}) : super(key: key);

  @override
  State<PasswordStrenght> createState() => _PasswordStrenghtState();
}

class _PasswordStrenghtState extends State<PasswordStrenght> {
  late String password;
  bool isObscure = false;
  double strength = 0;
  // 0: No password
  // 1/4: Weak
  // 2/4: Medium
  // 3/4: Strong
  // 1: Great

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  String displayText = 'Please enter a password';

  void checkPassword(String value) {
    password = value.trim();

    if (password.isEmpty) {
      setState(() {
        strength = 0;
        displayText = 'Please enter you password';
      });
    } else if (password.length < 6) {
      setState(() {
        strength = 1 / 4;
        displayText = 'Your password is too short';
      });
    } else if (password.length < 8) {
      setState(() {
        strength = 2 / 4;
        displayText = 'Your password is acceptable but not strong';
      });
    } else {
      if (!letterReg.hasMatch(password) || !numReg.hasMatch(password)) {
        setState(() {
          strength = 3 / 4;
          displayText = 'Your password is strong';
        });
      } else {
        setState(() {
          strength = 1;
          displayText = 'Your password is great';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Color(0xffFFF4EA),
          appBar: AppBar(
              backgroundColor: const Color(0xff97846B),
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset("assets/c4.png"),
                  ),
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "@Countrol4offical",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                    ),
                  ),
                ),
              ]),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  onChanged: (value) => checkPassword(value),
                  obscureText: isObscure,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 5,
                              color: Color(0xffB29E84).withOpacity(0.8))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: strength <= 1 / 4
                                  ? Color(0xffFF1616).withOpacity(0.6)
                                  : strength == 2 / 4
                                      ? Color(0xffFFDE59).withOpacity(0.8)
                                      : strength == 3 / 4
                                          ? Colors.blue.withOpacity(0.6)
                                          : Color(0xff008037).withOpacity(0.5),
                              width: 3),
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: Icon(
                        CupertinoIcons.lock,
                        color: strength <= 1 / 4
                            ? Colors.black
                            : strength == 2 / 4
                                ? Color(0xffFFDE59).withOpacity(0.8)
                                : strength == 3 / 4
                                    ? Colors.blue.withOpacity(0.6)
                                    : Color(0xff008037).withOpacity(0.5),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                          color: strength <= 1 / 4
                              ? Colors.black
                              : strength == 2 / 4
                                  ? Color(0xffFFDE59).withOpacity(0.8)
                                  : strength == 3 / 4
                                      ? Colors.blue.withOpacity(0.6)
                                      : Color(0xff008037).withOpacity(0.5),
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Password'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: LinearProgressIndicator(
                  value: strength,
                  backgroundColor: Color(0xffB29E84).withOpacity(0.8),
                  color: strength <= 1 / 4
                      ? Color(0xffFF1616).withOpacity(0.6)
                      : strength == 2 / 4
                          ? Color(0xffFFDE59).withOpacity(0.8)
                          : strength == 3 / 4
                              ? Colors.blue.withOpacity(0.6)
                              : Color(0xff008037).withOpacity(0.5),
                  minHeight: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                displayText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: strength <= 1 / 4
                      ? Color(0xffFF1616).withOpacity(0.6)
                      : strength == 2 / 4
                          ? Color(0xffFFDE59).withOpacity(0.8)
                          : strength == 3 / 4
                              ? Colors.blue.withOpacity(0.6)
                              : Color(0xff008037).withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: strength < 1 / 2
                      ? null
                      : () {
                          QuickAlert.show(
                            backgroundColor: Color(0xfff6E7D8),
                            context: context,
                            type: QuickAlertType.success,
                            text: 'Transaction Completed Successfully!',
                          );
                        },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      strength <= 1 / 4
                          ? Color(0xffFF1616).withOpacity(0.6)
                          : strength == 2 / 4
                              ? Color(0xffFFDE59).withOpacity(0.8)
                              : strength == 3 / 4
                                  ? Colors.blue.withOpacity(0.6)
                                  : Color(0xff008037).withOpacity(0.5),
                    ),
                  ),
                  child: const Text('Continue'))
            ],
          )),
    );
  }
}

////////////////////////////////////////////
  ///follow For more ig: @Countrol4offical
  ///@countrolfour@gmail.com
////////////////////////////////////////////
