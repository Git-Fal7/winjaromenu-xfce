cmake_minimum_required(VERSION 2.8)

message("Uninstall the project...")

if(NOT EXISTS "/home/hitcoder/winjaromenu-xfce/build/install_manifest.txt")
    message(FATAL_ERROR "Cannot find install manifest: \"/home/hitcoder/winjaromenu-xfce/build/install_manifest.txt\"")
endif()

file(READ "/home/hitcoder/winjaromenu-xfce/build/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
list(REVERSE files)
foreach (file ${files})
    message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
    if(EXISTS "$ENV{DESTDIR}${file}")
        execute_process(
            COMMAND /usr/bin/cmake -E remove "$ENV{DESTDIR}${file}"
            OUTPUT_VARIABLE rm_out
            RESULT_VARIABLE rm_retval
        )
        if(NOT ${rm_retval} EQUAL 0)
            message(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
        endif (NOT ${rm_retval} EQUAL 0)
    else(EXISTS "$ENV{DESTDIR}${file}")
        message(STATUS "File \"$ENV{DESTDIR}${file}\" does not exist.")
    endif()
endforeach(file)
