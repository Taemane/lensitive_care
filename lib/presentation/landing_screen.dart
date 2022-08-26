import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lensitive_care/presentation/login_screen.dart';
import 'package:lensitive_care/presentation/register_screen.dart';
import 'package:lensitive_care/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Lottie.asset('assets/lottie/banner.json'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'lensitive',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Icon(
                  FluentIcons.eye_tracking_20_regular,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 40,
                ),
                Text(
                  'care',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            CustomButton(
                label: 'Sign in',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                }),
            const SizedBox(height: 15),
            Text(
              'Or',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(height: 15),
            CustomButton(
              label: 'Register now',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
