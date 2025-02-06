//
// This file was auto-generated using the following command:
//
// jai ./generate.jai - -compile
//



dtStatus :: u32;

DT_FAILURE: u32 : 1 << 31; // Operation failed.
DT_SUCCESS: u32 : 1 << 30; // Operation succeed.
DT_IN_PROGRESS: u32 : 1 << 29; // Operation still in progress.

// Detail information for status.
DT_STATUS_DETAIL_MASK: u32 : 16777215;
DT_WRONG_MAGIC: u32 : 1 << 0; // Input data is not recognized.
DT_WRONG_VERSION: u32 : 1 << 1; // Input data is in wrong version.
DT_OUT_OF_MEMORY: u32 : 1 << 2; // Operation ran out of memory.
DT_INVALID_PARAM: u32 : 1 << 3; // An input parameter was invalid.
DT_BUFFER_TOO_SMALL: u32 : 1 << 4; // Result buffer for the query was too small to store all results.
DT_OUT_OF_NODES: u32 : 1 << 5; // Query ran out of nodes during search.
DT_PARTIAL_RESULT: u32 : 1 << 6; // Query did not reach the end location, returning best guess.
DT_ALREADY_OCCUPIED: u32 : 1 << 7; // A tile has already been assigned to the given x,y coordinate

// Returns true of status is success.
dtStatusSucceed :: (status: dtStatus) -> bool #foreign lib/windows/detourtilecache "?dtStatusSucceed@@YA_NI@Z";

// Returns true of status is failure.
dtStatusFailed :: (status: dtStatus) -> bool #foreign lib/windows/detourtilecache "?dtStatusFailed@@YA_NI@Z";

// Returns true of status is in progress.
dtStatusInProgress :: (status: dtStatus) -> bool #foreign lib/windows/detourtilecache "?dtStatusInProgress@@YA_NI@Z";

// Returns true if specific detail is set.
dtStatusDetail :: (status: dtStatus, detail: u32) -> bool #foreign lib/windows/detourtilecache "?dtStatusDetail@@YA_NII@Z";

dtObstacleRef :: u32;
dtCompressedTileRef :: u32;

/// Flags for addTile
dtCompressedTileFlags :: enum s32 {
    DT_COMPRESSEDTILE_FREE_DATA :: 1;
}

dtCompressedTile :: struct {
    salt:           u32; ///< Counter describing modifications to the tile.
    header:         *dtTileCacheLayerHeader;
    compressed:     *u8;
    compressedSize: s32;
    data:           *u8;
    dataSize:       s32;
    flags:          u32;
    next:           *dtCompressedTile;
}

ObstacleState :: enum s32 {
    EMPTY      :: 0;
    PROCESSING :: 1;
    PROCESSED  :: 2;
    REMOVING   :: 3;

    DT_OBSTACLE_EMPTY      :: EMPTY;
    DT_OBSTACLE_PROCESSING :: PROCESSING;
    DT_OBSTACLE_PROCESSED  :: PROCESSED;
    DT_OBSTACLE_REMOVING   :: REMOVING;
}

ObstacleType :: enum s32 {
    CYLINDER     :: 0;
    BOX          :: 1;
    ORIENTED_BOX :: 2;

    DT_OBSTACLE_CYLINDER     :: CYLINDER;
    DT_OBSTACLE_BOX          :: BOX;
    DT_OBSTACLE_ORIENTED_BOX :: ORIENTED_BOX;
}

dtObstacleCylinder :: struct {
    pos:    [3] float;
    radius: float;
    height: float;
}

dtObstacleBox :: struct {
    bmin: [3] float;
    bmax: [3] float;
}

dtObstacleOrientedBox :: struct {
    center:      [3] float;
    halfExtents: [3] float;
    rotAux:      [2] float; //{ cos(0.5f*angle)*sin(-0.5f*angle); cos(0.5f*angle)*cos(0.5f*angle) - 0.5 }
}

DT_MAX_TOUCHED_TILES: s32 : 8;
dtTileCacheObstacle :: struct {
    union {
        cylinder:    dtObstacleCylinder;
        box:         dtObstacleBox;
        orientedBox: dtObstacleOrientedBox;
    }

    touched:  [8] dtCompressedTileRef;
    pending:  [8] dtCompressedTileRef;
    salt:     u16;
    type:     u8;
    state:    u8;
    ntouched: u8;
    npending: u8;
    next:     *dtTileCacheObstacle;
}

dtTileCacheParams :: struct {
    orig:                   [3] float;
    cs:                     float;
    ch:                     float;
    width:                  s32;
    height:                 s32;
    walkableHeight:         float;
    walkableRadius:         float;
    walkableClimb:          float;
    maxSimplificationError: float;
    maxTiles:               s32;
    maxObstacles:           s32;
}

dtTileCacheMeshProcess :: struct {
    vtable: *dtTileCacheMeshProcess_VTable;
    dtNavMeshCreateParams :: struct {}
}
dtTileCacheMeshProcess_VTable :: struct #type_info_none {
    Destructor: (this: *dtTileCacheMeshProcess, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
    process: (this: *dtTileCacheMeshProcess, params: *dtTileCacheMeshProcess.dtNavMeshCreateParams, polyAreas: *u8, polyFlags: *u16) -> void #cpp_method;
}

dtTileCacheMeshProcess_Destructor :: inline (this: *dtTileCacheMeshProcess, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }
dtTileCacheMeshProcess_process :: inline (this: *dtTileCacheMeshProcess, params: *dtTileCacheMeshProcess.dtNavMeshCreateParams, polyAreas: *u8, polyFlags: *u16) { this.vtable.process(this, params, polyAreas, polyFlags); }

vtable :: (obj: *dtTileCacheMeshProcess) -> *dtTileCacheMeshProcess_VTable { return obj.vtable; }


dtTileCache :: struct {
    dtNavMesh :: struct {}

    ObstacleRequestAction :: enum s32 {
        ADD    :: 0;
        REMOVE :: 1;

        REQUEST_ADD    :: ADD;
        REQUEST_REMOVE :: REMOVE;
    }

    ObstacleRequest :: struct {
        action: s32;
        ref:    dtObstacleRef;
    }

    m_tileLutSize:      s32; ///< Tile hash lookup size (must be pot).
    m_tileLutMask:      s32; ///< Tile hash lookup mask.

    m_posLookup:        **dtCompressedTile; ///< Tile hash lookup.
    m_nextFreeTile:     *dtCompressedTile; ///< Freelist of tiles.
    m_tiles:            *dtCompressedTile; ///< List of tiles.

    m_saltBits:         u32; ///< Number of salt bits in the tile ID.
    m_tileBits:         u32; ///< Number of tile bits in the tile ID.

    m_params:           dtTileCacheParams;

    m_talloc:           *dtTileCacheAlloc;
    m_tcomp:            *dtTileCacheCompressor;
    m_tmproc:           *dtTileCacheMeshProcess;

    m_obstacles:        *dtTileCacheObstacle;
    m_nextFreeObstacle: *dtTileCacheObstacle;

    MAX_REQUESTS:       s32 : 64;
    m_reqs:             [64] ObstacleRequest;
    m_nreqs:            s32;

    MAX_UPDATE:         s32 : 64;
    m_update:           [64] dtCompressedTileRef;
    m_nupdate:          s32;
}

/// Provides hint values to the memory allocator on how long the
/// memory is expected to be used.
dtAllocHint :: enum s32 {
    PERM :: 0;
    TEMP :: 1;

    DT_ALLOC_PERM :: PERM;
    DT_ALLOC_TEMP :: TEMP;
}

/// A memory allocation function.
//  @param[in]		size			The size, in bytes of memory, to allocate.
//  @param[in]		rcAllocHint	A hint to the allocator on how long the memory is expected to be in use.
//  @return A pointer to the beginning of the allocated memory block, or null if the allocation failed.
///  @see dtAllocSetCustom
dtAllocFunc :: #type (size: u64, hint: dtAllocHint) -> *void #c_call;

/// A memory deallocation function.
///  @param[in]		ptr		A pointer to a memory block previously allocated using #dtAllocFunc.
/// @see dtAllocSetCustom
dtFreeFunc :: #type (ptr: *void) -> void #c_call;

/// Sets the base custom allocation functions to be used by Detour.
///  @param[in]		allocFunc	The memory allocation function to be used by #dtAlloc
///  @param[in]		freeFunc	The memory de-allocation function to be used by #dtFree
dtAllocSetCustom :: (allocFunc: dtAllocFunc, freeFunc: dtFreeFunc) -> void #foreign lib/windows/detourtilecache "?dtAllocSetCustom@@YAXP6APEAX_KW4dtAllocHint@@@ZP6AXPEAX@Z@Z";

/// Allocates a memory block.
///  @param[in]		size	The size, in bytes of memory, to allocate.
///  @param[in]		hint	A hint to the allocator on how long the memory is expected to be in use.
///  @return A pointer to the beginning of the allocated memory block, or null if the allocation failed.
/// @see dtFree
dtAlloc :: (size: u64, hint: dtAllocHint) -> *void #foreign lib/windows/detourtilecache "?dtAlloc@@YAPEAX_KW4dtAllocHint@@@Z";

/// Deallocates a memory block.
///  @param[in]		ptr		A pointer to a memory block previously allocated using #dtAlloc.
/// @see dtAlloc
dtFree :: (ptr: *void) -> void #foreign lib/windows/detourtilecache "?dtFree@@YAXPEAX@Z";

DT_TILECACHE_MAGIC: s32 : 68 << 24 | 84 << 16 | 76 << 8 | 82; ///< 'DTLR';
DT_TILECACHE_VERSION: s32 : 1;

DT_TILECACHE_NULL_AREA: u8 : 0;
DT_TILECACHE_WALKABLE_AREA: u8 : 63;
DT_TILECACHE_NULL_IDX: u16 : 65535;

dtTileCacheLayerHeader :: struct {
    magic:   s32; ///< Data magic
    version: s32; ///< Data version
    tx:      s32;
    ty:      s32;
    tlayer:  s32;
    bmin:    [3] float;
    bmax:    [3] float;
    hmin:    u16; ///< Height min/max range
    hmax:    u16; ///< Height min/max range
    width:   u8; ///< Dimension of the layer.
    height:  u8; ///< Dimension of the layer.
    minx:    u8; ///< Usable sub-region.
    maxx:    u8; ///< Usable sub-region.
    miny:    u8; ///< Usable sub-region.
    maxy:    u8; ///< Usable sub-region.
}

dtTileCacheLayer :: struct {
    header:   *dtTileCacheLayerHeader;
    regCount: u8; ///< Region count.
    heights:  *u8;
    areas:    *u8;
    cons:     *u8;
    regs:     *u8;
}

dtTileCacheContour :: struct {
    nverts: s32;
    verts:  *u8;
    reg:    u8;
    area:   u8;
}

dtTileCacheContourSet :: struct {
    nconts: s32;
    conts:  *dtTileCacheContour;
}

dtTileCachePolyMesh :: struct {
    nvp:    s32;
    nverts: s32; ///< Number of vertices.
    npolys: s32; ///< Number of polygons.
    verts:  *u16; ///< Vertices of the mesh, 3 elements per vertex.
    polys:  *u16; ///< Polygons of the mesh, nvp*2 elements per polygon.
    flags:  *u16; ///< Per polygon flags.
    areas:  *u8; ///< Area ID of polygons.
}

dtTileCacheAlloc :: struct {
    vtable: *dtTileCacheAlloc_VTable;
}
dtTileCacheAlloc_VTable :: struct #type_info_none {
    Destructor: (this: *dtTileCacheAlloc, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

    reset: (this: *dtTileCacheAlloc) -> void #cpp_method;

    alloc: (this: *dtTileCacheAlloc, size: u64) -> *void #cpp_method;

    free: (this: *dtTileCacheAlloc, ptr: *void) -> void #cpp_method;
}

dtTileCacheAlloc_Destructor :: inline (this: *dtTileCacheAlloc, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

dtTileCacheAlloc_reset :: inline (this: *dtTileCacheAlloc) { this.vtable.reset(this); }

dtTileCacheAlloc_alloc :: inline (this: *dtTileCacheAlloc, size: u64) -> *void { return this.vtable.alloc(this, size); }

dtTileCacheAlloc_free :: inline (this: *dtTileCacheAlloc, ptr: *void) { this.vtable.free(this, ptr); }

vtable :: (obj: *dtTileCacheAlloc) -> *dtTileCacheAlloc_VTable { return obj.vtable; }


dtTileCacheCompressor :: struct {
    vtable: *dtTileCacheCompressor_VTable;
}
dtTileCacheCompressor_VTable :: struct #type_info_none {
    Destructor: (this: *dtTileCacheCompressor, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

    maxCompressedSize: (this: *dtTileCacheCompressor, bufferSize: s32) -> s32 #cpp_method;
    compress: (this: *dtTileCacheCompressor, buffer: *u8, bufferSize: s32, compressed: *u8, maxCompressedSize: s32, compressedSize: *s32) -> dtStatus #cpp_method;

    decompress: (this: *dtTileCacheCompressor, compressed: *u8, compressedSize: s32, buffer: *u8, maxBufferSize: s32, bufferSize: *s32) -> dtStatus #cpp_method;
}

dtTileCacheCompressor_Destructor :: inline (this: *dtTileCacheCompressor, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

dtTileCacheCompressor_maxCompressedSize :: inline (this: *dtTileCacheCompressor, bufferSize: s32) -> s32 { return this.vtable.maxCompressedSize(this, bufferSize); }
dtTileCacheCompressor_compress :: inline (this: *dtTileCacheCompressor, buffer: *u8, bufferSize: s32, compressed: *u8, maxCompressedSize: s32, compressedSize: *s32) -> dtStatus { return this.vtable.compress(this, buffer, bufferSize, compressed, maxCompressedSize, compressedSize); }

dtTileCacheCompressor_decompress :: inline (this: *dtTileCacheCompressor, compressed: *u8, compressedSize: s32, buffer: *u8, maxBufferSize: s32, bufferSize: *s32) -> dtStatus { return this.vtable.decompress(this, compressed, compressedSize, buffer, maxBufferSize, bufferSize); }

vtable :: (obj: *dtTileCacheCompressor) -> *dtTileCacheCompressor_VTable { return obj.vtable; }


#scope_file

#import "Basic"; // For assert

lib/windows/detourtilecache :: #library "./lib/windows/DetourTileCache";

#run {
    {
        instance: dtCompressedTile;
        assert(((cast(*void)(*instance.salt)) - cast(*void)(*instance)) == 0, "dtCompressedTile.salt has unexpected offset % instead of 0", ((cast(*void)(*instance.salt)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCompressedTile.salt)) == 4, "dtCompressedTile.salt has unexpected size % instead of 4", size_of(type_of(dtCompressedTile.salt)));
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 8, "dtCompressedTile.header has unexpected offset % instead of 8", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCompressedTile.header)) == 8, "dtCompressedTile.header has unexpected size % instead of 8", size_of(type_of(dtCompressedTile.header)));
        assert(((cast(*void)(*instance.compressed)) - cast(*void)(*instance)) == 16, "dtCompressedTile.compressed has unexpected offset % instead of 16", ((cast(*void)(*instance.compressed)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCompressedTile.compressed)) == 8, "dtCompressedTile.compressed has unexpected size % instead of 8", size_of(type_of(dtCompressedTile.compressed)));
        assert(((cast(*void)(*instance.compressedSize)) - cast(*void)(*instance)) == 24, "dtCompressedTile.compressedSize has unexpected offset % instead of 24", ((cast(*void)(*instance.compressedSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCompressedTile.compressedSize)) == 4, "dtCompressedTile.compressedSize has unexpected size % instead of 4", size_of(type_of(dtCompressedTile.compressedSize)));
        assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 32, "dtCompressedTile.data has unexpected offset % instead of 32", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCompressedTile.data)) == 8, "dtCompressedTile.data has unexpected size % instead of 8", size_of(type_of(dtCompressedTile.data)));
        assert(((cast(*void)(*instance.dataSize)) - cast(*void)(*instance)) == 40, "dtCompressedTile.dataSize has unexpected offset % instead of 40", ((cast(*void)(*instance.dataSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCompressedTile.dataSize)) == 4, "dtCompressedTile.dataSize has unexpected size % instead of 4", size_of(type_of(dtCompressedTile.dataSize)));
        assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 44, "dtCompressedTile.flags has unexpected offset % instead of 44", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCompressedTile.flags)) == 4, "dtCompressedTile.flags has unexpected size % instead of 4", size_of(type_of(dtCompressedTile.flags)));
        assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 48, "dtCompressedTile.next has unexpected offset % instead of 48", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCompressedTile.next)) == 8, "dtCompressedTile.next has unexpected size % instead of 8", size_of(type_of(dtCompressedTile.next)));
        assert(size_of(dtCompressedTile) == 56, "dtCompressedTile has size % instead of 56", size_of(dtCompressedTile));
    }

    {
        instance: dtObstacleCylinder;
        assert(((cast(*void)(*instance.pos)) - cast(*void)(*instance)) == 0, "dtObstacleCylinder.pos has unexpected offset % instead of 0", ((cast(*void)(*instance.pos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleCylinder.pos)) == 12, "dtObstacleCylinder.pos has unexpected size % instead of 12", size_of(type_of(dtObstacleCylinder.pos)));
        assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 12, "dtObstacleCylinder.radius has unexpected offset % instead of 12", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleCylinder.radius)) == 4, "dtObstacleCylinder.radius has unexpected size % instead of 4", size_of(type_of(dtObstacleCylinder.radius)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 16, "dtObstacleCylinder.height has unexpected offset % instead of 16", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleCylinder.height)) == 4, "dtObstacleCylinder.height has unexpected size % instead of 4", size_of(type_of(dtObstacleCylinder.height)));
        assert(size_of(dtObstacleCylinder) == 20, "dtObstacleCylinder has size % instead of 20", size_of(dtObstacleCylinder));
    }

    {
        instance: dtObstacleBox;
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 0, "dtObstacleBox.bmin has unexpected offset % instead of 0", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleBox.bmin)) == 12, "dtObstacleBox.bmin has unexpected size % instead of 12", size_of(type_of(dtObstacleBox.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 12, "dtObstacleBox.bmax has unexpected offset % instead of 12", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleBox.bmax)) == 12, "dtObstacleBox.bmax has unexpected size % instead of 12", size_of(type_of(dtObstacleBox.bmax)));
        assert(size_of(dtObstacleBox) == 24, "dtObstacleBox has size % instead of 24", size_of(dtObstacleBox));
    }

    {
        instance: dtObstacleOrientedBox;
        assert(((cast(*void)(*instance.center)) - cast(*void)(*instance)) == 0, "dtObstacleOrientedBox.center has unexpected offset % instead of 0", ((cast(*void)(*instance.center)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleOrientedBox.center)) == 12, "dtObstacleOrientedBox.center has unexpected size % instead of 12", size_of(type_of(dtObstacleOrientedBox.center)));
        assert(((cast(*void)(*instance.halfExtents)) - cast(*void)(*instance)) == 12, "dtObstacleOrientedBox.halfExtents has unexpected offset % instead of 12", ((cast(*void)(*instance.halfExtents)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleOrientedBox.halfExtents)) == 12, "dtObstacleOrientedBox.halfExtents has unexpected size % instead of 12", size_of(type_of(dtObstacleOrientedBox.halfExtents)));
        assert(((cast(*void)(*instance.rotAux)) - cast(*void)(*instance)) == 24, "dtObstacleOrientedBox.rotAux has unexpected offset % instead of 24", ((cast(*void)(*instance.rotAux)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleOrientedBox.rotAux)) == 8, "dtObstacleOrientedBox.rotAux has unexpected size % instead of 8", size_of(type_of(dtObstacleOrientedBox.rotAux)));
        assert(size_of(dtObstacleOrientedBox) == 32, "dtObstacleOrientedBox has size % instead of 32", size_of(dtObstacleOrientedBox));
    }

    {
        instance: dtTileCacheObstacle;
        assert(((cast(*void)(*instance.touched)) - cast(*void)(*instance)) == 32, "dtTileCacheObstacle.touched has unexpected offset % instead of 32", ((cast(*void)(*instance.touched)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheObstacle.touched)) == 32, "dtTileCacheObstacle.touched has unexpected size % instead of 32", size_of(type_of(dtTileCacheObstacle.touched)));
        assert(((cast(*void)(*instance.pending)) - cast(*void)(*instance)) == 64, "dtTileCacheObstacle.pending has unexpected offset % instead of 64", ((cast(*void)(*instance.pending)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheObstacle.pending)) == 32, "dtTileCacheObstacle.pending has unexpected size % instead of 32", size_of(type_of(dtTileCacheObstacle.pending)));
        assert(((cast(*void)(*instance.salt)) - cast(*void)(*instance)) == 96, "dtTileCacheObstacle.salt has unexpected offset % instead of 96", ((cast(*void)(*instance.salt)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheObstacle.salt)) == 2, "dtTileCacheObstacle.salt has unexpected size % instead of 2", size_of(type_of(dtTileCacheObstacle.salt)));
        assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 98, "dtTileCacheObstacle.type has unexpected offset % instead of 98", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheObstacle.type)) == 1, "dtTileCacheObstacle.type has unexpected size % instead of 1", size_of(type_of(dtTileCacheObstacle.type)));
        assert(((cast(*void)(*instance.state)) - cast(*void)(*instance)) == 99, "dtTileCacheObstacle.state has unexpected offset % instead of 99", ((cast(*void)(*instance.state)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheObstacle.state)) == 1, "dtTileCacheObstacle.state has unexpected size % instead of 1", size_of(type_of(dtTileCacheObstacle.state)));
        assert(((cast(*void)(*instance.ntouched)) - cast(*void)(*instance)) == 100, "dtTileCacheObstacle.ntouched has unexpected offset % instead of 100", ((cast(*void)(*instance.ntouched)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheObstacle.ntouched)) == 1, "dtTileCacheObstacle.ntouched has unexpected size % instead of 1", size_of(type_of(dtTileCacheObstacle.ntouched)));
        assert(((cast(*void)(*instance.npending)) - cast(*void)(*instance)) == 101, "dtTileCacheObstacle.npending has unexpected offset % instead of 101", ((cast(*void)(*instance.npending)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheObstacle.npending)) == 1, "dtTileCacheObstacle.npending has unexpected size % instead of 1", size_of(type_of(dtTileCacheObstacle.npending)));
        assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 104, "dtTileCacheObstacle.next has unexpected offset % instead of 104", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheObstacle.next)) == 8, "dtTileCacheObstacle.next has unexpected size % instead of 8", size_of(type_of(dtTileCacheObstacle.next)));
        assert(size_of(dtTileCacheObstacle) == 112, "dtTileCacheObstacle has size % instead of 112", size_of(dtTileCacheObstacle));
    }

    {
        instance: dtTileCacheParams;
        assert(((cast(*void)(*instance.orig)) - cast(*void)(*instance)) == 0, "dtTileCacheParams.orig has unexpected offset % instead of 0", ((cast(*void)(*instance.orig)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheParams.orig)) == 12, "dtTileCacheParams.orig has unexpected size % instead of 12", size_of(type_of(dtTileCacheParams.orig)));
        assert(((cast(*void)(*instance.cs)) - cast(*void)(*instance)) == 12, "dtTileCacheParams.cs has unexpected offset % instead of 12", ((cast(*void)(*instance.cs)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheParams.cs)) == 4, "dtTileCacheParams.cs has unexpected size % instead of 4", size_of(type_of(dtTileCacheParams.cs)));
        assert(((cast(*void)(*instance.ch)) - cast(*void)(*instance)) == 16, "dtTileCacheParams.ch has unexpected offset % instead of 16", ((cast(*void)(*instance.ch)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheParams.ch)) == 4, "dtTileCacheParams.ch has unexpected size % instead of 4", size_of(type_of(dtTileCacheParams.ch)));
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 20, "dtTileCacheParams.width has unexpected offset % instead of 20", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheParams.width)) == 4, "dtTileCacheParams.width has unexpected size % instead of 4", size_of(type_of(dtTileCacheParams.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 24, "dtTileCacheParams.height has unexpected offset % instead of 24", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheParams.height)) == 4, "dtTileCacheParams.height has unexpected size % instead of 4", size_of(type_of(dtTileCacheParams.height)));
        assert(((cast(*void)(*instance.walkableHeight)) - cast(*void)(*instance)) == 28, "dtTileCacheParams.walkableHeight has unexpected offset % instead of 28", ((cast(*void)(*instance.walkableHeight)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheParams.walkableHeight)) == 4, "dtTileCacheParams.walkableHeight has unexpected size % instead of 4", size_of(type_of(dtTileCacheParams.walkableHeight)));
        assert(((cast(*void)(*instance.walkableRadius)) - cast(*void)(*instance)) == 32, "dtTileCacheParams.walkableRadius has unexpected offset % instead of 32", ((cast(*void)(*instance.walkableRadius)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheParams.walkableRadius)) == 4, "dtTileCacheParams.walkableRadius has unexpected size % instead of 4", size_of(type_of(dtTileCacheParams.walkableRadius)));
        assert(((cast(*void)(*instance.walkableClimb)) - cast(*void)(*instance)) == 36, "dtTileCacheParams.walkableClimb has unexpected offset % instead of 36", ((cast(*void)(*instance.walkableClimb)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheParams.walkableClimb)) == 4, "dtTileCacheParams.walkableClimb has unexpected size % instead of 4", size_of(type_of(dtTileCacheParams.walkableClimb)));
        assert(((cast(*void)(*instance.maxSimplificationError)) - cast(*void)(*instance)) == 40, "dtTileCacheParams.maxSimplificationError has unexpected offset % instead of 40", ((cast(*void)(*instance.maxSimplificationError)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheParams.maxSimplificationError)) == 4, "dtTileCacheParams.maxSimplificationError has unexpected size % instead of 4", size_of(type_of(dtTileCacheParams.maxSimplificationError)));
        assert(((cast(*void)(*instance.maxTiles)) - cast(*void)(*instance)) == 44, "dtTileCacheParams.maxTiles has unexpected offset % instead of 44", ((cast(*void)(*instance.maxTiles)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheParams.maxTiles)) == 4, "dtTileCacheParams.maxTiles has unexpected size % instead of 4", size_of(type_of(dtTileCacheParams.maxTiles)));
        assert(((cast(*void)(*instance.maxObstacles)) - cast(*void)(*instance)) == 48, "dtTileCacheParams.maxObstacles has unexpected offset % instead of 48", ((cast(*void)(*instance.maxObstacles)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheParams.maxObstacles)) == 4, "dtTileCacheParams.maxObstacles has unexpected size % instead of 4", size_of(type_of(dtTileCacheParams.maxObstacles)));
        assert(size_of(dtTileCacheParams) == 52, "dtTileCacheParams has size % instead of 52", size_of(dtTileCacheParams));
    }

    assert(size_of(dtTileCacheMeshProcess) == 8, "dtTileCacheMeshProcess has size % instead of 8", size_of(dtTileCacheMeshProcess));

    {
        instance: dtTileCache.ObstacleRequest;
        assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 0, "dtTileCache.ObstacleRequest.action has unexpected offset % instead of 0", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.ObstacleRequest.action)) == 4, "dtTileCache.ObstacleRequest.action has unexpected size % instead of 4", size_of(type_of(dtTileCache.ObstacleRequest.action)));
        assert(((cast(*void)(*instance.ref)) - cast(*void)(*instance)) == 4, "dtTileCache.ObstacleRequest.ref has unexpected offset % instead of 4", ((cast(*void)(*instance.ref)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.ObstacleRequest.ref)) == 4, "dtTileCache.ObstacleRequest.ref has unexpected size % instead of 4", size_of(type_of(dtTileCache.ObstacleRequest.ref)));
        assert(size_of(dtTileCache.ObstacleRequest) == 8, "dtTileCache.ObstacleRequest has size % instead of 8", size_of(dtTileCache.ObstacleRequest));
    }

    {
        instance: dtTileCache;
        assert(((cast(*void)(*instance.m_tileLutSize)) - cast(*void)(*instance)) == 0, "dtTileCache.m_tileLutSize has unexpected offset % instead of 0", ((cast(*void)(*instance.m_tileLutSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_tileLutSize)) == 4, "dtTileCache.m_tileLutSize has unexpected size % instead of 4", size_of(type_of(dtTileCache.m_tileLutSize)));
        assert(((cast(*void)(*instance.m_tileLutMask)) - cast(*void)(*instance)) == 4, "dtTileCache.m_tileLutMask has unexpected offset % instead of 4", ((cast(*void)(*instance.m_tileLutMask)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_tileLutMask)) == 4, "dtTileCache.m_tileLutMask has unexpected size % instead of 4", size_of(type_of(dtTileCache.m_tileLutMask)));
        assert(((cast(*void)(*instance.m_posLookup)) - cast(*void)(*instance)) == 8, "dtTileCache.m_posLookup has unexpected offset % instead of 8", ((cast(*void)(*instance.m_posLookup)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_posLookup)) == 8, "dtTileCache.m_posLookup has unexpected size % instead of 8", size_of(type_of(dtTileCache.m_posLookup)));
        assert(((cast(*void)(*instance.m_nextFreeTile)) - cast(*void)(*instance)) == 16, "dtTileCache.m_nextFreeTile has unexpected offset % instead of 16", ((cast(*void)(*instance.m_nextFreeTile)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_nextFreeTile)) == 8, "dtTileCache.m_nextFreeTile has unexpected size % instead of 8", size_of(type_of(dtTileCache.m_nextFreeTile)));
        assert(((cast(*void)(*instance.m_tiles)) - cast(*void)(*instance)) == 24, "dtTileCache.m_tiles has unexpected offset % instead of 24", ((cast(*void)(*instance.m_tiles)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_tiles)) == 8, "dtTileCache.m_tiles has unexpected size % instead of 8", size_of(type_of(dtTileCache.m_tiles)));
        assert(((cast(*void)(*instance.m_saltBits)) - cast(*void)(*instance)) == 32, "dtTileCache.m_saltBits has unexpected offset % instead of 32", ((cast(*void)(*instance.m_saltBits)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_saltBits)) == 4, "dtTileCache.m_saltBits has unexpected size % instead of 4", size_of(type_of(dtTileCache.m_saltBits)));
        assert(((cast(*void)(*instance.m_tileBits)) - cast(*void)(*instance)) == 36, "dtTileCache.m_tileBits has unexpected offset % instead of 36", ((cast(*void)(*instance.m_tileBits)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_tileBits)) == 4, "dtTileCache.m_tileBits has unexpected size % instead of 4", size_of(type_of(dtTileCache.m_tileBits)));
        assert(((cast(*void)(*instance.m_params)) - cast(*void)(*instance)) == 40, "dtTileCache.m_params has unexpected offset % instead of 40", ((cast(*void)(*instance.m_params)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_params)) == 52, "dtTileCache.m_params has unexpected size % instead of 52", size_of(type_of(dtTileCache.m_params)));
        assert(((cast(*void)(*instance.m_talloc)) - cast(*void)(*instance)) == 96, "dtTileCache.m_talloc has unexpected offset % instead of 96", ((cast(*void)(*instance.m_talloc)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_talloc)) == 8, "dtTileCache.m_talloc has unexpected size % instead of 8", size_of(type_of(dtTileCache.m_talloc)));
        assert(((cast(*void)(*instance.m_tcomp)) - cast(*void)(*instance)) == 104, "dtTileCache.m_tcomp has unexpected offset % instead of 104", ((cast(*void)(*instance.m_tcomp)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_tcomp)) == 8, "dtTileCache.m_tcomp has unexpected size % instead of 8", size_of(type_of(dtTileCache.m_tcomp)));
        assert(((cast(*void)(*instance.m_tmproc)) - cast(*void)(*instance)) == 112, "dtTileCache.m_tmproc has unexpected offset % instead of 112", ((cast(*void)(*instance.m_tmproc)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_tmproc)) == 8, "dtTileCache.m_tmproc has unexpected size % instead of 8", size_of(type_of(dtTileCache.m_tmproc)));
        assert(((cast(*void)(*instance.m_obstacles)) - cast(*void)(*instance)) == 120, "dtTileCache.m_obstacles has unexpected offset % instead of 120", ((cast(*void)(*instance.m_obstacles)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_obstacles)) == 8, "dtTileCache.m_obstacles has unexpected size % instead of 8", size_of(type_of(dtTileCache.m_obstacles)));
        assert(((cast(*void)(*instance.m_nextFreeObstacle)) - cast(*void)(*instance)) == 128, "dtTileCache.m_nextFreeObstacle has unexpected offset % instead of 128", ((cast(*void)(*instance.m_nextFreeObstacle)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_nextFreeObstacle)) == 8, "dtTileCache.m_nextFreeObstacle has unexpected size % instead of 8", size_of(type_of(dtTileCache.m_nextFreeObstacle)));
        assert(((cast(*void)(*instance.m_reqs)) - cast(*void)(*instance)) == 136, "dtTileCache.m_reqs has unexpected offset % instead of 136", ((cast(*void)(*instance.m_reqs)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_reqs)) == 512, "dtTileCache.m_reqs has unexpected size % instead of 512", size_of(type_of(dtTileCache.m_reqs)));
        assert(((cast(*void)(*instance.m_nreqs)) - cast(*void)(*instance)) == 648, "dtTileCache.m_nreqs has unexpected offset % instead of 648", ((cast(*void)(*instance.m_nreqs)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_nreqs)) == 4, "dtTileCache.m_nreqs has unexpected size % instead of 4", size_of(type_of(dtTileCache.m_nreqs)));
        assert(((cast(*void)(*instance.m_update)) - cast(*void)(*instance)) == 652, "dtTileCache.m_update has unexpected offset % instead of 652", ((cast(*void)(*instance.m_update)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_update)) == 256, "dtTileCache.m_update has unexpected size % instead of 256", size_of(type_of(dtTileCache.m_update)));
        assert(((cast(*void)(*instance.m_nupdate)) - cast(*void)(*instance)) == 908, "dtTileCache.m_nupdate has unexpected offset % instead of 908", ((cast(*void)(*instance.m_nupdate)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCache.m_nupdate)) == 4, "dtTileCache.m_nupdate has unexpected size % instead of 4", size_of(type_of(dtTileCache.m_nupdate)));
        assert(size_of(dtTileCache) == 912, "dtTileCache has size % instead of 912", size_of(dtTileCache));
    }

    {
        instance: dtTileCacheLayerHeader;
        assert(((cast(*void)(*instance.magic)) - cast(*void)(*instance)) == 0, "dtTileCacheLayerHeader.magic has unexpected offset % instead of 0", ((cast(*void)(*instance.magic)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.magic)) == 4, "dtTileCacheLayerHeader.magic has unexpected size % instead of 4", size_of(type_of(dtTileCacheLayerHeader.magic)));
        assert(((cast(*void)(*instance.version)) - cast(*void)(*instance)) == 4, "dtTileCacheLayerHeader.version has unexpected offset % instead of 4", ((cast(*void)(*instance.version)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.version)) == 4, "dtTileCacheLayerHeader.version has unexpected size % instead of 4", size_of(type_of(dtTileCacheLayerHeader.version)));
        assert(((cast(*void)(*instance.tx)) - cast(*void)(*instance)) == 8, "dtTileCacheLayerHeader.tx has unexpected offset % instead of 8", ((cast(*void)(*instance.tx)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.tx)) == 4, "dtTileCacheLayerHeader.tx has unexpected size % instead of 4", size_of(type_of(dtTileCacheLayerHeader.tx)));
        assert(((cast(*void)(*instance.ty)) - cast(*void)(*instance)) == 12, "dtTileCacheLayerHeader.ty has unexpected offset % instead of 12", ((cast(*void)(*instance.ty)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.ty)) == 4, "dtTileCacheLayerHeader.ty has unexpected size % instead of 4", size_of(type_of(dtTileCacheLayerHeader.ty)));
        assert(((cast(*void)(*instance.tlayer)) - cast(*void)(*instance)) == 16, "dtTileCacheLayerHeader.tlayer has unexpected offset % instead of 16", ((cast(*void)(*instance.tlayer)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.tlayer)) == 4, "dtTileCacheLayerHeader.tlayer has unexpected size % instead of 4", size_of(type_of(dtTileCacheLayerHeader.tlayer)));
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 20, "dtTileCacheLayerHeader.bmin has unexpected offset % instead of 20", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.bmin)) == 12, "dtTileCacheLayerHeader.bmin has unexpected size % instead of 12", size_of(type_of(dtTileCacheLayerHeader.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 32, "dtTileCacheLayerHeader.bmax has unexpected offset % instead of 32", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.bmax)) == 12, "dtTileCacheLayerHeader.bmax has unexpected size % instead of 12", size_of(type_of(dtTileCacheLayerHeader.bmax)));
        assert(((cast(*void)(*instance.hmin)) - cast(*void)(*instance)) == 44, "dtTileCacheLayerHeader.hmin has unexpected offset % instead of 44", ((cast(*void)(*instance.hmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.hmin)) == 2, "dtTileCacheLayerHeader.hmin has unexpected size % instead of 2", size_of(type_of(dtTileCacheLayerHeader.hmin)));
        assert(((cast(*void)(*instance.hmax)) - cast(*void)(*instance)) == 46, "dtTileCacheLayerHeader.hmax has unexpected offset % instead of 46", ((cast(*void)(*instance.hmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.hmax)) == 2, "dtTileCacheLayerHeader.hmax has unexpected size % instead of 2", size_of(type_of(dtTileCacheLayerHeader.hmax)));
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 48, "dtTileCacheLayerHeader.width has unexpected offset % instead of 48", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.width)) == 1, "dtTileCacheLayerHeader.width has unexpected size % instead of 1", size_of(type_of(dtTileCacheLayerHeader.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 49, "dtTileCacheLayerHeader.height has unexpected offset % instead of 49", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.height)) == 1, "dtTileCacheLayerHeader.height has unexpected size % instead of 1", size_of(type_of(dtTileCacheLayerHeader.height)));
        assert(((cast(*void)(*instance.minx)) - cast(*void)(*instance)) == 50, "dtTileCacheLayerHeader.minx has unexpected offset % instead of 50", ((cast(*void)(*instance.minx)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.minx)) == 1, "dtTileCacheLayerHeader.minx has unexpected size % instead of 1", size_of(type_of(dtTileCacheLayerHeader.minx)));
        assert(((cast(*void)(*instance.maxx)) - cast(*void)(*instance)) == 51, "dtTileCacheLayerHeader.maxx has unexpected offset % instead of 51", ((cast(*void)(*instance.maxx)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.maxx)) == 1, "dtTileCacheLayerHeader.maxx has unexpected size % instead of 1", size_of(type_of(dtTileCacheLayerHeader.maxx)));
        assert(((cast(*void)(*instance.miny)) - cast(*void)(*instance)) == 52, "dtTileCacheLayerHeader.miny has unexpected offset % instead of 52", ((cast(*void)(*instance.miny)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.miny)) == 1, "dtTileCacheLayerHeader.miny has unexpected size % instead of 1", size_of(type_of(dtTileCacheLayerHeader.miny)));
        assert(((cast(*void)(*instance.maxy)) - cast(*void)(*instance)) == 53, "dtTileCacheLayerHeader.maxy has unexpected offset % instead of 53", ((cast(*void)(*instance.maxy)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayerHeader.maxy)) == 1, "dtTileCacheLayerHeader.maxy has unexpected size % instead of 1", size_of(type_of(dtTileCacheLayerHeader.maxy)));
        assert(size_of(dtTileCacheLayerHeader) == 56, "dtTileCacheLayerHeader has size % instead of 56", size_of(dtTileCacheLayerHeader));
    }

    {
        instance: dtTileCacheLayer;
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 0, "dtTileCacheLayer.header has unexpected offset % instead of 0", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayer.header)) == 8, "dtTileCacheLayer.header has unexpected size % instead of 8", size_of(type_of(dtTileCacheLayer.header)));
        assert(((cast(*void)(*instance.regCount)) - cast(*void)(*instance)) == 8, "dtTileCacheLayer.regCount has unexpected offset % instead of 8", ((cast(*void)(*instance.regCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayer.regCount)) == 1, "dtTileCacheLayer.regCount has unexpected size % instead of 1", size_of(type_of(dtTileCacheLayer.regCount)));
        assert(((cast(*void)(*instance.heights)) - cast(*void)(*instance)) == 16, "dtTileCacheLayer.heights has unexpected offset % instead of 16", ((cast(*void)(*instance.heights)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayer.heights)) == 8, "dtTileCacheLayer.heights has unexpected size % instead of 8", size_of(type_of(dtTileCacheLayer.heights)));
        assert(((cast(*void)(*instance.areas)) - cast(*void)(*instance)) == 24, "dtTileCacheLayer.areas has unexpected offset % instead of 24", ((cast(*void)(*instance.areas)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayer.areas)) == 8, "dtTileCacheLayer.areas has unexpected size % instead of 8", size_of(type_of(dtTileCacheLayer.areas)));
        assert(((cast(*void)(*instance.cons)) - cast(*void)(*instance)) == 32, "dtTileCacheLayer.cons has unexpected offset % instead of 32", ((cast(*void)(*instance.cons)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayer.cons)) == 8, "dtTileCacheLayer.cons has unexpected size % instead of 8", size_of(type_of(dtTileCacheLayer.cons)));
        assert(((cast(*void)(*instance.regs)) - cast(*void)(*instance)) == 40, "dtTileCacheLayer.regs has unexpected offset % instead of 40", ((cast(*void)(*instance.regs)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheLayer.regs)) == 8, "dtTileCacheLayer.regs has unexpected size % instead of 8", size_of(type_of(dtTileCacheLayer.regs)));
        assert(size_of(dtTileCacheLayer) == 48, "dtTileCacheLayer has size % instead of 48", size_of(dtTileCacheLayer));
    }

    {
        instance: dtTileCacheContour;
        assert(((cast(*void)(*instance.nverts)) - cast(*void)(*instance)) == 0, "dtTileCacheContour.nverts has unexpected offset % instead of 0", ((cast(*void)(*instance.nverts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheContour.nverts)) == 4, "dtTileCacheContour.nverts has unexpected size % instead of 4", size_of(type_of(dtTileCacheContour.nverts)));
        assert(((cast(*void)(*instance.verts)) - cast(*void)(*instance)) == 8, "dtTileCacheContour.verts has unexpected offset % instead of 8", ((cast(*void)(*instance.verts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheContour.verts)) == 8, "dtTileCacheContour.verts has unexpected size % instead of 8", size_of(type_of(dtTileCacheContour.verts)));
        assert(((cast(*void)(*instance.reg)) - cast(*void)(*instance)) == 16, "dtTileCacheContour.reg has unexpected offset % instead of 16", ((cast(*void)(*instance.reg)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheContour.reg)) == 1, "dtTileCacheContour.reg has unexpected size % instead of 1", size_of(type_of(dtTileCacheContour.reg)));
        assert(((cast(*void)(*instance.area)) - cast(*void)(*instance)) == 17, "dtTileCacheContour.area has unexpected offset % instead of 17", ((cast(*void)(*instance.area)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheContour.area)) == 1, "dtTileCacheContour.area has unexpected size % instead of 1", size_of(type_of(dtTileCacheContour.area)));
        assert(size_of(dtTileCacheContour) == 24, "dtTileCacheContour has size % instead of 24", size_of(dtTileCacheContour));
    }

    {
        instance: dtTileCacheContourSet;
        assert(((cast(*void)(*instance.nconts)) - cast(*void)(*instance)) == 0, "dtTileCacheContourSet.nconts has unexpected offset % instead of 0", ((cast(*void)(*instance.nconts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheContourSet.nconts)) == 4, "dtTileCacheContourSet.nconts has unexpected size % instead of 4", size_of(type_of(dtTileCacheContourSet.nconts)));
        assert(((cast(*void)(*instance.conts)) - cast(*void)(*instance)) == 8, "dtTileCacheContourSet.conts has unexpected offset % instead of 8", ((cast(*void)(*instance.conts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCacheContourSet.conts)) == 8, "dtTileCacheContourSet.conts has unexpected size % instead of 8", size_of(type_of(dtTileCacheContourSet.conts)));
        assert(size_of(dtTileCacheContourSet) == 16, "dtTileCacheContourSet has size % instead of 16", size_of(dtTileCacheContourSet));
    }

    {
        instance: dtTileCachePolyMesh;
        assert(((cast(*void)(*instance.nvp)) - cast(*void)(*instance)) == 0, "dtTileCachePolyMesh.nvp has unexpected offset % instead of 0", ((cast(*void)(*instance.nvp)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCachePolyMesh.nvp)) == 4, "dtTileCachePolyMesh.nvp has unexpected size % instead of 4", size_of(type_of(dtTileCachePolyMesh.nvp)));
        assert(((cast(*void)(*instance.nverts)) - cast(*void)(*instance)) == 4, "dtTileCachePolyMesh.nverts has unexpected offset % instead of 4", ((cast(*void)(*instance.nverts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCachePolyMesh.nverts)) == 4, "dtTileCachePolyMesh.nverts has unexpected size % instead of 4", size_of(type_of(dtTileCachePolyMesh.nverts)));
        assert(((cast(*void)(*instance.npolys)) - cast(*void)(*instance)) == 8, "dtTileCachePolyMesh.npolys has unexpected offset % instead of 8", ((cast(*void)(*instance.npolys)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCachePolyMesh.npolys)) == 4, "dtTileCachePolyMesh.npolys has unexpected size % instead of 4", size_of(type_of(dtTileCachePolyMesh.npolys)));
        assert(((cast(*void)(*instance.verts)) - cast(*void)(*instance)) == 16, "dtTileCachePolyMesh.verts has unexpected offset % instead of 16", ((cast(*void)(*instance.verts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCachePolyMesh.verts)) == 8, "dtTileCachePolyMesh.verts has unexpected size % instead of 8", size_of(type_of(dtTileCachePolyMesh.verts)));
        assert(((cast(*void)(*instance.polys)) - cast(*void)(*instance)) == 24, "dtTileCachePolyMesh.polys has unexpected offset % instead of 24", ((cast(*void)(*instance.polys)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCachePolyMesh.polys)) == 8, "dtTileCachePolyMesh.polys has unexpected size % instead of 8", size_of(type_of(dtTileCachePolyMesh.polys)));
        assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 32, "dtTileCachePolyMesh.flags has unexpected offset % instead of 32", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCachePolyMesh.flags)) == 8, "dtTileCachePolyMesh.flags has unexpected size % instead of 8", size_of(type_of(dtTileCachePolyMesh.flags)));
        assert(((cast(*void)(*instance.areas)) - cast(*void)(*instance)) == 40, "dtTileCachePolyMesh.areas has unexpected offset % instead of 40", ((cast(*void)(*instance.areas)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtTileCachePolyMesh.areas)) == 8, "dtTileCachePolyMesh.areas has unexpected size % instead of 8", size_of(type_of(dtTileCachePolyMesh.areas)));
        assert(size_of(dtTileCachePolyMesh) == 48, "dtTileCachePolyMesh has size % instead of 48", size_of(dtTileCachePolyMesh));
    }

    assert(size_of(dtTileCacheAlloc) == 8, "dtTileCacheAlloc has size % instead of 8", size_of(dtTileCacheAlloc));

    assert(size_of(dtTileCacheCompressor) == 8, "dtTileCacheCompressor has size % instead of 8", size_of(dtTileCacheCompressor));
}

