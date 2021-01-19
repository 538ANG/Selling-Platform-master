
//TODO: routing mechanism to be updated later using this file

class AppRoutes{
  static const WelcomePage = '/root';
  static const HomePage = '/home';
  static const SignUpPage = '/signup';
  static const LoginPage = '/login';
  static const SearchPage = '/buyer/search';
  static const BuyerEnd = '/buyer/end';
  static const PhotoResult = '/seller/result';
  static const ImagePick = '/seller/imagepick';
  static const ProductSpec = '/seller/spec';
  static const ProfilePage = '/profile';
  static const SellerEnd = '/seller/end';
}

// class AppRouting{
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     final args = settings.arguments;
//     switch (settings.name) {
//       case AppRoutes.WelcomePage:
//         return MaterialPageRoute<dynamic>(
//           builder: (_) => EmailPasswordSignInPage.withFirebaseAuth(
//               FirebaseAuth.instance,
//               onSignedIn: args),
//           settings: settings,
//           fullscreenDialog: true,
//         );
//       case AppRoutes.editJobPage:
//         return MaterialPageRoute<dynamic>(
//           builder: (_) => EditJobPage(job: args),
//           settings: settings,
//           fullscreenDialog: true,
//         );
//       case AppRoutes.entryPage:
//         final mapArgs = args as Map<String, dynamic>;
//         final job = mapArgs['job'] as Job;
//         final entry = mapArgs['entry'] as Entry;
//         return MaterialPageRoute<dynamic>(
//           builder: (_) => EntryPage(job: job, entry: entry),
//           settings: settings,
//           fullscreenDialog: true,
//         );
//       default:
//       // TODO: Throw
//         return null;
//     }
//   }
// }
