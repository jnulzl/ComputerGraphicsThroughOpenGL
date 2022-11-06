function(opengl_add_executable src)
    get_filename_component(src_root_dir ${src} DIRECTORY)
    file(GLOB_RECURSE src_files ${src_root_dir}/*.cpp)
    file(GLOB_RECURSE inc_files ${src_root_dir}/*.h)
    list(LENGTH src_files src_len)
    if (src_len GREATER 0)
        # get Chapter name and exe name
        get_filename_component(target ${src} NAME_WE)
        get_filename_component(_tmp1 ${src} DIRECTORY)
        get_filename_component(_tmp2 ${_tmp1} DIRECTORY)
        get_filename_component(chapter_name ${_tmp2} NAME_WE)

        set(exe_name ${chapter_name}_${target})
        add_executable(${exe_name} ${src_files})
        target_include_directories(${exe_name} PRIVATE ${inc_files})
        if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
            set(third_party_root ${PROJECT_SOURCE_DIR}/third_party)
            target_include_directories(${exe_name} PRIVATE
                    ${third_party_root}/freeglut/include
                    ${third_party_root}/glew-2.1.0/include
                    ${third_party_root}/glfw-3.3.2/include
                    ${third_party_root}/glm)

            target_link_directories(${exe_name} PRIVATE
                    ${third_party_root}/freeglut/lib/x64
                    ${third_party_root}/glew-2.1.0/lib/Release/x64
                    ${third_party_root}/glfw-3.3.2/lib-vc2019)

            target_link_libraries(${exe_name} PRIVATE freeglut glew32 glfw3 OpenGL32)

            set(exe_suffix "exe")
        elseif (CMAKE_SYSTEM_NAME STREQUAL "Linux")
            target_link_libraries(${exe_name} PRIVATE glut GLEW GL GLU glfw OpenGL)
            set(exe_suffix "bin")
        endif ()
        set_target_properties(${exe_name} PROPERTIES OUTPUT_NAME ${exe_name}.${exe_suffix})
        message(STATUS "Add executable : "  ${EXECUTABLE_OUTPUT_PATH}/${exe_name}.${exe_suffix})
    endif()
endfunction()