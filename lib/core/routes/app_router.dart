import 'package:go_router/go_router.dart';
import 'package:news/features/authentication/presentation/pages/signin_page.dart';
import 'package:news/features/news/presentation/pages/news_page.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/sign_in',
  routes: [
    GoRoute(
      path: '/sign_in',
      name: 'sign_in',
      builder: (context, state) => SignInPage(),
    ),
    GoRoute(
      path: '/news',
      name: 'news',
      builder: (context, state) => NewsPage(),
    ),
  ],
);
