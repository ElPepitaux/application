import 'dart:ffi';
import 'dart:io';
import 'package:flutter_rust_bridge_template/bridge_generated.dart' show Todo, RustImpl;

class Api {
  final RustImpl _api;

  factory Api() {
    return _instance;
  }

  Api._internal() : _api = RustImpl(_loadDylib());

  static final Api _instance = Api._internal();

  static DynamicLibrary _loadDylib() {
    const base = "rust";
    final path = Platform.isWindows ? "$base.dll" : "rust/target/release/lib$base.so";
    return Platform.isIOS
        ? DynamicLibrary.process()
        : Platform.isMacOS
            ? DynamicLibrary.executable()
            : DynamicLibrary.open(path);
  }
  RustImpl getapi() {
    return _api;
  }
}
