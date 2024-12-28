import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'form_event.dart';
import 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(const FormState()) {
    on<NameChanged>((event, emit) {
      final name = NameInput.dirty(event.name);
      emit(state.copyWith(
        name: name,
        status: Formz.validate([name, state.email, state.phone]) 
            ? FormzSubmissionStatus.success 
            : FormzSubmissionStatus.failure,
      ));
    });

    on<EmailChanged>((event, emit) {
      final email = EmailInput.dirty(event.email);
      emit(state.copyWith(
        email: email,
        status: Formz.validate([state.name, email, state.phone]) 
            ? FormzSubmissionStatus.success 
            : FormzSubmissionStatus.failure,
      ));
    });

    on<PhoneChanged>((event, emit) {
      final phone = PhoneInput.dirty(event.phone);
      emit(state.copyWith(
        phone: phone,
        status: Formz.validate([state.name, state.email, phone]) 
            ? FormzSubmissionStatus.success 
            : FormzSubmissionStatus.failure,
      ));
    });

    // Add event handlers for gender, country, state, and city
    on<GenderChanged>((event, emit) {
      emit(state.copyWith(gender: event.gender));
    });

    on<CountryChanged>((event, emit) {
      emit(state.copyWith(country: event.country));
    });

    on<StateChanged>((event, emit) {
      emit(state.copyWith(state: event.state));
    });

    on<CityChanged>((event, emit) {
      emit(state.copyWith(city: event.city));
    });

    on<FormSubmitted>((event, emit) {
      if (state.status == FormzSubmissionStatus.success) {
        // Perform the form submission
        print('Form Submitted Successfully!');
      } else {
        print('Form is invalid!');
      }
    });
  }
}
