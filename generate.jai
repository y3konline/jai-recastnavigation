BASE_PATH :: "src/recast-navigation-77f7e54";

DECLARATIONS_TO_OMIT :: string.[
    // We have custom declarations for these in module.jai:
    "DT_TILECACHE_MAGIC",
    "DT_NAVMESH_STATE_MAGIC",
    "DT_NAVMESH_MAGIC",
];

#run,stallable {
    set_build_options_dc(.{do_output=false});
    root_options := get_build_options();
    args := root_options.compile_time_command_line;
    if !generate_bindings(args) {
        compiler_set_workspace_status(.FAILED);
    }
}

generate_bindings :: (args: [] string) -> bool {
    compile       := array_find(args, "-compile");
    compile_debug := array_find(args, "-debug");

    success := true;

    if compile {
        make_directory_if_it_does_not_exist("lib");

        src: [..] string;
        extra: [..] string;
        libs: [..] string;

        //===============
        // Compile Recast
        //---------------
        log("===============\nCompiling Recast...\n---------------");

        array_reset_keeping_memory(*src);
        array_add(*src, tprint("%/Recast/Source/Recast.cpp", BASE_PATH));
        array_add(*src, tprint("%/Recast/Source/RecastAlloc.cpp", BASE_PATH));
        array_add(*src, tprint("%/Recast/Source/RecastArea.cpp", BASE_PATH));
        array_add(*src, tprint("%/Recast/Source/RecastAssert.cpp", BASE_PATH));
        array_add(*src, tprint("%/Recast/Source/RecastContour.cpp", BASE_PATH));
        array_add(*src, tprint("%/Recast/Source/RecastFilter.cpp", BASE_PATH));
        array_add(*src, tprint("%/Recast/Source/RecastLayers.cpp", BASE_PATH));
        array_add(*src, tprint("%/Recast/Source/RecastMesh.cpp", BASE_PATH));
        array_add(*src, tprint("%/Recast/Source/RecastMeshDetail.cpp", BASE_PATH));
        array_add(*src, tprint("%/Recast/Source/RecastRasterization.cpp", BASE_PATH));
        array_add(*src, tprint("%/Recast/Source/RecastRegion.cpp", BASE_PATH));

        array_reset_keeping_memory(*extra);
        array_add(*extra, tprint("/I%/Recast/Include", BASE_PATH));

        #if OS == .WINDOWS {
            make_directory_if_it_does_not_exist("lib/windows", recursive=true);
            success &&= build_cpp_dynamic_lib("lib/windows/Recast", ..src, debug=compile_debug, extra=extra);
            success &&= build_cpp_static_lib("lib/windows/Recast", ..src, debug=compile_debug, extra=extra);
        } else #if OS == .LINUX {
            make_directory_if_it_does_not_exist("lib/linux", recursive=true);
            success &&= build_cpp_dynamic_lib("lib/linux/Recast", ..src, debug=compile_debug, extra=extra);
            success &&= build_cpp_static_lib("lib/linux/Recast", ..src, debug=compile_debug, extra=extra);
        } else {
            assert(false, "OS not supported");
        }

        if !success return false;

        //===============
        // Compile Detour
        //---------------
        log("===============\nCompiling Detour...\n---------------");

        array_reset_keeping_memory(*src);
        array_add(*src, tprint("%/Detour/Source/DetourAlloc.cpp", BASE_PATH));
        array_add(*src, tprint("%/Detour/Source/DetourAssert.cpp", BASE_PATH));
        array_add(*src, tprint("%/Detour/Source/DetourCommon.cpp", BASE_PATH));
        array_add(*src, tprint("%/Detour/Source/DetourNavMesh.cpp", BASE_PATH));
        array_add(*src, tprint("%/Detour/Source/DetourNavMeshBuilder.cpp", BASE_PATH));
        array_add(*src, tprint("%/Detour/Source/DetourNavMeshQuery.cpp", BASE_PATH));
        array_add(*src, tprint("%/Detour/Source/DetourNode.cpp", BASE_PATH));

        array_reset_keeping_memory(*extra);
        array_add(*extra, tprint("/I%/Detour/Include", BASE_PATH));

        #if OS == .WINDOWS {
            make_directory_if_it_does_not_exist("lib/windows", recursive=true);
            success &&= build_cpp_dynamic_lib("lib/windows/Detour", ..src, debug=compile_debug, extra=extra);
            success &&= build_cpp_static_lib("lib/windows/Detour", ..src, debug=compile_debug, extra=extra);
        } else #if OS == .LINUX {
            make_directory_if_it_does_not_exist("lib/linux", recursive=true);
            success &&= build_cpp_dynamic_lib("lib/linux/Detour", ..src, debug=compile_debug, extra=extra);
            success &&= build_cpp_static_lib("lib/linux/Detour", ..src, debug=compile_debug, extra=extra);
        } else {
            assert(false, "OS not supported");
        }

        if !success return false;

        //===============
        // Compile DetourTileCache
        //---------------
        log("===============\nCompiling DetourTileCache...\n---------------");

        array_reset_keeping_memory(*src);
        array_add(*src, tprint("%/DetourTileCache/Source/DetourTileCache.cpp", BASE_PATH));
        array_add(*src, tprint("%/DetourTileCache/Source/DetourTileCacheBuilder.cpp", BASE_PATH));

        array_reset_keeping_memory(*extra);
        array_add(*extra, tprint("/I%/DetourTileCache/Include", BASE_PATH));
        array_add(*extra, tprint("/I%/Detour/Include", BASE_PATH));

        array_reset_keeping_memory(*libs);

        #if OS == .WINDOWS {
            array_add(*libs, "lib/windows/Detour.lib");
            make_directory_if_it_does_not_exist("lib/windows", recursive=true);
            success &&= build_cpp_dynamic_lib("lib/windows/DetourTileCache", ..src, library_files=libs, debug=compile_debug, extra=extra);
            success &&= build_cpp_static_lib("lib/windows/DetourTileCache", ..src, library_files=libs, debug=compile_debug, extra=extra);
        } else #if OS == .LINUX {
            make_directory_if_it_does_not_exist("lib/linux", recursive=true);
            success &&= build_cpp_dynamic_lib("lib/linux/DetourTileCache", ..src, library_files=libs, debug=compile_debug, extra=extra);
            success &&= build_cpp_static_lib("lib/linux/DetourTileCache", ..src, library_files=libs, debug=compile_debug, extra=extra);
        } else {
            assert(false, "OS not supported");
        }

        if !success return false;

        //===============
        // Compile DetourCrowd
        //---------------
        log("===============\nCompiling DetourCrowd...\n---------------");

        array_reset_keeping_memory(*src);
        array_add(*src, tprint("%/DetourCrowd/Source/DetourCrowd.cpp", BASE_PATH));
        array_add(*src, tprint("%/DetourCrowd/Source/DetourLocalBoundary.cpp", BASE_PATH));
        array_add(*src, tprint("%/DetourCrowd/Source/DetourObstacleAvoidance.cpp", BASE_PATH));
        array_add(*src, tprint("%/DetourCrowd/Source/DetourPathCorridor.cpp", BASE_PATH));
        array_add(*src, tprint("%/DetourCrowd/Source/DetourPathQueue.cpp", BASE_PATH));
        array_add(*src, tprint("%/DetourCrowd/Source/DetourProximityGrid.cpp", BASE_PATH));

        array_reset_keeping_memory(*extra);
        array_add(*extra, tprint("/I%/DetourCrowd/Include", BASE_PATH));
        array_add(*extra, tprint("/I%/Detour/Include", BASE_PATH));

        array_reset_keeping_memory(*libs);

        #if OS == .WINDOWS {
            array_add(*libs, "lib/windows/Detour.lib");
            make_directory_if_it_does_not_exist("lib/windows", recursive=true);
            success &&= build_cpp_dynamic_lib("lib/windows/DetourCrowd", ..src, library_files=libs, debug=compile_debug, extra=extra);
            success &&= build_cpp_static_lib("lib/windows/DetourCrowd", ..src, library_files=libs, debug=compile_debug, extra=extra);
        } else #if OS == .LINUX {
            make_directory_if_it_does_not_exist("lib/linux", recursive=true);
            success &&= build_cpp_dynamic_lib("lib/linux/DetourCrowd", ..src, library_files=libs, debug=compile_debug, extra=extra);
            success &&= build_cpp_static_lib("lib/linux/DetourCrowd", ..src, library_files=libs, debug=compile_debug, extra=extra);
        } else {
            assert(false, "OS not supported");
        }

        if !success return false;

        //===============
        // Compile DebugUtils
        //---------------
        log("===============\nCompiling DebugUtils...\n---------------");

        array_reset_keeping_memory(*src);
        array_add(*src, tprint("%/DebugUtils/Source/DebugDraw.cpp", BASE_PATH));
        array_add(*src, tprint("%/DebugUtils/Source/DetourDebugDraw.cpp", BASE_PATH));
        array_add(*src, tprint("%/DebugUtils/Source/RecastDebugDraw.cpp", BASE_PATH));
        array_add(*src, tprint("%/DebugUtils/Source/RecastDump.cpp", BASE_PATH));

        array_reset_keeping_memory(*extra);
        array_add(*extra, tprint("/I%/DebugUtils/Include", BASE_PATH));
        array_add(*extra, tprint("/I%/Recast/Include", BASE_PATH));
        array_add(*extra, tprint("/I%/Detour/Include", BASE_PATH));
        array_add(*extra, tprint("/I%/DetourTileCache/Include", BASE_PATH));

        array_reset_keeping_memory(*libs);

        #if OS == .WINDOWS {
            array_add(*libs, "lib/windows/Recast.lib");
            array_add(*libs, "lib/windows/Detour.lib");
            make_directory_if_it_does_not_exist("lib/windows", recursive=true);
            success &&= build_cpp_dynamic_lib("lib/windows/DebugUtils", ..src, library_files=libs, debug=compile_debug, extra=extra);
            success &&= build_cpp_static_lib("lib/windows/DebugUtils", ..src, library_files=libs, debug=compile_debug, extra=extra);
        } else #if OS == .LINUX {
            make_directory_if_it_does_not_exist("lib/linux", recursive=true);
            success &&= build_cpp_dynamic_lib("lib/linux/DebugUtils", ..src, library_files=libs, debug=compile_debug, extra=extra);
            success &&= build_cpp_static_lib("lib/linux/DebugUtils", ..src, library_files=libs, debug=compile_debug, extra=extra);
        } else {
            assert(false, "OS not supported");
        }

        if !success return false;
    }

    output_file: string;
    libs_dir: string;

    if OS == .WINDOWS {
        output_file = "windows.jai";
        libs_dir = "lib/windows";
    } else #if OS == .LINUX {
        output_file = "linux.jai";
        libs_dir = "lib/linux";
    } else {
        assert(false, "OS not supported");
    }

    make_directory_if_it_does_not_exist(libs_dir, recursive=true);

    //================
    // Recast Bindings
    //----------------
    log("===============\nGenerating Recast Bindings...\n---------------");
    {
        opts: Generate_Bindings_Options;
        using opts;

        array_add(*libpaths, libs_dir);
        array_add(*libnames, "Recast");
        array_add(*libnames, "Detour");
        array_add(*libnames, "DetourTileCache");
        array_add(*libnames, "DetourCrowd");
        array_add(*libnames, "DebugUtils");
        array_add(*include_paths, tprint("%/Recast/Include", BASE_PATH));
        array_add(*include_paths, tprint("%/Detour/Include", BASE_PATH));
        array_add(*include_paths, tprint("%/DetourTileCache/Include", BASE_PATH));
        array_add(*include_paths, tprint("%/DetourCrowd/Include", BASE_PATH));
        array_add(*include_paths, tprint("%/DebugUtils/Include", BASE_PATH));
        array_add(*source_files, "src/all_includes.h");
        array_add(*extra_clang_arguments, "-x", "c++", "-DWIN32_LEAN_AND_MEAN");

        log_stripped_declarations = false;
        visitor = recast_visitor;

        success &&= generate_bindings(opts, output_file);
    }

    return success;
}

recast_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if !parent_decl {
        if array_find(DECLARATIONS_TO_OMIT, decl.name) {
                decl.decl_flags |= .OMIT_FROM_OUTPUT;
                return .STOP;
        }
    }

    return .RECURSE;
}

#import "Basic";
#import "Bindings_Generator";
#import "BuildCpp";
#import "Compiler";
#import "File";
