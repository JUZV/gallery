import 'package:flutter/material.dart';

void navigateTo(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

void navigateAndKill(BuildContext context, String route) {
  Navigator.pushReplacementNamed(context, route);
}
