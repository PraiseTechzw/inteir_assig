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

lib/ ├── api/ │ └── api_service.dart # Handles API interactions using Dio ├── bloc/ │ ├── home/ │ │ ├── home_bloc.dart # Home screen business logic │ │ ├── home_event.dart # Events for HomeBloc │ │ └── home_state.dart # States for HomeBloc │ └── form/ │ ├── form_bloc.dart # Form validation logic │ ├── form_event.dart # Events for FormBloc │ └── form_state.dart # States for FormBloc ├── models/ │ └── product.dart # Data model for products ├── screens/ │ ├── home_screen.dart # UI for home screen │ ├── detail_screen.dart # UI for product details │ ├── form_screen.dart # UI for form validation │ └── audio_player_screen.dart # UI for audio playback ├── widgets/ │ └── product_card.dart # Reusable widget for product display └── main.dart # App entry point



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





