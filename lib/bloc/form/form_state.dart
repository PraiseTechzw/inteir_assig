import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

// Input validators for the form fields
class NameInput extends FormzInput<String, String> {
  const NameInput.pure() : super.pure('');
  const NameInput.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String value) {
    return value.isNotEmpty ? null : 'Name cannot be empty';
  }
}

class EmailInput extends FormzInput<String, String> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value) ? null : 'Enter a valid email address';
  }
}

class PhoneInput extends FormzInput<String, String> {
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String value) {
    return value.length == 10 ? null : 'Phone number must be 10 digits';
  }
}

// Similarly, you can add input validation for other fields.

class FormState extends Equatable {
  final NameInput name;
  final EmailInput email;
  final PhoneInput phone;
  final String gender;
  final String country;
  final String state;
  final String city;
  final FormzSubmissionStatus status;

  const FormState({
    this.name = const NameInput.pure(),
    this.email = const EmailInput.pure(),
    this.phone = const PhoneInput.pure(),
    this.gender = '',
    this.country = '',
    this.state = '',
    this.city = '',
    this.status = FormzSubmissionStatus.canceled, // Default to 'canceled' or appropriate status
  });

  FormState copyWith({
    NameInput? name,
    EmailInput? email,
    PhoneInput? phone,
    String? gender,
    String? country,
    String? state,
    String? city,
    FormzSubmissionStatus? status,
  }) {
    return FormState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [name, email, phone, gender, country, state, city, status];
}
