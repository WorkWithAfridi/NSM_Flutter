# Flutter State Management (Without Packages)

## 📌 Overview
This Flutter project demonstrates **state management without external packages** like `provider` or `riverpod`. It includes:

✅ **User authentication** (login/logout)  
✅ **Fetching async data from an API**  
✅ **Managing multiple ViewModels** 
✅ **Efficient UI updates using ValueNotifier & InheritedNotifier**

---

## 🏗 Project Structure
```
/lib
│── main.dart              # App entry point
│
│── di
│   │── app_state.dart         # Centralized store for all ViewModels
│   │── app_provider.dart      # InheritedNotifier for state management
│
│── views              
│   │── auth_v.dart       # Login screen
│   │── home_v.dart       # Home screen with API fetch & logout
│   │── counter_v.dart       # Simple counter app
│
│── viewmodels
│   │── auth_vm.dart   # Manages user authentication
│   │── posts_vm.dart  # Handles API calls & data fetching
│   │── counter_vm.dart  # Handles counter logic
│   │── theme_vm.dart  # Handles theming data and logic
```

---

## 🚀 How to Run
1. **Clone the repository**
   ```sh
   git clone <repo_url>
   cd <project_directory>
   flutter pub get
   ```

2. **Run the app**
   ```sh
   flutter run
   ```

---

## 📂 Explanation
### **🔹 State Management Approach**
- Uses **ValueNotifier** for efficient state updates.
- Uses **InheritedNotifier** (`AppProvider`) for dependency injection.

### **🔹 Key Components**
- **Login Flow:** Users log in with a username → Stored in `AuthViewModel`
- **API Fetching:** Clicking 'Fetch Posts' fetches data asynchronously using `PostsViewModel`
- **Logout Flow:** Clicking logout clears session & redirects to login screen.

---

## 🔧 Future Enhancements
- ✅ Persist user session using SharedPreferences
- ✅ Add error handling for network requests
- ✅ Implement a real backend API for authentication

---

## 📝 License
This project is open-source and available for modification.

