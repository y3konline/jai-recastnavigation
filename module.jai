#if OS == .WINDOWS {
    #import "Windows";

    #load "windows/Recast.jai";
    #load "windows/Detour.jai";
    #load "windows/DebugUtils.jai";


} else #if OS == .LINUX {
    #load "linux.jai";


} else {
    #assert "Unsupported OS for now";
}