import 'package:board_game_manager/presentation/screens/game_list_screen.dart';
import 'package:board_game_manager/presentation/screens/home_screen.dart';
import 'package:board_game_manager/presentation/screens/login_screen.dart';
import 'package:board_game_manager/presentation/screens/signup_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/games',
      builder: (context, state) => const GameListScreen(),
    ),
  ]
);