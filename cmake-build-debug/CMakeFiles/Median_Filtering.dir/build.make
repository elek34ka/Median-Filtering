# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

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

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/129/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/129/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/elek34ka/Documents/project_mid/Median-Filtering

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/elek34ka/Documents/project_mid/Median-Filtering/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Median_Filtering.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Median_Filtering.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Median_Filtering.dir/flags.make

CMakeFiles/Median_Filtering.dir/main.cpp.o: CMakeFiles/Median_Filtering.dir/flags.make
CMakeFiles/Median_Filtering.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/elek34ka/Documents/project_mid/Median-Filtering/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Median_Filtering.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Median_Filtering.dir/main.cpp.o -c /home/elek34ka/Documents/project_mid/Median-Filtering/main.cpp

CMakeFiles/Median_Filtering.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Median_Filtering.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/elek34ka/Documents/project_mid/Median-Filtering/main.cpp > CMakeFiles/Median_Filtering.dir/main.cpp.i

CMakeFiles/Median_Filtering.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Median_Filtering.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/elek34ka/Documents/project_mid/Median-Filtering/main.cpp -o CMakeFiles/Median_Filtering.dir/main.cpp.s

CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.o: CMakeFiles/Median_Filtering.dir/flags.make
CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.o: ../EasyBMP/EasyBMP.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/elek34ka/Documents/project_mid/Median-Filtering/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.o -c /home/elek34ka/Documents/project_mid/Median-Filtering/EasyBMP/EasyBMP.cpp

CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/elek34ka/Documents/project_mid/Median-Filtering/EasyBMP/EasyBMP.cpp > CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.i

CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/elek34ka/Documents/project_mid/Median-Filtering/EasyBMP/EasyBMP.cpp -o CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.s

# Object files for target Median_Filtering
Median_Filtering_OBJECTS = \
"CMakeFiles/Median_Filtering.dir/main.cpp.o" \
"CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.o"

# External object files for target Median_Filtering
Median_Filtering_EXTERNAL_OBJECTS =

Median_Filtering: CMakeFiles/Median_Filtering.dir/main.cpp.o
Median_Filtering: CMakeFiles/Median_Filtering.dir/EasyBMP/EasyBMP.cpp.o
Median_Filtering: CMakeFiles/Median_Filtering.dir/build.make
Median_Filtering: CMakeFiles/Median_Filtering.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/elek34ka/Documents/project_mid/Median-Filtering/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable Median_Filtering"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Median_Filtering.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Median_Filtering.dir/build: Median_Filtering

.PHONY : CMakeFiles/Median_Filtering.dir/build

CMakeFiles/Median_Filtering.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Median_Filtering.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Median_Filtering.dir/clean

CMakeFiles/Median_Filtering.dir/depend:
	cd /home/elek34ka/Documents/project_mid/Median-Filtering/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/elek34ka/Documents/project_mid/Median-Filtering /home/elek34ka/Documents/project_mid/Median-Filtering /home/elek34ka/Documents/project_mid/Median-Filtering/cmake-build-debug /home/elek34ka/Documents/project_mid/Median-Filtering/cmake-build-debug /home/elek34ka/Documents/project_mid/Median-Filtering/cmake-build-debug/CMakeFiles/Median_Filtering.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Median_Filtering.dir/depend

