import 'package:easy_vet/features/auth/domain/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);

  Future<void> register(
    String email,
    String password,
    String lastName,
    String firstName,
  );
}
