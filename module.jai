// @NOTE - These were failing from the bindings generator because they lose data in the cast.
// I'm not sure if the intention is for them to overflow, or if something is wrong here.
DT_TILECACHE_MAGIC     :s32: cast,no_check(s32) 68 << 24 | 84 << 16 | 76 << 8 | 82;
DT_NAVMESH_MAGIC       :s32: cast,no_check(s32) 68 << 24 | 78 << 16 | 65 << 8 | 86;
DT_NAVMESH_STATE_MAGIC :s32: cast,no_check(s32) 68 << 24 | 78 << 16 | 77 << 8 | 83;

#if OS == .WINDOWS {
    #load "windows.jai";
    #import "Windows";
} else #if OS == .LINUX {
    #load "linux.jai";
} else {
    #assert "Unsupported OS for now";
}
