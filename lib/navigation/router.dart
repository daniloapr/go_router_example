import 'package:go_router/go_router.dart';
import 'package:go_router_example/screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Screen(
        route: state.location,
      ),
      routes: [
        GoRoute(
          path: 'a',
          name: 'a',
          builder: (context, state) => Screen(route: state.location),
          routes: [
            buildRoute('b'),
          ],
        ),
      ],
    ),
  ],
);

GoRoute buildRoute(String path) {
  return GoRoute(
    path: path,
    name: path,
    builder: (context, state) => Screen(
      route: state.location,
    ),
  );
}
