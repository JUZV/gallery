import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/util/hex_color.dart';
import 'package:gallery/core/util/media_query_values.dart';
import 'package:gallery/core/util/scroll_behavior.dart';
import 'package:gallery/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:gallery/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController userController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obsecurePassword = true;

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: MediaQueryValues(context).height,
              width: MediaQueryValues(context).width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/Group.png'))),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: MediaQueryValues(context).height * .1),
                          Text(
                            "My \n Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#4A4A4A')),
                          ),
                          SizedBox(
                            height: MediaQueryValues(context).height * .04,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, .6),
                                borderRadius: BorderRadius.circular(32)),
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                children: [
                                  Text(
                                    'LOG IN',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('#4A4A4A')),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQueryValues(context).height * .04,
                                  ),
                                  TextFormField(
                                    controller: userController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: "User Name",
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQueryValues(context).height * .024,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    controller: passwordController,
                                    obscureText: obsecurePassword,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQueryValues(context).height * .04,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      if (state is! LoginLoadingState) {
                                        if (formKey.currentState!.validate()) {
                                          cubit.login(
                                              userController.text.trim(),
                                              passwordController.text.trim(),
                                              context);
                                        }
                                      }
                                    },
                                    child: state is! LoginLoadingState
                                        ? Text(
                                            "SUBMIT",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                              strokeWidth: 4,
                                            ),
                                          ),
                                    color: state is! LoginLoadingState
                                        ? HexColor("#7BB3FF")
                                        : Colors.grey,
                                    height: 48,
                                    minWidth: double.infinity,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
