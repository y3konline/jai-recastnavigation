//
// This file was auto-generated using the following command:
//
// jai ./generate.jai - -compile
//



// Some math headers don't have PI defined.
DU_PI: float : 3.141593;

duDebugDrawPrimitives :: enum s32 {
    POINTS :: 0;
    LINES  :: 1;
    TRIS   :: 2;
    QUADS  :: 3;

    DU_DRAW_POINTS :: POINTS;
    DU_DRAW_LINES  :: LINES;
    DU_DRAW_TRIS   :: TRIS;
    DU_DRAW_QUADS  :: QUADS;
}

/// Abstract debug draw interface.
duDebugDraw :: struct {
    vtable: *duDebugDraw_VTable;

    // Virtual functions:
    // Normally you should call them via the vtable.
    // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
    // or need to create a vtable yourself.
    virtual_Destructor :: (this: *duDebugDraw, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign lib/windows/debugutils "??1duDebugDraw@@UEAA@XZ";

    /// Compute a color for given area.
    virtual_areaToCol :: (this: *duDebugDraw, area: u32) -> u32 #cpp_method #foreign lib/windows/debugutils "?areaToCol@duDebugDraw@@UEAAII@Z";
}
duDebugDraw_VTable :: struct #type_info_none {
    Destructor: (this: *duDebugDraw, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

    depthMask: (this: *duDebugDraw, state: bool) -> void #cpp_method;

    texture: (this: *duDebugDraw, state: bool) -> void #cpp_method;

    begin: (this: *duDebugDraw, prim: duDebugDrawPrimitives, size: float = 1.0) -> void #cpp_method;

    vertex: (this: *duDebugDraw, x: float, y: float, z: float, color: u32, u: float, v: float) -> void #cpp_method;

    vertex_1: (this: *duDebugDraw, pos: /*const*/ *float, color: u32, uv: /*const*/ *float) -> void #cpp_method;

    vertex_2: (this: *duDebugDraw, x: /*const*/ float, y: /*const*/ float, z: /*const*/ float, color: u32) -> void #cpp_method;

    vertex_3: (this: *duDebugDraw, pos: /*const*/ *float, color: u32) -> void #cpp_method;

    end: (this: *duDebugDraw) -> void #cpp_method;

    areaToCol: (this: *duDebugDraw, area: u32) -> u32 #cpp_method;
}

duDebugDraw_Destructor :: inline (this: *duDebugDraw, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

duDebugDraw_depthMask :: inline (this: *duDebugDraw, state: bool) { this.vtable.depthMask(this, state); }

duDebugDraw_texture :: inline (this: *duDebugDraw, state: bool) { this.vtable.texture(this, state); }

duDebugDraw_begin :: inline (this: *duDebugDraw, prim: duDebugDrawPrimitives, size: float = 1.0) { this.vtable.begin(this, prim, size); }

duDebugDraw_vertex :: inline (this: *duDebugDraw, x: /*const*/ float, y: /*const*/ float, z: /*const*/ float, color: u32, u: /*const*/ float, v: /*const*/ float) { this.vtable.vertex(this, x, y, z, color, u, v); }

duDebugDraw_vertex_1 :: inline (this: *duDebugDraw, pos: /*const*/ *float, color: u32, uv: /*const*/ *float) { this.vtable.vertex_1(this, pos, color, uv); }

duDebugDraw_vertex_2 :: inline (this: *duDebugDraw, x: /*const*/ float, y: /*const*/ float, z: /*const*/ float, color: u32) { this.vtable.vertex_2(this, x, y, z, color); }

duDebugDraw_vertex_3 :: inline (this: *duDebugDraw, pos: /*const*/ *float, color: u32) { this.vtable.vertex_3(this, pos, color); }

duDebugDraw_end :: inline (this: *duDebugDraw) { this.vtable.end(this); }

duDebugDraw_areaToCol :: inline (this: *duDebugDraw, area: u32) -> u32 { return this.vtable.areaToCol(this, area); }

vtable :: (obj: *duDebugDraw) -> *duDebugDraw_VTable { return obj.vtable; }


duRGBA :: (r: s32, g: s32, b: s32, a: s32) -> u32 #foreign lib/windows/debugutils "?duRGBA@@YAIHHHH@Z";

duRGBAf :: (fr: float, fg: float, fb: float, fa: float) -> u32 #foreign lib/windows/debugutils "?duRGBAf@@YAIMMMM@Z";

duIntToCol :: (i: s32, a: s32) -> u32 #foreign lib/windows/debugutils "?duIntToCol@@YAIHH@Z";
duIntToCol :: (i: s32, col: *float) -> void #foreign lib/windows/debugutils "?duIntToCol@@YAXHPEAM@Z";

duMultCol :: (col: u32, d: u32) -> u32 #foreign lib/windows/debugutils "?duMultCol@@YAIII@Z";

duDarkenCol :: (col: u32) -> u32 #foreign lib/windows/debugutils "?duDarkenCol@@YAII@Z";

duLerpCol :: (ca: u32, cb: u32, u: u32) -> u32 #foreign lib/windows/debugutils "?duLerpCol@@YAIIII@Z";

duTransCol :: (c: u32, a: u32) -> u32 #foreign lib/windows/debugutils "?duTransCol@@YAIII@Z";

duCalcBoxColors :: (colors: *u32, colTop: u32, colSide: u32) -> void #foreign lib/windows/debugutils "?duCalcBoxColors@@YAXPEAIII@Z";

duDebugDrawCylinderWire :: (dd: *duDebugDraw, minx: float, miny: float, minz: float, maxx: float, maxy: float, maxz: float, col: u32, lineWidth: float) -> void #foreign lib/windows/debugutils "?duDebugDrawCylinderWire@@YAXPEAUduDebugDraw@@MMMMMMIM@Z";

duDebugDrawBoxWire :: (dd: *duDebugDraw, minx: float, miny: float, minz: float, maxx: float, maxy: float, maxz: float, col: u32, lineWidth: float) -> void #foreign lib/windows/debugutils "?duDebugDrawBoxWire@@YAXPEAUduDebugDraw@@MMMMMMIM@Z";

duDebugDrawArc :: (dd: *duDebugDraw, x0: float, y0: float, z0: float, x1: float, y1: float, z1: float, h: float, as0: float, as1: float, col: u32, lineWidth: float) -> void #foreign lib/windows/debugutils "?duDebugDrawArc@@YAXPEAUduDebugDraw@@MMMMMMMMMIM@Z";

duDebugDrawArrow :: (dd: *duDebugDraw, x0: float, y0: float, z0: float, x1: float, y1: float, z1: float, as0: float, as1: float, col: u32, lineWidth: float) -> void #foreign lib/windows/debugutils "?duDebugDrawArrow@@YAXPEAUduDebugDraw@@MMMMMMMMIM@Z";

duDebugDrawCircle :: (dd: *duDebugDraw, x: float, y: float, z: float, r: float, col: u32, lineWidth: float) -> void #foreign lib/windows/debugutils "?duDebugDrawCircle@@YAXPEAUduDebugDraw@@MMMMIM@Z";

duDebugDrawCross :: (dd: *duDebugDraw, x: float, y: float, z: float, size: float, col: u32, lineWidth: float) -> void #foreign lib/windows/debugutils "?duDebugDrawCross@@YAXPEAUduDebugDraw@@MMMMIM@Z";

duDebugDrawBox :: (dd: *duDebugDraw, minx: float, miny: float, minz: float, maxx: float, maxy: float, maxz: float, fcol: *u32) -> void #foreign lib/windows/debugutils "?duDebugDrawBox@@YAXPEAUduDebugDraw@@MMMMMMPEBI@Z";

duDebugDrawCylinder :: (dd: *duDebugDraw, minx: float, miny: float, minz: float, maxx: float, maxy: float, maxz: float, col: u32) -> void #foreign lib/windows/debugutils "?duDebugDrawCylinder@@YAXPEAUduDebugDraw@@MMMMMMI@Z";

duDebugDrawGridXZ :: (dd: *duDebugDraw, ox: float, oy: float, oz: float, w: s32, h: s32, size: float, col: u32, lineWidth: float) -> void #foreign lib/windows/debugutils "?duDebugDrawGridXZ@@YAXPEAUduDebugDraw@@MMMHHMIM@Z";

// Versions without begin/end, can be used to draw multiple primitives.
duAppendCylinderWire :: (dd: *duDebugDraw, minx: float, miny: float, minz: float, maxx: float, maxy: float, maxz: float, col: u32) -> void #foreign lib/windows/debugutils "?duAppendCylinderWire@@YAXPEAUduDebugDraw@@MMMMMMI@Z";

duAppendBoxWire :: (dd: *duDebugDraw, minx: float, miny: float, minz: float, maxx: float, maxy: float, maxz: float, col: u32) -> void #foreign lib/windows/debugutils "?duAppendBoxWire@@YAXPEAUduDebugDraw@@MMMMMMI@Z";

duAppendBoxPoints :: (dd: *duDebugDraw, minx: float, miny: float, minz: float, maxx: float, maxy: float, maxz: float, col: u32) -> void #foreign lib/windows/debugutils "?duAppendBoxPoints@@YAXPEAUduDebugDraw@@MMMMMMI@Z";

duAppendArc :: (dd: *duDebugDraw, x0: float, y0: float, z0: float, x1: float, y1: float, z1: float, h: float, as0: float, as1: float, col: u32) -> void #foreign lib/windows/debugutils "?duAppendArc@@YAXPEAUduDebugDraw@@MMMMMMMMMI@Z";

duAppendArrow :: (dd: *duDebugDraw, x0: float, y0: float, z0: float, x1: float, y1: float, z1: float, as0: float, as1: float, col: u32) -> void #foreign lib/windows/debugutils "?duAppendArrow@@YAXPEAUduDebugDraw@@MMMMMMMMI@Z";

duAppendCircle :: (dd: *duDebugDraw, x: float, y: float, z: float, r: float, col: u32) -> void #foreign lib/windows/debugutils "?duAppendCircle@@YAXPEAUduDebugDraw@@MMMMI@Z";

duAppendCross :: (dd: *duDebugDraw, x: float, y: float, z: float, size: float, col: u32) -> void #foreign lib/windows/debugutils "?duAppendCross@@YAXPEAUduDebugDraw@@MMMMI@Z";

duAppendBox :: (dd: *duDebugDraw, minx: float, miny: float, minz: float, maxx: float, maxy: float, maxz: float, fcol: *u32) -> void #foreign lib/windows/debugutils "?duAppendBox@@YAXPEAUduDebugDraw@@MMMMMMPEBI@Z";

duAppendCylinder :: (dd: *duDebugDraw, minx: float, miny: float, minz: float, maxx: float, maxy: float, maxz: float, col: u32) -> void #foreign lib/windows/debugutils "?duAppendCylinder@@YAXPEAUduDebugDraw@@MMMMMMI@Z";

duDisplayList :: struct {
    #as using dudebugdraw: duDebugDraw;

    m_pos:       *float;
    m_color:     *u32;
    m_size:      s32;
    m_cap:       s32;

    m_prim:      duDebugDrawPrimitives;
    m_primSize:  float;
    m_depthMask: bool;

    resize :: (this: *duDisplayList, cap: s32) -> void #cpp_method #foreign lib/windows/debugutils "?resize@duDisplayList@@AEAAXH@Z";

    Constructor :: (this: *duDisplayList, cap: s32 = 512) -> void #cpp_method #foreign lib/windows/debugutils "??0duDisplayList@@QEAA@H@Z";

    clear :: (this: *duDisplayList) -> void #cpp_method #foreign lib/windows/debugutils "?clear@duDisplayList@@QEAAXXZ";
    draw :: (this: *duDisplayList, dd: *duDebugDraw) -> void #cpp_method #foreign lib/windows/debugutils "?draw@duDisplayList@@QEAAXPEAUduDebugDraw@@@Z";

    // Virtual functions:
    // Normally you should call them via the vtable.
    // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
    // or need to create a vtable yourself.

    virtual_Destructor :: (this: *duDisplayList, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign lib/windows/debugutils "??1duDisplayList@@UEAA@XZ";
    virtual_depthMask :: (this: *duDisplayList, state: bool) -> void #cpp_method #foreign lib/windows/debugutils "?depthMask@duDisplayList@@UEAAX_N@Z";
    virtual_begin :: (this: *duDisplayList, prim: duDebugDrawPrimitives, size: float = 1.0) -> void #cpp_method #foreign lib/windows/debugutils "?begin@duDisplayList@@UEAAXW4duDebugDrawPrimitives@@M@Z";
    virtual_vertex :: (this: *duDisplayList, x: float, y: float, z: float, color: u32) -> void #cpp_method #foreign lib/windows/debugutils "?vertex@duDisplayList@@UEAAXMMMI@Z";
    virtual_vertex :: (this: *duDisplayList, pos: *float, color: u32) -> void #cpp_method #foreign lib/windows/debugutils "?vertex@duDisplayList@@UEAAXPEBMI@Z";
    virtual_end :: (this: *duDisplayList) -> void #cpp_method #foreign lib/windows/debugutils "?end@duDisplayList@@UEAAXXZ";
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
dtAllocSetCustom :: (allocFunc: dtAllocFunc, freeFunc: dtFreeFunc) -> void #foreign lib/windows/debugutils "?dtAllocSetCustom@@YAXP6APEAX_KW4dtAllocHint@@@ZP6AXPEAX@Z@Z";

/// Allocates a memory block.
///  @param[in]		size	The size, in bytes of memory, to allocate.
///  @param[in]		hint	A hint to the allocator on how long the memory is expected to be in use.
///  @return A pointer to the beginning of the allocated memory block, or null if the allocation failed.
/// @see dtFree
dtAlloc :: (size: u64, hint: dtAllocHint) -> *void #foreign lib/windows/debugutils "?dtAlloc@@YAPEAX_KW4dtAllocHint@@@Z";

/// Deallocates a memory block.
///  @param[in]		ptr		A pointer to a memory block previously allocated using #dtAlloc.
/// @see dtAlloc
dtFree :: (ptr: *void) -> void #foreign lib/windows/debugutils "?dtFree@@YAXPEAX@Z";

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
dtStatusSucceed :: (status: dtStatus) -> bool #foreign lib/windows/debugutils "?dtStatusSucceed@@YA_NI@Z";

// Returns true of status is failure.
dtStatusFailed :: (status: dtStatus) -> bool #foreign lib/windows/debugutils "?dtStatusFailed@@YA_NI@Z";

// Returns true of status is in progress.
dtStatusInProgress :: (status: dtStatus) -> bool #foreign lib/windows/debugutils "?dtStatusInProgress@@YA_NI@Z";

// Returns true if specific detail is set.
dtStatusDetail :: (status: dtStatus, detail: u32) -> bool #foreign lib/windows/debugutils "?dtStatusDetail@@YA_NII@Z";

dtPolyRef :: u32;

dtTileRef :: u32;

/// The maximum number of vertices per navigation polygon.
/// @ingroup detour
DT_VERTS_PER_POLYGON: s32 : 6;

/// A magic number used to detect compatibility of navigation tile data.
DT_NAVMESH_MAGIC: s32 : 68 << 24 | 78 << 16 | 65 << 8 | 86;

/// A version number used to detect compatibility of navigation tile data.
DT_NAVMESH_VERSION: s32 : 7;

/// A magic number used to detect the compatibility of navigation tile states.
DT_NAVMESH_STATE_MAGIC: s32 : 68 << 24 | 78 << 16 | 77 << 8 | 83;

/// A version number used to detect compatibility of navigation tile states.
DT_NAVMESH_STATE_VERSION: s32 : 1;

/// A flag that indicates that an entity links to an external entity.
/// (E.g. A polygon edge is a portal that links to another polygon.)
DT_EXT_LINK: u16 : 32768;

/// A value that indicates the entity does not link to anything.
DT_NULL_LINK: u32 : 4294967295;

/// A flag that indicates that an off-mesh connection can be traversed in both directions. (Is bidirectional.)
DT_OFFMESH_CON_BIDIR: u32 : 1;

/// The maximum number of user defined area ids.
/// @ingroup detour
DT_MAX_AREAS: s32 : 64;

/// Tile flags used for various functions and fields.
/// For an example, see dtNavMesh::addTile().
dtTileFlags :: enum s32 {
    DT_TILE_FREE_DATA :: 1;
}

/// Vertex flags returned by dtNavMeshQuery::findStraightPath.
dtStraightPathFlags :: enum s32 {
    START              :: 1;
    END                :: 2;
    OFFMESH_CONNECTION :: 4;

    DT_STRAIGHTPATH_START              :: START;
    DT_STRAIGHTPATH_END                :: END;
    DT_STRAIGHTPATH_OFFMESH_CONNECTION :: OFFMESH_CONNECTION;
}

/// Options for dtNavMeshQuery::findStraightPath.
dtStraightPathOptions :: enum s32 {
    AREA_CROSSINGS :: 1;
    ALL_CROSSINGS  :: 2;

    DT_STRAIGHTPATH_AREA_CROSSINGS :: AREA_CROSSINGS;
    DT_STRAIGHTPATH_ALL_CROSSINGS  :: ALL_CROSSINGS;
}

/// Options for dtNavMeshQuery::initSlicedFindPath and updateSlicedFindPath
dtFindPathOptions :: enum s32 {
    DT_FINDPATH_ANY_ANGLE :: 2;
}

/// Options for dtNavMeshQuery::raycast
dtRaycastOptions :: enum s32 {
    DT_RAYCAST_USE_COSTS :: 1;
}

dtDetailTriEdgeFlags :: enum s32 {
    DT_DETAIL_EDGE_BOUNDARY :: 1;
}

/// Limit raycasting during any angle pahfinding
/// The limit is given as a multiple of the character radius
DT_RAY_CAST_LIMIT_PROPORTIONS: float : 50.0;

/// Flags representing the type of a navigation mesh polygon.
dtPolyTypes :: enum s32 {
    GROUND             :: 0;

    OFFMESH_CONNECTION :: 1;

    DT_POLYTYPE_GROUND             :: GROUND;

    DT_POLYTYPE_OFFMESH_CONNECTION :: OFFMESH_CONNECTION;
}

/// Defines a polygon within a dtMeshTile object.
/// @ingroup detour
dtPoly :: struct {
    /// Index to first link in linked list. (Or #DT_NULL_LINK if there is no link.)
    firstLink:   u32;

    /// The indices of the polygon's vertices.
    /// The actual vertices are located in dtMeshTile::verts.
    verts:       [6] u16;

    /// Packed data representing neighbor polygons references and flags for each edge.
    neis:        [6] u16;

    /// The user defined polygon flags.
    flags:       u16;

    /// The number of vertices in the polygon.
    vertCount:   u8;

    /// The bit packed area id and polygon type.
    /// @note Use the structure's set and get methods to access this value.
    areaAndtype: u8;
}

/// Defines the location of detail sub-mesh data within a dtMeshTile.
dtPolyDetail :: struct {
    vertBase:  u32; ///< The offset of the vertices in the dtMeshTile::detailVerts array.
    triBase:   u32; ///< The offset of the triangles in the dtMeshTile::detailTris array.
    vertCount: u8; ///< The number of vertices in the sub-mesh.
    triCount:  u8; ///< The number of triangles in the sub-mesh.
}

/// Defines a link between polygons.
/// @note This structure is rarely if ever used by the end user.
/// @see dtMeshTile
dtLink :: struct {
    ref:  dtPolyRef; ///< Neighbour reference. (The neighbor that is linked to.)
    next: u32; ///< Index of the next link.
    edge: u8; ///< Index of the polygon edge that owns this link.
    side: u8; ///< If a boundary link, defines on which side the link is.
    bmin: u8; ///< If a boundary link, defines the minimum sub-edge area.
    bmax: u8; ///< If a boundary link, defines the maximum sub-edge area.
}

/// Bounding volume node.
/// @note This structure is rarely if ever used by the end user.
/// @see dtMeshTile
dtBVNode :: struct {
    bmin: [3] u16; ///< Minimum bounds of the node's AABB. [(x, y, z)]
    bmax: [3] u16; ///< Maximum bounds of the node's AABB. [(x, y, z)]
    i:    s32; ///< The node's index. (Negative for escape sequence.)
}

/// Defines an navigation mesh off-mesh connection within a dtMeshTile object.
/// An off-mesh connection is a user defined traversable connection made up to two vertices.
dtOffMeshConnection :: struct {
    /// The endpoints of the connection. [(ax, ay, az, bx, by, bz)]
    pos:    [6] float;

    /// The radius of the endpoints. [Limit: >= 0]
    rad:    float;

    /// The polygon reference of the connection within the tile.
    poly:   u16;

    /// Link flags.
    /// @note These are not the connection's user defined flags. Those are assigned via the
    /// connection's dtPoly definition. These are link flags used for internal purposes.
    flags:  u8;

    /// End point side.
    side:   u8;

    /// The id of the offmesh connection. (User assigned when the navigation mesh is built.)
    userId: u32;
}

/// Provides high level information related to a dtMeshTile object.
/// @ingroup detour
dtMeshHeader :: struct {
    magic:           s32; ///< Tile magic number. (Used to identify the data format.)
    version:         s32; ///< Tile data format version number.
    x:               s32; ///< The x-position of the tile within the dtNavMesh tile grid. (x, y, layer)
    y:               s32; ///< The y-position of the tile within the dtNavMesh tile grid. (x, y, layer)
    layer:           s32; ///< The layer of the tile within the dtNavMesh tile grid. (x, y, layer)
    userId:          u32; ///< The user defined id of the tile.
    polyCount:       s32; ///< The number of polygons in the tile.
    vertCount:       s32; ///< The number of vertices in the tile.
    maxLinkCount:    s32; ///< The number of allocated links.
    detailMeshCount: s32; ///< The number of sub-meshes in the detail mesh.

    /// The number of unique vertices in the detail mesh. (In addition to the polygon vertices.)
    detailVertCount: s32;

    detailTriCount:  s32; ///< The number of triangles in the detail mesh.
    bvNodeCount:     s32; ///< The number of bounding volume nodes. (Zero if bounding volumes are disabled.)
    offMeshConCount: s32; ///< The number of off-mesh connections.
    offMeshBase:     s32; ///< The index of the first polygon which is an off-mesh connection.
    walkableHeight:  float; ///< The height of the agents using the tile.
    walkableRadius:  float; ///< The radius of the agents using the tile.
    walkableClimb:   float; ///< The maximum climb height of the agents using the tile.
    bmin:            [3] float; ///< The minimum bounds of the tile's AABB. [(x, y, z)]
    bmax:            [3] float; ///< The maximum bounds of the tile's AABB. [(x, y, z)]

    /// The bounding volume quantization factor.
    bvQuantFactor:   float;
}

/// Defines a navigation mesh tile.
/// @ingroup detour
dtMeshTile :: struct {
    salt:          u32; ///< Counter describing modifications to the tile.

    linksFreeList: u32; ///< Index to the next free link.
    header:        *dtMeshHeader; ///< The tile header.
    polys:         *dtPoly; ///< The tile polygons. [Size: dtMeshHeader::polyCount]
    verts:         *float; ///< The tile vertices. [(x, y, z) * dtMeshHeader::vertCount]
    links:         *dtLink; ///< The tile links. [Size: dtMeshHeader::maxLinkCount]
    detailMeshes:  *dtPolyDetail; ///< The tile's detail sub-meshes. [Size: dtMeshHeader::detailMeshCount]

    /// The detail mesh's unique vertices. [(x, y, z) * dtMeshHeader::detailVertCount]
    detailVerts:   *float;

    /// The detail mesh's triangles. [(vertA, vertB, vertC, triFlags) * dtMeshHeader::detailTriCount].
    /// See dtDetailTriEdgeFlags and dtGetDetailTriEdgeFlags.
    detailTris:    *u8;

    /// The tile bounding volume nodes. [Size: dtMeshHeader::bvNodeCount]
    /// (Will be null if bounding volumes are disabled.)
    bvTree:        *dtBVNode;

    offMeshCons:   *dtOffMeshConnection; ///< The tile off-mesh connections. [Size: dtMeshHeader::offMeshConCount]

    data:          *u8; ///< The tile data. (Not directly accessed under normal situations.)
    dataSize:      s32; ///< Size of the tile data.
    flags:         s32; ///< Tile flags. (See: #dtTileFlags)
    next:          *dtMeshTile; ///< The next free tile, or the next tile in the spatial grid.
}

/// Configuration parameters used to define multi-tile navigation meshes.
/// The values are used to allocate space during the initialization of a navigation mesh.
/// @see dtNavMesh::init()
/// @ingroup detour
dtNavMeshParams :: struct {
    orig:       [3] float; ///< The world space origin of the navigation mesh's tile space. [(x, y, z)]
    tileWidth:  float; ///< The width of each tile. (Along the x-axis.)
    tileHeight: float; ///< The height of each tile. (Along the z-axis.)
    maxTiles:   s32; ///< The maximum number of tiles the navigation mesh can contain. This and maxPolys are used to calculate how many bits are needed to identify tiles and polygons uniquely.
    maxPolys:   s32; ///< The maximum number of polygons each tile can contain. This and maxTiles are used to calculate how many bits are needed to identify tiles and polygons uniquely.
}

/// A navigation mesh based on tiles of convex polygons.
/// @ingroup detour
dtNavMesh :: struct {
    Constructor :: (this: *dtNavMesh) -> void #cpp_method #foreign lib/windows/debugutils "??0dtNavMesh@@QEAA@XZ";
    Destructor :: (this: *dtNavMesh) -> void #cpp_method #foreign lib/windows/debugutils "??1dtNavMesh@@QEAA@XZ";

    /// Initializes the navigation mesh for tiled use.
    ///  @param[in]	params		Initialization parameters.
    /// @return The status flags for the operation.
    init :: (this: *dtNavMesh, params: *dtNavMeshParams) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?init@dtNavMesh@@QEAAIPEBUdtNavMeshParams@@@Z";

    /// Initializes the navigation mesh for single tile use.
    ///  @param[in]	data		Data of the new tile. (See: #dtCreateNavMeshData)
    ///  @param[in]	dataSize	The data size of the new tile.
    ///  @param[in]	flags		The tile flags. (See: #dtTileFlags)
    /// @return The status flags for the operation.
    ///  @see dtCreateNavMeshData
    init :: (this: *dtNavMesh, data: *u8, dataSize: s32, flags: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?init@dtNavMesh@@QEAAIPEAEHH@Z";

    /// The navigation mesh initialization params.
    getParams :: (this: *dtNavMesh) -> *dtNavMeshParams #cpp_method #foreign lib/windows/debugutils "?getParams@dtNavMesh@@QEBAPEBUdtNavMeshParams@@XZ";

    /// Adds a tile to the navigation mesh.
    ///  @param[in]		data		Data for the new tile mesh. (See: #dtCreateNavMeshData)
    ///  @param[in]		dataSize	Data size of the new tile mesh.
    ///  @param[in]		flags		Tile flags. (See: #dtTileFlags)
    ///  @param[in]		lastRef		The desired reference for the tile. (When reloading a tile.) [opt] [Default: 0]
    ///  @param[out]	result		The tile reference. (If the tile was succesfully added.) [opt]
    /// @return The status flags for the operation.
    addTile :: (this: *dtNavMesh, data: *u8, dataSize: s32, flags: s32, lastRef: dtTileRef, result: *dtTileRef) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?addTile@dtNavMesh@@QEAAIPEAEHHIPEAI@Z";

    /// Removes the specified tile from the navigation mesh.
    ///  @param[in]		ref			The reference of the tile to remove.
    ///  @param[out]	data		Data associated with deleted tile.
    ///  @param[out]	dataSize	Size of the data associated with deleted tile.
    /// @return The status flags for the operation.
    removeTile :: (this: *dtNavMesh, ref: dtTileRef, data: **u8, dataSize: *s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?removeTile@dtNavMesh@@QEAAIIPEAPEAEPEAH@Z";

    /// Calculates the tile grid location for the specified world position.
    ///  @param[in]	pos  The world position for the query. [(x, y, z)]
    ///  @param[out]	tx		The tile's x-location. (x, y)
    ///  @param[out]	ty		The tile's y-location. (x, y)
    calcTileLoc :: (this: *dtNavMesh, pos: *float, tx: *s32, ty: *s32) -> void #cpp_method #foreign lib/windows/debugutils "?calcTileLoc@dtNavMesh@@QEBAXPEBMPEAH1@Z";

    /// Gets the tile at the specified grid location.
    ///  @param[in]	x		The tile's x-location. (x, y, layer)
    ///  @param[in]	y		The tile's y-location. (x, y, layer)
    ///  @param[in]	layer	The tile's layer. (x, y, layer)
    /// @return The tile, or null if the tile does not exist.
    getTileAt :: (this: *dtNavMesh, x: s32, y: s32, layer: s32) -> *dtMeshTile #cpp_method #foreign lib/windows/debugutils "?getTileAt@dtNavMesh@@QEBAPEBUdtMeshTile@@HHH@Z";

    /// Gets all tiles at the specified grid location. (All layers.)
    ///  @param[in]		x			The tile's x-location. (x, y)
    ///  @param[in]		y			The tile's y-location. (x, y)
    ///  @param[out]	tiles		A pointer to an array of tiles that will hold the result.
    ///  @param[in]		maxTiles	The maximum tiles the tiles parameter can hold.
    /// @return The number of tiles returned in the tiles array.
    getTilesAt :: (this: /*const*/ *dtNavMesh, x: /*const*/ s32, y: /*const*/ s32, tiles: **dtMeshTile, maxTiles: /*const*/ s32) -> s32 #cpp_method #foreign lib/windows/debugutils "?getTilesAt@dtNavMesh@@QEBAHHHPEAPEBUdtMeshTile@@H@Z";

    /// Gets the tile reference for the tile at specified grid location.
    ///  @param[in]	x		The tile's x-location. (x, y, layer)
    ///  @param[in]	y		The tile's y-location. (x, y, layer)
    ///  @param[in]	layer	The tile's layer. (x, y, layer)
    /// @return The tile reference of the tile, or 0 if there is none.
    getTileRefAt :: (this: *dtNavMesh, x: s32, y: s32, layer: s32) -> dtTileRef #cpp_method #foreign lib/windows/debugutils "?getTileRefAt@dtNavMesh@@QEBAIHHH@Z";

    /// Gets the tile reference for the specified tile.
    ///  @param[in]	tile	The tile.
    /// @return The tile reference of the tile.
    getTileRef :: (this: *dtNavMesh, tile: *dtMeshTile) -> dtTileRef #cpp_method #foreign lib/windows/debugutils "?getTileRef@dtNavMesh@@QEBAIPEBUdtMeshTile@@@Z";

    /// Gets the tile for the specified tile reference.
    ///  @param[in]	ref		The tile reference of the tile to retrieve.
    /// @return The tile for the specified reference, or null if the
    ///		reference is invalid.
    getTileByRef :: (this: *dtNavMesh, ref: dtTileRef) -> *dtMeshTile #cpp_method #foreign lib/windows/debugutils "?getTileByRef@dtNavMesh@@QEBAPEBUdtMeshTile@@I@Z";

    /// The maximum number of tiles supported by the navigation mesh.
    /// @return The maximum number of tiles supported by the navigation mesh.
    getMaxTiles :: (this: *dtNavMesh) -> s32 #cpp_method #foreign lib/windows/debugutils "?getMaxTiles@dtNavMesh@@QEBAHXZ";

    /// Gets the tile at the specified index.
    ///  @param[in]	i		The tile index. [Limit: 0 >= index < #getMaxTiles()]
    /// @return The tile at the specified index.
    getTile :: (this: /*const*/ *dtNavMesh, i: s32) -> *dtMeshTile #cpp_method #foreign lib/windows/debugutils "?getTile@dtNavMesh@@QEBAPEBUdtMeshTile@@H@Z";

    /// Gets the tile and polygon for the specified polygon reference.
    ///  @param[in]		ref		The reference for the a polygon.
    ///  @param[out]	tile	The tile containing the polygon.
    ///  @param[out]	poly	The polygon.
    /// @return The status flags for the operation.
    getTileAndPolyByRef :: (this: *dtNavMesh, ref: dtPolyRef, tile: **dtMeshTile, poly: **dtPoly) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getTileAndPolyByRef@dtNavMesh@@QEBAIIPEAPEBUdtMeshTile@@PEAPEBUdtPoly@@@Z";

    /// Returns the tile and polygon for the specified polygon reference.
    ///  @param[in]		ref		A known valid reference for a polygon.
    ///  @param[out]	tile	The tile containing the polygon.
    ///  @param[out]	poly	The polygon.
    getTileAndPolyByRefUnsafe :: (this: *dtNavMesh, ref: dtPolyRef, tile: **dtMeshTile, poly: **dtPoly) -> void #cpp_method #foreign lib/windows/debugutils "?getTileAndPolyByRefUnsafe@dtNavMesh@@QEBAXIPEAPEBUdtMeshTile@@PEAPEBUdtPoly@@@Z";

    /// Checks the validity of a polygon reference.
    ///  @param[in]	ref		The polygon reference to check.
    /// @return True if polygon reference is valid for the navigation mesh.
    isValidPolyRef :: (this: *dtNavMesh, ref: dtPolyRef) -> bool #cpp_method #foreign lib/windows/debugutils "?isValidPolyRef@dtNavMesh@@QEBA_NI@Z";

    /// Gets the polygon reference for the tile's base polygon.
    ///  @param[in]	tile		The tile.
    /// @return The polygon reference for the base polygon in the specified tile.
    getPolyRefBase :: (this: *dtNavMesh, tile: *dtMeshTile) -> dtPolyRef #cpp_method #foreign lib/windows/debugutils "?getPolyRefBase@dtNavMesh@@QEBAIPEBUdtMeshTile@@@Z";

    /// Gets the endpoints for an off-mesh connection, ordered by "direction of travel".
    ///  @param[in]		prevRef		The reference of the polygon before the connection.
    ///  @param[in]		polyRef		The reference of the off-mesh connection polygon.
    ///  @param[out]	startPos	The start position of the off-mesh connection. [(x, y, z)]
    ///  @param[out]	endPos		The end position of the off-mesh connection. [(x, y, z)]
    /// @return The status flags for the operation.
    getOffMeshConnectionPolyEndPoints :: (this: *dtNavMesh, prevRef: dtPolyRef, polyRef: dtPolyRef, startPos: *float, endPos: *float) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getOffMeshConnectionPolyEndPoints@dtNavMesh@@QEBAIIIPEAM0@Z";

    /// Gets the specified off-mesh connection.
    ///  @param[in]	ref		The polygon reference of the off-mesh connection.
    /// @return The specified off-mesh connection, or null if the polygon reference is not valid.
    getOffMeshConnectionByRef :: (this: *dtNavMesh, ref: dtPolyRef) -> *dtOffMeshConnection #cpp_method #foreign lib/windows/debugutils "?getOffMeshConnectionByRef@dtNavMesh@@QEBAPEBUdtOffMeshConnection@@I@Z";

    /// Sets the user defined flags for the specified polygon.
    ///  @param[in]	ref		The polygon reference.
    ///  @param[in]	flags	The new flags for the polygon.
    /// @return The status flags for the operation.
    setPolyFlags :: (this: *dtNavMesh, ref: dtPolyRef, flags: u16) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?setPolyFlags@dtNavMesh@@QEAAIIG@Z";

    /// Gets the user defined flags for the specified polygon.
    ///  @param[in]		ref				The polygon reference.
    ///  @param[out]	resultFlags		The polygon flags.
    /// @return The status flags for the operation.
    getPolyFlags :: (this: *dtNavMesh, ref: dtPolyRef, resultFlags: *u16) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getPolyFlags@dtNavMesh@@QEBAIIPEAG@Z";

    /// Sets the user defined area for the specified polygon.
    ///  @param[in]	ref		The polygon reference.
    ///  @param[in]	area	The new area id for the polygon. [Limit: < #DT_MAX_AREAS]
    /// @return The status flags for the operation.
    setPolyArea :: (this: *dtNavMesh, ref: dtPolyRef, area: u8) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?setPolyArea@dtNavMesh@@QEAAIIE@Z";

    /// Gets the user defined area for the specified polygon.
    ///  @param[in]		ref			The polygon reference.
    ///  @param[out]	resultArea	The area id for the polygon.
    /// @return The status flags for the operation.
    getPolyArea :: (this: *dtNavMesh, ref: dtPolyRef, resultArea: *u8) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getPolyArea@dtNavMesh@@QEBAIIPEAE@Z";

    /// Gets the size of the buffer required by #storeTileState to store the specified tile's state.
    ///  @param[in]	tile	The tile.
    /// @return The size of the buffer required to store the state.
    getTileStateSize :: (this: *dtNavMesh, tile: *dtMeshTile) -> s32 #cpp_method #foreign lib/windows/debugutils "?getTileStateSize@dtNavMesh@@QEBAHPEBUdtMeshTile@@@Z";

    /// Stores the non-structural state of the tile in the specified buffer. (Flags, area ids, etc.)
    ///  @param[in]		tile			The tile.
    ///  @param[out]	data			The buffer to store the tile's state in.
    ///  @param[in]		maxDataSize		The size of the data buffer. [Limit: >= #getTileStateSize]
    /// @return The status flags for the operation.
    storeTileState :: (this: *dtNavMesh, tile: *dtMeshTile, data: *u8, maxDataSize: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?storeTileState@dtNavMesh@@QEBAIPEBUdtMeshTile@@PEAEH@Z";

    /// Restores the state of the tile.
    ///  @param[in]	tile			The tile.
    ///  @param[in]	data			The new state. (Obtained from #storeTileState.)
    ///  @param[in]	maxDataSize		The size of the state within the data buffer.
    /// @return The status flags for the operation.
    restoreTileState :: (this: *dtNavMesh, tile: *dtMeshTile, data: *u8, maxDataSize: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?restoreTileState@dtNavMesh@@QEAAIPEAUdtMeshTile@@PEBEH@Z";

    /// Derives a standard polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	salt	The tile's salt value.
    ///  @param[in]	it		The index of the tile.
    ///  @param[in]	ip		The index of the polygon within the tile.
    encodePolyId :: (this: *dtNavMesh, salt: u32, it: u32, ip: u32) -> dtPolyRef #cpp_method #foreign lib/windows/debugutils "?encodePolyId@dtNavMesh@@QEBAIIII@Z";

    /// Decodes a standard polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref   The polygon reference to decode.
    ///  @param[out]	salt	The tile's salt value.
    ///  @param[out]	it		The index of the tile.
    ///  @param[out]	ip		The index of the polygon within the tile.
    ///  @see #encodePolyId
    decodePolyId :: (this: *dtNavMesh, ref: dtPolyRef, salt: *u32, it: *u32, ip: *u32) -> void #cpp_method #foreign lib/windows/debugutils "?decodePolyId@dtNavMesh@@QEBAXIAEAI00@Z";

    /// Extracts a tile's salt value from the specified polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref		The polygon reference.
    ///  @see #encodePolyId
    decodePolyIdSalt :: (this: *dtNavMesh, ref: dtPolyRef) -> u32 #cpp_method #foreign lib/windows/debugutils "?decodePolyIdSalt@dtNavMesh@@QEBAII@Z";

    /// Extracts the tile's index from the specified polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref		The polygon reference.
    ///  @see #encodePolyId
    decodePolyIdTile :: (this: *dtNavMesh, ref: dtPolyRef) -> u32 #cpp_method #foreign lib/windows/debugutils "?decodePolyIdTile@dtNavMesh@@QEBAII@Z";

    /// Extracts the polygon's index (within its tile) from the specified polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref		The polygon reference.
    ///  @see #encodePolyId
    decodePolyIdPoly :: (this: *dtNavMesh, ref: dtPolyRef) -> u32 #cpp_method #foreign lib/windows/debugutils "?decodePolyIdPoly@dtNavMesh@@QEBAII@Z";

    /// Returns pointer to tile in the tile array.
    getTile_1 :: (this: *dtNavMesh, i: s32) -> *dtMeshTile #cpp_method #foreign lib/windows/debugutils "?getTile@dtNavMesh@@AEAAPEAUdtMeshTile@@H@Z";

    /// Returns neighbour tile based on side.
    getTilesAt_1 :: (this: /*const*/ *dtNavMesh, x: /*const*/ s32, y: /*const*/ s32, tiles: **dtMeshTile, maxTiles: /*const*/ s32) -> s32 #cpp_method #foreign lib/windows/debugutils "?getTilesAt@dtNavMesh@@AEBAHHHPEAPEAUdtMeshTile@@H@Z";

    /// Returns neighbour tile based on side.
    getNeighbourTilesAt :: (this: *dtNavMesh, x: s32, y: s32, side: s32, tiles: **dtMeshTile, maxTiles: s32) -> s32 #cpp_method #foreign lib/windows/debugutils "?getNeighbourTilesAt@dtNavMesh@@AEBAHHHHPEAPEAUdtMeshTile@@H@Z";

    /// Returns all polygons in neighbour tile based on portal defined by the segment.
    findConnectingPolys :: (this: *dtNavMesh, va: *float, vb: *float, tile: *dtMeshTile, side: s32, con: *dtPolyRef, conarea: *float, maxcon: s32) -> s32 #cpp_method #foreign lib/windows/debugutils "?findConnectingPolys@dtNavMesh@@AEBAHPEBM0PEBUdtMeshTile@@HPEAIPEAMH@Z";

    /// Builds internal polygons links for a tile.
    connectIntLinks :: (this: *dtNavMesh, tile: *dtMeshTile) -> void #cpp_method #foreign lib/windows/debugutils "?connectIntLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@@Z";

    /// Builds internal polygons links for a tile.
    baseOffMeshLinks :: (this: *dtNavMesh, tile: *dtMeshTile) -> void #cpp_method #foreign lib/windows/debugutils "?baseOffMeshLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@@Z";

    /// Builds external polygon links for a tile.
    connectExtLinks :: (this: *dtNavMesh, tile: *dtMeshTile, target: *dtMeshTile, side: s32) -> void #cpp_method #foreign lib/windows/debugutils "?connectExtLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@0H@Z";

    /// Builds external polygon links for a tile.
    connectExtOffMeshLinks :: (this: *dtNavMesh, tile: *dtMeshTile, target: *dtMeshTile, side: s32) -> void #cpp_method #foreign lib/windows/debugutils "?connectExtOffMeshLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@0H@Z";

    /// Removes external links at specified side.
    unconnectLinks :: (this: *dtNavMesh, tile: *dtMeshTile, target: *dtMeshTile) -> void #cpp_method #foreign lib/windows/debugutils "?unconnectLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@0@Z";

    /// Queries polygons within a tile.
    queryPolygonsInTile :: (this: *dtNavMesh, tile: *dtMeshTile, qmin: *float, qmax: *float, polys: *dtPolyRef, maxPolys: s32) -> s32 #cpp_method #foreign lib/windows/debugutils "?queryPolygonsInTile@dtNavMesh@@AEBAHPEBUdtMeshTile@@PEBM1PEAIH@Z";

    /// Find nearest polygon within a tile.
    findNearestPolyInTile :: (this: *dtNavMesh, tile: *dtMeshTile, center: *float, halfExtents: *float, nearestPt: *float) -> dtPolyRef #cpp_method #foreign lib/windows/debugutils "?findNearestPolyInTile@dtNavMesh@@AEBAIPEBUdtMeshTile@@PEBM1PEAM@Z";

    /// Returns whether position is over the poly and the height at the position if so.
    getPolyHeight :: (this: *dtNavMesh, tile: *dtMeshTile, poly: *dtPoly, pos: *float, height: *float) -> bool #cpp_method #foreign lib/windows/debugutils "?getPolyHeight@dtNavMesh@@AEBA_NPEBUdtMeshTile@@PEBUdtPoly@@PEBMPEAM@Z";

    /// Returns closest point on polygon.
    closestPointOnPoly :: (this: *dtNavMesh, ref: dtPolyRef, pos: *float, closest: *float, posOverPoly: *bool) -> void #cpp_method #foreign lib/windows/debugutils "?closestPointOnPoly@dtNavMesh@@AEBAXIPEBMPEAMPEA_N@Z";

    m_params:      dtNavMeshParams; ///< Current initialization params. TODO: do not store this info twice.
    m_orig:        [3] float; ///< Origin of the tile (0,0)
    m_tileWidth:   float; ///< Dimensions of each tile.
    m_tileHeight:  float; ///< Dimensions of each tile.
    m_maxTiles:    s32; ///< Max number of tiles.
    m_tileLutSize: s32; ///< Tile hash lookup size (must be pot).
    m_tileLutMask: s32; ///< Tile hash lookup mask.

    m_posLookup:   **dtMeshTile; ///< Tile hash lookup.
    m_nextFree:    *dtMeshTile; ///< Freelist of tiles.
    m_tiles:       *dtMeshTile; ///< List of tiles.

    m_saltBits:    u32; ///< Number of salt bits in the tile ID.
    m_tileBits:    u32; ///< Number of tile bits in the tile ID.
    m_polyBits:    u32; ///< Number of poly bits in the tile ID.
}

/// Allocates a navigation mesh object using the Detour allocator.
/// @return A navigation mesh that is ready for initialization, or null on failure.
///  @ingroup detour
dtAllocNavMesh :: () -> *dtNavMesh #foreign lib/windows/debugutils "?dtAllocNavMesh@@YAPEAVdtNavMesh@@XZ";

/// Frees the specified navigation mesh object using the Detour allocator.
///  @param[in]	navmesh		A navigation mesh allocated using #dtAllocNavMesh
///  @ingroup detour
dtFreeNavMesh :: (navmesh: *dtNavMesh) -> void #foreign lib/windows/debugutils "?dtFreeNavMesh@@YAXPEAVdtNavMesh@@@Z";

/// Defines polygon filtering and traversal costs for navigation mesh query operations.
/// @ingroup detour
dtQueryFilter :: struct {
    m_areaCost:     [64] float; ///< Cost per area type. (Used by default implementation.)
    m_includeFlags: u16; ///< Flags for polygons that can be visited. (Used by default implementation.)
    m_excludeFlags: u16; ///< Flags for polygons that should not be visited. (Used by default implementation.)

    Constructor :: (this: *dtQueryFilter) -> void #cpp_method #foreign lib/windows/debugutils "??0dtQueryFilter@@QEAA@XZ";

    passFilter :: (this: *dtQueryFilter, ref: dtPolyRef, tile: *dtMeshTile, poly: *dtPoly) -> bool #cpp_method #foreign lib/windows/debugutils "?passFilter@dtQueryFilter@@QEBA_NIPEBUdtMeshTile@@PEBUdtPoly@@@Z";

    getCost :: (this: *dtQueryFilter, pa: *float, pb: *float, prevRef: dtPolyRef, prevTile: *dtMeshTile, prevPoly: *dtPoly, curRef: dtPolyRef, curTile: *dtMeshTile, curPoly: *dtPoly, nextRef: dtPolyRef, nextTile: *dtMeshTile, nextPoly: *dtPoly) -> float #cpp_method #foreign lib/windows/debugutils "?getCost@dtQueryFilter@@QEBAMPEBM0IPEBUdtMeshTile@@PEBUdtPoly@@I12I12@Z";

    /// Returns the traversal cost of the area.
    ///  @param[in]		i		The id of the area.
    /// @returns The traversal cost of the area.
    getAreaCost :: (this: *dtQueryFilter, i: s32) -> float #cpp_method #foreign lib/windows/debugutils "?getAreaCost@dtQueryFilter@@QEBAMH@Z";

    /// Sets the traversal cost of the area.
    ///  @param[in]		i		The id of the area.
    ///  @param[in]		cost	The new cost of traversing the area.
    setAreaCost :: (this: *dtQueryFilter, i: s32, cost: float) -> void #cpp_method #foreign lib/windows/debugutils "?setAreaCost@dtQueryFilter@@QEAAXHM@Z";

    /// Returns the include flags for the filter.
    /// Any polygons that include one or more of these flags will be
    /// included in the operation.
    getIncludeFlags :: (this: *dtQueryFilter) -> u16 #cpp_method #foreign lib/windows/debugutils "?getIncludeFlags@dtQueryFilter@@QEBAGXZ";

    /// Sets the include flags for the filter.
    /// @param[in]		flags	The new flags.
    setIncludeFlags :: (this: *dtQueryFilter, flags: u16) -> void #cpp_method #foreign lib/windows/debugutils "?setIncludeFlags@dtQueryFilter@@QEAAXG@Z";

    /// Returns the exclude flags for the filter.
    /// Any polygons that include one ore more of these flags will be
    /// excluded from the operation.
    getExcludeFlags :: (this: *dtQueryFilter) -> u16 #cpp_method #foreign lib/windows/debugutils "?getExcludeFlags@dtQueryFilter@@QEBAGXZ";

    /// Sets the exclude flags for the filter.
    /// @param[in]		flags		The new flags.
    setExcludeFlags :: (this: *dtQueryFilter, flags: u16) -> void #cpp_method #foreign lib/windows/debugutils "?setExcludeFlags@dtQueryFilter@@QEAAXG@Z";
}

/// Provides information about raycast hit
/// filled by dtNavMeshQuery::raycast
/// @ingroup detour
dtRaycastHit :: struct {
    /// The hit parameter. (FLT_MAX if no wall hit.)
    t:            float;

    /// hitNormal	The normal of the nearest wall hit. [(x, y, z)]
    hitNormal:    [3] float;

    /// The index of the edge on the final polygon where the wall was hit.
    hitEdgeIndex: s32;

    /// Pointer to an array of reference ids of the visited polygons. [opt]
    path:         *dtPolyRef;

    /// The number of visited polygons. [opt]
    pathCount:    s32;

    /// The maximum number of polygons the @p path array can hold.
    maxPath:      s32;

    ///  The cost of the path until hit.
    pathCost:     float;
}

/// Provides custom polygon query behavior.
/// Used by dtNavMeshQuery::queryPolygons.
/// @ingroup detour
dtPolyQuery :: struct {
    vtable: *dtPolyQuery_VTable;

    // Virtual functions:
    // Normally you should call them via the vtable.
    // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
    // or need to create a vtable yourself.
    virtual_Destructor :: (this: *dtPolyQuery, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign lib/windows/debugutils "??1dtPolyQuery@@UEAA@XZ";
}
dtPolyQuery_VTable :: struct #type_info_none {
    Destructor: (this: *dtPolyQuery, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

    process: (this: *dtPolyQuery, tile: *dtMeshTile, polys: **dtPoly, refs: *dtPolyRef, count: s32) -> void #cpp_method;
}

dtPolyQuery_Destructor :: inline (this: *dtPolyQuery, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

dtPolyQuery_process :: inline (this: *dtPolyQuery, tile: *dtMeshTile, polys: **dtPoly, refs: *dtPolyRef, count: s32) { this.vtable.process(this, tile, polys, refs, count); }

vtable :: (obj: *dtPolyQuery) -> *dtPolyQuery_VTable { return obj.vtable; }


/// Provides the ability to perform pathfinding related queries against
/// a navigation mesh.
/// @ingroup detour
dtNavMeshQuery :: struct {
    Constructor :: (this: *dtNavMeshQuery) -> void #cpp_method #foreign lib/windows/debugutils "??0dtNavMeshQuery@@QEAA@XZ";
    Destructor :: (this: *dtNavMeshQuery) -> void #cpp_method #foreign lib/windows/debugutils "??1dtNavMeshQuery@@QEAA@XZ";

    /// Initializes the query object.
    ///  @param[in]		nav			Pointer to the dtNavMesh object to use for all queries.
    ///  @param[in]		maxNodes	Maximum number of search nodes. [Limits: 0 < value <= 65535]
    /// @returns The status flags for the query.
    init :: (this: *dtNavMeshQuery, nav: *dtNavMesh, maxNodes: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?init@dtNavMeshQuery@@QEAAIPEBVdtNavMesh@@H@Z";

    /// Finds a path from the start polygon to the end polygon.
    ///  @param[in]		startRef	The reference id of the start polygon.
    ///  @param[in]		endRef		The reference id of the end polygon.
    ///  @param[in]		startPos	A position within the start polygon. [(x, y, z)]
    ///  @param[in]		endPos		A position within the end polygon. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[out]	path		An ordered list of polygon references representing the path. (Start to end.)
    ///  							[(polyRef) * @p pathCount]
    ///  @param[out]	pathCount	The number of polygons returned in the @p path array.
    ///  @param[in]		maxPath		The maximum number of polygons the @p path array can hold. [Limit: >= 1]
    findPath :: (this: *dtNavMeshQuery, startRef: dtPolyRef, endRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?findPath@dtNavMeshQuery@@QEBAIIIPEBM0PEBVdtQueryFilter@@PEAIPEAHH@Z";

    /// Finds the straight path from the start to the end position within the polygon corridor.
    ///  @param[in]		startPos			Path start position. [(x, y, z)]
    ///  @param[in]		endPos				Path end position. [(x, y, z)]
    ///  @param[in]		path				An array of polygon references that represent the path corridor.
    ///  @param[in]		pathSize			The number of polygons in the @p path array.
    ///  @param[out]	straightPath		Points describing the straight path. [(x, y, z) * @p straightPathCount].
    ///  @param[out]	straightPathFlags	Flags describing each point. (See: #dtStraightPathFlags) [opt]
    ///  @param[out]	straightPathRefs	The reference id of the polygon that is being entered at each point. [opt]
    ///  @param[out]	straightPathCount	The number of points in the straight path.
    ///  @param[in]		maxStraightPath		The maximum number of points the straight path arrays can hold.  [Limit: > 0]
    ///  @param[in]		options				Query options. (see: #dtStraightPathOptions)
    /// @returns The status flags for the query.
    findStraightPath :: (this: *dtNavMeshQuery, startPos: *float, endPos: *float, path: *dtPolyRef, pathSize: s32, straightPath: *float, straightPathFlags: *u8, straightPathRefs: *dtPolyRef, straightPathCount: *s32, maxStraightPath: s32, options: s32 = 0) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?findStraightPath@dtNavMeshQuery@@QEBAIPEBM0PEBIHPEAMPEAEPEAIPEAHHH@Z";

    /// Initializes a sliced path query.
    ///  @param[in]		startRef	The reference id of the start polygon.
    ///  @param[in]		endRef		The reference id of the end polygon.
    ///  @param[in]		startPos	A position within the start polygon. [(x, y, z)]
    ///  @param[in]		endPos		A position within the end polygon. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[in]		options		query options (see: #dtFindPathOptions)
    /// @returns The status flags for the query.
    initSlicedFindPath :: (this: *dtNavMeshQuery, startRef: dtPolyRef, endRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, options: u32 = 0) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?initSlicedFindPath@dtNavMeshQuery@@QEAAIIIPEBM0PEBVdtQueryFilter@@I@Z";

    /// Updates an in-progress sliced path query.
    ///  @param[in]		maxIter		The maximum number of iterations to perform.
    ///  @param[out]	doneIters	The actual number of iterations completed. [opt]
    /// @returns The status flags for the query.
    updateSlicedFindPath :: (this: *dtNavMeshQuery, maxIter: s32, doneIters: *s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?updateSlicedFindPath@dtNavMeshQuery@@QEAAIHPEAH@Z";

    /// Finalizes and returns the results of a sliced path query.
    ///  @param[out]	path		An ordered list of polygon references representing the path. (Start to end.)
    ///  							[(polyRef) * @p pathCount]
    ///  @param[out]	pathCount	The number of polygons returned in the @p path array.
    ///  @param[in]		maxPath		The max number of polygons the path array can hold. [Limit: >= 1]
    /// @returns The status flags for the query.
    finalizeSlicedFindPath :: (this: *dtNavMeshQuery, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?finalizeSlicedFindPath@dtNavMeshQuery@@QEAAIPEAIPEAHH@Z";

    /// Finalizes and returns the results of an incomplete sliced path query, returning the path to the furthest
    /// polygon on the existing path that was visited during the search.
    ///  @param[in]		existing		An array of polygon references for the existing path.
    ///  @param[in]		existingSize	The number of polygon in the @p existing array.
    ///  @param[out]	path			An ordered list of polygon references representing the path. (Start to end.)
    ///  								[(polyRef) * @p pathCount]
    ///  @param[out]	pathCount		The number of polygons returned in the @p path array.
    ///  @param[in]		maxPath			The max number of polygons the @p path array can hold. [Limit: >= 1]
    /// @returns The status flags for the query.
    finalizeSlicedFindPathPartial :: (this: *dtNavMeshQuery, existing: *dtPolyRef, existingSize: s32, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?finalizeSlicedFindPathPartial@dtNavMeshQuery@@QEAAIPEBIHPEAIPEAHH@Z";

    /// Finds the polygons along the navigation graph that touch the specified circle.
    ///  @param[in]		startRef		The reference id of the polygon where the search starts.
    ///  @param[in]		centerPos		The center of the search circle. [(x, y, z)]
    ///  @param[in]		radius			The radius of the search circle.
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[out]	resultRef		The reference ids of the polygons touched by the circle. [opt]
    ///  @param[out]	resultParent	The reference ids of the parent polygons for each result.
    ///  								Zero if a result polygon has no parent. [opt]
    ///  @param[out]	resultCost		The search cost from @p centerPos to the polygon. [opt]
    ///  @param[out]	resultCount		The number of polygons found. [opt]
    ///  @param[in]		maxResult		The maximum number of polygons the result arrays can hold.
    /// @returns The status flags for the query.
    findPolysAroundCircle :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, radius: float, filter: *dtQueryFilter, resultRef: *dtPolyRef, resultParent: *dtPolyRef, resultCost: *float, resultCount: *s32, maxResult: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?findPolysAroundCircle@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@PEAI2PEAMPEAHH@Z";

    /// Finds the polygons along the naviation graph that touch the specified convex polygon.
    ///  @param[in]		startRef		The reference id of the polygon where the search starts.
    ///  @param[in]		verts			The vertices describing the convex polygon. (CCW)
    ///  								[(x, y, z) * @p nverts]
    ///  @param[in]		nverts			The number of vertices in the polygon.
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[out]	resultRef		The reference ids of the polygons touched by the search polygon. [opt]
    ///  @param[out]	resultParent	The reference ids of the parent polygons for each result. Zero if a
    ///  								result polygon has no parent. [opt]
    ///  @param[out]	resultCost		The search cost from the centroid point to the polygon. [opt]
    ///  @param[out]	resultCount		The number of polygons found.
    ///  @param[in]		maxResult		The maximum number of polygons the result arrays can hold.
    /// @returns The status flags for the query.
    findPolysAroundShape :: (this: *dtNavMeshQuery, startRef: dtPolyRef, verts: *float, nverts: s32, filter: *dtQueryFilter, resultRef: *dtPolyRef, resultParent: *dtPolyRef, resultCost: *float, resultCount: *s32, maxResult: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?findPolysAroundShape@dtNavMeshQuery@@QEBAIIPEBMHPEBVdtQueryFilter@@PEAI2PEAMPEAHH@Z";

    /// Gets a path from the explored nodes in the previous search.
    ///  @param[in]		endRef		The reference id of the end polygon.
    ///  @param[out]	path		An ordered list of polygon references representing the path. (Start to end.)
    ///  							[(polyRef) * @p pathCount]
    ///  @param[out]	pathCount	The number of polygons returned in the @p path array.
    ///  @param[in]		maxPath		The maximum number of polygons the @p path array can hold. [Limit: >= 0]
    ///  @returns		The status flags. Returns DT_FAILURE | DT_INVALID_PARAM if any parameter is wrong, or if
    ///  				@p endRef was not explored in the previous search. Returns DT_SUCCESS | DT_BUFFER_TOO_SMALL
    ///  				if @p path cannot contain the entire path. In this case it is filled to capacity with a partial path.
    ///  				Otherwise returns DT_SUCCESS.
    ///  @remarks		The result of this function depends on the state of the query object. For that reason it should only
    ///  				be used immediately after one of the two Dijkstra searches, findPolysAroundCircle or findPolysAroundShape.
    getPathFromDijkstraSearch :: (this: *dtNavMeshQuery, endRef: dtPolyRef, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getPathFromDijkstraSearch@dtNavMeshQuery@@QEBAIIPEAIPEAHH@Z";

    /// Finds the polygon nearest to the specified center point.
    /// [opt] means the specified parameter can be a null pointer, in that case the output parameter will not be set.
    ///
    ///  @param[in]		center		The center of the search box. [(x, y, z)]
    ///  @param[in]		halfExtents	The search distance along each axis. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[out]	nearestRef	The reference id of the nearest polygon. Will be set to 0 if no polygon is found.
    ///  @param[out]	nearestPt	The nearest point on the polygon. Unchanged if no polygon is found. [opt] [(x, y, z)]
    /// @returns The status flags for the query.
    findNearestPoly :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, nearestRef: *dtPolyRef, nearestPt: *float) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?findNearestPoly@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAIPEAM@Z";

    /// Finds the polygon nearest to the specified center point.
    /// [opt] means the specified parameter can be a null pointer, in that case the output parameter will not be set.
    ///
    ///  @param[in]		center		The center of the search box. [(x, y, z)]
    ///  @param[in]		halfExtents	The search distance along each axis. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[out]	nearestRef	The reference id of the nearest polygon. Will be set to 0 if no polygon is found.
    ///  @param[out]	nearestPt	The nearest point on the polygon. Unchanged if no polygon is found. [opt] [(x, y, z)]
    ///  @param[out]	isOverPoly 	Set to true if the point's X/Z coordinate lies inside the polygon, false otherwise. Unchanged if no polygon is found. [opt]
    /// @returns The status flags for the query.
    findNearestPoly :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, nearestRef: *dtPolyRef, nearestPt: *float, isOverPoly: *bool) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?findNearestPoly@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAIPEAMPEA_N@Z";

    /// Finds polygons that overlap the search box.
    ///  @param[in]		center		The center of the search box. [(x, y, z)]
    ///  @param[in]		halfExtents		The search distance along each axis. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[out]	polys		The reference ids of the polygons that overlap the query box.
    ///  @param[out]	polyCount	The number of polygons in the search result.
    ///  @param[in]		maxPolys	The maximum number of polygons the search result can hold.
    /// @returns The status flags for the query.
    queryPolygons :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, polys: *dtPolyRef, polyCount: *s32, maxPolys: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?queryPolygons@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAIPEAHH@Z";

    /// Finds polygons that overlap the search box.
    ///  @param[in]		center		The center of the search box. [(x, y, z)]
    ///  @param[in]		halfExtents		The search distance along each axis. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[in]		query		The query. Polygons found will be batched together and passed to this query.
    queryPolygons :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, query: *dtPolyQuery) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?queryPolygons@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAVdtPolyQuery@@@Z";

    /// Finds the non-overlapping navigation polygons in the local neighbourhood around the center position.
    ///  @param[in]		startRef		The reference id of the polygon where the search starts.
    ///  @param[in]		centerPos		The center of the query circle. [(x, y, z)]
    ///  @param[in]		radius			The radius of the query circle.
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[out]	resultRef		The reference ids of the polygons touched by the circle.
    ///  @param[out]	resultParent	The reference ids of the parent polygons for each result.
    ///  								Zero if a result polygon has no parent. [opt]
    ///  @param[out]	resultCount		The number of polygons found.
    ///  @param[in]		maxResult		The maximum number of polygons the result arrays can hold.
    /// @returns The status flags for the query.
    findLocalNeighbourhood :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, radius: float, filter: *dtQueryFilter, resultRef: *dtPolyRef, resultParent: *dtPolyRef, resultCount: *s32, maxResult: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?findLocalNeighbourhood@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@PEAI2PEAHH@Z";

    /// Moves from the start to the end position constrained to the navigation mesh.
    ///  @param[in]		startRef		The reference id of the start polygon.
    ///  @param[in]		startPos		A position of the mover within the start polygon. [(x, y, x)]
    ///  @param[in]		endPos			The desired end position of the mover. [(x, y, z)]
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[out]	resultPos		The result position of the mover. [(x, y, z)]
    ///  @param[out]	visited			The reference ids of the polygons visited during the move.
    ///  @param[out]	visitedCount	The number of polygons visited during the move.
    ///  @param[in]		maxVisitedSize	The maximum number of polygons the @p visited array can hold.
    /// @returns The status flags for the query.
    moveAlongSurface :: (this: *dtNavMeshQuery, startRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, resultPos: *float, visited: *dtPolyRef, visitedCount: *s32, maxVisitedSize: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?moveAlongSurface@dtNavMeshQuery@@QEBAIIPEBM0PEBVdtQueryFilter@@PEAMPEAIPEAHH@Z";

    /// Casts a 'walkability' ray along the surface of the navigation mesh from
    /// the start position toward the end position.
    /// @note A wrapper around raycast(..., RaycastHit*). Retained for backward compatibility.
    ///  @param[in]		startRef	The reference id of the start polygon.
    ///  @param[in]		startPos	A position within the start polygon representing
    ///  							the start of the ray. [(x, y, z)]
    ///  @param[in]		endPos		The position to cast the ray toward. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[out]	t			The hit parameter. (FLT_MAX if no wall hit.)
    ///  @param[out]	hitNormal	The normal of the nearest wall hit. [(x, y, z)]
    ///  @param[out]	path		The reference ids of the visited polygons. [opt]
    ///  @param[out]	pathCount	The number of visited polygons. [opt]
    ///  @param[in]		maxPath		The maximum number of polygons the @p path array can hold.
    /// @returns The status flags for the query.
    raycast :: (this: *dtNavMeshQuery, startRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, t: *float, hitNormal: *float, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?raycast@dtNavMeshQuery@@QEBAIIPEBM0PEBVdtQueryFilter@@PEAM2PEAIPEAHH@Z";

    /// Casts a 'walkability' ray along the surface of the navigation mesh from
    /// the start position toward the end position.
    ///  @param[in]		startRef	The reference id of the start polygon.
    ///  @param[in]		startPos	A position within the start polygon representing
    ///  							the start of the ray. [(x, y, z)]
    ///  @param[in]		endPos		The position to cast the ray toward. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[in]		options		govern how the raycast behaves. See dtRaycastOptions
    ///  @param[out]	hit			Pointer to a raycast hit structure which will be filled by the results.
    ///  @param[in]		prevRef		parent of start ref. Used during for cost calculation [opt]
    /// @returns The status flags for the query.
    raycast :: (this: *dtNavMeshQuery, startRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, options: u32, hit: *dtRaycastHit, prevRef: dtPolyRef = 0) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?raycast@dtNavMeshQuery@@QEBAIIPEBM0PEBVdtQueryFilter@@IPEAUdtRaycastHit@@I@Z";

    /// Finds the distance from the specified position to the nearest polygon wall.
    ///  @param[in]		startRef		The reference id of the polygon containing @p centerPos.
    ///  @param[in]		centerPos		The center of the search circle. [(x, y, z)]
    ///  @param[in]		maxRadius		The radius of the search circle.
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[out]	hitDist			The distance to the nearest wall from @p centerPos.
    ///  @param[out]	hitPos			The nearest position on the wall that was hit. [(x, y, z)]
    ///  @param[out]	hitNormal		The normalized ray formed from the wall point to the
    ///  								source point. [(x, y, z)]
    /// @returns The status flags for the query.
    findDistanceToWall :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, maxRadius: float, filter: *dtQueryFilter, hitDist: *float, hitPos: *float, hitNormal: *float) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?findDistanceToWall@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@PEAM22@Z";

    /// Returns the segments for the specified polygon, optionally including portals.
    ///  @param[in]		ref				The reference id of the polygon.
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[out]	segmentVerts	The segments. [(ax, ay, az, bx, by, bz) * segmentCount]
    ///  @param[out]	segmentRefs		The reference ids of each segment's neighbor polygon.
    ///  								Or zero if the segment is a wall. [opt] [(parentRef) * @p segmentCount]
    ///  @param[out]	segmentCount	The number of segments returned.
    ///  @param[in]		maxSegments		The maximum number of segments the result arrays can hold.
    /// @returns The status flags for the query.
    getPolyWallSegments :: (this: *dtNavMeshQuery, ref: dtPolyRef, filter: *dtQueryFilter, segmentVerts: *float, segmentRefs: *dtPolyRef, segmentCount: *s32, maxSegments: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getPolyWallSegments@dtNavMeshQuery@@QEBAIIPEBVdtQueryFilter@@PEAMPEAIPEAHH@Z";

    /// Returns random location on navmesh.
    /// Polygons are chosen weighted by area. The search runs in linear related to number of polygon.
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[in]		frand			Function returning a random number [0..1).
    ///  @param[out]	randomRef		The reference id of the random location.
    ///  @param[out]	randomPt		The random location.
    /// @returns The status flags for the query.
    findRandomPoint :: (this: *dtNavMeshQuery, filter: *dtQueryFilter, frand: #type () -> float #c_call, randomRef: *dtPolyRef, randomPt: *float) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?findRandomPoint@dtNavMeshQuery@@QEBAIPEBVdtQueryFilter@@P6AMXZPEAIPEAM@Z";

    /// Returns random location on navmesh within the reach of specified location.
    /// Polygons are chosen weighted by area. The search runs in linear related to number of polygon.
    /// The location is not exactly constrained by the circle, but it limits the visited polygons.
    ///  @param[in]		startRef		The reference id of the polygon where the search starts.
    ///  @param[in]		centerPos		The center of the search circle. [(x, y, z)]
    ///  @param[in]		maxRadius		The radius of the search circle. [Units: wu]
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[in]		frand			Function returning a random number [0..1).
    ///  @param[out]	randomRef		The reference id of the random location.
    ///  @param[out]	randomPt		The random location. [(x, y, z)]
    /// @returns The status flags for the query.
    findRandomPointAroundCircle :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, maxRadius: float, filter: *dtQueryFilter, frand: #type () -> float #c_call, randomRef: *dtPolyRef, randomPt: *float) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?findRandomPointAroundCircle@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@P6AMXZPEAIPEAM@Z";

    /// Finds the closest point on the specified polygon.
    ///  @param[in]		ref			The reference id of the polygon.
    ///  @param[in]		pos			The position to check. [(x, y, z)]
    ///  @param[out]	closest		The closest point on the polygon. [(x, y, z)]
    ///  @param[out]	posOverPoly	True of the position is over the polygon.
    /// @returns The status flags for the query.
    closestPointOnPoly :: (this: *dtNavMeshQuery, ref: dtPolyRef, pos: *float, closest: *float, posOverPoly: *bool) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?closestPointOnPoly@dtNavMeshQuery@@QEBAIIPEBMPEAMPEA_N@Z";

    /// Returns a point on the boundary closest to the source point if the source point is outside the
    /// polygon's xz-bounds.
    ///  @param[in]		ref			The reference id to the polygon.
    ///  @param[in]		pos			The position to check. [(x, y, z)]
    ///  @param[out]	closest		The closest point. [(x, y, z)]
    /// @returns The status flags for the query.
    closestPointOnPolyBoundary :: (this: *dtNavMeshQuery, ref: dtPolyRef, pos: *float, closest: *float) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?closestPointOnPolyBoundary@dtNavMeshQuery@@QEBAIIPEBMPEAM@Z";

    /// Gets the height of the polygon at the provided position using the height detail. (Most accurate.)
    ///  @param[in]		ref			The reference id of the polygon.
    ///  @param[in]		pos			A position within the xz-bounds of the polygon. [(x, y, z)]
    ///  @param[out]	height		The height at the surface of the polygon.
    /// @returns The status flags for the query.
    getPolyHeight :: (this: *dtNavMeshQuery, ref: dtPolyRef, pos: *float, height: *float) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getPolyHeight@dtNavMeshQuery@@QEBAIIPEBMPEAM@Z";

    /// Returns true if the polygon reference is valid and passes the filter restrictions.
    ///  @param[in]		ref			The polygon reference to check.
    ///  @param[in]		filter		The filter to apply.
    isValidPolyRef :: (this: *dtNavMeshQuery, ref: dtPolyRef, filter: *dtQueryFilter) -> bool #cpp_method #foreign lib/windows/debugutils "?isValidPolyRef@dtNavMeshQuery@@QEBA_NIPEBVdtQueryFilter@@@Z";

    /// Returns true if the polygon reference is in the closed list.
    ///  @param[in]		ref		The reference id of the polygon to check.
    /// @returns True if the polygon is in closed list.
    isInClosedList :: (this: *dtNavMeshQuery, ref: dtPolyRef) -> bool #cpp_method #foreign lib/windows/debugutils "?isInClosedList@dtNavMeshQuery@@QEBA_NI@Z";

    dtNodePool :: struct {}
    /// Gets the node pool.
    /// @returns The node pool.
    getNodePool :: (this: *dtNavMeshQuery) -> *dtNodePool #cpp_method #foreign lib/windows/debugutils "?getNodePool@dtNavMeshQuery@@QEBAPEAVdtNodePool@@XZ";

    /// Gets the navigation mesh the query object is using.
    /// @return The navigation mesh the query object is using.
    getAttachedNavMesh :: (this: *dtNavMeshQuery) -> *dtNavMesh #cpp_method #foreign lib/windows/debugutils "?getAttachedNavMesh@dtNavMeshQuery@@QEBAPEBVdtNavMesh@@XZ";

    /// Queries polygons within a tile.
    queryPolygonsInTile :: (this: *dtNavMeshQuery, tile: *dtMeshTile, qmin: *float, qmax: *float, filter: *dtQueryFilter, query: *dtPolyQuery) -> void #cpp_method #foreign lib/windows/debugutils "?queryPolygonsInTile@dtNavMeshQuery@@AEBAXPEBUdtMeshTile@@PEBM1PEBVdtQueryFilter@@PEAVdtPolyQuery@@@Z";

    /// Returns portal points between two polygons.
    getPortalPoints :: (this: *dtNavMeshQuery, from: dtPolyRef, to: dtPolyRef, left: *float, right: *float, fromType: *u8, toType: *u8) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getPortalPoints@dtNavMeshQuery@@AEBAIIIPEAM0AEAE1@Z";

    getPortalPoints :: (this: *dtNavMeshQuery, from: dtPolyRef, fromPoly: *dtPoly, fromTile: *dtMeshTile, to: dtPolyRef, toPoly: *dtPoly, toTile: *dtMeshTile, left: *float, right: *float) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getPortalPoints@dtNavMeshQuery@@AEBAIIPEBUdtPoly@@PEBUdtMeshTile@@I01PEAM2@Z";

    /// Returns edge mid point between two polygons.
    getEdgeMidPoint :: (this: *dtNavMeshQuery, from: dtPolyRef, to: dtPolyRef, mid: *float) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getEdgeMidPoint@dtNavMeshQuery@@AEBAIIIPEAM@Z";
    getEdgeMidPoint :: (this: *dtNavMeshQuery, from: dtPolyRef, fromPoly: *dtPoly, fromTile: *dtMeshTile, to: dtPolyRef, toPoly: *dtPoly, toTile: *dtMeshTile, mid: *float) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getEdgeMidPoint@dtNavMeshQuery@@AEBAIIPEBUdtPoly@@PEBUdtMeshTile@@I01PEAM@Z";

    // Appends vertex to a straight path
    appendVertex :: (this: *dtNavMeshQuery, pos: *float, flags: u8, ref: dtPolyRef, straightPath: *float, straightPathFlags: *u8, straightPathRefs: *dtPolyRef, straightPathCount: *s32, maxStraightPath: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?appendVertex@dtNavMeshQuery@@AEBAIPEBMEIPEAMPEAEPEAIPEAHH@Z";

    // Appends intermediate portal points to a straight path.
    appendPortals :: (this: *dtNavMeshQuery, startIdx: s32, endIdx: s32, endPos: *float, path: *dtPolyRef, straightPath: *float, straightPathFlags: *u8, straightPathRefs: *dtPolyRef, straightPathCount: *s32, maxStraightPath: s32, options: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?appendPortals@dtNavMeshQuery@@AEBAIHHPEBMPEBIPEAMPEAEPEAIPEAHHH@Z";

    dtNode :: struct {}
    // Gets the path leading to the specified end node.
    getPathToNode :: (this: *dtNavMeshQuery, endNode: *dtNode, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/debugutils "?getPathToNode@dtNavMeshQuery@@AEBAIPEAUdtNode@@PEAIPEAHH@Z";

    m_nav:          *dtNavMesh; ///< Pointer to navmesh data.

    dtQueryData :: struct {
        status:           dtStatus;
        lastBestNode:     *dtNode;
        lastBestNodeCost: float;
        startRef:         dtPolyRef;
        endRef:           dtPolyRef;
        startPos:         [3] float;
        endPos:           [3] float;
        filter:           *dtQueryFilter;
        options:          u32;
        raycastLimitSqr:  float;
    }

    m_query:        dtQueryData; ///< Sliced query state.

    m_tinyNodePool: *dtNodePool; ///< Pointer to small node pool.
    m_nodePool:     *dtNodePool; ///< Pointer to node pool.
    dtNodeQueue :: struct {}
    m_openList:     *dtNodeQueue; ///< Pointer to open list queue.
}

/// Allocates a query object using the Detour allocator.
/// @return An allocated query object, or null on failure.
/// @ingroup detour
dtAllocNavMeshQuery :: () -> *dtNavMeshQuery #foreign lib/windows/debugutils "?dtAllocNavMeshQuery@@YAPEAVdtNavMeshQuery@@XZ";

/// Frees the specified query object using the Detour allocator.
///  @param[in]		query		A query object allocated using #dtAllocNavMeshQuery
/// @ingroup detour
dtFreeNavMeshQuery :: (query: *dtNavMeshQuery) -> void #foreign lib/windows/debugutils "?dtFreeNavMeshQuery@@YAXPEAVdtNavMeshQuery@@@Z";

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


DrawNavMeshFlags :: enum s32 {
    OFFMESHCONS :: 1;
    CLOSEDLIST  :: 2;
    COLOR_TILES :: 4;

    DU_DRAWNAVMESH_OFFMESHCONS :: OFFMESHCONS;
    DU_DRAWNAVMESH_CLOSEDLIST  :: CLOSEDLIST;
    DU_DRAWNAVMESH_COLOR_TILES :: COLOR_TILES;
}

duDebugDrawNavMesh :: (dd: *duDebugDraw, mesh: *dtNavMesh, flags: u8) -> void #foreign lib/windows/debugutils "?duDebugDrawNavMesh@@YAXPEAUduDebugDraw@@AEBVdtNavMesh@@E@Z";
duDebugDrawNavMesh :: (dd: *duDebugDraw, mesh: dtNavMesh, flags: u8) #no_context {
    duDebugDrawNavMesh(dd, *mesh, flags);
}
duDebugDrawNavMeshWithClosedList :: (dd: *duDebugDraw, mesh: *dtNavMesh, query: *dtNavMeshQuery, flags: u8) -> void #foreign lib/windows/debugutils "?duDebugDrawNavMeshWithClosedList@@YAXPEAUduDebugDraw@@AEBVdtNavMesh@@AEBVdtNavMeshQuery@@E@Z";
duDebugDrawNavMeshWithClosedList :: (dd: *duDebugDraw, mesh: dtNavMesh, query: dtNavMeshQuery, flags: u8) #no_context {
    duDebugDrawNavMeshWithClosedList(dd, *mesh, *query, flags);
}
duDebugDrawNavMeshNodes :: (dd: *duDebugDraw, query: *dtNavMeshQuery) -> void #foreign lib/windows/debugutils "?duDebugDrawNavMeshNodes@@YAXPEAUduDebugDraw@@AEBVdtNavMeshQuery@@@Z";
duDebugDrawNavMeshNodes :: (dd: *duDebugDraw, query: dtNavMeshQuery) #no_context {
    duDebugDrawNavMeshNodes(dd, *query);
}
duDebugDrawNavMeshBVTree :: (dd: *duDebugDraw, mesh: *dtNavMesh) -> void #foreign lib/windows/debugutils "?duDebugDrawNavMeshBVTree@@YAXPEAUduDebugDraw@@AEBVdtNavMesh@@@Z";
duDebugDrawNavMeshBVTree :: (dd: *duDebugDraw, mesh: dtNavMesh) #no_context {
    duDebugDrawNavMeshBVTree(dd, *mesh);
}
duDebugDrawNavMeshPortals :: (dd: *duDebugDraw, mesh: *dtNavMesh) -> void #foreign lib/windows/debugutils "?duDebugDrawNavMeshPortals@@YAXPEAUduDebugDraw@@AEBVdtNavMesh@@@Z";
duDebugDrawNavMeshPortals :: (dd: *duDebugDraw, mesh: dtNavMesh) #no_context {
    duDebugDrawNavMeshPortals(dd, *mesh);
}
duDebugDrawNavMeshPolysWithFlags :: (dd: *duDebugDraw, mesh: *dtNavMesh, polyFlags: u16, col: u32) -> void #foreign lib/windows/debugutils "?duDebugDrawNavMeshPolysWithFlags@@YAXPEAUduDebugDraw@@AEBVdtNavMesh@@GI@Z";
duDebugDrawNavMeshPolysWithFlags :: (dd: *duDebugDraw, mesh: dtNavMesh, polyFlags: u16, col: u32) #no_context {
    duDebugDrawNavMeshPolysWithFlags(dd, *mesh, polyFlags, col);
}
duDebugDrawNavMeshPoly :: (dd: *duDebugDraw, mesh: *dtNavMesh, ref: dtPolyRef, col: u32) -> void #foreign lib/windows/debugutils "?duDebugDrawNavMeshPoly@@YAXPEAUduDebugDraw@@AEBVdtNavMesh@@II@Z";
duDebugDrawNavMeshPoly :: (dd: *duDebugDraw, mesh: dtNavMesh, ref: dtPolyRef, col: u32) #no_context {
    duDebugDrawNavMeshPoly(dd, *mesh, ref, col);
}

duDebugDrawTileCacheLayerAreas :: (dd: *duDebugDraw, layer: *dtTileCacheLayer, cs: float, ch: float) -> void #foreign lib/windows/debugutils "?duDebugDrawTileCacheLayerAreas@@YAXPEAUduDebugDraw@@AEBUdtTileCacheLayer@@MM@Z";
duDebugDrawTileCacheLayerAreas :: (dd: *duDebugDraw, layer: dtTileCacheLayer, cs: float, ch: float) #no_context {
    duDebugDrawTileCacheLayerAreas(dd, *layer, cs, ch);
}
duDebugDrawTileCacheLayerRegions :: (dd: *duDebugDraw, layer: *dtTileCacheLayer, cs: float, ch: float) -> void #foreign lib/windows/debugutils "?duDebugDrawTileCacheLayerRegions@@YAXPEAUduDebugDraw@@AEBUdtTileCacheLayer@@MM@Z";
duDebugDrawTileCacheLayerRegions :: (dd: *duDebugDraw, layer: dtTileCacheLayer, cs: float, ch: float) #no_context {
    duDebugDrawTileCacheLayerRegions(dd, *layer, cs, ch);
}
duDebugDrawTileCacheContours :: (dd: *duDebugDraw, lcset: *dtTileCacheContourSet, orig: *float, cs: float, ch: float) -> void #foreign lib/windows/debugutils "?duDebugDrawTileCacheContours@@YAXPEAUduDebugDraw@@AEBUdtTileCacheContourSet@@PEBMMM@Z";
duDebugDrawTileCacheContours :: (dd: *duDebugDraw, lcset: dtTileCacheContourSet, orig: *float, cs: float, ch: float) #no_context {
    duDebugDrawTileCacheContours(dd, *lcset, orig, cs, ch);
}

duDebugDrawTileCachePolyMesh :: (dd: *duDebugDraw, lmesh: *dtTileCachePolyMesh, orig: *float, cs: float, ch: float) -> void #foreign lib/windows/debugutils "?duDebugDrawTileCachePolyMesh@@YAXPEAUduDebugDraw@@AEBUdtTileCachePolyMesh@@PEBMMM@Z";
duDebugDrawTileCachePolyMesh :: (dd: *duDebugDraw, lmesh: dtTileCachePolyMesh, orig: *float, cs: float, ch: float) #no_context {
    duDebugDrawTileCachePolyMesh(dd, *lmesh, orig, cs, ch);
}

duDebugDrawTriMesh :: (dd: *duDebugDraw, verts: *float, nverts: s32, tris: *s32, normals: *float, ntris: s32, flags: *u8, texScale: float) -> void #foreign lib/windows/debugutils "?duDebugDrawTriMesh@@YAXPEAUduDebugDraw@@PEBMHPEBH1HPEBEM@Z";
duDebugDrawTriMeshSlope :: (dd: *duDebugDraw, verts: *float, nverts: s32, tris: *s32, normals: *float, ntris: s32, walkableSlopeAngle: float, texScale: float) -> void #foreign lib/windows/debugutils "?duDebugDrawTriMeshSlope@@YAXPEAUduDebugDraw@@PEBMHPEBH1HMM@Z";

duDebugDrawHeightfieldSolid :: (dd: *duDebugDraw, hf: *rcHeightfield) -> void #foreign lib/windows/debugutils "?duDebugDrawHeightfieldSolid@@YAXPEAUduDebugDraw@@AEBUrcHeightfield@@@Z";
duDebugDrawHeightfieldSolid :: (dd: *duDebugDraw, hf: rcHeightfield) #no_context {
    duDebugDrawHeightfieldSolid(dd, *hf);
}
duDebugDrawHeightfieldWalkable :: (dd: *duDebugDraw, hf: *rcHeightfield) -> void #foreign lib/windows/debugutils "?duDebugDrawHeightfieldWalkable@@YAXPEAUduDebugDraw@@AEBUrcHeightfield@@@Z";
duDebugDrawHeightfieldWalkable :: (dd: *duDebugDraw, hf: rcHeightfield) #no_context {
    duDebugDrawHeightfieldWalkable(dd, *hf);
}

duDebugDrawCompactHeightfieldSolid :: (dd: *duDebugDraw, chf: *rcCompactHeightfield) -> void #foreign lib/windows/debugutils "?duDebugDrawCompactHeightfieldSolid@@YAXPEAUduDebugDraw@@AEBUrcCompactHeightfield@@@Z";
duDebugDrawCompactHeightfieldSolid :: (dd: *duDebugDraw, chf: rcCompactHeightfield) #no_context {
    duDebugDrawCompactHeightfieldSolid(dd, *chf);
}
duDebugDrawCompactHeightfieldRegions :: (dd: *duDebugDraw, chf: *rcCompactHeightfield) -> void #foreign lib/windows/debugutils "?duDebugDrawCompactHeightfieldRegions@@YAXPEAUduDebugDraw@@AEBUrcCompactHeightfield@@@Z";
duDebugDrawCompactHeightfieldRegions :: (dd: *duDebugDraw, chf: rcCompactHeightfield) #no_context {
    duDebugDrawCompactHeightfieldRegions(dd, *chf);
}
duDebugDrawCompactHeightfieldDistance :: (dd: *duDebugDraw, chf: *rcCompactHeightfield) -> void #foreign lib/windows/debugutils "?duDebugDrawCompactHeightfieldDistance@@YAXPEAUduDebugDraw@@AEBUrcCompactHeightfield@@@Z";
duDebugDrawCompactHeightfieldDistance :: (dd: *duDebugDraw, chf: rcCompactHeightfield) #no_context {
    duDebugDrawCompactHeightfieldDistance(dd, *chf);
}

duDebugDrawHeightfieldLayer :: (dd: *duDebugDraw, layer: *rcHeightfieldLayer, idx: s32) -> void #foreign lib/windows/debugutils "?duDebugDrawHeightfieldLayer@@YAXPEAUduDebugDraw@@AEBUrcHeightfieldLayer@@H@Z";
duDebugDrawHeightfieldLayer :: (dd: *duDebugDraw, layer: rcHeightfieldLayer, idx: s32) #no_context {
    duDebugDrawHeightfieldLayer(dd, *layer, idx);
}
duDebugDrawHeightfieldLayers :: (dd: *duDebugDraw, lset: *rcHeightfieldLayerSet) -> void #foreign lib/windows/debugutils "?duDebugDrawHeightfieldLayers@@YAXPEAUduDebugDraw@@AEBUrcHeightfieldLayerSet@@@Z";
duDebugDrawHeightfieldLayers :: (dd: *duDebugDraw, lset: rcHeightfieldLayerSet) #no_context {
    duDebugDrawHeightfieldLayers(dd, *lset);
}

duDebugDrawRegionConnections :: (dd: *duDebugDraw, cset: *rcContourSet, alpha: float = 1.0) -> void #foreign lib/windows/debugutils "?duDebugDrawRegionConnections@@YAXPEAUduDebugDraw@@AEBUrcContourSet@@M@Z";
duDebugDrawRegionConnections :: (dd: *duDebugDraw, cset: rcContourSet, alpha: float = 1.0) #no_context {
    duDebugDrawRegionConnections(dd, *cset, alpha);
}
duDebugDrawRawContours :: (dd: *duDebugDraw, cset: *rcContourSet, alpha: float = 1.0) -> void #foreign lib/windows/debugutils "?duDebugDrawRawContours@@YAXPEAUduDebugDraw@@AEBUrcContourSet@@M@Z";
duDebugDrawRawContours :: (dd: *duDebugDraw, cset: rcContourSet, alpha: float = 1.0) #no_context {
    duDebugDrawRawContours(dd, *cset, alpha);
}
duDebugDrawContours :: (dd: *duDebugDraw, cset: *rcContourSet, alpha: float = 1.0) -> void #foreign lib/windows/debugutils "?duDebugDrawContours@@YAXPEAUduDebugDraw@@AEBUrcContourSet@@M@Z";
duDebugDrawContours :: (dd: *duDebugDraw, cset: rcContourSet, alpha: float = 1.0) #no_context {
    duDebugDrawContours(dd, *cset, alpha);
}
duDebugDrawPolyMesh :: (dd: *duDebugDraw, mesh: *rcPolyMesh) -> void #foreign lib/windows/debugutils "?duDebugDrawPolyMesh@@YAXPEAUduDebugDraw@@AEBUrcPolyMesh@@@Z";
duDebugDrawPolyMesh :: (dd: *duDebugDraw, mesh: rcPolyMesh) #no_context {
    duDebugDrawPolyMesh(dd, *mesh);
}
duDebugDrawPolyMeshDetail :: (dd: *duDebugDraw, dmesh: *rcPolyMeshDetail) -> void #foreign lib/windows/debugutils "?duDebugDrawPolyMeshDetail@@YAXPEAUduDebugDraw@@AEBUrcPolyMeshDetail@@@Z";
duDebugDrawPolyMeshDetail :: (dd: *duDebugDraw, dmesh: rcPolyMeshDetail) #no_context {
    duDebugDrawPolyMeshDetail(dd, *dmesh);
}

/// The value of PI used by Recast.
RC_PI: float : 3.141593;

/// Recast log categories.
/// @see rcContext
rcLogCategory :: enum s32 {
    PROGRESS :: 1;
    WARNING  :: 2;
    ERROR    :: 3;

    RC_LOG_PROGRESS :: PROGRESS;
    RC_LOG_WARNING  :: WARNING;
    RC_LOG_ERROR    :: ERROR;
}

/// Recast performance timer categories.
/// @see rcContext
rcTimerLabel :: enum s32 {
    TIMER_TOTAL                    :: 0;

    TIMER_TEMP                     :: 1;

    TIMER_RASTERIZE_TRIANGLES      :: 2;

    TIMER_BUILD_COMPACTHEIGHTFIELD :: 3;

    TIMER_BUILD_CONTOURS           :: 4;

    TIMER_BUILD_CONTOURS_TRACE     :: 5;

    TIMER_BUILD_CONTOURS_SIMPLIFY  :: 6;

    TIMER_FILTER_BORDER            :: 7;

    TIMER_FILTER_WALKABLE          :: 8;

    TIMER_MEDIAN_AREA              :: 9;

    TIMER_FILTER_LOW_OBSTACLES     :: 10;

    TIMER_BUILD_POLYMESH           :: 11;

    TIMER_MERGE_POLYMESH           :: 12;

    TIMER_ERODE_AREA               :: 13;

    TIMER_MARK_BOX_AREA            :: 14;

    TIMER_MARK_CYLINDER_AREA       :: 15;

    TIMER_MARK_CONVEXPOLY_AREA     :: 16;

    TIMER_BUILD_DISTANCEFIELD      :: 17;

    TIMER_BUILD_DISTANCEFIELD_DIST :: 18;

    TIMER_BUILD_DISTANCEFIELD_BLUR :: 19;

    TIMER_BUILD_REGIONS            :: 20;

    TIMER_BUILD_REGIONS_WATERSHED  :: 21;

    TIMER_BUILD_REGIONS_EXPAND     :: 22;

    TIMER_BUILD_REGIONS_FLOOD      :: 23;

    TIMER_BUILD_REGIONS_FILTER     :: 24;

    TIMER_BUILD_LAYERS             :: 25;

    TIMER_BUILD_POLYMESHDETAIL     :: 26;

    TIMER_MERGE_POLYMESHDETAIL     :: 27;

    MAX_TIMERS                     :: 28;

    RC_TIMER_TOTAL                    :: TIMER_TOTAL;

    RC_TIMER_TEMP                     :: TIMER_TEMP;

    RC_TIMER_RASTERIZE_TRIANGLES      :: TIMER_RASTERIZE_TRIANGLES;

    RC_TIMER_BUILD_COMPACTHEIGHTFIELD :: TIMER_BUILD_COMPACTHEIGHTFIELD;

    RC_TIMER_BUILD_CONTOURS           :: TIMER_BUILD_CONTOURS;

    RC_TIMER_BUILD_CONTOURS_TRACE     :: TIMER_BUILD_CONTOURS_TRACE;

    RC_TIMER_BUILD_CONTOURS_SIMPLIFY  :: TIMER_BUILD_CONTOURS_SIMPLIFY;

    RC_TIMER_FILTER_BORDER            :: TIMER_FILTER_BORDER;

    RC_TIMER_FILTER_WALKABLE          :: TIMER_FILTER_WALKABLE;

    RC_TIMER_MEDIAN_AREA              :: TIMER_MEDIAN_AREA;

    RC_TIMER_FILTER_LOW_OBSTACLES     :: TIMER_FILTER_LOW_OBSTACLES;

    RC_TIMER_BUILD_POLYMESH           :: TIMER_BUILD_POLYMESH;

    RC_TIMER_MERGE_POLYMESH           :: TIMER_MERGE_POLYMESH;

    RC_TIMER_ERODE_AREA               :: TIMER_ERODE_AREA;

    RC_TIMER_MARK_BOX_AREA            :: TIMER_MARK_BOX_AREA;

    RC_TIMER_MARK_CYLINDER_AREA       :: TIMER_MARK_CYLINDER_AREA;

    RC_TIMER_MARK_CONVEXPOLY_AREA     :: TIMER_MARK_CONVEXPOLY_AREA;

    RC_TIMER_BUILD_DISTANCEFIELD      :: TIMER_BUILD_DISTANCEFIELD;

    RC_TIMER_BUILD_DISTANCEFIELD_DIST :: TIMER_BUILD_DISTANCEFIELD_DIST;

    RC_TIMER_BUILD_DISTANCEFIELD_BLUR :: TIMER_BUILD_DISTANCEFIELD_BLUR;

    RC_TIMER_BUILD_REGIONS            :: TIMER_BUILD_REGIONS;

    RC_TIMER_BUILD_REGIONS_WATERSHED  :: TIMER_BUILD_REGIONS_WATERSHED;

    RC_TIMER_BUILD_REGIONS_EXPAND     :: TIMER_BUILD_REGIONS_EXPAND;

    RC_TIMER_BUILD_REGIONS_FLOOD      :: TIMER_BUILD_REGIONS_FLOOD;

    RC_TIMER_BUILD_REGIONS_FILTER     :: TIMER_BUILD_REGIONS_FILTER;

    RC_TIMER_BUILD_LAYERS             :: TIMER_BUILD_LAYERS;

    RC_TIMER_BUILD_POLYMESHDETAIL     :: TIMER_BUILD_POLYMESHDETAIL;

    RC_TIMER_MERGE_POLYMESHDETAIL     :: TIMER_MERGE_POLYMESHDETAIL;

    RC_MAX_TIMERS                     :: MAX_TIMERS;
}

/// Provides an interface for optional logging and performance tracking of the Recast
/// build process.
///
/// This class does not provide logging or timer functionality on its
/// own.  Both must be provided by a concrete implementation
/// by overriding the protected member functions.  Also, this class does not
/// provide an interface for extracting log messages. (Only adding them.)
/// So concrete implementations must provide one.
///
/// If no logging or timers are required, just pass an instance of this
/// class through the Recast build process.
///
/// @ingroup recast
rcContext :: struct {
    vtable: *rcContext_VTable;
    /// Constructor.
    ///  @param[in]		state	TRUE if the logging and performance timers should be enabled.  [Default: true]
    Constructor :: (this: *rcContext, state := true) -> void #cpp_method #foreign lib/windows/debugutils "??0rcContext@@QEAA@_N@Z";

    /// Enables or disables logging.
    ///  @param[in]		state	TRUE if logging should be enabled.
    enableLog :: (this: *rcContext, state: bool) -> void #cpp_method #foreign lib/windows/debugutils "?enableLog@rcContext@@QEAAX_N@Z";

    /// Clears all log entries.
    resetLog :: (this: *rcContext) -> void #cpp_method #foreign lib/windows/debugutils "?resetLog@rcContext@@QEAAXXZ";

    /// Logs a message.
    ///
    /// Example:
    /// @code
    /// // Where ctx is an instance of rcContext and filepath is a char array.
    /// ctx->log(RC_LOG_ERROR, "buildTiledNavigation: Could not load '%s'", filepath);
    /// @endcode
    ///
    /// @param[in]		category	The category of the message.
    /// @param[in]		format		The message.
    log_CFormat :: (this: *rcContext, category: rcLogCategory, format: *u8, __args: ..Any) -> void #cpp_method #foreign lib/windows/debugutils "?log@rcContext@@QEAAXW4rcLogCategory@@PEBDZZ";
    log :: (this: *rcContext, category: rcLogCategory, format: string, __args: ..Any) {
        push_allocator(temp);
        formatted_text_builder: String_Builder;
        print_to_builder(*formatted_text_builder, format, ..__args);
        append(*formatted_text_builder, "\0");
        formatted_text := builder_to_string(*formatted_text_builder);
        log_CFormat(this, category, "%s", formatted_text.data);
    } @PrintLike

    /// Enables or disables the performance timers.
    ///  @param[in]		state	TRUE if timers should be enabled.
    enableTimer :: (this: *rcContext, state: bool) -> void #cpp_method #foreign lib/windows/debugutils "?enableTimer@rcContext@@QEAAX_N@Z";

    /// Clears all performance timers. (Resets all to unused.)
    resetTimers :: (this: *rcContext) -> void #cpp_method #foreign lib/windows/debugutils "?resetTimers@rcContext@@QEAAXXZ";

    /// Starts the specified performance timer.
    /// @param	label	The category of the timer.
    startTimer :: (this: *rcContext, label: rcTimerLabel) -> void #cpp_method #foreign lib/windows/debugutils "?startTimer@rcContext@@QEAAXW4rcTimerLabel@@@Z";

    /// Stops the specified performance timer.
    /// @param	label	The category of the timer.
    stopTimer :: (this: *rcContext, label: rcTimerLabel) -> void #cpp_method #foreign lib/windows/debugutils "?stopTimer@rcContext@@QEAAXW4rcTimerLabel@@@Z";

    /// Returns the total accumulated time of the specified performance timer.
    /// @param	label	The category of the timer.
    /// @return The accumulated time of the timer, or -1 if timers are disabled or the timer has never been started.
    getAccumulatedTime :: (this: *rcContext, label: rcTimerLabel) -> s32 #cpp_method #foreign lib/windows/debugutils "?getAccumulatedTime@rcContext@@QEBAHW4rcTimerLabel@@@Z";

    /// True if logging is enabled.
    m_logEnabled:   bool;

    /// True if the performance timers are enabled.
    m_timerEnabled: bool;

    // Virtual functions:
    // Normally you should call them via the vtable.
    // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
    // or need to create a vtable yourself.

    virtual_Destructor :: (this: *rcContext, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign lib/windows/debugutils "??1rcContext@@UEAA@XZ";

    /// Clears all log entries.
    virtual_doResetLog :: (this: *rcContext) -> void #cpp_method #foreign lib/windows/debugutils "?doResetLog@rcContext@@MEAAXXZ";

    /// Logs a message.
    /// @param[in]		category	The category of the message.
    /// @param[in]		msg			The formatted message.
    /// @param[in]		len			The length of the formatted message.
    virtual_doLog :: (this: *rcContext, category: rcLogCategory, msg: *u8, len: s32) -> void #cpp_method #foreign lib/windows/debugutils "?doLog@rcContext@@MEAAXW4rcLogCategory@@PEBDH@Z";

    /// Clears all timers. (Resets all to unused.)
    virtual_doResetTimers :: (this: *rcContext) -> void #cpp_method #foreign lib/windows/debugutils "?doResetTimers@rcContext@@MEAAXXZ";

    /// Starts the specified performance timer.
    /// @param[in]		label	The category of timer.
    virtual_doStartTimer :: (this: *rcContext, label: rcTimerLabel) -> void #cpp_method #foreign lib/windows/debugutils "?doStartTimer@rcContext@@MEAAXW4rcTimerLabel@@@Z";

    /// Stops the specified performance timer.
    /// @param[in]		label	The category of the timer.
    virtual_doStopTimer :: (this: *rcContext, label: rcTimerLabel) -> void #cpp_method #foreign lib/windows/debugutils "?doStopTimer@rcContext@@MEAAXW4rcTimerLabel@@@Z";

    /// Returns the total accumulated time of the specified performance timer.
    /// @param[in]		label	The category of the timer.
    /// @return The accumulated time of the timer, or -1 if timers are disabled or the timer has never been started.
    virtual_doGetAccumulatedTime :: (this: *rcContext, label: rcTimerLabel) -> s32 #cpp_method #foreign lib/windows/debugutils "?doGetAccumulatedTime@rcContext@@MEBAHW4rcTimerLabel@@@Z";
}
rcContext_VTable :: struct #type_info_none {
    Destructor: (this: *rcContext, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

    doResetLog: (this: *rcContext) -> void #cpp_method;

    doLog: (this: *rcContext, category: rcLogCategory, msg: *u8, len: s32) -> void #cpp_method;

    doResetTimers: (this: *rcContext) -> void #cpp_method;

    doStartTimer: (this: *rcContext, label: rcTimerLabel) -> void #cpp_method;

    doStopTimer: (this: *rcContext, label: rcTimerLabel) -> void #cpp_method;

    doGetAccumulatedTime: (this: *rcContext, label: rcTimerLabel) -> s32 #cpp_method;
}

rcContext_Destructor :: inline (this: *rcContext, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

rcContext_doResetLog :: inline (this: *rcContext) { this.vtable.doResetLog(this); }

rcContext_doLog :: inline (this: *rcContext, category: rcLogCategory, msg: *u8, len: s32) { this.vtable.doLog(this, category, msg, len); }

rcContext_doResetTimers :: inline (this: *rcContext) { this.vtable.doResetTimers(this); }

rcContext_doStartTimer :: inline (this: *rcContext, label: rcTimerLabel) { this.vtable.doStartTimer(this, label); }

rcContext_doStopTimer :: inline (this: *rcContext, label: rcTimerLabel) { this.vtable.doStopTimer(this, label); }

rcContext_doGetAccumulatedTime :: inline (this: *rcContext, label: rcTimerLabel) -> s32 { return this.vtable.doGetAccumulatedTime(this, label); }

vtable :: (obj: *rcContext) -> *rcContext_VTable { return obj.vtable; }


/// A helper to first start a timer and then stop it when this helper goes out of scope.
/// @see rcContext
rcScopedTimer :: struct {
    /// Constructs an instance and starts the timer.
    ///  @param[in]		ctx		The context to use.
    ///  @param[in]		label	The category of the timer.
    Constructor :: (this: *rcScopedTimer, ctx: *rcContext, label: rcTimerLabel) -> void #cpp_method #foreign lib/windows/debugutils "??0rcScopedTimer@@QEAA@PEAVrcContext@@W4rcTimerLabel@@@Z";
    Destructor :: (this: *rcScopedTimer) -> void #cpp_method #foreign lib/windows/debugutils "??1rcScopedTimer@@QEAA@XZ";

    m_ctx:   *rcContext;
    m_label: rcTimerLabel;
}

/// Specifies a configuration to use when performing Recast builds.
/// @ingroup recast
rcConfig :: struct {
    /// The width of the field along the x-axis. [Limit: >= 0] [Units: vx]
    width:                  s32;

    /// The height of the field along the z-axis. [Limit: >= 0] [Units: vx]
    height:                 s32;

    /// The width/height size of tile's on the xz-plane. [Limit: >= 0] [Units: vx]
    tileSize:               s32;

    /// The size of the non-navigable border around the heightfield. [Limit: >=0] [Units: vx]
    borderSize:             s32;

    /// The xz-plane cell size to use for fields. [Limit: > 0] [Units: wu]
    cs:                     float;

    /// The y-axis cell size to use for fields. [Limit: > 0] [Units: wu]
    ch:                     float;

    /// The minimum bounds of the field's AABB. [(x, y, z)] [Units: wu]
    bmin:                   [3] float;

    /// The maximum bounds of the field's AABB. [(x, y, z)] [Units: wu]
    bmax:                   [3] float;

    /// The maximum slope that is considered walkable. [Limits: 0 <= value < 90] [Units: Degrees]
    walkableSlopeAngle:     float;

    /// Minimum floor to 'ceiling' height that will still allow the floor area to
    /// be considered walkable. [Limit: >= 3] [Units: vx]
    walkableHeight:         s32;

    /// Maximum ledge height that is considered to still be traversable. [Limit: >=0] [Units: vx]
    walkableClimb:          s32;

    /// The distance to erode/shrink the walkable area of the heightfield away from
    /// obstructions.  [Limit: >=0] [Units: vx]
    walkableRadius:         s32;

    /// The maximum allowed length for contour edges along the border of the mesh. [Limit: >=0] [Units: vx]
    maxEdgeLen:             s32;

    /// The maximum distance a simplified contour's border edges should deviate
    /// the original raw contour. [Limit: >=0] [Units: vx]
    maxSimplificationError: float;

    /// The minimum number of cells allowed to form isolated island areas. [Limit: >=0] [Units: vx]
    minRegionArea:          s32;

    /// Any regions with a span count smaller than this value will, if possible,
    /// be merged with larger regions. [Limit: >=0] [Units: vx]
    mergeRegionArea:        s32;

    /// The maximum number of vertices allowed for polygons generated during the
    /// contour to polygon conversion process. [Limit: >= 3]
    maxVertsPerPoly:        s32;

    /// Sets the sampling distance to use when generating the detail mesh.
    /// (For height detail only.) [Limits: 0 or >= 0.9] [Units: wu]
    detailSampleDist:       float;

    /// The maximum distance the detail mesh surface should deviate from heightfield
    /// data. (For height detail only.) [Limit: >=0] [Units: wu]
    detailSampleMaxError:   float;
}

/// Defines the number of bits allocated to rcSpan::smin and rcSpan::smax.
RC_SPAN_HEIGHT_BITS: s32 : 13;

/// Defines the maximum value for rcSpan::smin and rcSpan::smax.
RC_SPAN_MAX_HEIGHT: s32 : (1 << RC_SPAN_HEIGHT_BITS) - 1;

/// The number of spans allocated per span spool.
/// @see rcSpanPool
RC_SPANS_PER_POOL: s32 : 2048;

/// Represents a span in a heightfield.
/// @see rcHeightfield
rcSpan :: struct {
    smin: u32; ///< The lower limit of the span. [Limit: < #smax]
    #place smin; /*bitfield 13*/ smax: u32; ///< The upper limit of the span. [Limit: <= #RC_SPAN_MAX_HEIGHT]
    #place smin; /*bitfield 26*/ area: u32; ///< The area id assigned to the span.
    next: *rcSpan; ///< The next span higher up in column.
}

/// A memory pool used for quick allocation of spans within a heightfield.
/// @see rcHeightfield
rcSpanPool :: struct {
    next:  *rcSpanPool; ///< The next span pool.
    items: [2048] rcSpan; ///< Array of spans in the pool.
}

/// A dynamic heightfield representing obstructed space.
/// @ingroup recast
rcHeightfield :: struct {
    width:    s32; ///< The width of the heightfield. (Along the x-axis in cell units.)
    height:   s32; ///< The height of the heightfield. (Along the z-axis in cell units.)
    bmin:     [3] float; ///< The minimum bounds in world space. [(x, y, z)]
    bmax:     [3] float; ///< The maximum bounds in world space. [(x, y, z)]
    cs:       float; ///< The size of each cell. (On the xz-plane.)
    ch:       float; ///< The height of each cell. (The minimum increment along the y-axis.)
    spans:    **rcSpan; ///< Heightfield of spans (width*height).

    pools:    *rcSpanPool; ///< Linked list of span pools.
    freelist: *rcSpan; ///< The next free span.
}

/// Provides information on the content of a cell column in a compact heightfield.
rcCompactCell :: struct {
    index: u32; ///< Index to the first span in the column.
    #place index; /*bitfield 24*/ count: u32; ///< Number of spans in the column.
}

/// Represents a span of unobstructed space within a compact heightfield.
rcCompactSpan :: struct {
    y:   u16; ///< The lower extent of the span. (Measured from the heightfield's base.)
    reg: u16; ///< The id of the region the span belongs to. (Or zero if not in a region.)
    con: u32; ///< Packed neighbor connection data.
    #place con; /*bitfield 24*/ h:   u32; ///< The height of the span.  (Measured from #y.)
}

/// A compact, static heightfield representing unobstructed space.
/// @ingroup recast
rcCompactHeightfield :: struct {
    width:          s32; ///< The width of the heightfield. (Along the x-axis in cell units.)
    height:         s32; ///< The height of the heightfield. (Along the z-axis in cell units.)
    spanCount:      s32; ///< The number of spans in the heightfield.
    walkableHeight: s32; ///< The walkable height used during the build of the field.  (See: rcConfig::walkableHeight)
    walkableClimb:  s32; ///< The walkable climb used during the build of the field. (See: rcConfig::walkableClimb)
    borderSize:     s32; ///< The AABB border size used during the build of the field. (See: rcConfig::borderSize)
    maxDistance:    u16; ///< The maximum distance value of any span within the field.
    maxRegions:     u16; ///< The maximum region id of any span within the field.
    bmin:           [3] float; ///< The minimum bounds in world space. [(x, y, z)]
    bmax:           [3] float; ///< The maximum bounds in world space. [(x, y, z)]
    cs:             float; ///< The size of each cell. (On the xz-plane.)
    ch:             float; ///< The height of each cell. (The minimum increment along the y-axis.)
    cells:          *rcCompactCell; ///< Array of cells. [Size: #width*#height]
    spans:          *rcCompactSpan; ///< Array of spans. [Size: #spanCount]
    dist:           *u16; ///< Array containing border distance data. [Size: #spanCount]
    areas:          *u8; ///< Array containing area id data. [Size: #spanCount]
}

/// Represents a heightfield layer within a layer set.
/// @see rcHeightfieldLayerSet
rcHeightfieldLayer :: struct {
    bmin:    [3] float; ///< The minimum bounds in world space. [(x, y, z)]
    bmax:    [3] float; ///< The maximum bounds in world space. [(x, y, z)]
    cs:      float; ///< The size of each cell. (On the xz-plane.)
    ch:      float; ///< The height of each cell. (The minimum increment along the y-axis.)
    width:   s32; ///< The width of the heightfield. (Along the x-axis in cell units.)
    height:  s32; ///< The height of the heightfield. (Along the z-axis in cell units.)
    minx:    s32; ///< The minimum x-bounds of usable data.
    maxx:    s32; ///< The maximum x-bounds of usable data.
    miny:    s32; ///< The minimum y-bounds of usable data. (Along the z-axis.)
    maxy:    s32; ///< The maximum y-bounds of usable data. (Along the z-axis.)
    hmin:    s32; ///< The minimum height bounds of usable data. (Along the y-axis.)
    hmax:    s32; ///< The maximum height bounds of usable data. (Along the y-axis.)
    heights: *u8; ///< The heightfield. [Size: width * height]
    areas:   *u8; ///< Area ids. [Size: Same as #heights]
    cons:    *u8; ///< Packed neighbor connection information. [Size: Same as #heights]
}

/// Represents a set of heightfield layers.
/// @ingroup recast
/// @see rcAllocHeightfieldLayerSet, rcFreeHeightfieldLayerSet
rcHeightfieldLayerSet :: struct {
    layers:  *rcHeightfieldLayer; ///< The layers in the set. [Size: #nlayers]
    nlayers: s32; ///< The number of layers in the set.
}

/// Represents a simple, non-overlapping contour in field space.
rcContour :: struct {
    verts:   *s32; ///< Simplified contour vertex and connection data. [Size: 4 * #nverts]
    nverts:  s32; ///< The number of vertices in the simplified contour.
    rverts:  *s32; ///< Raw contour vertex and connection data. [Size: 4 * #nrverts]
    nrverts: s32; ///< The number of vertices in the raw contour.
    reg:     u16; ///< The region id of the contour.
    area:    u8; ///< The area id of the contour.
}

/// Represents a group of related contours.
/// @ingroup recast
rcContourSet :: struct {
    conts:      *rcContour; ///< An array of the contours in the set. [Size: #nconts]
    nconts:     s32; ///< The number of contours in the set.
    bmin:       [3] float; ///< The minimum bounds in world space. [(x, y, z)]
    bmax:       [3] float; ///< The maximum bounds in world space. [(x, y, z)]
    cs:         float; ///< The size of each cell. (On the xz-plane.)
    ch:         float; ///< The height of each cell. (The minimum increment along the y-axis.)
    width:      s32; ///< The width of the set. (Along the x-axis in cell units.)
    height:     s32; ///< The height of the set. (Along the z-axis in cell units.)
    borderSize: s32; ///< The AABB border size used to generate the source data from which the contours were derived.
    maxError:   float; ///< The max edge error that this contour set was simplified with.
}

/// Represents a polygon mesh suitable for use in building a navigation mesh.
/// @ingroup recast
rcPolyMesh :: struct {
    verts:        *u16; ///< The mesh vertices. [Form: (x, y, z) * #nverts]
    polys:        *u16; ///< Polygon and neighbor data. [Length: #maxpolys * 2 * #nvp]
    regs:         *u16; ///< The region id assigned to each polygon. [Length: #maxpolys]
    flags:        *u16; ///< The user defined flags for each polygon. [Length: #maxpolys]
    areas:        *u8; ///< The area id assigned to each polygon. [Length: #maxpolys]
    nverts:       s32; ///< The number of vertices.
    npolys:       s32; ///< The number of polygons.
    maxpolys:     s32; ///< The number of allocated polygons.
    nvp:          s32; ///< The maximum number of vertices per polygon.
    bmin:         [3] float; ///< The minimum bounds in world space. [(x, y, z)]
    bmax:         [3] float; ///< The maximum bounds in world space. [(x, y, z)]
    cs:           float; ///< The size of each cell. (On the xz-plane.)
    ch:           float; ///< The height of each cell. (The minimum increment along the y-axis.)
    borderSize:   s32; ///< The AABB border size used to generate the source data from which the mesh was derived.
    maxEdgeError: float; ///< The max error of the polygon edges in the mesh.
}

/// Contains triangle meshes that represent detailed height data associated
/// with the polygons in its associated polygon mesh object.
/// @ingroup recast
rcPolyMeshDetail :: struct {
    meshes:  *u32; ///< The sub-mesh data. [Size: 4*#nmeshes]
    verts:   *float; ///< The mesh vertices. [Size: 3*#nverts]
    tris:    *u8; ///< The mesh triangles. [Size: 4*#ntris]
    nmeshes: s32; ///< The number of sub-meshes defined by #meshes.
    nverts:  s32; ///< The number of vertices in #verts.
    ntris:   s32; ///< The number of triangles in #tris.
}

/// Allocates a heightfield object using the Recast allocator.
/// @return A heightfield that is ready for initialization, or null on failure.
/// @ingroup recast
/// @see rcCreateHeightfield, rcFreeHeightField
rcAllocHeightfield :: () -> *rcHeightfield #foreign lib/windows/debugutils "?rcAllocHeightfield@@YAPEAUrcHeightfield@@XZ";

/// Frees the specified heightfield object using the Recast allocator.
/// @param[in]		heightfield	A heightfield allocated using #rcAllocHeightfield
/// @ingroup recast
/// @see rcAllocHeightfield
rcFreeHeightField :: (heightfield: *rcHeightfield) -> void #foreign lib/windows/debugutils "?rcFreeHeightField@@YAXPEAUrcHeightfield@@@Z";

/// Allocates a compact heightfield object using the Recast allocator.
/// @return A compact heightfield that is ready for initialization, or null on failure.
/// @ingroup recast
/// @see rcBuildCompactHeightfield, rcFreeCompactHeightfield
rcAllocCompactHeightfield :: () -> *rcCompactHeightfield #foreign lib/windows/debugutils "?rcAllocCompactHeightfield@@YAPEAUrcCompactHeightfield@@XZ";

/// Frees the specified compact heightfield object using the Recast allocator.
/// @param[in]		compactHeightfield		A compact heightfield allocated using #rcAllocCompactHeightfield
/// @ingroup recast
/// @see rcAllocCompactHeightfield
rcFreeCompactHeightfield :: (compactHeightfield: *rcCompactHeightfield) -> void #foreign lib/windows/debugutils "?rcFreeCompactHeightfield@@YAXPEAUrcCompactHeightfield@@@Z";

/// Allocates a heightfield layer set using the Recast allocator.
/// @return A heightfield layer set that is ready for initialization, or null on failure.
/// @ingroup recast
/// @see rcBuildHeightfieldLayers, rcFreeHeightfieldLayerSet
rcAllocHeightfieldLayerSet :: () -> *rcHeightfieldLayerSet #foreign lib/windows/debugutils "?rcAllocHeightfieldLayerSet@@YAPEAUrcHeightfieldLayerSet@@XZ";

/// Frees the specified heightfield layer set using the Recast allocator.
/// @param[in]		layerSet	A heightfield layer set allocated using #rcAllocHeightfieldLayerSet
/// @ingroup recast
/// @see rcAllocHeightfieldLayerSet
rcFreeHeightfieldLayerSet :: (layerSet: *rcHeightfieldLayerSet) -> void #foreign lib/windows/debugutils "?rcFreeHeightfieldLayerSet@@YAXPEAUrcHeightfieldLayerSet@@@Z";

/// Allocates a contour set object using the Recast allocator.
/// @return A contour set that is ready for initialization, or null on failure.
/// @ingroup recast
/// @see rcBuildContours, rcFreeContourSet
rcAllocContourSet :: () -> *rcContourSet #foreign lib/windows/debugutils "?rcAllocContourSet@@YAPEAUrcContourSet@@XZ";

/// Frees the specified contour set using the Recast allocator.
/// @param[in]		contourSet	A contour set allocated using #rcAllocContourSet
/// @ingroup recast
/// @see rcAllocContourSet
rcFreeContourSet :: (contourSet: *rcContourSet) -> void #foreign lib/windows/debugutils "?rcFreeContourSet@@YAXPEAUrcContourSet@@@Z";

/// Allocates a polygon mesh object using the Recast allocator.
/// @return A polygon mesh that is ready for initialization, or null on failure.
/// @ingroup recast
/// @see rcBuildPolyMesh, rcFreePolyMesh
rcAllocPolyMesh :: () -> *rcPolyMesh #foreign lib/windows/debugutils "?rcAllocPolyMesh@@YAPEAUrcPolyMesh@@XZ";

/// Frees the specified polygon mesh using the Recast allocator.
/// @param[in]		polyMesh	A polygon mesh allocated using #rcAllocPolyMesh
/// @ingroup recast
/// @see rcAllocPolyMesh
rcFreePolyMesh :: (polyMesh: *rcPolyMesh) -> void #foreign lib/windows/debugutils "?rcFreePolyMesh@@YAXPEAUrcPolyMesh@@@Z";

/// Allocates a detail mesh object using the Recast allocator.
/// @return A detail mesh that is ready for initialization, or null on failure.
/// @ingroup recast
/// @see rcBuildPolyMeshDetail, rcFreePolyMeshDetail
rcAllocPolyMeshDetail :: () -> *rcPolyMeshDetail #foreign lib/windows/debugutils "?rcAllocPolyMeshDetail@@YAPEAUrcPolyMeshDetail@@XZ";

/// Frees the specified detail mesh using the Recast allocator.
/// @param[in]		detailMesh	A detail mesh allocated using #rcAllocPolyMeshDetail
/// @ingroup recast
/// @see rcAllocPolyMeshDetail
rcFreePolyMeshDetail :: (detailMesh: *rcPolyMeshDetail) -> void #foreign lib/windows/debugutils "?rcFreePolyMeshDetail@@YAXPEAUrcPolyMeshDetail@@@Z";

/// Heightfield border flag.
/// If a heightfield region ID has this bit set, then the region is a border
/// region and its spans are considered un-walkable.
/// (Used during the region and contour build process.)
/// @see rcCompactSpan::reg
RC_BORDER_REG: u16 : 32768;

/// Polygon touches multiple regions.
/// If a polygon has this region ID it was merged with or created
/// from polygons of different regions during the polymesh
/// build step that removes redundant border vertices.
/// (Used during the polymesh and detail polymesh build processes)
/// @see rcPolyMesh::regs
RC_MULTIPLE_REGS: u16 : 0;

/// Border vertex flag.
/// If a region ID has this bit set, then the associated element lies on
/// a tile border. If a contour vertex's region ID has this bit set, the
/// vertex will later be removed in order to match the segments and vertices
/// at tile boundaries.
/// (Used during the build process.)
/// @see rcCompactSpan::reg, #rcContour::verts, #rcContour::rverts
RC_BORDER_VERTEX: s32 : 65536;

/// Area border flag.
/// If a region ID has this bit set, then the associated element lies on
/// the border of an area.
/// (Used during the region and contour build process.)
/// @see rcCompactSpan::reg, #rcContour::verts, #rcContour::rverts
RC_AREA_BORDER: s32 : 131072;

/// Contour build flags.
/// @see rcBuildContours
rcBuildContoursFlags :: enum s32 {
    WALL_EDGES :: 1;
    AREA_EDGES :: 2;

    RC_CONTOUR_TESS_WALL_EDGES :: WALL_EDGES;
    RC_CONTOUR_TESS_AREA_EDGES :: AREA_EDGES;
}

/// Applied to the region id field of contour vertices in order to extract the region id.
/// The region id field of a vertex may have several flags applied to it.  So the
/// fields value can't be used directly.
/// @see rcContour::verts, rcContour::rverts
RC_CONTOUR_REG_MASK: s32 : 65535;

/// An value which indicates an invalid index within a mesh.
/// @note This does not necessarily indicate an error.
/// @see rcPolyMesh::polys
RC_MESH_NULL_IDX: u16 : 65535;

/// Represents the null area.
/// When a data element is given this value it is considered to no longer be
/// assigned to a usable area.  (E.g. It is un-walkable.)
RC_NULL_AREA: u8 : 0;

/// The default area id used to indicate a walkable polygon.
/// This is also the maximum allowed area id, and the only non-null area id
/// recognized by some steps in the build process.
RC_WALKABLE_AREA: u8 : 63;

/// The value returned by #rcGetCon if the specified direction is not connected
/// to another span. (Has no neighbor.)
RC_NOT_CONNECTED: s32 : 63;

/// Returns the square root of the value.
///  @param[in]		x	The value.
///  @return The square root of the vlaue.
rcSqrt :: (x: float) -> float #foreign lib/windows/debugutils "?rcSqrt@@YAMM@Z";

/// Derives the cross product of two vectors. (@p v1 x @p v2)
/// @param[out]		dest	The cross product. [(x, y, z)]
/// @param[in]		v1		A Vector [(x, y, z)]
/// @param[in]		v2		A vector [(x, y, z)]
rcVcross :: (dest: *float, v1: *float, v2: *float) -> void #foreign lib/windows/debugutils "?rcVcross@@YAXPEAMPEBM1@Z";

/// Derives the dot product of two vectors. (@p v1 . @p v2)
/// @param[in]		v1	A Vector [(x, y, z)]
/// @param[in]		v2	A vector [(x, y, z)]
/// @return The dot product.
rcVdot :: (v1: *float, v2: *float) -> float #foreign lib/windows/debugutils "?rcVdot@@YAMPEBM0@Z";

/// Performs a scaled vector addition. (@p v1 + (@p v2 * @p s))
/// @param[out]		dest	The result vector. [(x, y, z)]
/// @param[in]		v1		The base vector. [(x, y, z)]
/// @param[in]		v2		The vector to scale and add to @p v1. [(x, y, z)]
/// @param[in]		s		The amount to scale @p v2 by before adding to @p v1.
rcVmad :: (dest: *float, v1: *float, v2: *float, s: float) -> void #foreign lib/windows/debugutils "?rcVmad@@YAXPEAMPEBM1M@Z";

/// Performs a vector addition. (@p v1 + @p v2)
/// @param[out]		dest	The result vector. [(x, y, z)]
/// @param[in]		v1		The base vector. [(x, y, z)]
/// @param[in]		v2		The vector to add to @p v1. [(x, y, z)]
rcVadd :: (dest: *float, v1: *float, v2: *float) -> void #foreign lib/windows/debugutils "?rcVadd@@YAXPEAMPEBM1@Z";

/// Performs a vector subtraction. (@p v1 - @p v2)
/// @param[out]		dest	The result vector. [(x, y, z)]
/// @param[in]		v1		The base vector. [(x, y, z)]
/// @param[in]		v2		The vector to subtract from @p v1. [(x, y, z)]
rcVsub :: (dest: *float, v1: *float, v2: *float) -> void #foreign lib/windows/debugutils "?rcVsub@@YAXPEAMPEBM1@Z";

/// Selects the minimum value of each element from the specified vectors.
/// @param[in,out]	mn	A vector.  (Will be updated with the result.) [(x, y, z)]
/// @param[in]		v	A vector. [(x, y, z)]
rcVmin :: (mn: *float, v: *float) -> void #foreign lib/windows/debugutils "?rcVmin@@YAXPEAMPEBM@Z";

/// Selects the maximum value of each element from the specified vectors.
/// @param[in,out]	mx	A vector.  (Will be updated with the result.) [(x, y, z)]
/// @param[in]		v	A vector. [(x, y, z)]
rcVmax :: (mx: *float, v: *float) -> void #foreign lib/windows/debugutils "?rcVmax@@YAXPEAMPEBM@Z";

/// Performs a vector copy.
/// @param[out]		dest	The result. [(x, y, z)]
/// @param[in]		v		The vector to copy. [(x, y, z)]
rcVcopy :: (dest: *float, v: *float) -> void #foreign lib/windows/debugutils "?rcVcopy@@YAXPEAMPEBM@Z";

/// Returns the distance between two points.
/// @param[in]		v1	A point. [(x, y, z)]
/// @param[in]		v2	A point. [(x, y, z)]
/// @return The distance between the two points.
rcVdist :: (v1: *float, v2: *float) -> float #foreign lib/windows/debugutils "?rcVdist@@YAMPEBM0@Z";

/// Returns the square of the distance between two points.
/// @param[in]		v1	A point. [(x, y, z)]
/// @param[in]		v2	A point. [(x, y, z)]
/// @return The square of the distance between the two points.
rcVdistSqr :: (v1: *float, v2: *float) -> float #foreign lib/windows/debugutils "?rcVdistSqr@@YAMPEBM0@Z";

/// Normalizes the vector.
/// @param[in,out]	v	The vector to normalize. [(x, y, z)]
rcVnormalize :: (v: *float) -> void #foreign lib/windows/debugutils "?rcVnormalize@@YAXPEAM@Z";

/// Calculates the bounding box of an array of vertices.
/// @ingroup recast
/// @param[in]		verts		An array of vertices. [(x, y, z) * @p nv]
/// @param[in]		numVerts	The number of vertices in the @p verts array.
/// @param[out]		minBounds	The minimum bounds of the AABB. [(x, y, z)] [Units: wu]
/// @param[out]		maxBounds	The maximum bounds of the AABB. [(x, y, z)] [Units: wu]
rcCalcBounds :: (verts: *float, numVerts: s32, minBounds: *float, maxBounds: *float) -> void #foreign lib/windows/debugutils "?rcCalcBounds@@YAXPEBMHPEAM1@Z";

/// Calculates the grid size based on the bounding box and grid cell size.
/// @ingroup recast
/// @param[in]		minBounds	The minimum bounds of the AABB. [(x, y, z)] [Units: wu]
/// @param[in]		maxBounds	The maximum bounds of the AABB. [(x, y, z)] [Units: wu]
/// @param[in]		cellSize	The xz-plane cell size. [Limit: > 0] [Units: wu]
/// @param[out]		sizeX		The width along the x-axis. [Limit: >= 0] [Units: vx]
/// @param[out]		sizeZ		The height along the z-axis. [Limit: >= 0] [Units: vx]
rcCalcGridSize :: (minBounds: *float, maxBounds: *float, cellSize: float, sizeX: *s32, sizeZ: *s32) -> void #foreign lib/windows/debugutils "?rcCalcGridSize@@YAXPEBM0MPEAH1@Z";

/// Initializes a new heightfield.
/// See the #rcConfig documentation for more information on the configuration parameters.
///
/// @see rcAllocHeightfield, rcHeightfield
/// @ingroup recast
///
/// @param[in,out]	context		The build context to use during the operation.
/// @param[in,out]	heightfield	The allocated heightfield to initialize.
/// @param[in]		sizeX		The width of the field along the x-axis. [Limit: >= 0] [Units: vx]
/// @param[in]		sizeZ		The height of the field along the z-axis. [Limit: >= 0] [Units: vx]
/// @param[in]		minBounds	The minimum bounds of the field's AABB. [(x, y, z)] [Units: wu]
/// @param[in]		maxBounds	The maximum bounds of the field's AABB. [(x, y, z)] [Units: wu]
/// @param[in]		cellSize	The xz-plane cell size to use for the field. [Limit: > 0] [Units: wu]
/// @param[in]		cellHeight	The y-axis cell size to use for field. [Limit: > 0] [Units: wu]
/// @returns True if the operation completed successfully.
rcCreateHeightfield :: (_context: *rcContext, heightfield: *rcHeightfield, sizeX: s32, sizeZ: s32, minBounds: *float, maxBounds: *float, cellSize: float, cellHeight: float) -> bool #foreign lib/windows/debugutils "?rcCreateHeightfield@@YA_NPEAVrcContext@@AEAUrcHeightfield@@HHPEBM2MM@Z";

/// Sets the area id of all triangles with a slope below the specified value
/// to #RC_WALKABLE_AREA.
///
/// Only sets the area id's for the walkable triangles.  Does not alter the
/// area id's for un-walkable triangles.
///
/// See the #rcConfig documentation for more information on the configuration parameters.
///
/// @see rcHeightfield, rcClearUnwalkableTriangles, rcRasterizeTriangles
///
/// @ingroup recast
/// @param[in,out]	context				The build context to use during the operation.
/// @param[in]		walkableSlopeAngle	The maximum slope that is considered walkable.
/// 									[Limits: 0 <= value < 90] [Units: Degrees]
/// @param[in]		verts				The vertices. [(x, y, z) * @p nv]
/// @param[in]		numVerts			The number of vertices.
/// @param[in]		tris				The triangle vertex indices. [(vertA, vertB, vertC) * @p nt]
/// @param[in]		numTris				The number of triangles.
/// @param[out]		triAreaIDs			The triangle area ids. [Length: >= @p nt]
rcMarkWalkableTriangles :: (_context: *rcContext, walkableSlopeAngle: float, verts: *float, numVerts: s32, tris: *s32, numTris: s32, triAreaIDs: *u8) -> void #foreign lib/windows/debugutils "?rcMarkWalkableTriangles@@YAXPEAVrcContext@@MPEBMHPEBHHPEAE@Z";

/// Sets the area id of all triangles with a slope greater than or equal to the specified value to #RC_NULL_AREA.
///
/// Only sets the area id's for the un-walkable triangles.  Does not alter the
/// area id's for walkable triangles.
///
/// See the #rcConfig documentation for more information on the configuration parameters.
///
/// @see rcHeightfield, rcClearUnwalkableTriangles, rcRasterizeTriangles
///
/// @ingroup recast
/// @param[in,out]	context				The build context to use during the operation.
/// @param[in]		walkableSlopeAngle	The maximum slope that is considered walkable.
/// 									[Limits: 0 <= value < 90] [Units: Degrees]
/// @param[in]		verts				The vertices. [(x, y, z) * @p nv]
/// @param[in]		numVerts			The number of vertices.
/// @param[in]		tris				The triangle vertex indices. [(vertA, vertB, vertC) * @p nt]
/// @param[in]		numTris				The number of triangles.
/// @param[out]		triAreaIDs			The triangle area ids. [Length: >= @p nt]
rcClearUnwalkableTriangles :: (_context: *rcContext, walkableSlopeAngle: float, verts: *float, numVerts: s32, tris: *s32, numTris: s32, triAreaIDs: *u8) -> void #foreign lib/windows/debugutils "?rcClearUnwalkableTriangles@@YAXPEAVrcContext@@MPEBMHPEBHHPEAE@Z";

/// Returns the number of spans contained in the specified heightfield.
///  @ingroup recast
///  @param[in,out]	context		The build context to use during the operation.
///  @param[in]		heightfield	An initialized heightfield.
///  @returns The number of spans in the heightfield.
rcGetHeightFieldSpanCount :: (_context: *rcContext, heightfield: *rcHeightfield) -> s32 #foreign lib/windows/debugutils "?rcGetHeightFieldSpanCount@@YAHPEAVrcContext@@AEBUrcHeightfield@@@Z";
rcGetHeightFieldSpanCount :: (_context: *rcContext, heightfield: rcHeightfield) -> s32 #no_context {
    return rcGetHeightFieldSpanCount(_context, *heightfield);
}

/// Builds a compact heightfield representing open space, from a heightfield representing solid space.
///
/// This is just the beginning of the process of fully building a compact heightfield.
/// Various filters may be applied, then the distance field and regions built.
/// E.g: #rcBuildDistanceField and #rcBuildRegions
///
/// See the #rcConfig documentation for more information on the configuration parameters.
///
/// @see rcAllocCompactHeightfield, rcHeightfield, rcCompactHeightfield, rcConfig
/// @ingroup recast
///
/// @param[in,out]	context				The build context to use during the operation.
/// @param[in]		walkableHeight		Minimum floor to 'ceiling' height that will still allow the floor area
/// 									to be considered walkable. [Limit: >= 3] [Units: vx]
/// @param[in]		walkableClimb		Maximum ledge height that is considered to still be traversable.
/// 									[Limit: >=0] [Units: vx]
/// @param[in]		heightfield			The heightfield to be compacted.
/// @param[out]		compactHeightfield	The resulting compact heightfield. (Must be pre-allocated.)
/// @returns True if the operation completed successfully.
rcBuildCompactHeightfield :: (_context: *rcContext, walkableHeight: s32, walkableClimb: s32, heightfield: *rcHeightfield, compactHeightfield: *rcCompactHeightfield) -> bool #foreign lib/windows/debugutils "?rcBuildCompactHeightfield@@YA_NPEAVrcContext@@HHAEBUrcHeightfield@@AEAUrcCompactHeightfield@@@Z";
rcBuildCompactHeightfield :: (_context: *rcContext, walkableHeight: s32, walkableClimb: s32, heightfield: rcHeightfield, compactHeightfield: *rcCompactHeightfield) -> bool #no_context {
    return rcBuildCompactHeightfield(_context, walkableHeight, walkableClimb, *heightfield, compactHeightfield);
}

duFileIO :: struct {
    vtable: *duFileIO_VTable;

    // Virtual functions:
    // Normally you should call them via the vtable.
    // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
    // or need to create a vtable yourself.
    virtual_Destructor :: (this: *duFileIO, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign lib/windows/debugutils "??1duFileIO@@UEAA@XZ";
}
duFileIO_VTable :: struct #type_info_none {
    Destructor: (this: *duFileIO, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
    isWriting: (this: *duFileIO) -> bool #cpp_method;
    isReading: (this: *duFileIO) -> bool #cpp_method;
    write: (this: *duFileIO, ptr: *void, size: u64) -> bool #cpp_method;
    read: (this: *duFileIO, ptr: *void, size: u64) -> bool #cpp_method;
}

duFileIO_Destructor :: inline (this: *duFileIO, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }
duFileIO_isWriting :: inline (this: *duFileIO) -> bool { return this.vtable.isWriting(this); }
duFileIO_isReading :: inline (this: *duFileIO) -> bool { return this.vtable.isReading(this); }
duFileIO_write :: inline (this: *duFileIO, ptr: *void, size: u64) -> bool { return this.vtable.write(this, ptr, size); }
duFileIO_read :: inline (this: *duFileIO, ptr: *void, size: u64) -> bool { return this.vtable.read(this, ptr, size); }

vtable :: (obj: *duFileIO) -> *duFileIO_VTable { return obj.vtable; }


duDumpPolyMeshToObj :: (pmesh: *rcPolyMesh, io: *duFileIO) -> bool #foreign lib/windows/debugutils "?duDumpPolyMeshToObj@@YA_NAEAUrcPolyMesh@@PEAUduFileIO@@@Z";
duDumpPolyMeshDetailToObj :: (dmesh: *rcPolyMeshDetail, io: *duFileIO) -> bool #foreign lib/windows/debugutils "?duDumpPolyMeshDetailToObj@@YA_NAEAUrcPolyMeshDetail@@PEAUduFileIO@@@Z";

duDumpContourSet :: (cset: *rcContourSet, io: *duFileIO) -> bool #foreign lib/windows/debugutils "?duDumpContourSet@@YA_NAEAUrcContourSet@@PEAUduFileIO@@@Z";
duReadContourSet :: (cset: *rcContourSet, io: *duFileIO) -> bool #foreign lib/windows/debugutils "?duReadContourSet@@YA_NAEAUrcContourSet@@PEAUduFileIO@@@Z";

duDumpCompactHeightfield :: (chf: *rcCompactHeightfield, io: *duFileIO) -> bool #foreign lib/windows/debugutils "?duDumpCompactHeightfield@@YA_NAEAUrcCompactHeightfield@@PEAUduFileIO@@@Z";
duReadCompactHeightfield :: (chf: *rcCompactHeightfield, io: *duFileIO) -> bool #foreign lib/windows/debugutils "?duReadCompactHeightfield@@YA_NAEAUrcCompactHeightfield@@PEAUduFileIO@@@Z";

duLogBuildTimes :: (ctx: *rcContext, totalTileUsec: s32) -> void #foreign lib/windows/debugutils "?duLogBuildTimes@@YAXAEAVrcContext@@H@Z";

#scope_file

#import "Basic"; // For assert, push_context

lib/windows/debugutils :: #library "./lib/windows/DebugUtils";

#run {
    assert(size_of(duDebugDraw) == 8, "duDebugDraw has size % instead of 8", size_of(duDebugDraw));

    {
        instance: duDisplayList;
        assert(((cast(*void)(*instance.m_pos)) - cast(*void)(*instance)) == 8, "duDisplayList.m_pos has unexpected offset % instead of 8", ((cast(*void)(*instance.m_pos)) - cast(*void)(*instance)));
        assert(size_of(type_of(duDisplayList.m_pos)) == 8, "duDisplayList.m_pos has unexpected size % instead of 8", size_of(type_of(duDisplayList.m_pos)));
        assert(((cast(*void)(*instance.m_color)) - cast(*void)(*instance)) == 16, "duDisplayList.m_color has unexpected offset % instead of 16", ((cast(*void)(*instance.m_color)) - cast(*void)(*instance)));
        assert(size_of(type_of(duDisplayList.m_color)) == 8, "duDisplayList.m_color has unexpected size % instead of 8", size_of(type_of(duDisplayList.m_color)));
        assert(((cast(*void)(*instance.m_size)) - cast(*void)(*instance)) == 24, "duDisplayList.m_size has unexpected offset % instead of 24", ((cast(*void)(*instance.m_size)) - cast(*void)(*instance)));
        assert(size_of(type_of(duDisplayList.m_size)) == 4, "duDisplayList.m_size has unexpected size % instead of 4", size_of(type_of(duDisplayList.m_size)));
        assert(((cast(*void)(*instance.m_cap)) - cast(*void)(*instance)) == 28, "duDisplayList.m_cap has unexpected offset % instead of 28", ((cast(*void)(*instance.m_cap)) - cast(*void)(*instance)));
        assert(size_of(type_of(duDisplayList.m_cap)) == 4, "duDisplayList.m_cap has unexpected size % instead of 4", size_of(type_of(duDisplayList.m_cap)));
        assert(((cast(*void)(*instance.m_prim)) - cast(*void)(*instance)) == 32, "duDisplayList.m_prim has unexpected offset % instead of 32", ((cast(*void)(*instance.m_prim)) - cast(*void)(*instance)));
        assert(size_of(type_of(duDisplayList.m_prim)) == 4, "duDisplayList.m_prim has unexpected size % instead of 4", size_of(type_of(duDisplayList.m_prim)));
        assert(((cast(*void)(*instance.m_primSize)) - cast(*void)(*instance)) == 36, "duDisplayList.m_primSize has unexpected offset % instead of 36", ((cast(*void)(*instance.m_primSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(duDisplayList.m_primSize)) == 4, "duDisplayList.m_primSize has unexpected size % instead of 4", size_of(type_of(duDisplayList.m_primSize)));
        assert(((cast(*void)(*instance.m_depthMask)) - cast(*void)(*instance)) == 40, "duDisplayList.m_depthMask has unexpected offset % instead of 40", ((cast(*void)(*instance.m_depthMask)) - cast(*void)(*instance)));
        assert(size_of(type_of(duDisplayList.m_depthMask)) == 1, "duDisplayList.m_depthMask has unexpected size % instead of 1", size_of(type_of(duDisplayList.m_depthMask)));
        assert(size_of(duDisplayList) == 48, "duDisplayList has size % instead of 48", size_of(duDisplayList));
    }

    {
        instance: dtPoly;
        assert(((cast(*void)(*instance.firstLink)) - cast(*void)(*instance)) == 0, "dtPoly.firstLink has unexpected offset % instead of 0", ((cast(*void)(*instance.firstLink)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPoly.firstLink)) == 4, "dtPoly.firstLink has unexpected size % instead of 4", size_of(type_of(dtPoly.firstLink)));
        assert(((cast(*void)(*instance.verts)) - cast(*void)(*instance)) == 4, "dtPoly.verts has unexpected offset % instead of 4", ((cast(*void)(*instance.verts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPoly.verts)) == 12, "dtPoly.verts has unexpected size % instead of 12", size_of(type_of(dtPoly.verts)));
        assert(((cast(*void)(*instance.neis)) - cast(*void)(*instance)) == 16, "dtPoly.neis has unexpected offset % instead of 16", ((cast(*void)(*instance.neis)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPoly.neis)) == 12, "dtPoly.neis has unexpected size % instead of 12", size_of(type_of(dtPoly.neis)));
        assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 28, "dtPoly.flags has unexpected offset % instead of 28", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPoly.flags)) == 2, "dtPoly.flags has unexpected size % instead of 2", size_of(type_of(dtPoly.flags)));
        assert(((cast(*void)(*instance.vertCount)) - cast(*void)(*instance)) == 30, "dtPoly.vertCount has unexpected offset % instead of 30", ((cast(*void)(*instance.vertCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPoly.vertCount)) == 1, "dtPoly.vertCount has unexpected size % instead of 1", size_of(type_of(dtPoly.vertCount)));
        assert(((cast(*void)(*instance.areaAndtype)) - cast(*void)(*instance)) == 31, "dtPoly.areaAndtype has unexpected offset % instead of 31", ((cast(*void)(*instance.areaAndtype)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPoly.areaAndtype)) == 1, "dtPoly.areaAndtype has unexpected size % instead of 1", size_of(type_of(dtPoly.areaAndtype)));
        assert(size_of(dtPoly) == 32, "dtPoly has size % instead of 32", size_of(dtPoly));
    }

    {
        instance: dtPolyDetail;
        assert(((cast(*void)(*instance.vertBase)) - cast(*void)(*instance)) == 0, "dtPolyDetail.vertBase has unexpected offset % instead of 0", ((cast(*void)(*instance.vertBase)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPolyDetail.vertBase)) == 4, "dtPolyDetail.vertBase has unexpected size % instead of 4", size_of(type_of(dtPolyDetail.vertBase)));
        assert(((cast(*void)(*instance.triBase)) - cast(*void)(*instance)) == 4, "dtPolyDetail.triBase has unexpected offset % instead of 4", ((cast(*void)(*instance.triBase)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPolyDetail.triBase)) == 4, "dtPolyDetail.triBase has unexpected size % instead of 4", size_of(type_of(dtPolyDetail.triBase)));
        assert(((cast(*void)(*instance.vertCount)) - cast(*void)(*instance)) == 8, "dtPolyDetail.vertCount has unexpected offset % instead of 8", ((cast(*void)(*instance.vertCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPolyDetail.vertCount)) == 1, "dtPolyDetail.vertCount has unexpected size % instead of 1", size_of(type_of(dtPolyDetail.vertCount)));
        assert(((cast(*void)(*instance.triCount)) - cast(*void)(*instance)) == 9, "dtPolyDetail.triCount has unexpected offset % instead of 9", ((cast(*void)(*instance.triCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPolyDetail.triCount)) == 1, "dtPolyDetail.triCount has unexpected size % instead of 1", size_of(type_of(dtPolyDetail.triCount)));
        assert(size_of(dtPolyDetail) == 12, "dtPolyDetail has size % instead of 12", size_of(dtPolyDetail));
    }

    {
        instance: dtLink;
        assert(((cast(*void)(*instance.ref)) - cast(*void)(*instance)) == 0, "dtLink.ref has unexpected offset % instead of 0", ((cast(*void)(*instance.ref)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLink.ref)) == 4, "dtLink.ref has unexpected size % instead of 4", size_of(type_of(dtLink.ref)));
        assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 4, "dtLink.next has unexpected offset % instead of 4", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLink.next)) == 4, "dtLink.next has unexpected size % instead of 4", size_of(type_of(dtLink.next)));
        assert(((cast(*void)(*instance.edge)) - cast(*void)(*instance)) == 8, "dtLink.edge has unexpected offset % instead of 8", ((cast(*void)(*instance.edge)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLink.edge)) == 1, "dtLink.edge has unexpected size % instead of 1", size_of(type_of(dtLink.edge)));
        assert(((cast(*void)(*instance.side)) - cast(*void)(*instance)) == 9, "dtLink.side has unexpected offset % instead of 9", ((cast(*void)(*instance.side)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLink.side)) == 1, "dtLink.side has unexpected size % instead of 1", size_of(type_of(dtLink.side)));
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 10, "dtLink.bmin has unexpected offset % instead of 10", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLink.bmin)) == 1, "dtLink.bmin has unexpected size % instead of 1", size_of(type_of(dtLink.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 11, "dtLink.bmax has unexpected offset % instead of 11", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLink.bmax)) == 1, "dtLink.bmax has unexpected size % instead of 1", size_of(type_of(dtLink.bmax)));
        assert(size_of(dtLink) == 12, "dtLink has size % instead of 12", size_of(dtLink));
    }

    {
        instance: dtBVNode;
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 0, "dtBVNode.bmin has unexpected offset % instead of 0", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtBVNode.bmin)) == 6, "dtBVNode.bmin has unexpected size % instead of 6", size_of(type_of(dtBVNode.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 6, "dtBVNode.bmax has unexpected offset % instead of 6", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtBVNode.bmax)) == 6, "dtBVNode.bmax has unexpected size % instead of 6", size_of(type_of(dtBVNode.bmax)));
        assert(((cast(*void)(*instance.i)) - cast(*void)(*instance)) == 12, "dtBVNode.i has unexpected offset % instead of 12", ((cast(*void)(*instance.i)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtBVNode.i)) == 4, "dtBVNode.i has unexpected size % instead of 4", size_of(type_of(dtBVNode.i)));
        assert(size_of(dtBVNode) == 16, "dtBVNode has size % instead of 16", size_of(dtBVNode));
    }

    {
        instance: dtOffMeshConnection;
        assert(((cast(*void)(*instance.pos)) - cast(*void)(*instance)) == 0, "dtOffMeshConnection.pos has unexpected offset % instead of 0", ((cast(*void)(*instance.pos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtOffMeshConnection.pos)) == 24, "dtOffMeshConnection.pos has unexpected size % instead of 24", size_of(type_of(dtOffMeshConnection.pos)));
        assert(((cast(*void)(*instance.rad)) - cast(*void)(*instance)) == 24, "dtOffMeshConnection.rad has unexpected offset % instead of 24", ((cast(*void)(*instance.rad)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtOffMeshConnection.rad)) == 4, "dtOffMeshConnection.rad has unexpected size % instead of 4", size_of(type_of(dtOffMeshConnection.rad)));
        assert(((cast(*void)(*instance.poly)) - cast(*void)(*instance)) == 28, "dtOffMeshConnection.poly has unexpected offset % instead of 28", ((cast(*void)(*instance.poly)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtOffMeshConnection.poly)) == 2, "dtOffMeshConnection.poly has unexpected size % instead of 2", size_of(type_of(dtOffMeshConnection.poly)));
        assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 30, "dtOffMeshConnection.flags has unexpected offset % instead of 30", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtOffMeshConnection.flags)) == 1, "dtOffMeshConnection.flags has unexpected size % instead of 1", size_of(type_of(dtOffMeshConnection.flags)));
        assert(((cast(*void)(*instance.side)) - cast(*void)(*instance)) == 31, "dtOffMeshConnection.side has unexpected offset % instead of 31", ((cast(*void)(*instance.side)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtOffMeshConnection.side)) == 1, "dtOffMeshConnection.side has unexpected size % instead of 1", size_of(type_of(dtOffMeshConnection.side)));
        assert(((cast(*void)(*instance.userId)) - cast(*void)(*instance)) == 32, "dtOffMeshConnection.userId has unexpected offset % instead of 32", ((cast(*void)(*instance.userId)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtOffMeshConnection.userId)) == 4, "dtOffMeshConnection.userId has unexpected size % instead of 4", size_of(type_of(dtOffMeshConnection.userId)));
        assert(size_of(dtOffMeshConnection) == 36, "dtOffMeshConnection has size % instead of 36", size_of(dtOffMeshConnection));
    }

    {
        instance: dtMeshHeader;
        assert(((cast(*void)(*instance.magic)) - cast(*void)(*instance)) == 0, "dtMeshHeader.magic has unexpected offset % instead of 0", ((cast(*void)(*instance.magic)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.magic)) == 4, "dtMeshHeader.magic has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.magic)));
        assert(((cast(*void)(*instance.version)) - cast(*void)(*instance)) == 4, "dtMeshHeader.version has unexpected offset % instead of 4", ((cast(*void)(*instance.version)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.version)) == 4, "dtMeshHeader.version has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.version)));
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 8, "dtMeshHeader.x has unexpected offset % instead of 8", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.x)) == 4, "dtMeshHeader.x has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 12, "dtMeshHeader.y has unexpected offset % instead of 12", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.y)) == 4, "dtMeshHeader.y has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.y)));
        assert(((cast(*void)(*instance.layer)) - cast(*void)(*instance)) == 16, "dtMeshHeader.layer has unexpected offset % instead of 16", ((cast(*void)(*instance.layer)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.layer)) == 4, "dtMeshHeader.layer has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.layer)));
        assert(((cast(*void)(*instance.userId)) - cast(*void)(*instance)) == 20, "dtMeshHeader.userId has unexpected offset % instead of 20", ((cast(*void)(*instance.userId)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.userId)) == 4, "dtMeshHeader.userId has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.userId)));
        assert(((cast(*void)(*instance.polyCount)) - cast(*void)(*instance)) == 24, "dtMeshHeader.polyCount has unexpected offset % instead of 24", ((cast(*void)(*instance.polyCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.polyCount)) == 4, "dtMeshHeader.polyCount has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.polyCount)));
        assert(((cast(*void)(*instance.vertCount)) - cast(*void)(*instance)) == 28, "dtMeshHeader.vertCount has unexpected offset % instead of 28", ((cast(*void)(*instance.vertCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.vertCount)) == 4, "dtMeshHeader.vertCount has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.vertCount)));
        assert(((cast(*void)(*instance.maxLinkCount)) - cast(*void)(*instance)) == 32, "dtMeshHeader.maxLinkCount has unexpected offset % instead of 32", ((cast(*void)(*instance.maxLinkCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.maxLinkCount)) == 4, "dtMeshHeader.maxLinkCount has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.maxLinkCount)));
        assert(((cast(*void)(*instance.detailMeshCount)) - cast(*void)(*instance)) == 36, "dtMeshHeader.detailMeshCount has unexpected offset % instead of 36", ((cast(*void)(*instance.detailMeshCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.detailMeshCount)) == 4, "dtMeshHeader.detailMeshCount has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.detailMeshCount)));
        assert(((cast(*void)(*instance.detailVertCount)) - cast(*void)(*instance)) == 40, "dtMeshHeader.detailVertCount has unexpected offset % instead of 40", ((cast(*void)(*instance.detailVertCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.detailVertCount)) == 4, "dtMeshHeader.detailVertCount has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.detailVertCount)));
        assert(((cast(*void)(*instance.detailTriCount)) - cast(*void)(*instance)) == 44, "dtMeshHeader.detailTriCount has unexpected offset % instead of 44", ((cast(*void)(*instance.detailTriCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.detailTriCount)) == 4, "dtMeshHeader.detailTriCount has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.detailTriCount)));
        assert(((cast(*void)(*instance.bvNodeCount)) - cast(*void)(*instance)) == 48, "dtMeshHeader.bvNodeCount has unexpected offset % instead of 48", ((cast(*void)(*instance.bvNodeCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.bvNodeCount)) == 4, "dtMeshHeader.bvNodeCount has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.bvNodeCount)));
        assert(((cast(*void)(*instance.offMeshConCount)) - cast(*void)(*instance)) == 52, "dtMeshHeader.offMeshConCount has unexpected offset % instead of 52", ((cast(*void)(*instance.offMeshConCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.offMeshConCount)) == 4, "dtMeshHeader.offMeshConCount has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.offMeshConCount)));
        assert(((cast(*void)(*instance.offMeshBase)) - cast(*void)(*instance)) == 56, "dtMeshHeader.offMeshBase has unexpected offset % instead of 56", ((cast(*void)(*instance.offMeshBase)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.offMeshBase)) == 4, "dtMeshHeader.offMeshBase has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.offMeshBase)));
        assert(((cast(*void)(*instance.walkableHeight)) - cast(*void)(*instance)) == 60, "dtMeshHeader.walkableHeight has unexpected offset % instead of 60", ((cast(*void)(*instance.walkableHeight)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.walkableHeight)) == 4, "dtMeshHeader.walkableHeight has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.walkableHeight)));
        assert(((cast(*void)(*instance.walkableRadius)) - cast(*void)(*instance)) == 64, "dtMeshHeader.walkableRadius has unexpected offset % instead of 64", ((cast(*void)(*instance.walkableRadius)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.walkableRadius)) == 4, "dtMeshHeader.walkableRadius has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.walkableRadius)));
        assert(((cast(*void)(*instance.walkableClimb)) - cast(*void)(*instance)) == 68, "dtMeshHeader.walkableClimb has unexpected offset % instead of 68", ((cast(*void)(*instance.walkableClimb)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.walkableClimb)) == 4, "dtMeshHeader.walkableClimb has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.walkableClimb)));
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 72, "dtMeshHeader.bmin has unexpected offset % instead of 72", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.bmin)) == 12, "dtMeshHeader.bmin has unexpected size % instead of 12", size_of(type_of(dtMeshHeader.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 84, "dtMeshHeader.bmax has unexpected offset % instead of 84", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.bmax)) == 12, "dtMeshHeader.bmax has unexpected size % instead of 12", size_of(type_of(dtMeshHeader.bmax)));
        assert(((cast(*void)(*instance.bvQuantFactor)) - cast(*void)(*instance)) == 96, "dtMeshHeader.bvQuantFactor has unexpected offset % instead of 96", ((cast(*void)(*instance.bvQuantFactor)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshHeader.bvQuantFactor)) == 4, "dtMeshHeader.bvQuantFactor has unexpected size % instead of 4", size_of(type_of(dtMeshHeader.bvQuantFactor)));
        assert(size_of(dtMeshHeader) == 100, "dtMeshHeader has size % instead of 100", size_of(dtMeshHeader));
    }

    {
        instance: dtMeshTile;
        assert(((cast(*void)(*instance.salt)) - cast(*void)(*instance)) == 0, "dtMeshTile.salt has unexpected offset % instead of 0", ((cast(*void)(*instance.salt)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.salt)) == 4, "dtMeshTile.salt has unexpected size % instead of 4", size_of(type_of(dtMeshTile.salt)));
        assert(((cast(*void)(*instance.linksFreeList)) - cast(*void)(*instance)) == 4, "dtMeshTile.linksFreeList has unexpected offset % instead of 4", ((cast(*void)(*instance.linksFreeList)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.linksFreeList)) == 4, "dtMeshTile.linksFreeList has unexpected size % instead of 4", size_of(type_of(dtMeshTile.linksFreeList)));
        assert(((cast(*void)(*instance.header)) - cast(*void)(*instance)) == 8, "dtMeshTile.header has unexpected offset % instead of 8", ((cast(*void)(*instance.header)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.header)) == 8, "dtMeshTile.header has unexpected size % instead of 8", size_of(type_of(dtMeshTile.header)));
        assert(((cast(*void)(*instance.polys)) - cast(*void)(*instance)) == 16, "dtMeshTile.polys has unexpected offset % instead of 16", ((cast(*void)(*instance.polys)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.polys)) == 8, "dtMeshTile.polys has unexpected size % instead of 8", size_of(type_of(dtMeshTile.polys)));
        assert(((cast(*void)(*instance.verts)) - cast(*void)(*instance)) == 24, "dtMeshTile.verts has unexpected offset % instead of 24", ((cast(*void)(*instance.verts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.verts)) == 8, "dtMeshTile.verts has unexpected size % instead of 8", size_of(type_of(dtMeshTile.verts)));
        assert(((cast(*void)(*instance.links)) - cast(*void)(*instance)) == 32, "dtMeshTile.links has unexpected offset % instead of 32", ((cast(*void)(*instance.links)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.links)) == 8, "dtMeshTile.links has unexpected size % instead of 8", size_of(type_of(dtMeshTile.links)));
        assert(((cast(*void)(*instance.detailMeshes)) - cast(*void)(*instance)) == 40, "dtMeshTile.detailMeshes has unexpected offset % instead of 40", ((cast(*void)(*instance.detailMeshes)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.detailMeshes)) == 8, "dtMeshTile.detailMeshes has unexpected size % instead of 8", size_of(type_of(dtMeshTile.detailMeshes)));
        assert(((cast(*void)(*instance.detailVerts)) - cast(*void)(*instance)) == 48, "dtMeshTile.detailVerts has unexpected offset % instead of 48", ((cast(*void)(*instance.detailVerts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.detailVerts)) == 8, "dtMeshTile.detailVerts has unexpected size % instead of 8", size_of(type_of(dtMeshTile.detailVerts)));
        assert(((cast(*void)(*instance.detailTris)) - cast(*void)(*instance)) == 56, "dtMeshTile.detailTris has unexpected offset % instead of 56", ((cast(*void)(*instance.detailTris)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.detailTris)) == 8, "dtMeshTile.detailTris has unexpected size % instead of 8", size_of(type_of(dtMeshTile.detailTris)));
        assert(((cast(*void)(*instance.bvTree)) - cast(*void)(*instance)) == 64, "dtMeshTile.bvTree has unexpected offset % instead of 64", ((cast(*void)(*instance.bvTree)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.bvTree)) == 8, "dtMeshTile.bvTree has unexpected size % instead of 8", size_of(type_of(dtMeshTile.bvTree)));
        assert(((cast(*void)(*instance.offMeshCons)) - cast(*void)(*instance)) == 72, "dtMeshTile.offMeshCons has unexpected offset % instead of 72", ((cast(*void)(*instance.offMeshCons)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.offMeshCons)) == 8, "dtMeshTile.offMeshCons has unexpected size % instead of 8", size_of(type_of(dtMeshTile.offMeshCons)));
        assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 80, "dtMeshTile.data has unexpected offset % instead of 80", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.data)) == 8, "dtMeshTile.data has unexpected size % instead of 8", size_of(type_of(dtMeshTile.data)));
        assert(((cast(*void)(*instance.dataSize)) - cast(*void)(*instance)) == 88, "dtMeshTile.dataSize has unexpected offset % instead of 88", ((cast(*void)(*instance.dataSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.dataSize)) == 4, "dtMeshTile.dataSize has unexpected size % instead of 4", size_of(type_of(dtMeshTile.dataSize)));
        assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 92, "dtMeshTile.flags has unexpected offset % instead of 92", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.flags)) == 4, "dtMeshTile.flags has unexpected size % instead of 4", size_of(type_of(dtMeshTile.flags)));
        assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 96, "dtMeshTile.next has unexpected offset % instead of 96", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtMeshTile.next)) == 8, "dtMeshTile.next has unexpected size % instead of 8", size_of(type_of(dtMeshTile.next)));
        assert(size_of(dtMeshTile) == 104, "dtMeshTile has size % instead of 104", size_of(dtMeshTile));
    }

    {
        instance: dtNavMeshParams;
        assert(((cast(*void)(*instance.orig)) - cast(*void)(*instance)) == 0, "dtNavMeshParams.orig has unexpected offset % instead of 0", ((cast(*void)(*instance.orig)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshParams.orig)) == 12, "dtNavMeshParams.orig has unexpected size % instead of 12", size_of(type_of(dtNavMeshParams.orig)));
        assert(((cast(*void)(*instance.tileWidth)) - cast(*void)(*instance)) == 12, "dtNavMeshParams.tileWidth has unexpected offset % instead of 12", ((cast(*void)(*instance.tileWidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshParams.tileWidth)) == 4, "dtNavMeshParams.tileWidth has unexpected size % instead of 4", size_of(type_of(dtNavMeshParams.tileWidth)));
        assert(((cast(*void)(*instance.tileHeight)) - cast(*void)(*instance)) == 16, "dtNavMeshParams.tileHeight has unexpected offset % instead of 16", ((cast(*void)(*instance.tileHeight)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshParams.tileHeight)) == 4, "dtNavMeshParams.tileHeight has unexpected size % instead of 4", size_of(type_of(dtNavMeshParams.tileHeight)));
        assert(((cast(*void)(*instance.maxTiles)) - cast(*void)(*instance)) == 20, "dtNavMeshParams.maxTiles has unexpected offset % instead of 20", ((cast(*void)(*instance.maxTiles)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshParams.maxTiles)) == 4, "dtNavMeshParams.maxTiles has unexpected size % instead of 4", size_of(type_of(dtNavMeshParams.maxTiles)));
        assert(((cast(*void)(*instance.maxPolys)) - cast(*void)(*instance)) == 24, "dtNavMeshParams.maxPolys has unexpected offset % instead of 24", ((cast(*void)(*instance.maxPolys)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshParams.maxPolys)) == 4, "dtNavMeshParams.maxPolys has unexpected size % instead of 4", size_of(type_of(dtNavMeshParams.maxPolys)));
        assert(size_of(dtNavMeshParams) == 28, "dtNavMeshParams has size % instead of 28", size_of(dtNavMeshParams));
    }

    {
        instance: dtNavMesh;
        assert(((cast(*void)(*instance.m_params)) - cast(*void)(*instance)) == 0, "dtNavMesh.m_params has unexpected offset % instead of 0", ((cast(*void)(*instance.m_params)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_params)) == 28, "dtNavMesh.m_params has unexpected size % instead of 28", size_of(type_of(dtNavMesh.m_params)));
        assert(((cast(*void)(*instance.m_orig)) - cast(*void)(*instance)) == 28, "dtNavMesh.m_orig has unexpected offset % instead of 28", ((cast(*void)(*instance.m_orig)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_orig)) == 12, "dtNavMesh.m_orig has unexpected size % instead of 12", size_of(type_of(dtNavMesh.m_orig)));
        assert(((cast(*void)(*instance.m_tileWidth)) - cast(*void)(*instance)) == 40, "dtNavMesh.m_tileWidth has unexpected offset % instead of 40", ((cast(*void)(*instance.m_tileWidth)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_tileWidth)) == 4, "dtNavMesh.m_tileWidth has unexpected size % instead of 4", size_of(type_of(dtNavMesh.m_tileWidth)));
        assert(((cast(*void)(*instance.m_tileHeight)) - cast(*void)(*instance)) == 44, "dtNavMesh.m_tileHeight has unexpected offset % instead of 44", ((cast(*void)(*instance.m_tileHeight)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_tileHeight)) == 4, "dtNavMesh.m_tileHeight has unexpected size % instead of 4", size_of(type_of(dtNavMesh.m_tileHeight)));
        assert(((cast(*void)(*instance.m_maxTiles)) - cast(*void)(*instance)) == 48, "dtNavMesh.m_maxTiles has unexpected offset % instead of 48", ((cast(*void)(*instance.m_maxTiles)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_maxTiles)) == 4, "dtNavMesh.m_maxTiles has unexpected size % instead of 4", size_of(type_of(dtNavMesh.m_maxTiles)));
        assert(((cast(*void)(*instance.m_tileLutSize)) - cast(*void)(*instance)) == 52, "dtNavMesh.m_tileLutSize has unexpected offset % instead of 52", ((cast(*void)(*instance.m_tileLutSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_tileLutSize)) == 4, "dtNavMesh.m_tileLutSize has unexpected size % instead of 4", size_of(type_of(dtNavMesh.m_tileLutSize)));
        assert(((cast(*void)(*instance.m_tileLutMask)) - cast(*void)(*instance)) == 56, "dtNavMesh.m_tileLutMask has unexpected offset % instead of 56", ((cast(*void)(*instance.m_tileLutMask)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_tileLutMask)) == 4, "dtNavMesh.m_tileLutMask has unexpected size % instead of 4", size_of(type_of(dtNavMesh.m_tileLutMask)));
        assert(((cast(*void)(*instance.m_posLookup)) - cast(*void)(*instance)) == 64, "dtNavMesh.m_posLookup has unexpected offset % instead of 64", ((cast(*void)(*instance.m_posLookup)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_posLookup)) == 8, "dtNavMesh.m_posLookup has unexpected size % instead of 8", size_of(type_of(dtNavMesh.m_posLookup)));
        assert(((cast(*void)(*instance.m_nextFree)) - cast(*void)(*instance)) == 72, "dtNavMesh.m_nextFree has unexpected offset % instead of 72", ((cast(*void)(*instance.m_nextFree)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_nextFree)) == 8, "dtNavMesh.m_nextFree has unexpected size % instead of 8", size_of(type_of(dtNavMesh.m_nextFree)));
        assert(((cast(*void)(*instance.m_tiles)) - cast(*void)(*instance)) == 80, "dtNavMesh.m_tiles has unexpected offset % instead of 80", ((cast(*void)(*instance.m_tiles)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_tiles)) == 8, "dtNavMesh.m_tiles has unexpected size % instead of 8", size_of(type_of(dtNavMesh.m_tiles)));
        assert(((cast(*void)(*instance.m_saltBits)) - cast(*void)(*instance)) == 88, "dtNavMesh.m_saltBits has unexpected offset % instead of 88", ((cast(*void)(*instance.m_saltBits)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_saltBits)) == 4, "dtNavMesh.m_saltBits has unexpected size % instead of 4", size_of(type_of(dtNavMesh.m_saltBits)));
        assert(((cast(*void)(*instance.m_tileBits)) - cast(*void)(*instance)) == 92, "dtNavMesh.m_tileBits has unexpected offset % instead of 92", ((cast(*void)(*instance.m_tileBits)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_tileBits)) == 4, "dtNavMesh.m_tileBits has unexpected size % instead of 4", size_of(type_of(dtNavMesh.m_tileBits)));
        assert(((cast(*void)(*instance.m_polyBits)) - cast(*void)(*instance)) == 96, "dtNavMesh.m_polyBits has unexpected offset % instead of 96", ((cast(*void)(*instance.m_polyBits)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMesh.m_polyBits)) == 4, "dtNavMesh.m_polyBits has unexpected size % instead of 4", size_of(type_of(dtNavMesh.m_polyBits)));
        assert(size_of(dtNavMesh) == 104, "dtNavMesh has size % instead of 104", size_of(dtNavMesh));
    }

    {
        instance: dtQueryFilter;
        assert(((cast(*void)(*instance.m_areaCost)) - cast(*void)(*instance)) == 0, "dtQueryFilter.m_areaCost has unexpected offset % instead of 0", ((cast(*void)(*instance.m_areaCost)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtQueryFilter.m_areaCost)) == 256, "dtQueryFilter.m_areaCost has unexpected size % instead of 256", size_of(type_of(dtQueryFilter.m_areaCost)));
        assert(((cast(*void)(*instance.m_includeFlags)) - cast(*void)(*instance)) == 256, "dtQueryFilter.m_includeFlags has unexpected offset % instead of 256", ((cast(*void)(*instance.m_includeFlags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtQueryFilter.m_includeFlags)) == 2, "dtQueryFilter.m_includeFlags has unexpected size % instead of 2", size_of(type_of(dtQueryFilter.m_includeFlags)));
        assert(((cast(*void)(*instance.m_excludeFlags)) - cast(*void)(*instance)) == 258, "dtQueryFilter.m_excludeFlags has unexpected offset % instead of 258", ((cast(*void)(*instance.m_excludeFlags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtQueryFilter.m_excludeFlags)) == 2, "dtQueryFilter.m_excludeFlags has unexpected size % instead of 2", size_of(type_of(dtQueryFilter.m_excludeFlags)));
        assert(size_of(dtQueryFilter) == 260, "dtQueryFilter has size % instead of 260", size_of(dtQueryFilter));
    }

    {
        instance: dtRaycastHit;
        assert(((cast(*void)(*instance.t)) - cast(*void)(*instance)) == 0, "dtRaycastHit.t has unexpected offset % instead of 0", ((cast(*void)(*instance.t)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtRaycastHit.t)) == 4, "dtRaycastHit.t has unexpected size % instead of 4", size_of(type_of(dtRaycastHit.t)));
        assert(((cast(*void)(*instance.hitNormal)) - cast(*void)(*instance)) == 4, "dtRaycastHit.hitNormal has unexpected offset % instead of 4", ((cast(*void)(*instance.hitNormal)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtRaycastHit.hitNormal)) == 12, "dtRaycastHit.hitNormal has unexpected size % instead of 12", size_of(type_of(dtRaycastHit.hitNormal)));
        assert(((cast(*void)(*instance.hitEdgeIndex)) - cast(*void)(*instance)) == 16, "dtRaycastHit.hitEdgeIndex has unexpected offset % instead of 16", ((cast(*void)(*instance.hitEdgeIndex)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtRaycastHit.hitEdgeIndex)) == 4, "dtRaycastHit.hitEdgeIndex has unexpected size % instead of 4", size_of(type_of(dtRaycastHit.hitEdgeIndex)));
        assert(((cast(*void)(*instance.path)) - cast(*void)(*instance)) == 24, "dtRaycastHit.path has unexpected offset % instead of 24", ((cast(*void)(*instance.path)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtRaycastHit.path)) == 8, "dtRaycastHit.path has unexpected size % instead of 8", size_of(type_of(dtRaycastHit.path)));
        assert(((cast(*void)(*instance.pathCount)) - cast(*void)(*instance)) == 32, "dtRaycastHit.pathCount has unexpected offset % instead of 32", ((cast(*void)(*instance.pathCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtRaycastHit.pathCount)) == 4, "dtRaycastHit.pathCount has unexpected size % instead of 4", size_of(type_of(dtRaycastHit.pathCount)));
        assert(((cast(*void)(*instance.maxPath)) - cast(*void)(*instance)) == 36, "dtRaycastHit.maxPath has unexpected offset % instead of 36", ((cast(*void)(*instance.maxPath)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtRaycastHit.maxPath)) == 4, "dtRaycastHit.maxPath has unexpected size % instead of 4", size_of(type_of(dtRaycastHit.maxPath)));
        assert(((cast(*void)(*instance.pathCost)) - cast(*void)(*instance)) == 40, "dtRaycastHit.pathCost has unexpected offset % instead of 40", ((cast(*void)(*instance.pathCost)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtRaycastHit.pathCost)) == 4, "dtRaycastHit.pathCost has unexpected size % instead of 4", size_of(type_of(dtRaycastHit.pathCost)));
        assert(size_of(dtRaycastHit) == 48, "dtRaycastHit has size % instead of 48", size_of(dtRaycastHit));
    }

    assert(size_of(dtPolyQuery) == 8, "dtPolyQuery has size % instead of 8", size_of(dtPolyQuery));

    {
        instance: dtNavMeshQuery.dtQueryData;
        assert(((cast(*void)(*instance.status)) - cast(*void)(*instance)) == 0, "dtNavMeshQuery.dtQueryData.status has unexpected offset % instead of 0", ((cast(*void)(*instance.status)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.dtQueryData.status)) == 4, "dtNavMeshQuery.dtQueryData.status has unexpected size % instead of 4", size_of(type_of(dtNavMeshQuery.dtQueryData.status)));
        assert(((cast(*void)(*instance.lastBestNode)) - cast(*void)(*instance)) == 8, "dtNavMeshQuery.dtQueryData.lastBestNode has unexpected offset % instead of 8", ((cast(*void)(*instance.lastBestNode)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.dtQueryData.lastBestNode)) == 8, "dtNavMeshQuery.dtQueryData.lastBestNode has unexpected size % instead of 8", size_of(type_of(dtNavMeshQuery.dtQueryData.lastBestNode)));
        assert(((cast(*void)(*instance.lastBestNodeCost)) - cast(*void)(*instance)) == 16, "dtNavMeshQuery.dtQueryData.lastBestNodeCost has unexpected offset % instead of 16", ((cast(*void)(*instance.lastBestNodeCost)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.dtQueryData.lastBestNodeCost)) == 4, "dtNavMeshQuery.dtQueryData.lastBestNodeCost has unexpected size % instead of 4", size_of(type_of(dtNavMeshQuery.dtQueryData.lastBestNodeCost)));
        assert(((cast(*void)(*instance.startRef)) - cast(*void)(*instance)) == 20, "dtNavMeshQuery.dtQueryData.startRef has unexpected offset % instead of 20", ((cast(*void)(*instance.startRef)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.dtQueryData.startRef)) == 4, "dtNavMeshQuery.dtQueryData.startRef has unexpected size % instead of 4", size_of(type_of(dtNavMeshQuery.dtQueryData.startRef)));
        assert(((cast(*void)(*instance.endRef)) - cast(*void)(*instance)) == 24, "dtNavMeshQuery.dtQueryData.endRef has unexpected offset % instead of 24", ((cast(*void)(*instance.endRef)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.dtQueryData.endRef)) == 4, "dtNavMeshQuery.dtQueryData.endRef has unexpected size % instead of 4", size_of(type_of(dtNavMeshQuery.dtQueryData.endRef)));
        assert(((cast(*void)(*instance.startPos)) - cast(*void)(*instance)) == 28, "dtNavMeshQuery.dtQueryData.startPos has unexpected offset % instead of 28", ((cast(*void)(*instance.startPos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.dtQueryData.startPos)) == 12, "dtNavMeshQuery.dtQueryData.startPos has unexpected size % instead of 12", size_of(type_of(dtNavMeshQuery.dtQueryData.startPos)));
        assert(((cast(*void)(*instance.endPos)) - cast(*void)(*instance)) == 40, "dtNavMeshQuery.dtQueryData.endPos has unexpected offset % instead of 40", ((cast(*void)(*instance.endPos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.dtQueryData.endPos)) == 12, "dtNavMeshQuery.dtQueryData.endPos has unexpected size % instead of 12", size_of(type_of(dtNavMeshQuery.dtQueryData.endPos)));
        assert(((cast(*void)(*instance.filter)) - cast(*void)(*instance)) == 56, "dtNavMeshQuery.dtQueryData.filter has unexpected offset % instead of 56", ((cast(*void)(*instance.filter)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.dtQueryData.filter)) == 8, "dtNavMeshQuery.dtQueryData.filter has unexpected size % instead of 8", size_of(type_of(dtNavMeshQuery.dtQueryData.filter)));
        assert(((cast(*void)(*instance.options)) - cast(*void)(*instance)) == 64, "dtNavMeshQuery.dtQueryData.options has unexpected offset % instead of 64", ((cast(*void)(*instance.options)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.dtQueryData.options)) == 4, "dtNavMeshQuery.dtQueryData.options has unexpected size % instead of 4", size_of(type_of(dtNavMeshQuery.dtQueryData.options)));
        assert(((cast(*void)(*instance.raycastLimitSqr)) - cast(*void)(*instance)) == 68, "dtNavMeshQuery.dtQueryData.raycastLimitSqr has unexpected offset % instead of 68", ((cast(*void)(*instance.raycastLimitSqr)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.dtQueryData.raycastLimitSqr)) == 4, "dtNavMeshQuery.dtQueryData.raycastLimitSqr has unexpected size % instead of 4", size_of(type_of(dtNavMeshQuery.dtQueryData.raycastLimitSqr)));
        assert(size_of(dtNavMeshQuery.dtQueryData) == 72, "dtNavMeshQuery.dtQueryData has size % instead of 72", size_of(dtNavMeshQuery.dtQueryData));
    }

    {
        instance: dtNavMeshQuery;
        assert(((cast(*void)(*instance.m_nav)) - cast(*void)(*instance)) == 0, "dtNavMeshQuery.m_nav has unexpected offset % instead of 0", ((cast(*void)(*instance.m_nav)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.m_nav)) == 8, "dtNavMeshQuery.m_nav has unexpected size % instead of 8", size_of(type_of(dtNavMeshQuery.m_nav)));
        assert(((cast(*void)(*instance.m_query)) - cast(*void)(*instance)) == 8, "dtNavMeshQuery.m_query has unexpected offset % instead of 8", ((cast(*void)(*instance.m_query)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.m_query)) == 72, "dtNavMeshQuery.m_query has unexpected size % instead of 72", size_of(type_of(dtNavMeshQuery.m_query)));
        assert(((cast(*void)(*instance.m_tinyNodePool)) - cast(*void)(*instance)) == 80, "dtNavMeshQuery.m_tinyNodePool has unexpected offset % instead of 80", ((cast(*void)(*instance.m_tinyNodePool)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.m_tinyNodePool)) == 8, "dtNavMeshQuery.m_tinyNodePool has unexpected size % instead of 8", size_of(type_of(dtNavMeshQuery.m_tinyNodePool)));
        assert(((cast(*void)(*instance.m_nodePool)) - cast(*void)(*instance)) == 88, "dtNavMeshQuery.m_nodePool has unexpected offset % instead of 88", ((cast(*void)(*instance.m_nodePool)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.m_nodePool)) == 8, "dtNavMeshQuery.m_nodePool has unexpected size % instead of 8", size_of(type_of(dtNavMeshQuery.m_nodePool)));
        assert(((cast(*void)(*instance.m_openList)) - cast(*void)(*instance)) == 96, "dtNavMeshQuery.m_openList has unexpected offset % instead of 96", ((cast(*void)(*instance.m_openList)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshQuery.m_openList)) == 8, "dtNavMeshQuery.m_openList has unexpected size % instead of 8", size_of(type_of(dtNavMeshQuery.m_openList)));
        assert(size_of(dtNavMeshQuery) == 104, "dtNavMeshQuery has size % instead of 104", size_of(dtNavMeshQuery));
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

    {
        instance: rcContext;
        assert(((cast(*void)(*instance.m_logEnabled)) - cast(*void)(*instance)) == 8, "rcContext.m_logEnabled has unexpected offset % instead of 8", ((cast(*void)(*instance.m_logEnabled)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContext.m_logEnabled)) == 1, "rcContext.m_logEnabled has unexpected size % instead of 1", size_of(type_of(rcContext.m_logEnabled)));
        assert(((cast(*void)(*instance.m_timerEnabled)) - cast(*void)(*instance)) == 9, "rcContext.m_timerEnabled has unexpected offset % instead of 9", ((cast(*void)(*instance.m_timerEnabled)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContext.m_timerEnabled)) == 1, "rcContext.m_timerEnabled has unexpected size % instead of 1", size_of(type_of(rcContext.m_timerEnabled)));
        assert(size_of(rcContext) == 16, "rcContext has size % instead of 16", size_of(rcContext));
    }

    {
        instance: rcScopedTimer;
        assert(((cast(*void)(*instance.m_ctx)) - cast(*void)(*instance)) == 0, "rcScopedTimer.m_ctx has unexpected offset % instead of 0", ((cast(*void)(*instance.m_ctx)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcScopedTimer.m_ctx)) == 8, "rcScopedTimer.m_ctx has unexpected size % instead of 8", size_of(type_of(rcScopedTimer.m_ctx)));
        assert(((cast(*void)(*instance.m_label)) - cast(*void)(*instance)) == 8, "rcScopedTimer.m_label has unexpected offset % instead of 8", ((cast(*void)(*instance.m_label)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcScopedTimer.m_label)) == 4, "rcScopedTimer.m_label has unexpected size % instead of 4", size_of(type_of(rcScopedTimer.m_label)));
        assert(size_of(rcScopedTimer) == 16, "rcScopedTimer has size % instead of 16", size_of(rcScopedTimer));
    }

    {
        instance: rcConfig;
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 0, "rcConfig.width has unexpected offset % instead of 0", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.width)) == 4, "rcConfig.width has unexpected size % instead of 4", size_of(type_of(rcConfig.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 4, "rcConfig.height has unexpected offset % instead of 4", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.height)) == 4, "rcConfig.height has unexpected size % instead of 4", size_of(type_of(rcConfig.height)));
        assert(((cast(*void)(*instance.tileSize)) - cast(*void)(*instance)) == 8, "rcConfig.tileSize has unexpected offset % instead of 8", ((cast(*void)(*instance.tileSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.tileSize)) == 4, "rcConfig.tileSize has unexpected size % instead of 4", size_of(type_of(rcConfig.tileSize)));
        assert(((cast(*void)(*instance.borderSize)) - cast(*void)(*instance)) == 12, "rcConfig.borderSize has unexpected offset % instead of 12", ((cast(*void)(*instance.borderSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.borderSize)) == 4, "rcConfig.borderSize has unexpected size % instead of 4", size_of(type_of(rcConfig.borderSize)));
        assert(((cast(*void)(*instance.cs)) - cast(*void)(*instance)) == 16, "rcConfig.cs has unexpected offset % instead of 16", ((cast(*void)(*instance.cs)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.cs)) == 4, "rcConfig.cs has unexpected size % instead of 4", size_of(type_of(rcConfig.cs)));
        assert(((cast(*void)(*instance.ch)) - cast(*void)(*instance)) == 20, "rcConfig.ch has unexpected offset % instead of 20", ((cast(*void)(*instance.ch)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.ch)) == 4, "rcConfig.ch has unexpected size % instead of 4", size_of(type_of(rcConfig.ch)));
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 24, "rcConfig.bmin has unexpected offset % instead of 24", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.bmin)) == 12, "rcConfig.bmin has unexpected size % instead of 12", size_of(type_of(rcConfig.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 36, "rcConfig.bmax has unexpected offset % instead of 36", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.bmax)) == 12, "rcConfig.bmax has unexpected size % instead of 12", size_of(type_of(rcConfig.bmax)));
        assert(((cast(*void)(*instance.walkableSlopeAngle)) - cast(*void)(*instance)) == 48, "rcConfig.walkableSlopeAngle has unexpected offset % instead of 48", ((cast(*void)(*instance.walkableSlopeAngle)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.walkableSlopeAngle)) == 4, "rcConfig.walkableSlopeAngle has unexpected size % instead of 4", size_of(type_of(rcConfig.walkableSlopeAngle)));
        assert(((cast(*void)(*instance.walkableHeight)) - cast(*void)(*instance)) == 52, "rcConfig.walkableHeight has unexpected offset % instead of 52", ((cast(*void)(*instance.walkableHeight)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.walkableHeight)) == 4, "rcConfig.walkableHeight has unexpected size % instead of 4", size_of(type_of(rcConfig.walkableHeight)));
        assert(((cast(*void)(*instance.walkableClimb)) - cast(*void)(*instance)) == 56, "rcConfig.walkableClimb has unexpected offset % instead of 56", ((cast(*void)(*instance.walkableClimb)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.walkableClimb)) == 4, "rcConfig.walkableClimb has unexpected size % instead of 4", size_of(type_of(rcConfig.walkableClimb)));
        assert(((cast(*void)(*instance.walkableRadius)) - cast(*void)(*instance)) == 60, "rcConfig.walkableRadius has unexpected offset % instead of 60", ((cast(*void)(*instance.walkableRadius)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.walkableRadius)) == 4, "rcConfig.walkableRadius has unexpected size % instead of 4", size_of(type_of(rcConfig.walkableRadius)));
        assert(((cast(*void)(*instance.maxEdgeLen)) - cast(*void)(*instance)) == 64, "rcConfig.maxEdgeLen has unexpected offset % instead of 64", ((cast(*void)(*instance.maxEdgeLen)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.maxEdgeLen)) == 4, "rcConfig.maxEdgeLen has unexpected size % instead of 4", size_of(type_of(rcConfig.maxEdgeLen)));
        assert(((cast(*void)(*instance.maxSimplificationError)) - cast(*void)(*instance)) == 68, "rcConfig.maxSimplificationError has unexpected offset % instead of 68", ((cast(*void)(*instance.maxSimplificationError)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.maxSimplificationError)) == 4, "rcConfig.maxSimplificationError has unexpected size % instead of 4", size_of(type_of(rcConfig.maxSimplificationError)));
        assert(((cast(*void)(*instance.minRegionArea)) - cast(*void)(*instance)) == 72, "rcConfig.minRegionArea has unexpected offset % instead of 72", ((cast(*void)(*instance.minRegionArea)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.minRegionArea)) == 4, "rcConfig.minRegionArea has unexpected size % instead of 4", size_of(type_of(rcConfig.minRegionArea)));
        assert(((cast(*void)(*instance.mergeRegionArea)) - cast(*void)(*instance)) == 76, "rcConfig.mergeRegionArea has unexpected offset % instead of 76", ((cast(*void)(*instance.mergeRegionArea)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.mergeRegionArea)) == 4, "rcConfig.mergeRegionArea has unexpected size % instead of 4", size_of(type_of(rcConfig.mergeRegionArea)));
        assert(((cast(*void)(*instance.maxVertsPerPoly)) - cast(*void)(*instance)) == 80, "rcConfig.maxVertsPerPoly has unexpected offset % instead of 80", ((cast(*void)(*instance.maxVertsPerPoly)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.maxVertsPerPoly)) == 4, "rcConfig.maxVertsPerPoly has unexpected size % instead of 4", size_of(type_of(rcConfig.maxVertsPerPoly)));
        assert(((cast(*void)(*instance.detailSampleDist)) - cast(*void)(*instance)) == 84, "rcConfig.detailSampleDist has unexpected offset % instead of 84", ((cast(*void)(*instance.detailSampleDist)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.detailSampleDist)) == 4, "rcConfig.detailSampleDist has unexpected size % instead of 4", size_of(type_of(rcConfig.detailSampleDist)));
        assert(((cast(*void)(*instance.detailSampleMaxError)) - cast(*void)(*instance)) == 88, "rcConfig.detailSampleMaxError has unexpected offset % instead of 88", ((cast(*void)(*instance.detailSampleMaxError)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcConfig.detailSampleMaxError)) == 4, "rcConfig.detailSampleMaxError has unexpected size % instead of 4", size_of(type_of(rcConfig.detailSampleMaxError)));
        assert(size_of(rcConfig) == 92, "rcConfig has size % instead of 92", size_of(rcConfig));
    }

    {
        instance: rcSpan;
        // Bitfields are currently not correctly aligned
        // assert(((cast(*void)(*instance.smin)) - cast(*void)(*instance)) == 0, "rcSpan.smin has unexpected offset % instead of 0", ((cast(*void)(*instance.smin)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcSpan.smin)) == 4, "rcSpan.smin has unexpected size % instead of 4", size_of(type_of(rcSpan.smin)));
        // Bitfields are currently not correctly aligned
        // assert(((cast(*void)(*instance.smax)) - cast(*void)(*instance)) == 1, "rcSpan.smax has unexpected offset % instead of 1", ((cast(*void)(*instance.smax)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcSpan.smax)) == 4, "rcSpan.smax has unexpected size % instead of 4", size_of(type_of(rcSpan.smax)));
        // Bitfields are currently not correctly aligned
        // assert(((cast(*void)(*instance.area)) - cast(*void)(*instance)) == 3, "rcSpan.area has unexpected offset % instead of 3", ((cast(*void)(*instance.area)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcSpan.area)) == 4, "rcSpan.area has unexpected size % instead of 4", size_of(type_of(rcSpan.area)));
        assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "rcSpan.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcSpan.next)) == 8, "rcSpan.next has unexpected size % instead of 8", size_of(type_of(rcSpan.next)));
        assert(size_of(rcSpan) == 16, "rcSpan has size % instead of 16", size_of(rcSpan));
    }

    {
        instance: rcSpanPool;
        assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 0, "rcSpanPool.next has unexpected offset % instead of 0", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcSpanPool.next)) == 8, "rcSpanPool.next has unexpected size % instead of 8", size_of(type_of(rcSpanPool.next)));
        assert(((cast(*void)(*instance.items)) - cast(*void)(*instance)) == 8, "rcSpanPool.items has unexpected offset % instead of 8", ((cast(*void)(*instance.items)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcSpanPool.items)) == 32768, "rcSpanPool.items has unexpected size % instead of 32768", size_of(type_of(rcSpanPool.items)));
        assert(size_of(rcSpanPool) == 32776, "rcSpanPool has size % instead of 32776", size_of(rcSpanPool));
    }

    {
        instance: rcHeightfield;
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 0, "rcHeightfield.width has unexpected offset % instead of 0", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfield.width)) == 4, "rcHeightfield.width has unexpected size % instead of 4", size_of(type_of(rcHeightfield.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 4, "rcHeightfield.height has unexpected offset % instead of 4", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfield.height)) == 4, "rcHeightfield.height has unexpected size % instead of 4", size_of(type_of(rcHeightfield.height)));
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 8, "rcHeightfield.bmin has unexpected offset % instead of 8", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfield.bmin)) == 12, "rcHeightfield.bmin has unexpected size % instead of 12", size_of(type_of(rcHeightfield.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 20, "rcHeightfield.bmax has unexpected offset % instead of 20", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfield.bmax)) == 12, "rcHeightfield.bmax has unexpected size % instead of 12", size_of(type_of(rcHeightfield.bmax)));
        assert(((cast(*void)(*instance.cs)) - cast(*void)(*instance)) == 32, "rcHeightfield.cs has unexpected offset % instead of 32", ((cast(*void)(*instance.cs)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfield.cs)) == 4, "rcHeightfield.cs has unexpected size % instead of 4", size_of(type_of(rcHeightfield.cs)));
        assert(((cast(*void)(*instance.ch)) - cast(*void)(*instance)) == 36, "rcHeightfield.ch has unexpected offset % instead of 36", ((cast(*void)(*instance.ch)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfield.ch)) == 4, "rcHeightfield.ch has unexpected size % instead of 4", size_of(type_of(rcHeightfield.ch)));
        assert(((cast(*void)(*instance.spans)) - cast(*void)(*instance)) == 40, "rcHeightfield.spans has unexpected offset % instead of 40", ((cast(*void)(*instance.spans)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfield.spans)) == 8, "rcHeightfield.spans has unexpected size % instead of 8", size_of(type_of(rcHeightfield.spans)));
        assert(((cast(*void)(*instance.pools)) - cast(*void)(*instance)) == 48, "rcHeightfield.pools has unexpected offset % instead of 48", ((cast(*void)(*instance.pools)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfield.pools)) == 8, "rcHeightfield.pools has unexpected size % instead of 8", size_of(type_of(rcHeightfield.pools)));
        assert(((cast(*void)(*instance.freelist)) - cast(*void)(*instance)) == 56, "rcHeightfield.freelist has unexpected offset % instead of 56", ((cast(*void)(*instance.freelist)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfield.freelist)) == 8, "rcHeightfield.freelist has unexpected size % instead of 8", size_of(type_of(rcHeightfield.freelist)));
        assert(size_of(rcHeightfield) == 64, "rcHeightfield has size % instead of 64", size_of(rcHeightfield));
    }

    {
        instance: rcCompactCell;
        // Bitfields are currently not correctly aligned
        // assert(((cast(*void)(*instance.index)) - cast(*void)(*instance)) == 0, "rcCompactCell.index has unexpected offset % instead of 0", ((cast(*void)(*instance.index)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactCell.index)) == 4, "rcCompactCell.index has unexpected size % instead of 4", size_of(type_of(rcCompactCell.index)));
        // Bitfields are currently not correctly aligned
        // assert(((cast(*void)(*instance.count)) - cast(*void)(*instance)) == 3, "rcCompactCell.count has unexpected offset % instead of 3", ((cast(*void)(*instance.count)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactCell.count)) == 4, "rcCompactCell.count has unexpected size % instead of 4", size_of(type_of(rcCompactCell.count)));
        assert(size_of(rcCompactCell) == 4, "rcCompactCell has size % instead of 4", size_of(rcCompactCell));
    }

    {
        instance: rcCompactSpan;
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 0, "rcCompactSpan.y has unexpected offset % instead of 0", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactSpan.y)) == 2, "rcCompactSpan.y has unexpected size % instead of 2", size_of(type_of(rcCompactSpan.y)));
        assert(((cast(*void)(*instance.reg)) - cast(*void)(*instance)) == 2, "rcCompactSpan.reg has unexpected offset % instead of 2", ((cast(*void)(*instance.reg)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactSpan.reg)) == 2, "rcCompactSpan.reg has unexpected size % instead of 2", size_of(type_of(rcCompactSpan.reg)));
        // Bitfields are currently not correctly aligned
        // assert(((cast(*void)(*instance.con)) - cast(*void)(*instance)) == 4, "rcCompactSpan.con has unexpected offset % instead of 4", ((cast(*void)(*instance.con)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactSpan.con)) == 4, "rcCompactSpan.con has unexpected size % instead of 4", size_of(type_of(rcCompactSpan.con)));
        // Bitfields are currently not correctly aligned
        // assert(((cast(*void)(*instance.h)) - cast(*void)(*instance)) == 7, "rcCompactSpan.h has unexpected offset % instead of 7", ((cast(*void)(*instance.h)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactSpan.h)) == 4, "rcCompactSpan.h has unexpected size % instead of 4", size_of(type_of(rcCompactSpan.h)));
        assert(size_of(rcCompactSpan) == 8, "rcCompactSpan has size % instead of 8", size_of(rcCompactSpan));
    }

    {
        instance: rcCompactHeightfield;
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 0, "rcCompactHeightfield.width has unexpected offset % instead of 0", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.width)) == 4, "rcCompactHeightfield.width has unexpected size % instead of 4", size_of(type_of(rcCompactHeightfield.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 4, "rcCompactHeightfield.height has unexpected offset % instead of 4", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.height)) == 4, "rcCompactHeightfield.height has unexpected size % instead of 4", size_of(type_of(rcCompactHeightfield.height)));
        assert(((cast(*void)(*instance.spanCount)) - cast(*void)(*instance)) == 8, "rcCompactHeightfield.spanCount has unexpected offset % instead of 8", ((cast(*void)(*instance.spanCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.spanCount)) == 4, "rcCompactHeightfield.spanCount has unexpected size % instead of 4", size_of(type_of(rcCompactHeightfield.spanCount)));
        assert(((cast(*void)(*instance.walkableHeight)) - cast(*void)(*instance)) == 12, "rcCompactHeightfield.walkableHeight has unexpected offset % instead of 12", ((cast(*void)(*instance.walkableHeight)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.walkableHeight)) == 4, "rcCompactHeightfield.walkableHeight has unexpected size % instead of 4", size_of(type_of(rcCompactHeightfield.walkableHeight)));
        assert(((cast(*void)(*instance.walkableClimb)) - cast(*void)(*instance)) == 16, "rcCompactHeightfield.walkableClimb has unexpected offset % instead of 16", ((cast(*void)(*instance.walkableClimb)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.walkableClimb)) == 4, "rcCompactHeightfield.walkableClimb has unexpected size % instead of 4", size_of(type_of(rcCompactHeightfield.walkableClimb)));
        assert(((cast(*void)(*instance.borderSize)) - cast(*void)(*instance)) == 20, "rcCompactHeightfield.borderSize has unexpected offset % instead of 20", ((cast(*void)(*instance.borderSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.borderSize)) == 4, "rcCompactHeightfield.borderSize has unexpected size % instead of 4", size_of(type_of(rcCompactHeightfield.borderSize)));
        assert(((cast(*void)(*instance.maxDistance)) - cast(*void)(*instance)) == 24, "rcCompactHeightfield.maxDistance has unexpected offset % instead of 24", ((cast(*void)(*instance.maxDistance)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.maxDistance)) == 2, "rcCompactHeightfield.maxDistance has unexpected size % instead of 2", size_of(type_of(rcCompactHeightfield.maxDistance)));
        assert(((cast(*void)(*instance.maxRegions)) - cast(*void)(*instance)) == 26, "rcCompactHeightfield.maxRegions has unexpected offset % instead of 26", ((cast(*void)(*instance.maxRegions)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.maxRegions)) == 2, "rcCompactHeightfield.maxRegions has unexpected size % instead of 2", size_of(type_of(rcCompactHeightfield.maxRegions)));
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 28, "rcCompactHeightfield.bmin has unexpected offset % instead of 28", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.bmin)) == 12, "rcCompactHeightfield.bmin has unexpected size % instead of 12", size_of(type_of(rcCompactHeightfield.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 40, "rcCompactHeightfield.bmax has unexpected offset % instead of 40", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.bmax)) == 12, "rcCompactHeightfield.bmax has unexpected size % instead of 12", size_of(type_of(rcCompactHeightfield.bmax)));
        assert(((cast(*void)(*instance.cs)) - cast(*void)(*instance)) == 52, "rcCompactHeightfield.cs has unexpected offset % instead of 52", ((cast(*void)(*instance.cs)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.cs)) == 4, "rcCompactHeightfield.cs has unexpected size % instead of 4", size_of(type_of(rcCompactHeightfield.cs)));
        assert(((cast(*void)(*instance.ch)) - cast(*void)(*instance)) == 56, "rcCompactHeightfield.ch has unexpected offset % instead of 56", ((cast(*void)(*instance.ch)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.ch)) == 4, "rcCompactHeightfield.ch has unexpected size % instead of 4", size_of(type_of(rcCompactHeightfield.ch)));
        assert(((cast(*void)(*instance.cells)) - cast(*void)(*instance)) == 64, "rcCompactHeightfield.cells has unexpected offset % instead of 64", ((cast(*void)(*instance.cells)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.cells)) == 8, "rcCompactHeightfield.cells has unexpected size % instead of 8", size_of(type_of(rcCompactHeightfield.cells)));
        assert(((cast(*void)(*instance.spans)) - cast(*void)(*instance)) == 72, "rcCompactHeightfield.spans has unexpected offset % instead of 72", ((cast(*void)(*instance.spans)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.spans)) == 8, "rcCompactHeightfield.spans has unexpected size % instead of 8", size_of(type_of(rcCompactHeightfield.spans)));
        assert(((cast(*void)(*instance.dist)) - cast(*void)(*instance)) == 80, "rcCompactHeightfield.dist has unexpected offset % instead of 80", ((cast(*void)(*instance.dist)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.dist)) == 8, "rcCompactHeightfield.dist has unexpected size % instead of 8", size_of(type_of(rcCompactHeightfield.dist)));
        assert(((cast(*void)(*instance.areas)) - cast(*void)(*instance)) == 88, "rcCompactHeightfield.areas has unexpected offset % instead of 88", ((cast(*void)(*instance.areas)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcCompactHeightfield.areas)) == 8, "rcCompactHeightfield.areas has unexpected size % instead of 8", size_of(type_of(rcCompactHeightfield.areas)));
        assert(size_of(rcCompactHeightfield) == 96, "rcCompactHeightfield has size % instead of 96", size_of(rcCompactHeightfield));
    }

    {
        instance: rcHeightfieldLayer;
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 0, "rcHeightfieldLayer.bmin has unexpected offset % instead of 0", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.bmin)) == 12, "rcHeightfieldLayer.bmin has unexpected size % instead of 12", size_of(type_of(rcHeightfieldLayer.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 12, "rcHeightfieldLayer.bmax has unexpected offset % instead of 12", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.bmax)) == 12, "rcHeightfieldLayer.bmax has unexpected size % instead of 12", size_of(type_of(rcHeightfieldLayer.bmax)));
        assert(((cast(*void)(*instance.cs)) - cast(*void)(*instance)) == 24, "rcHeightfieldLayer.cs has unexpected offset % instead of 24", ((cast(*void)(*instance.cs)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.cs)) == 4, "rcHeightfieldLayer.cs has unexpected size % instead of 4", size_of(type_of(rcHeightfieldLayer.cs)));
        assert(((cast(*void)(*instance.ch)) - cast(*void)(*instance)) == 28, "rcHeightfieldLayer.ch has unexpected offset % instead of 28", ((cast(*void)(*instance.ch)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.ch)) == 4, "rcHeightfieldLayer.ch has unexpected size % instead of 4", size_of(type_of(rcHeightfieldLayer.ch)));
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 32, "rcHeightfieldLayer.width has unexpected offset % instead of 32", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.width)) == 4, "rcHeightfieldLayer.width has unexpected size % instead of 4", size_of(type_of(rcHeightfieldLayer.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 36, "rcHeightfieldLayer.height has unexpected offset % instead of 36", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.height)) == 4, "rcHeightfieldLayer.height has unexpected size % instead of 4", size_of(type_of(rcHeightfieldLayer.height)));
        assert(((cast(*void)(*instance.minx)) - cast(*void)(*instance)) == 40, "rcHeightfieldLayer.minx has unexpected offset % instead of 40", ((cast(*void)(*instance.minx)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.minx)) == 4, "rcHeightfieldLayer.minx has unexpected size % instead of 4", size_of(type_of(rcHeightfieldLayer.minx)));
        assert(((cast(*void)(*instance.maxx)) - cast(*void)(*instance)) == 44, "rcHeightfieldLayer.maxx has unexpected offset % instead of 44", ((cast(*void)(*instance.maxx)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.maxx)) == 4, "rcHeightfieldLayer.maxx has unexpected size % instead of 4", size_of(type_of(rcHeightfieldLayer.maxx)));
        assert(((cast(*void)(*instance.miny)) - cast(*void)(*instance)) == 48, "rcHeightfieldLayer.miny has unexpected offset % instead of 48", ((cast(*void)(*instance.miny)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.miny)) == 4, "rcHeightfieldLayer.miny has unexpected size % instead of 4", size_of(type_of(rcHeightfieldLayer.miny)));
        assert(((cast(*void)(*instance.maxy)) - cast(*void)(*instance)) == 52, "rcHeightfieldLayer.maxy has unexpected offset % instead of 52", ((cast(*void)(*instance.maxy)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.maxy)) == 4, "rcHeightfieldLayer.maxy has unexpected size % instead of 4", size_of(type_of(rcHeightfieldLayer.maxy)));
        assert(((cast(*void)(*instance.hmin)) - cast(*void)(*instance)) == 56, "rcHeightfieldLayer.hmin has unexpected offset % instead of 56", ((cast(*void)(*instance.hmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.hmin)) == 4, "rcHeightfieldLayer.hmin has unexpected size % instead of 4", size_of(type_of(rcHeightfieldLayer.hmin)));
        assert(((cast(*void)(*instance.hmax)) - cast(*void)(*instance)) == 60, "rcHeightfieldLayer.hmax has unexpected offset % instead of 60", ((cast(*void)(*instance.hmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.hmax)) == 4, "rcHeightfieldLayer.hmax has unexpected size % instead of 4", size_of(type_of(rcHeightfieldLayer.hmax)));
        assert(((cast(*void)(*instance.heights)) - cast(*void)(*instance)) == 64, "rcHeightfieldLayer.heights has unexpected offset % instead of 64", ((cast(*void)(*instance.heights)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.heights)) == 8, "rcHeightfieldLayer.heights has unexpected size % instead of 8", size_of(type_of(rcHeightfieldLayer.heights)));
        assert(((cast(*void)(*instance.areas)) - cast(*void)(*instance)) == 72, "rcHeightfieldLayer.areas has unexpected offset % instead of 72", ((cast(*void)(*instance.areas)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.areas)) == 8, "rcHeightfieldLayer.areas has unexpected size % instead of 8", size_of(type_of(rcHeightfieldLayer.areas)));
        assert(((cast(*void)(*instance.cons)) - cast(*void)(*instance)) == 80, "rcHeightfieldLayer.cons has unexpected offset % instead of 80", ((cast(*void)(*instance.cons)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayer.cons)) == 8, "rcHeightfieldLayer.cons has unexpected size % instead of 8", size_of(type_of(rcHeightfieldLayer.cons)));
        assert(size_of(rcHeightfieldLayer) == 88, "rcHeightfieldLayer has size % instead of 88", size_of(rcHeightfieldLayer));
    }

    {
        instance: rcHeightfieldLayerSet;
        assert(((cast(*void)(*instance.layers)) - cast(*void)(*instance)) == 0, "rcHeightfieldLayerSet.layers has unexpected offset % instead of 0", ((cast(*void)(*instance.layers)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayerSet.layers)) == 8, "rcHeightfieldLayerSet.layers has unexpected size % instead of 8", size_of(type_of(rcHeightfieldLayerSet.layers)));
        assert(((cast(*void)(*instance.nlayers)) - cast(*void)(*instance)) == 8, "rcHeightfieldLayerSet.nlayers has unexpected offset % instead of 8", ((cast(*void)(*instance.nlayers)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcHeightfieldLayerSet.nlayers)) == 4, "rcHeightfieldLayerSet.nlayers has unexpected size % instead of 4", size_of(type_of(rcHeightfieldLayerSet.nlayers)));
        assert(size_of(rcHeightfieldLayerSet) == 16, "rcHeightfieldLayerSet has size % instead of 16", size_of(rcHeightfieldLayerSet));
    }

    {
        instance: rcContour;
        assert(((cast(*void)(*instance.verts)) - cast(*void)(*instance)) == 0, "rcContour.verts has unexpected offset % instead of 0", ((cast(*void)(*instance.verts)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContour.verts)) == 8, "rcContour.verts has unexpected size % instead of 8", size_of(type_of(rcContour.verts)));
        assert(((cast(*void)(*instance.nverts)) - cast(*void)(*instance)) == 8, "rcContour.nverts has unexpected offset % instead of 8", ((cast(*void)(*instance.nverts)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContour.nverts)) == 4, "rcContour.nverts has unexpected size % instead of 4", size_of(type_of(rcContour.nverts)));
        assert(((cast(*void)(*instance.rverts)) - cast(*void)(*instance)) == 16, "rcContour.rverts has unexpected offset % instead of 16", ((cast(*void)(*instance.rverts)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContour.rverts)) == 8, "rcContour.rverts has unexpected size % instead of 8", size_of(type_of(rcContour.rverts)));
        assert(((cast(*void)(*instance.nrverts)) - cast(*void)(*instance)) == 24, "rcContour.nrverts has unexpected offset % instead of 24", ((cast(*void)(*instance.nrverts)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContour.nrverts)) == 4, "rcContour.nrverts has unexpected size % instead of 4", size_of(type_of(rcContour.nrverts)));
        assert(((cast(*void)(*instance.reg)) - cast(*void)(*instance)) == 28, "rcContour.reg has unexpected offset % instead of 28", ((cast(*void)(*instance.reg)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContour.reg)) == 2, "rcContour.reg has unexpected size % instead of 2", size_of(type_of(rcContour.reg)));
        assert(((cast(*void)(*instance.area)) - cast(*void)(*instance)) == 30, "rcContour.area has unexpected offset % instead of 30", ((cast(*void)(*instance.area)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContour.area)) == 1, "rcContour.area has unexpected size % instead of 1", size_of(type_of(rcContour.area)));
        assert(size_of(rcContour) == 32, "rcContour has size % instead of 32", size_of(rcContour));
    }

    {
        instance: rcContourSet;
        assert(((cast(*void)(*instance.conts)) - cast(*void)(*instance)) == 0, "rcContourSet.conts has unexpected offset % instead of 0", ((cast(*void)(*instance.conts)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContourSet.conts)) == 8, "rcContourSet.conts has unexpected size % instead of 8", size_of(type_of(rcContourSet.conts)));
        assert(((cast(*void)(*instance.nconts)) - cast(*void)(*instance)) == 8, "rcContourSet.nconts has unexpected offset % instead of 8", ((cast(*void)(*instance.nconts)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContourSet.nconts)) == 4, "rcContourSet.nconts has unexpected size % instead of 4", size_of(type_of(rcContourSet.nconts)));
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 12, "rcContourSet.bmin has unexpected offset % instead of 12", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContourSet.bmin)) == 12, "rcContourSet.bmin has unexpected size % instead of 12", size_of(type_of(rcContourSet.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 24, "rcContourSet.bmax has unexpected offset % instead of 24", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContourSet.bmax)) == 12, "rcContourSet.bmax has unexpected size % instead of 12", size_of(type_of(rcContourSet.bmax)));
        assert(((cast(*void)(*instance.cs)) - cast(*void)(*instance)) == 36, "rcContourSet.cs has unexpected offset % instead of 36", ((cast(*void)(*instance.cs)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContourSet.cs)) == 4, "rcContourSet.cs has unexpected size % instead of 4", size_of(type_of(rcContourSet.cs)));
        assert(((cast(*void)(*instance.ch)) - cast(*void)(*instance)) == 40, "rcContourSet.ch has unexpected offset % instead of 40", ((cast(*void)(*instance.ch)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContourSet.ch)) == 4, "rcContourSet.ch has unexpected size % instead of 4", size_of(type_of(rcContourSet.ch)));
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 44, "rcContourSet.width has unexpected offset % instead of 44", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContourSet.width)) == 4, "rcContourSet.width has unexpected size % instead of 4", size_of(type_of(rcContourSet.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 48, "rcContourSet.height has unexpected offset % instead of 48", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContourSet.height)) == 4, "rcContourSet.height has unexpected size % instead of 4", size_of(type_of(rcContourSet.height)));
        assert(((cast(*void)(*instance.borderSize)) - cast(*void)(*instance)) == 52, "rcContourSet.borderSize has unexpected offset % instead of 52", ((cast(*void)(*instance.borderSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContourSet.borderSize)) == 4, "rcContourSet.borderSize has unexpected size % instead of 4", size_of(type_of(rcContourSet.borderSize)));
        assert(((cast(*void)(*instance.maxError)) - cast(*void)(*instance)) == 56, "rcContourSet.maxError has unexpected offset % instead of 56", ((cast(*void)(*instance.maxError)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcContourSet.maxError)) == 4, "rcContourSet.maxError has unexpected size % instead of 4", size_of(type_of(rcContourSet.maxError)));
        assert(size_of(rcContourSet) == 64, "rcContourSet has size % instead of 64", size_of(rcContourSet));
    }

    {
        instance: rcPolyMesh;
        assert(((cast(*void)(*instance.verts)) - cast(*void)(*instance)) == 0, "rcPolyMesh.verts has unexpected offset % instead of 0", ((cast(*void)(*instance.verts)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.verts)) == 8, "rcPolyMesh.verts has unexpected size % instead of 8", size_of(type_of(rcPolyMesh.verts)));
        assert(((cast(*void)(*instance.polys)) - cast(*void)(*instance)) == 8, "rcPolyMesh.polys has unexpected offset % instead of 8", ((cast(*void)(*instance.polys)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.polys)) == 8, "rcPolyMesh.polys has unexpected size % instead of 8", size_of(type_of(rcPolyMesh.polys)));
        assert(((cast(*void)(*instance.regs)) - cast(*void)(*instance)) == 16, "rcPolyMesh.regs has unexpected offset % instead of 16", ((cast(*void)(*instance.regs)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.regs)) == 8, "rcPolyMesh.regs has unexpected size % instead of 8", size_of(type_of(rcPolyMesh.regs)));
        assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 24, "rcPolyMesh.flags has unexpected offset % instead of 24", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.flags)) == 8, "rcPolyMesh.flags has unexpected size % instead of 8", size_of(type_of(rcPolyMesh.flags)));
        assert(((cast(*void)(*instance.areas)) - cast(*void)(*instance)) == 32, "rcPolyMesh.areas has unexpected offset % instead of 32", ((cast(*void)(*instance.areas)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.areas)) == 8, "rcPolyMesh.areas has unexpected size % instead of 8", size_of(type_of(rcPolyMesh.areas)));
        assert(((cast(*void)(*instance.nverts)) - cast(*void)(*instance)) == 40, "rcPolyMesh.nverts has unexpected offset % instead of 40", ((cast(*void)(*instance.nverts)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.nverts)) == 4, "rcPolyMesh.nverts has unexpected size % instead of 4", size_of(type_of(rcPolyMesh.nverts)));
        assert(((cast(*void)(*instance.npolys)) - cast(*void)(*instance)) == 44, "rcPolyMesh.npolys has unexpected offset % instead of 44", ((cast(*void)(*instance.npolys)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.npolys)) == 4, "rcPolyMesh.npolys has unexpected size % instead of 4", size_of(type_of(rcPolyMesh.npolys)));
        assert(((cast(*void)(*instance.maxpolys)) - cast(*void)(*instance)) == 48, "rcPolyMesh.maxpolys has unexpected offset % instead of 48", ((cast(*void)(*instance.maxpolys)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.maxpolys)) == 4, "rcPolyMesh.maxpolys has unexpected size % instead of 4", size_of(type_of(rcPolyMesh.maxpolys)));
        assert(((cast(*void)(*instance.nvp)) - cast(*void)(*instance)) == 52, "rcPolyMesh.nvp has unexpected offset % instead of 52", ((cast(*void)(*instance.nvp)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.nvp)) == 4, "rcPolyMesh.nvp has unexpected size % instead of 4", size_of(type_of(rcPolyMesh.nvp)));
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 56, "rcPolyMesh.bmin has unexpected offset % instead of 56", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.bmin)) == 12, "rcPolyMesh.bmin has unexpected size % instead of 12", size_of(type_of(rcPolyMesh.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 68, "rcPolyMesh.bmax has unexpected offset % instead of 68", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.bmax)) == 12, "rcPolyMesh.bmax has unexpected size % instead of 12", size_of(type_of(rcPolyMesh.bmax)));
        assert(((cast(*void)(*instance.cs)) - cast(*void)(*instance)) == 80, "rcPolyMesh.cs has unexpected offset % instead of 80", ((cast(*void)(*instance.cs)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.cs)) == 4, "rcPolyMesh.cs has unexpected size % instead of 4", size_of(type_of(rcPolyMesh.cs)));
        assert(((cast(*void)(*instance.ch)) - cast(*void)(*instance)) == 84, "rcPolyMesh.ch has unexpected offset % instead of 84", ((cast(*void)(*instance.ch)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.ch)) == 4, "rcPolyMesh.ch has unexpected size % instead of 4", size_of(type_of(rcPolyMesh.ch)));
        assert(((cast(*void)(*instance.borderSize)) - cast(*void)(*instance)) == 88, "rcPolyMesh.borderSize has unexpected offset % instead of 88", ((cast(*void)(*instance.borderSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.borderSize)) == 4, "rcPolyMesh.borderSize has unexpected size % instead of 4", size_of(type_of(rcPolyMesh.borderSize)));
        assert(((cast(*void)(*instance.maxEdgeError)) - cast(*void)(*instance)) == 92, "rcPolyMesh.maxEdgeError has unexpected offset % instead of 92", ((cast(*void)(*instance.maxEdgeError)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMesh.maxEdgeError)) == 4, "rcPolyMesh.maxEdgeError has unexpected size % instead of 4", size_of(type_of(rcPolyMesh.maxEdgeError)));
        assert(size_of(rcPolyMesh) == 96, "rcPolyMesh has size % instead of 96", size_of(rcPolyMesh));
    }

    {
        instance: rcPolyMeshDetail;
        assert(((cast(*void)(*instance.meshes)) - cast(*void)(*instance)) == 0, "rcPolyMeshDetail.meshes has unexpected offset % instead of 0", ((cast(*void)(*instance.meshes)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMeshDetail.meshes)) == 8, "rcPolyMeshDetail.meshes has unexpected size % instead of 8", size_of(type_of(rcPolyMeshDetail.meshes)));
        assert(((cast(*void)(*instance.verts)) - cast(*void)(*instance)) == 8, "rcPolyMeshDetail.verts has unexpected offset % instead of 8", ((cast(*void)(*instance.verts)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMeshDetail.verts)) == 8, "rcPolyMeshDetail.verts has unexpected size % instead of 8", size_of(type_of(rcPolyMeshDetail.verts)));
        assert(((cast(*void)(*instance.tris)) - cast(*void)(*instance)) == 16, "rcPolyMeshDetail.tris has unexpected offset % instead of 16", ((cast(*void)(*instance.tris)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMeshDetail.tris)) == 8, "rcPolyMeshDetail.tris has unexpected size % instead of 8", size_of(type_of(rcPolyMeshDetail.tris)));
        assert(((cast(*void)(*instance.nmeshes)) - cast(*void)(*instance)) == 24, "rcPolyMeshDetail.nmeshes has unexpected offset % instead of 24", ((cast(*void)(*instance.nmeshes)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMeshDetail.nmeshes)) == 4, "rcPolyMeshDetail.nmeshes has unexpected size % instead of 4", size_of(type_of(rcPolyMeshDetail.nmeshes)));
        assert(((cast(*void)(*instance.nverts)) - cast(*void)(*instance)) == 28, "rcPolyMeshDetail.nverts has unexpected offset % instead of 28", ((cast(*void)(*instance.nverts)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMeshDetail.nverts)) == 4, "rcPolyMeshDetail.nverts has unexpected size % instead of 4", size_of(type_of(rcPolyMeshDetail.nverts)));
        assert(((cast(*void)(*instance.ntris)) - cast(*void)(*instance)) == 32, "rcPolyMeshDetail.ntris has unexpected offset % instead of 32", ((cast(*void)(*instance.ntris)) - cast(*void)(*instance)));
        assert(size_of(type_of(rcPolyMeshDetail.ntris)) == 4, "rcPolyMeshDetail.ntris has unexpected size % instead of 4", size_of(type_of(rcPolyMeshDetail.ntris)));
        assert(size_of(rcPolyMeshDetail) == 40, "rcPolyMeshDetail has size % instead of 40", size_of(rcPolyMeshDetail));
    }

    assert(size_of(duFileIO) == 8, "duFileIO has size % instead of 8", size_of(duFileIO));
}

