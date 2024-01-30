import 'package:emad/FakeData.dart';

dynamic login({required String password, required String email}) {
  var checker = false;
  for (var element in users['Users']) {
    if (email == element['Email'] && password == element['password']) {
      checker = true;
    }
  }
  return checker;
}
