##
## EPITECH PROJECT, 2023
## application
## File description:
## Makefile
##

rebuild_api:
	flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated.dart

rebuild_so:
	cd rust && cargo build --release ; cd ..

all: rebuild_api rebuild_so

