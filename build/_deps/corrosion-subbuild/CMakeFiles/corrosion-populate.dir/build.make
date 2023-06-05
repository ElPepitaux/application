# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sleo/repo/application/build/_deps/corrosion-subbuild

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sleo/repo/application/build/_deps/corrosion-subbuild

# Utility rule file for corrosion-populate.

# Include any custom commands dependencies for this target.
include CMakeFiles/corrosion-populate.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/corrosion-populate.dir/progress.make

CMakeFiles/corrosion-populate: CMakeFiles/corrosion-populate-complete

CMakeFiles/corrosion-populate-complete: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-install
CMakeFiles/corrosion-populate-complete: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-mkdir
CMakeFiles/corrosion-populate-complete: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-download
CMakeFiles/corrosion-populate-complete: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-update
CMakeFiles/corrosion-populate-complete: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-patch
CMakeFiles/corrosion-populate-complete: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-configure
CMakeFiles/corrosion-populate-complete: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-build
CMakeFiles/corrosion-populate-complete: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-install
CMakeFiles/corrosion-populate-complete: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-test
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'corrosion-populate'"
	/usr/bin/cmake -E make_directory /home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles
	/usr/bin/cmake -E touch /home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles/corrosion-populate-complete
	/usr/bin/cmake -E touch /home/sleo/repo/application/build/_deps/corrosion-subbuild/corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-done

corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-update:
.PHONY : corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-update

corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-build: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No build step for 'corrosion-populate'"
	cd /home/sleo/repo/application/build/_deps/corrosion-build && /usr/bin/cmake -E echo_append
	cd /home/sleo/repo/application/build/_deps/corrosion-build && /usr/bin/cmake -E touch /home/sleo/repo/application/build/_deps/corrosion-subbuild/corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-build

corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-configure: corrosion-populate-prefix/tmp/corrosion-populate-cfgcmd.txt
corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-configure: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "No configure step for 'corrosion-populate'"
	cd /home/sleo/repo/application/build/_deps/corrosion-build && /usr/bin/cmake -E echo_append
	cd /home/sleo/repo/application/build/_deps/corrosion-build && /usr/bin/cmake -E touch /home/sleo/repo/application/build/_deps/corrosion-subbuild/corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-configure

corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-download: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-gitinfo.txt
corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-download: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'corrosion-populate'"
	cd /home/sleo/repo/application/build/_deps && /usr/bin/cmake -P /home/sleo/repo/application/build/_deps/corrosion-subbuild/corrosion-populate-prefix/tmp/corrosion-populate-gitclone.cmake
	cd /home/sleo/repo/application/build/_deps && /usr/bin/cmake -E touch /home/sleo/repo/application/build/_deps/corrosion-subbuild/corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-download

corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-install: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No install step for 'corrosion-populate'"
	cd /home/sleo/repo/application/build/_deps/corrosion-build && /usr/bin/cmake -E echo_append
	cd /home/sleo/repo/application/build/_deps/corrosion-build && /usr/bin/cmake -E touch /home/sleo/repo/application/build/_deps/corrosion-subbuild/corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-install

corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'corrosion-populate'"
	/usr/bin/cmake -Dcfgdir= -P /home/sleo/repo/application/build/_deps/corrosion-subbuild/corrosion-populate-prefix/tmp/corrosion-populate-mkdirs.cmake
	/usr/bin/cmake -E touch /home/sleo/repo/application/build/_deps/corrosion-subbuild/corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-mkdir

corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-patch: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-update
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'corrosion-populate'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/sleo/repo/application/build/_deps/corrosion-subbuild/corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-patch

corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-update:
.PHONY : corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-update

corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-test: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No test step for 'corrosion-populate'"
	cd /home/sleo/repo/application/build/_deps/corrosion-build && /usr/bin/cmake -E echo_append
	cd /home/sleo/repo/application/build/_deps/corrosion-build && /usr/bin/cmake -E touch /home/sleo/repo/application/build/_deps/corrosion-subbuild/corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-test

corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-update: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Performing update step for 'corrosion-populate'"
	cd /home/sleo/repo/application/build/_deps/corrosion-src && /usr/bin/cmake -P /home/sleo/repo/application/build/_deps/corrosion-subbuild/corrosion-populate-prefix/tmp/corrosion-populate-gitupdate.cmake

corrosion-populate: CMakeFiles/corrosion-populate
corrosion-populate: CMakeFiles/corrosion-populate-complete
corrosion-populate: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-build
corrosion-populate: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-configure
corrosion-populate: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-download
corrosion-populate: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-install
corrosion-populate: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-mkdir
corrosion-populate: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-patch
corrosion-populate: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-test
corrosion-populate: corrosion-populate-prefix/src/corrosion-populate-stamp/corrosion-populate-update
corrosion-populate: CMakeFiles/corrosion-populate.dir/build.make
.PHONY : corrosion-populate

# Rule to build all files generated by this target.
CMakeFiles/corrosion-populate.dir/build: corrosion-populate
.PHONY : CMakeFiles/corrosion-populate.dir/build

CMakeFiles/corrosion-populate.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/corrosion-populate.dir/cmake_clean.cmake
.PHONY : CMakeFiles/corrosion-populate.dir/clean

CMakeFiles/corrosion-populate.dir/depend:
	cd /home/sleo/repo/application/build/_deps/corrosion-subbuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sleo/repo/application/build/_deps/corrosion-subbuild /home/sleo/repo/application/build/_deps/corrosion-subbuild /home/sleo/repo/application/build/_deps/corrosion-subbuild /home/sleo/repo/application/build/_deps/corrosion-subbuild /home/sleo/repo/application/build/_deps/corrosion-subbuild/CMakeFiles/corrosion-populate.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/corrosion-populate.dir/depend
