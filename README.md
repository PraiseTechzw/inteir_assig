# Flutter Project: Multi-Feature Application

Welcome to the **Multi-Feature Application** built using Flutter! This project demonstrates state management with Flutter Bloc, form validation with Formz, API integration with Dio, and audio playback with Just Audio.

---

## 🚀 Features

- **Home Screen**: Displays a list of products fetched from an API.
- **Form Validation**: Validates user input with custom logic using Formz.
- **Audio Playback**: Provides basic controls for playing, pausing, and stopping audio files.
- **Reusable Widgets**: Includes components like product cards for a consistent UI.

---

## 🛠️ Tech Stack

- **Flutter**: Cross-platform UI development.
- **Dio**: For making network requests.
- **Bloc**: State management.
- **Equatable**: Simplified equality checks.
- **Formz**: Form validation.
- **Just Audio**: Audio playback.

---

## 📂 Project Structure
<<<<<<< HEAD

![Local Image](assets\1.png)



=======
`
lib/
├── api/
│   └── api_service.dart
├── bloc/
│   ├── home/
│   │   ├── home_bloc.dart
│   │   ├── home_event.dart
│   │   └── home_state.dart
│   └── form/
│       ├── form_bloc.dart
│       ├── form_event.dart
│       └── form_state.dart
├── models/
│   └── product.dart
├── screens/
│   ├── home_screen.dart
│   ├── detail_screen.dart
│   ├── form_screen.dart
│   └── audio_player_screen.dart
├── widgets/
│   └── product_card.dart
└── main.dart
`
>>>>>>> 583896a1177dc18ac60599b8e165aa24d5a0cdad

---

## 🚀 Getting Started

### Prerequisites

1. **Flutter**: Ensure you have Flutter installed. Follow the [official guide](https://docs.flutter.dev/get-started/install) to set it up.
2. **Git**: Required to clone the repository.

📖 How It Works
Home Screen
Fetches product data from an API and displays it using a list.
Managed using HomeBloc, which separates events, states, and logic.
Form Validation
Utilizes Formz for custom validation logic for fields like email and password.
Displays validation errors and allows submission only when the form is valid.
Audio Playback
Plays audio files using Just Audio.
Includes basic controls for play, pause, and stop.

🤝 Contributing
Fork the repository.
Create a new branch:
bash
Copy code
git checkout -b feature-name
Make your changes and commit:
bash
Copy code
git commit -m "Add new feature"
Push to your fork and submit a pull request.
🧪 Running Tests
Run the unit tests to ensure everything works as expected:


🌟 Acknowledgements
Special thanks to the developers of the libraries used in this project:

Flutter Bloc
Dio
Just Audio
📧 Contact


Watch the detailed explanation of the project [here](https://drive.google.com/file/d/1DB1z-vZKroPQYFrf-TQY_IvH5aGOzBNy/view?usp=sharing).



