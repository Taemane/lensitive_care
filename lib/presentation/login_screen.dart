import 'package:email_validator/email_validator.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lensitive_care/presentation/register_screen.dart';
import 'package:lensitive_care/presentation/tabs_screen.dart';
import 'package:lensitive_care/widgets/custom_button.dart';
import 'package:lensitive_care/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 211, 211, 211),
        ));

    final appBar = AppBar(
      title: const Text('Sign in'),
      titleTextStyle: Theme.of(context)
          .textTheme
          .headline2
          ?.copyWith(fontSize: 18, color: Colors.black54),
      centerTitle: true,
      leading: Container(),
      leadingWidth: 0,
      elevation: 2,
      backgroundColor: Colors.white,
    );
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: (size.height - appBar.preferredSize.height) * 0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'lensitive',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Icon(
                      FluentIcons.eye_tracking_20_regular,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 35,
                    ),
                    Text(
                      'care',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        return value != null && !EmailValidator.validate(value)
                            ? 'Enter a valid email address'
                            : null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter email',
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 255, 255, 0.808),
                        prefixIcon: SizedBox(
                          width: 24.0,
                          child: Center(
                            child: Icon(
                              FluentIcons.mail_24_regular,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        border: outlineBorder,
                        focusedBorder: outlineBorder,
                        enabledBorder: outlineBorder,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      enableSuggestions: false,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      validator: (value) {
                        return value != null && value.length < 8
                            ? "Password must be a minimum \rof 8 characters long"
                            : null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 255, 255, 0.808),
                        prefixIcon: SizedBox(
                          width: 24.0,
                          child: Center(
                            child: Icon(
                              FluentIcons.lock_closed_24_regular,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        border: outlineBorder,
                        focusedBorder: outlineBorder,
                        enabledBorder: outlineBorder,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: Checkbox(
                              value: false,
                              onChanged: (value) {
                                rememberMe = value!;
                              },
                            ),
                          ),
                          const SizedBox(width: 3),
                          const Text('Remember me')
                        ]),
                        InkWell(
                          onTap: () {},
                          child: const Text('Forgot Password?'),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    CustomButton(
                      label: 'Log in',
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const TabsScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(FluentIcons.save_24_regular),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {},
                          child: Icon(FluentIcons.save_24_regular),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {},
                          child: Icon(FluentIcons.save_24_regular),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
