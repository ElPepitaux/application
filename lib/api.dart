import 'dart:ffi';
import 'dart:io';
import 'package:flutter_rust_bridge_template/bridge_generated.dart' show Todo, RustImpl;

// This is the API class that will be used by the Flutter app.
class Api {
  final RustImpl _api;
  // This is the factory constructor of the API class.
  factory Api() {
    return _instance;
  }

  Api._internal() : _api = RustImpl(_loadDylib());

  // This is the singleton instance of the API class.
  static final Api _instance = Api._internal();

  // This is the function that loads the Rust library.
  static DynamicLibrary _loadDylib() {
    const base = "rust";
    final path = Platform.isWindows ? "$base.dll" : "rust/target/release/lib$base.so";
    return Platform.isIOS
        ? DynamicLibrary.process()
        : Platform.isMacOS
            ? DynamicLibrary.executable()
            : DynamicLibrary.open(path);
  }
  // This is the function that returns the RustImpl object.
  RustImpl getapi() {
    return _api;
  }
}
