import 'package:flutter/material.dart'
    hide FormState; // Hide FormState from Flutter
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:inteir_assig/bloc/form/form_bloc.dart';
import 'package:inteir_assig/bloc/form/form_event.dart';
import 'package:inteir_assig/bloc/form/form_state.dart'; // Use the FormState from your project

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Personal Information",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<FormBloc, FormState>(
            builder: (context, state) {
              final formBloc = context.read<FormBloc>();
              return Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Name field
                      buildTextField(
                        label: "Your Name",
                        onChanged: (value) => formBloc.add(NameChanged(value)),
                        validator: (_) => state.name.displayError,
                      ),
                      SizedBox(height: 16),

                      // Email field
                      buildTextField(
                        label: "Email",
                        onChanged: (value) => formBloc.add(EmailChanged(value)),
                        validator: (_) => state.email.displayError,
                      ),
                      SizedBox(height: 16),

                      // Phone number field
                      buildTextField(
                        label: "Phone number",
                        keyboardType: TextInputType.phone,
                        onChanged: (value) => formBloc.add(PhoneChanged(value)),
                        validator: (_) => state.phone.displayError,
                      ),
                      SizedBox(height: 16),

                      // Gender field
                      buildDropdownField(
                        label: "Gender",
                        value: state.gender.isNotEmpty ? state.gender : null,
                        items: ['Male', 'Female', 'Other'],
                        onChanged: (value) {
                          if (value != null) {
                            formBloc.add(GenderChanged(value));
                          }
                        },
                      ),
                      SizedBox(height: 16),

                      // Country field
                      buildTextField(
                        label: "Country",
                        onChanged: (value) =>
                            formBloc.add(CountryChanged(value)),
                        validator: (_) => state.country.isEmpty
                            ? 'Country cannot be empty'
                            : null,
                      ),
                      SizedBox(height: 16),

                      // State field
                      buildTextField(
                        label: "State",
                        onChanged: (value) => formBloc.add(StateChanged(value)),
                        validator: (_) => state.state.isEmpty
                            ? 'State cannot be empty'
                            : null,
                      ),
                      SizedBox(height: 16),

                      // City field
                      buildTextField(
                        label: "City",
                        onChanged: (value) => formBloc.add(CityChanged(value)),
                        validator: (_) =>
                            state.city.isEmpty ? 'City cannot be empty' : null,
                      ),
                      SizedBox(height: 32),

                      // Submit button
                      ElevatedButton(
                        onPressed: state.status == FormzSubmissionStatus.success
                            ? () => formBloc.add(FormSubmitted())
                            : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
    required Function(String) onChanged,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }

  Widget buildDropdownField({
    required String label,
    String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: onChanged,
      validator: (value) =>
          value == null || value.isEmpty ? '$label cannot be empty' : null,
    );
  }
}
