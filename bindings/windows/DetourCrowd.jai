//
// This file was auto-generated using the following command:
//
// jai ./generate.jai - -compile
//



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
dtAllocSetCustom :: (allocFunc: dtAllocFunc, freeFunc: dtFreeFunc) -> void #foreign lib/windows/detourcrowd "?dtAllocSetCustom@@YAXP6APEAX_KW4dtAllocHint@@@ZP6AXPEAX@Z@Z";

/// Allocates a memory block.
///  @param[in]		size	The size, in bytes of memory, to allocate.
///  @param[in]		hint	A hint to the allocator on how long the memory is expected to be in use.
///  @return A pointer to the beginning of the allocated memory block, or null if the allocation failed.
/// @see dtFree
dtAlloc :: (size: u64, hint: dtAllocHint) -> *void #foreign lib/windows/detourcrowd "?dtAlloc@@YAPEAX_KW4dtAllocHint@@@Z";

/// Deallocates a memory block.
///  @param[in]		ptr		A pointer to a memory block previously allocated using #dtAlloc.
/// @see dtAlloc
dtFree :: (ptr: *void) -> void #foreign lib/windows/detourcrowd "?dtFree@@YAXPEAX@Z";

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
dtStatusSucceed :: (status: dtStatus) -> bool #foreign lib/windows/detourcrowd "?dtStatusSucceed@@YA_NI@Z";

// Returns true of status is failure.
dtStatusFailed :: (status: dtStatus) -> bool #foreign lib/windows/detourcrowd "?dtStatusFailed@@YA_NI@Z";

// Returns true of status is in progress.
dtStatusInProgress :: (status: dtStatus) -> bool #foreign lib/windows/detourcrowd "?dtStatusInProgress@@YA_NI@Z";

// Returns true if specific detail is set.
dtStatusDetail :: (status: dtStatus, detail: u32) -> bool #foreign lib/windows/detourcrowd "?dtStatusDetail@@YA_NII@Z";

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
    Constructor :: (this: *dtNavMesh) -> void #cpp_method #foreign lib/windows/detourcrowd "??0dtNavMesh@@QEAA@XZ";
    Destructor :: (this: *dtNavMesh) -> void #cpp_method #foreign lib/windows/detourcrowd "??1dtNavMesh@@QEAA@XZ";

    /// Initializes the navigation mesh for tiled use.
    ///  @param[in]	params		Initialization parameters.
    /// @return The status flags for the operation.
    init :: (this: *dtNavMesh, params: *dtNavMeshParams) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?init@dtNavMesh@@QEAAIPEBUdtNavMeshParams@@@Z";

    /// Initializes the navigation mesh for single tile use.
    ///  @param[in]	data		Data of the new tile. (See: #dtCreateNavMeshData)
    ///  @param[in]	dataSize	The data size of the new tile.
    ///  @param[in]	flags		The tile flags. (See: #dtTileFlags)
    /// @return The status flags for the operation.
    ///  @see dtCreateNavMeshData
    init :: (this: *dtNavMesh, data: *u8, dataSize: s32, flags: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?init@dtNavMesh@@QEAAIPEAEHH@Z";

    /// The navigation mesh initialization params.
    getParams :: (this: *dtNavMesh) -> *dtNavMeshParams #cpp_method #foreign lib/windows/detourcrowd "?getParams@dtNavMesh@@QEBAPEBUdtNavMeshParams@@XZ";

    /// Adds a tile to the navigation mesh.
    ///  @param[in]		data		Data for the new tile mesh. (See: #dtCreateNavMeshData)
    ///  @param[in]		dataSize	Data size of the new tile mesh.
    ///  @param[in]		flags		Tile flags. (See: #dtTileFlags)
    ///  @param[in]		lastRef		The desired reference for the tile. (When reloading a tile.) [opt] [Default: 0]
    ///  @param[out]	result		The tile reference. (If the tile was succesfully added.) [opt]
    /// @return The status flags for the operation.
    addTile :: (this: *dtNavMesh, data: *u8, dataSize: s32, flags: s32, lastRef: dtTileRef, result: *dtTileRef) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?addTile@dtNavMesh@@QEAAIPEAEHHIPEAI@Z";

    /// Removes the specified tile from the navigation mesh.
    ///  @param[in]		ref			The reference of the tile to remove.
    ///  @param[out]	data		Data associated with deleted tile.
    ///  @param[out]	dataSize	Size of the data associated with deleted tile.
    /// @return The status flags for the operation.
    removeTile :: (this: *dtNavMesh, ref: dtTileRef, data: **u8, dataSize: *s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?removeTile@dtNavMesh@@QEAAIIPEAPEAEPEAH@Z";

    /// Calculates the tile grid location for the specified world position.
    ///  @param[in]	pos  The world position for the query. [(x, y, z)]
    ///  @param[out]	tx		The tile's x-location. (x, y)
    ///  @param[out]	ty		The tile's y-location. (x, y)
    calcTileLoc :: (this: *dtNavMesh, pos: *float, tx: *s32, ty: *s32) -> void #cpp_method #foreign lib/windows/detourcrowd "?calcTileLoc@dtNavMesh@@QEBAXPEBMPEAH1@Z";

    /// Gets the tile at the specified grid location.
    ///  @param[in]	x		The tile's x-location. (x, y, layer)
    ///  @param[in]	y		The tile's y-location. (x, y, layer)
    ///  @param[in]	layer	The tile's layer. (x, y, layer)
    /// @return The tile, or null if the tile does not exist.
    getTileAt :: (this: *dtNavMesh, x: s32, y: s32, layer: s32) -> *dtMeshTile #cpp_method #foreign lib/windows/detourcrowd "?getTileAt@dtNavMesh@@QEBAPEBUdtMeshTile@@HHH@Z";

    /// Gets all tiles at the specified grid location. (All layers.)
    ///  @param[in]		x			The tile's x-location. (x, y)
    ///  @param[in]		y			The tile's y-location. (x, y)
    ///  @param[out]	tiles		A pointer to an array of tiles that will hold the result.
    ///  @param[in]		maxTiles	The maximum tiles the tiles parameter can hold.
    /// @return The number of tiles returned in the tiles array.
    getTilesAt :: (this: /*const*/ *dtNavMesh, x: /*const*/ s32, y: /*const*/ s32, tiles: **dtMeshTile, maxTiles: /*const*/ s32) -> s32 #cpp_method #foreign lib/windows/detourcrowd "?getTilesAt@dtNavMesh@@QEBAHHHPEAPEBUdtMeshTile@@H@Z";

    /// Gets the tile reference for the tile at specified grid location.
    ///  @param[in]	x		The tile's x-location. (x, y, layer)
    ///  @param[in]	y		The tile's y-location. (x, y, layer)
    ///  @param[in]	layer	The tile's layer. (x, y, layer)
    /// @return The tile reference of the tile, or 0 if there is none.
    getTileRefAt :: (this: *dtNavMesh, x: s32, y: s32, layer: s32) -> dtTileRef #cpp_method #foreign lib/windows/detourcrowd "?getTileRefAt@dtNavMesh@@QEBAIHHH@Z";

    /// Gets the tile reference for the specified tile.
    ///  @param[in]	tile	The tile.
    /// @return The tile reference of the tile.
    getTileRef :: (this: *dtNavMesh, tile: *dtMeshTile) -> dtTileRef #cpp_method #foreign lib/windows/detourcrowd "?getTileRef@dtNavMesh@@QEBAIPEBUdtMeshTile@@@Z";

    /// Gets the tile for the specified tile reference.
    ///  @param[in]	ref		The tile reference of the tile to retrieve.
    /// @return The tile for the specified reference, or null if the
    ///		reference is invalid.
    getTileByRef :: (this: *dtNavMesh, ref: dtTileRef) -> *dtMeshTile #cpp_method #foreign lib/windows/detourcrowd "?getTileByRef@dtNavMesh@@QEBAPEBUdtMeshTile@@I@Z";

    /// The maximum number of tiles supported by the navigation mesh.
    /// @return The maximum number of tiles supported by the navigation mesh.
    getMaxTiles :: (this: *dtNavMesh) -> s32 #cpp_method #foreign lib/windows/detourcrowd "?getMaxTiles@dtNavMesh@@QEBAHXZ";

    /// Gets the tile at the specified index.
    ///  @param[in]	i		The tile index. [Limit: 0 >= index < #getMaxTiles()]
    /// @return The tile at the specified index.
    getTile :: (this: /*const*/ *dtNavMesh, i: s32) -> *dtMeshTile #cpp_method #foreign lib/windows/detourcrowd "?getTile@dtNavMesh@@QEBAPEBUdtMeshTile@@H@Z";

    /// Gets the tile and polygon for the specified polygon reference.
    ///  @param[in]		ref		The reference for the a polygon.
    ///  @param[out]	tile	The tile containing the polygon.
    ///  @param[out]	poly	The polygon.
    /// @return The status flags for the operation.
    getTileAndPolyByRef :: (this: *dtNavMesh, ref: dtPolyRef, tile: **dtMeshTile, poly: **dtPoly) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getTileAndPolyByRef@dtNavMesh@@QEBAIIPEAPEBUdtMeshTile@@PEAPEBUdtPoly@@@Z";

    /// Returns the tile and polygon for the specified polygon reference.
    ///  @param[in]		ref		A known valid reference for a polygon.
    ///  @param[out]	tile	The tile containing the polygon.
    ///  @param[out]	poly	The polygon.
    getTileAndPolyByRefUnsafe :: (this: *dtNavMesh, ref: dtPolyRef, tile: **dtMeshTile, poly: **dtPoly) -> void #cpp_method #foreign lib/windows/detourcrowd "?getTileAndPolyByRefUnsafe@dtNavMesh@@QEBAXIPEAPEBUdtMeshTile@@PEAPEBUdtPoly@@@Z";

    /// Checks the validity of a polygon reference.
    ///  @param[in]	ref		The polygon reference to check.
    /// @return True if polygon reference is valid for the navigation mesh.
    isValidPolyRef :: (this: *dtNavMesh, ref: dtPolyRef) -> bool #cpp_method #foreign lib/windows/detourcrowd "?isValidPolyRef@dtNavMesh@@QEBA_NI@Z";

    /// Gets the polygon reference for the tile's base polygon.
    ///  @param[in]	tile		The tile.
    /// @return The polygon reference for the base polygon in the specified tile.
    getPolyRefBase :: (this: *dtNavMesh, tile: *dtMeshTile) -> dtPolyRef #cpp_method #foreign lib/windows/detourcrowd "?getPolyRefBase@dtNavMesh@@QEBAIPEBUdtMeshTile@@@Z";

    /// Gets the endpoints for an off-mesh connection, ordered by "direction of travel".
    ///  @param[in]		prevRef		The reference of the polygon before the connection.
    ///  @param[in]		polyRef		The reference of the off-mesh connection polygon.
    ///  @param[out]	startPos	The start position of the off-mesh connection. [(x, y, z)]
    ///  @param[out]	endPos		The end position of the off-mesh connection. [(x, y, z)]
    /// @return The status flags for the operation.
    getOffMeshConnectionPolyEndPoints :: (this: *dtNavMesh, prevRef: dtPolyRef, polyRef: dtPolyRef, startPos: *float, endPos: *float) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getOffMeshConnectionPolyEndPoints@dtNavMesh@@QEBAIIIPEAM0@Z";

    /// Gets the specified off-mesh connection.
    ///  @param[in]	ref		The polygon reference of the off-mesh connection.
    /// @return The specified off-mesh connection, or null if the polygon reference is not valid.
    getOffMeshConnectionByRef :: (this: *dtNavMesh, ref: dtPolyRef) -> *dtOffMeshConnection #cpp_method #foreign lib/windows/detourcrowd "?getOffMeshConnectionByRef@dtNavMesh@@QEBAPEBUdtOffMeshConnection@@I@Z";

    /// Sets the user defined flags for the specified polygon.
    ///  @param[in]	ref		The polygon reference.
    ///  @param[in]	flags	The new flags for the polygon.
    /// @return The status flags for the operation.
    setPolyFlags :: (this: *dtNavMesh, ref: dtPolyRef, flags: u16) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?setPolyFlags@dtNavMesh@@QEAAIIG@Z";

    /// Gets the user defined flags for the specified polygon.
    ///  @param[in]		ref				The polygon reference.
    ///  @param[out]	resultFlags		The polygon flags.
    /// @return The status flags for the operation.
    getPolyFlags :: (this: *dtNavMesh, ref: dtPolyRef, resultFlags: *u16) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getPolyFlags@dtNavMesh@@QEBAIIPEAG@Z";

    /// Sets the user defined area for the specified polygon.
    ///  @param[in]	ref		The polygon reference.
    ///  @param[in]	area	The new area id for the polygon. [Limit: < #DT_MAX_AREAS]
    /// @return The status flags for the operation.
    setPolyArea :: (this: *dtNavMesh, ref: dtPolyRef, area: u8) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?setPolyArea@dtNavMesh@@QEAAIIE@Z";

    /// Gets the user defined area for the specified polygon.
    ///  @param[in]		ref			The polygon reference.
    ///  @param[out]	resultArea	The area id for the polygon.
    /// @return The status flags for the operation.
    getPolyArea :: (this: *dtNavMesh, ref: dtPolyRef, resultArea: *u8) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getPolyArea@dtNavMesh@@QEBAIIPEAE@Z";

    /// Gets the size of the buffer required by #storeTileState to store the specified tile's state.
    ///  @param[in]	tile	The tile.
    /// @return The size of the buffer required to store the state.
    getTileStateSize :: (this: *dtNavMesh, tile: *dtMeshTile) -> s32 #cpp_method #foreign lib/windows/detourcrowd "?getTileStateSize@dtNavMesh@@QEBAHPEBUdtMeshTile@@@Z";

    /// Stores the non-structural state of the tile in the specified buffer. (Flags, area ids, etc.)
    ///  @param[in]		tile			The tile.
    ///  @param[out]	data			The buffer to store the tile's state in.
    ///  @param[in]		maxDataSize		The size of the data buffer. [Limit: >= #getTileStateSize]
    /// @return The status flags for the operation.
    storeTileState :: (this: *dtNavMesh, tile: *dtMeshTile, data: *u8, maxDataSize: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?storeTileState@dtNavMesh@@QEBAIPEBUdtMeshTile@@PEAEH@Z";

    /// Restores the state of the tile.
    ///  @param[in]	tile			The tile.
    ///  @param[in]	data			The new state. (Obtained from #storeTileState.)
    ///  @param[in]	maxDataSize		The size of the state within the data buffer.
    /// @return The status flags for the operation.
    restoreTileState :: (this: *dtNavMesh, tile: *dtMeshTile, data: *u8, maxDataSize: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?restoreTileState@dtNavMesh@@QEAAIPEAUdtMeshTile@@PEBEH@Z";

    /// Derives a standard polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	salt	The tile's salt value.
    ///  @param[in]	it		The index of the tile.
    ///  @param[in]	ip		The index of the polygon within the tile.
    encodePolyId :: (this: *dtNavMesh, salt: u32, it: u32, ip: u32) -> dtPolyRef #cpp_method #foreign lib/windows/detourcrowd "?encodePolyId@dtNavMesh@@QEBAIIII@Z";

    /// Decodes a standard polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref   The polygon reference to decode.
    ///  @param[out]	salt	The tile's salt value.
    ///  @param[out]	it		The index of the tile.
    ///  @param[out]	ip		The index of the polygon within the tile.
    ///  @see #encodePolyId
    decodePolyId :: (this: *dtNavMesh, ref: dtPolyRef, salt: *u32, it: *u32, ip: *u32) -> void #cpp_method #foreign lib/windows/detourcrowd "?decodePolyId@dtNavMesh@@QEBAXIAEAI00@Z";

    /// Extracts a tile's salt value from the specified polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref		The polygon reference.
    ///  @see #encodePolyId
    decodePolyIdSalt :: (this: *dtNavMesh, ref: dtPolyRef) -> u32 #cpp_method #foreign lib/windows/detourcrowd "?decodePolyIdSalt@dtNavMesh@@QEBAII@Z";

    /// Extracts the tile's index from the specified polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref		The polygon reference.
    ///  @see #encodePolyId
    decodePolyIdTile :: (this: *dtNavMesh, ref: dtPolyRef) -> u32 #cpp_method #foreign lib/windows/detourcrowd "?decodePolyIdTile@dtNavMesh@@QEBAII@Z";

    /// Extracts the polygon's index (within its tile) from the specified polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref		The polygon reference.
    ///  @see #encodePolyId
    decodePolyIdPoly :: (this: *dtNavMesh, ref: dtPolyRef) -> u32 #cpp_method #foreign lib/windows/detourcrowd "?decodePolyIdPoly@dtNavMesh@@QEBAII@Z";

    /// Returns pointer to tile in the tile array.
    getTile_1 :: (this: *dtNavMesh, i: s32) -> *dtMeshTile #cpp_method #foreign lib/windows/detourcrowd "?getTile@dtNavMesh@@AEAAPEAUdtMeshTile@@H@Z";

    /// Returns neighbour tile based on side.
    getTilesAt_1 :: (this: /*const*/ *dtNavMesh, x: /*const*/ s32, y: /*const*/ s32, tiles: **dtMeshTile, maxTiles: /*const*/ s32) -> s32 #cpp_method #foreign lib/windows/detourcrowd "?getTilesAt@dtNavMesh@@AEBAHHHPEAPEAUdtMeshTile@@H@Z";

    /// Returns neighbour tile based on side.
    getNeighbourTilesAt :: (this: *dtNavMesh, x: s32, y: s32, side: s32, tiles: **dtMeshTile, maxTiles: s32) -> s32 #cpp_method #foreign lib/windows/detourcrowd "?getNeighbourTilesAt@dtNavMesh@@AEBAHHHHPEAPEAUdtMeshTile@@H@Z";

    /// Returns all polygons in neighbour tile based on portal defined by the segment.
    findConnectingPolys :: (this: *dtNavMesh, va: *float, vb: *float, tile: *dtMeshTile, side: s32, con: *dtPolyRef, conarea: *float, maxcon: s32) -> s32 #cpp_method #foreign lib/windows/detourcrowd "?findConnectingPolys@dtNavMesh@@AEBAHPEBM0PEBUdtMeshTile@@HPEAIPEAMH@Z";

    /// Builds internal polygons links for a tile.
    connectIntLinks :: (this: *dtNavMesh, tile: *dtMeshTile) -> void #cpp_method #foreign lib/windows/detourcrowd "?connectIntLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@@Z";

    /// Builds internal polygons links for a tile.
    baseOffMeshLinks :: (this: *dtNavMesh, tile: *dtMeshTile) -> void #cpp_method #foreign lib/windows/detourcrowd "?baseOffMeshLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@@Z";

    /// Builds external polygon links for a tile.
    connectExtLinks :: (this: *dtNavMesh, tile: *dtMeshTile, target: *dtMeshTile, side: s32) -> void #cpp_method #foreign lib/windows/detourcrowd "?connectExtLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@0H@Z";

    /// Builds external polygon links for a tile.
    connectExtOffMeshLinks :: (this: *dtNavMesh, tile: *dtMeshTile, target: *dtMeshTile, side: s32) -> void #cpp_method #foreign lib/windows/detourcrowd "?connectExtOffMeshLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@0H@Z";

    /// Removes external links at specified side.
    unconnectLinks :: (this: *dtNavMesh, tile: *dtMeshTile, target: *dtMeshTile) -> void #cpp_method #foreign lib/windows/detourcrowd "?unconnectLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@0@Z";

    /// Queries polygons within a tile.
    queryPolygonsInTile :: (this: *dtNavMesh, tile: *dtMeshTile, qmin: *float, qmax: *float, polys: *dtPolyRef, maxPolys: s32) -> s32 #cpp_method #foreign lib/windows/detourcrowd "?queryPolygonsInTile@dtNavMesh@@AEBAHPEBUdtMeshTile@@PEBM1PEAIH@Z";

    /// Find nearest polygon within a tile.
    findNearestPolyInTile :: (this: *dtNavMesh, tile: *dtMeshTile, center: *float, halfExtents: *float, nearestPt: *float) -> dtPolyRef #cpp_method #foreign lib/windows/detourcrowd "?findNearestPolyInTile@dtNavMesh@@AEBAIPEBUdtMeshTile@@PEBM1PEAM@Z";

    /// Returns whether position is over the poly and the height at the position if so.
    getPolyHeight :: (this: *dtNavMesh, tile: *dtMeshTile, poly: *dtPoly, pos: *float, height: *float) -> bool #cpp_method #foreign lib/windows/detourcrowd "?getPolyHeight@dtNavMesh@@AEBA_NPEBUdtMeshTile@@PEBUdtPoly@@PEBMPEAM@Z";

    /// Returns closest point on polygon.
    closestPointOnPoly :: (this: *dtNavMesh, ref: dtPolyRef, pos: *float, closest: *float, posOverPoly: *bool) -> void #cpp_method #foreign lib/windows/detourcrowd "?closestPointOnPoly@dtNavMesh@@AEBAXIPEBMPEAMPEA_N@Z";

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
dtAllocNavMesh :: () -> *dtNavMesh #foreign lib/windows/detourcrowd "?dtAllocNavMesh@@YAPEAVdtNavMesh@@XZ";

/// Frees the specified navigation mesh object using the Detour allocator.
///  @param[in]	navmesh		A navigation mesh allocated using #dtAllocNavMesh
///  @ingroup detour
dtFreeNavMesh :: (navmesh: *dtNavMesh) -> void #foreign lib/windows/detourcrowd "?dtFreeNavMesh@@YAXPEAVdtNavMesh@@@Z";

/// Defines polygon filtering and traversal costs for navigation mesh query operations.
/// @ingroup detour
dtQueryFilter :: struct {
    m_areaCost:     [64] float; ///< Cost per area type. (Used by default implementation.)
    m_includeFlags: u16; ///< Flags for polygons that can be visited. (Used by default implementation.)
    m_excludeFlags: u16; ///< Flags for polygons that should not be visited. (Used by default implementation.)

    Constructor :: (this: *dtQueryFilter) -> void #cpp_method #foreign lib/windows/detourcrowd "??0dtQueryFilter@@QEAA@XZ";

    passFilter :: (this: *dtQueryFilter, ref: dtPolyRef, tile: *dtMeshTile, poly: *dtPoly) -> bool #cpp_method #foreign lib/windows/detourcrowd "?passFilter@dtQueryFilter@@QEBA_NIPEBUdtMeshTile@@PEBUdtPoly@@@Z";

    getCost :: (this: *dtQueryFilter, pa: *float, pb: *float, prevRef: dtPolyRef, prevTile: *dtMeshTile, prevPoly: *dtPoly, curRef: dtPolyRef, curTile: *dtMeshTile, curPoly: *dtPoly, nextRef: dtPolyRef, nextTile: *dtMeshTile, nextPoly: *dtPoly) -> float #cpp_method #foreign lib/windows/detourcrowd "?getCost@dtQueryFilter@@QEBAMPEBM0IPEBUdtMeshTile@@PEBUdtPoly@@I12I12@Z";

    /// Returns the traversal cost of the area.
    ///  @param[in]		i		The id of the area.
    /// @returns The traversal cost of the area.
    getAreaCost :: (this: *dtQueryFilter, i: s32) -> float #cpp_method #foreign lib/windows/detourcrowd "?getAreaCost@dtQueryFilter@@QEBAMH@Z";

    /// Sets the traversal cost of the area.
    ///  @param[in]		i		The id of the area.
    ///  @param[in]		cost	The new cost of traversing the area.
    setAreaCost :: (this: *dtQueryFilter, i: s32, cost: float) -> void #cpp_method #foreign lib/windows/detourcrowd "?setAreaCost@dtQueryFilter@@QEAAXHM@Z";

    /// Returns the include flags for the filter.
    /// Any polygons that include one or more of these flags will be
    /// included in the operation.
    getIncludeFlags :: (this: *dtQueryFilter) -> u16 #cpp_method #foreign lib/windows/detourcrowd "?getIncludeFlags@dtQueryFilter@@QEBAGXZ";

    /// Sets the include flags for the filter.
    /// @param[in]		flags	The new flags.
    setIncludeFlags :: (this: *dtQueryFilter, flags: u16) -> void #cpp_method #foreign lib/windows/detourcrowd "?setIncludeFlags@dtQueryFilter@@QEAAXG@Z";

    /// Returns the exclude flags for the filter.
    /// Any polygons that include one ore more of these flags will be
    /// excluded from the operation.
    getExcludeFlags :: (this: *dtQueryFilter) -> u16 #cpp_method #foreign lib/windows/detourcrowd "?getExcludeFlags@dtQueryFilter@@QEBAGXZ";

    /// Sets the exclude flags for the filter.
    /// @param[in]		flags		The new flags.
    setExcludeFlags :: (this: *dtQueryFilter, flags: u16) -> void #cpp_method #foreign lib/windows/detourcrowd "?setExcludeFlags@dtQueryFilter@@QEAAXG@Z";
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
    virtual_Destructor :: (this: *dtPolyQuery, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign lib/windows/detourcrowd "??1dtPolyQuery@@UEAA@XZ";
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
    Constructor :: (this: *dtNavMeshQuery) -> void #cpp_method #foreign lib/windows/detourcrowd "??0dtNavMeshQuery@@QEAA@XZ";
    Destructor :: (this: *dtNavMeshQuery) -> void #cpp_method #foreign lib/windows/detourcrowd "??1dtNavMeshQuery@@QEAA@XZ";

    /// Initializes the query object.
    ///  @param[in]		nav			Pointer to the dtNavMesh object to use for all queries.
    ///  @param[in]		maxNodes	Maximum number of search nodes. [Limits: 0 < value <= 65535]
    /// @returns The status flags for the query.
    init :: (this: *dtNavMeshQuery, nav: *dtNavMesh, maxNodes: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?init@dtNavMeshQuery@@QEAAIPEBVdtNavMesh@@H@Z";

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
    findPath :: (this: *dtNavMeshQuery, startRef: dtPolyRef, endRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?findPath@dtNavMeshQuery@@QEBAIIIPEBM0PEBVdtQueryFilter@@PEAIPEAHH@Z";

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
    findStraightPath :: (this: *dtNavMeshQuery, startPos: *float, endPos: *float, path: *dtPolyRef, pathSize: s32, straightPath: *float, straightPathFlags: *u8, straightPathRefs: *dtPolyRef, straightPathCount: *s32, maxStraightPath: s32, options: s32 = 0) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?findStraightPath@dtNavMeshQuery@@QEBAIPEBM0PEBIHPEAMPEAEPEAIPEAHHH@Z";

    /// Initializes a sliced path query.
    ///  @param[in]		startRef	The reference id of the start polygon.
    ///  @param[in]		endRef		The reference id of the end polygon.
    ///  @param[in]		startPos	A position within the start polygon. [(x, y, z)]
    ///  @param[in]		endPos		A position within the end polygon. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[in]		options		query options (see: #dtFindPathOptions)
    /// @returns The status flags for the query.
    initSlicedFindPath :: (this: *dtNavMeshQuery, startRef: dtPolyRef, endRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, options: u32 = 0) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?initSlicedFindPath@dtNavMeshQuery@@QEAAIIIPEBM0PEBVdtQueryFilter@@I@Z";

    /// Updates an in-progress sliced path query.
    ///  @param[in]		maxIter		The maximum number of iterations to perform.
    ///  @param[out]	doneIters	The actual number of iterations completed. [opt]
    /// @returns The status flags for the query.
    updateSlicedFindPath :: (this: *dtNavMeshQuery, maxIter: s32, doneIters: *s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?updateSlicedFindPath@dtNavMeshQuery@@QEAAIHPEAH@Z";

    /// Finalizes and returns the results of a sliced path query.
    ///  @param[out]	path		An ordered list of polygon references representing the path. (Start to end.)
    ///  							[(polyRef) * @p pathCount]
    ///  @param[out]	pathCount	The number of polygons returned in the @p path array.
    ///  @param[in]		maxPath		The max number of polygons the path array can hold. [Limit: >= 1]
    /// @returns The status flags for the query.
    finalizeSlicedFindPath :: (this: *dtNavMeshQuery, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?finalizeSlicedFindPath@dtNavMeshQuery@@QEAAIPEAIPEAHH@Z";

    /// Finalizes and returns the results of an incomplete sliced path query, returning the path to the furthest
    /// polygon on the existing path that was visited during the search.
    ///  @param[in]		existing		An array of polygon references for the existing path.
    ///  @param[in]		existingSize	The number of polygon in the @p existing array.
    ///  @param[out]	path			An ordered list of polygon references representing the path. (Start to end.)
    ///  								[(polyRef) * @p pathCount]
    ///  @param[out]	pathCount		The number of polygons returned in the @p path array.
    ///  @param[in]		maxPath			The max number of polygons the @p path array can hold. [Limit: >= 1]
    /// @returns The status flags for the query.
    finalizeSlicedFindPathPartial :: (this: *dtNavMeshQuery, existing: *dtPolyRef, existingSize: s32, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?finalizeSlicedFindPathPartial@dtNavMeshQuery@@QEAAIPEBIHPEAIPEAHH@Z";

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
    findPolysAroundCircle :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, radius: float, filter: *dtQueryFilter, resultRef: *dtPolyRef, resultParent: *dtPolyRef, resultCost: *float, resultCount: *s32, maxResult: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?findPolysAroundCircle@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@PEAI2PEAMPEAHH@Z";

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
    findPolysAroundShape :: (this: *dtNavMeshQuery, startRef: dtPolyRef, verts: *float, nverts: s32, filter: *dtQueryFilter, resultRef: *dtPolyRef, resultParent: *dtPolyRef, resultCost: *float, resultCount: *s32, maxResult: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?findPolysAroundShape@dtNavMeshQuery@@QEBAIIPEBMHPEBVdtQueryFilter@@PEAI2PEAMPEAHH@Z";

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
    getPathFromDijkstraSearch :: (this: *dtNavMeshQuery, endRef: dtPolyRef, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getPathFromDijkstraSearch@dtNavMeshQuery@@QEBAIIPEAIPEAHH@Z";

    /// Finds the polygon nearest to the specified center point.
    /// [opt] means the specified parameter can be a null pointer, in that case the output parameter will not be set.
    ///
    ///  @param[in]		center		The center of the search box. [(x, y, z)]
    ///  @param[in]		halfExtents	The search distance along each axis. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[out]	nearestRef	The reference id of the nearest polygon. Will be set to 0 if no polygon is found.
    ///  @param[out]	nearestPt	The nearest point on the polygon. Unchanged if no polygon is found. [opt] [(x, y, z)]
    /// @returns The status flags for the query.
    findNearestPoly :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, nearestRef: *dtPolyRef, nearestPt: *float) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?findNearestPoly@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAIPEAM@Z";

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
    findNearestPoly :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, nearestRef: *dtPolyRef, nearestPt: *float, isOverPoly: *bool) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?findNearestPoly@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAIPEAMPEA_N@Z";

    /// Finds polygons that overlap the search box.
    ///  @param[in]		center		The center of the search box. [(x, y, z)]
    ///  @param[in]		halfExtents		The search distance along each axis. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[out]	polys		The reference ids of the polygons that overlap the query box.
    ///  @param[out]	polyCount	The number of polygons in the search result.
    ///  @param[in]		maxPolys	The maximum number of polygons the search result can hold.
    /// @returns The status flags for the query.
    queryPolygons :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, polys: *dtPolyRef, polyCount: *s32, maxPolys: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?queryPolygons@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAIPEAHH@Z";

    /// Finds polygons that overlap the search box.
    ///  @param[in]		center		The center of the search box. [(x, y, z)]
    ///  @param[in]		halfExtents		The search distance along each axis. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[in]		query		The query. Polygons found will be batched together and passed to this query.
    queryPolygons :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, query: *dtPolyQuery) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?queryPolygons@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAVdtPolyQuery@@@Z";

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
    findLocalNeighbourhood :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, radius: float, filter: *dtQueryFilter, resultRef: *dtPolyRef, resultParent: *dtPolyRef, resultCount: *s32, maxResult: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?findLocalNeighbourhood@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@PEAI2PEAHH@Z";

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
    moveAlongSurface :: (this: *dtNavMeshQuery, startRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, resultPos: *float, visited: *dtPolyRef, visitedCount: *s32, maxVisitedSize: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?moveAlongSurface@dtNavMeshQuery@@QEBAIIPEBM0PEBVdtQueryFilter@@PEAMPEAIPEAHH@Z";

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
    raycast :: (this: *dtNavMeshQuery, startRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, t: *float, hitNormal: *float, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?raycast@dtNavMeshQuery@@QEBAIIPEBM0PEBVdtQueryFilter@@PEAM2PEAIPEAHH@Z";

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
    raycast :: (this: *dtNavMeshQuery, startRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, options: u32, hit: *dtRaycastHit, prevRef: dtPolyRef = 0) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?raycast@dtNavMeshQuery@@QEBAIIPEBM0PEBVdtQueryFilter@@IPEAUdtRaycastHit@@I@Z";

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
    findDistanceToWall :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, maxRadius: float, filter: *dtQueryFilter, hitDist: *float, hitPos: *float, hitNormal: *float) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?findDistanceToWall@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@PEAM22@Z";

    /// Returns the segments for the specified polygon, optionally including portals.
    ///  @param[in]		ref				The reference id of the polygon.
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[out]	segmentVerts	The segments. [(ax, ay, az, bx, by, bz) * segmentCount]
    ///  @param[out]	segmentRefs		The reference ids of each segment's neighbor polygon.
    ///  								Or zero if the segment is a wall. [opt] [(parentRef) * @p segmentCount]
    ///  @param[out]	segmentCount	The number of segments returned.
    ///  @param[in]		maxSegments		The maximum number of segments the result arrays can hold.
    /// @returns The status flags for the query.
    getPolyWallSegments :: (this: *dtNavMeshQuery, ref: dtPolyRef, filter: *dtQueryFilter, segmentVerts: *float, segmentRefs: *dtPolyRef, segmentCount: *s32, maxSegments: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getPolyWallSegments@dtNavMeshQuery@@QEBAIIPEBVdtQueryFilter@@PEAMPEAIPEAHH@Z";

    /// Returns random location on navmesh.
    /// Polygons are chosen weighted by area. The search runs in linear related to number of polygon.
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[in]		frand			Function returning a random number [0..1).
    ///  @param[out]	randomRef		The reference id of the random location.
    ///  @param[out]	randomPt		The random location.
    /// @returns The status flags for the query.
    findRandomPoint :: (this: *dtNavMeshQuery, filter: *dtQueryFilter, frand: #type () -> float #c_call, randomRef: *dtPolyRef, randomPt: *float) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?findRandomPoint@dtNavMeshQuery@@QEBAIPEBVdtQueryFilter@@P6AMXZPEAIPEAM@Z";

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
    findRandomPointAroundCircle :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, maxRadius: float, filter: *dtQueryFilter, frand: #type () -> float #c_call, randomRef: *dtPolyRef, randomPt: *float) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?findRandomPointAroundCircle@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@P6AMXZPEAIPEAM@Z";

    /// Finds the closest point on the specified polygon.
    ///  @param[in]		ref			The reference id of the polygon.
    ///  @param[in]		pos			The position to check. [(x, y, z)]
    ///  @param[out]	closest		The closest point on the polygon. [(x, y, z)]
    ///  @param[out]	posOverPoly	True of the position is over the polygon.
    /// @returns The status flags for the query.
    closestPointOnPoly :: (this: *dtNavMeshQuery, ref: dtPolyRef, pos: *float, closest: *float, posOverPoly: *bool) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?closestPointOnPoly@dtNavMeshQuery@@QEBAIIPEBMPEAMPEA_N@Z";

    /// Returns a point on the boundary closest to the source point if the source point is outside the
    /// polygon's xz-bounds.
    ///  @param[in]		ref			The reference id to the polygon.
    ///  @param[in]		pos			The position to check. [(x, y, z)]
    ///  @param[out]	closest		The closest point. [(x, y, z)]
    /// @returns The status flags for the query.
    closestPointOnPolyBoundary :: (this: *dtNavMeshQuery, ref: dtPolyRef, pos: *float, closest: *float) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?closestPointOnPolyBoundary@dtNavMeshQuery@@QEBAIIPEBMPEAM@Z";

    /// Gets the height of the polygon at the provided position using the height detail. (Most accurate.)
    ///  @param[in]		ref			The reference id of the polygon.
    ///  @param[in]		pos			A position within the xz-bounds of the polygon. [(x, y, z)]
    ///  @param[out]	height		The height at the surface of the polygon.
    /// @returns The status flags for the query.
    getPolyHeight :: (this: *dtNavMeshQuery, ref: dtPolyRef, pos: *float, height: *float) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getPolyHeight@dtNavMeshQuery@@QEBAIIPEBMPEAM@Z";

    /// Returns true if the polygon reference is valid and passes the filter restrictions.
    ///  @param[in]		ref			The polygon reference to check.
    ///  @param[in]		filter		The filter to apply.
    isValidPolyRef :: (this: *dtNavMeshQuery, ref: dtPolyRef, filter: *dtQueryFilter) -> bool #cpp_method #foreign lib/windows/detourcrowd "?isValidPolyRef@dtNavMeshQuery@@QEBA_NIPEBVdtQueryFilter@@@Z";

    /// Returns true if the polygon reference is in the closed list.
    ///  @param[in]		ref		The reference id of the polygon to check.
    /// @returns True if the polygon is in closed list.
    isInClosedList :: (this: *dtNavMeshQuery, ref: dtPolyRef) -> bool #cpp_method #foreign lib/windows/detourcrowd "?isInClosedList@dtNavMeshQuery@@QEBA_NI@Z";

    dtNodePool :: struct {}
    /// Gets the node pool.
    /// @returns The node pool.
    getNodePool :: (this: *dtNavMeshQuery) -> *dtNodePool #cpp_method #foreign lib/windows/detourcrowd "?getNodePool@dtNavMeshQuery@@QEBAPEAVdtNodePool@@XZ";

    /// Gets the navigation mesh the query object is using.
    /// @return The navigation mesh the query object is using.
    getAttachedNavMesh :: (this: *dtNavMeshQuery) -> *dtNavMesh #cpp_method #foreign lib/windows/detourcrowd "?getAttachedNavMesh@dtNavMeshQuery@@QEBAPEBVdtNavMesh@@XZ";

    /// Queries polygons within a tile.
    queryPolygonsInTile :: (this: *dtNavMeshQuery, tile: *dtMeshTile, qmin: *float, qmax: *float, filter: *dtQueryFilter, query: *dtPolyQuery) -> void #cpp_method #foreign lib/windows/detourcrowd "?queryPolygonsInTile@dtNavMeshQuery@@AEBAXPEBUdtMeshTile@@PEBM1PEBVdtQueryFilter@@PEAVdtPolyQuery@@@Z";

    /// Returns portal points between two polygons.
    getPortalPoints :: (this: *dtNavMeshQuery, from: dtPolyRef, to: dtPolyRef, left: *float, right: *float, fromType: *u8, toType: *u8) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getPortalPoints@dtNavMeshQuery@@AEBAIIIPEAM0AEAE1@Z";

    getPortalPoints :: (this: *dtNavMeshQuery, from: dtPolyRef, fromPoly: *dtPoly, fromTile: *dtMeshTile, to: dtPolyRef, toPoly: *dtPoly, toTile: *dtMeshTile, left: *float, right: *float) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getPortalPoints@dtNavMeshQuery@@AEBAIIPEBUdtPoly@@PEBUdtMeshTile@@I01PEAM2@Z";

    /// Returns edge mid point between two polygons.
    getEdgeMidPoint :: (this: *dtNavMeshQuery, from: dtPolyRef, to: dtPolyRef, mid: *float) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getEdgeMidPoint@dtNavMeshQuery@@AEBAIIIPEAM@Z";
    getEdgeMidPoint :: (this: *dtNavMeshQuery, from: dtPolyRef, fromPoly: *dtPoly, fromTile: *dtMeshTile, to: dtPolyRef, toPoly: *dtPoly, toTile: *dtMeshTile, mid: *float) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getEdgeMidPoint@dtNavMeshQuery@@AEBAIIPEBUdtPoly@@PEBUdtMeshTile@@I01PEAM@Z";

    // Appends vertex to a straight path
    appendVertex :: (this: *dtNavMeshQuery, pos: *float, flags: u8, ref: dtPolyRef, straightPath: *float, straightPathFlags: *u8, straightPathRefs: *dtPolyRef, straightPathCount: *s32, maxStraightPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?appendVertex@dtNavMeshQuery@@AEBAIPEBMEIPEAMPEAEPEAIPEAHH@Z";

    // Appends intermediate portal points to a straight path.
    appendPortals :: (this: *dtNavMeshQuery, startIdx: s32, endIdx: s32, endPos: *float, path: *dtPolyRef, straightPath: *float, straightPathFlags: *u8, straightPathRefs: *dtPolyRef, straightPathCount: *s32, maxStraightPath: s32, options: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?appendPortals@dtNavMeshQuery@@AEBAIHHPEBMPEBIPEAMPEAEPEAIPEAHHH@Z";

    dtNode :: struct {}
    // Gets the path leading to the specified end node.
    getPathToNode :: (this: *dtNavMeshQuery, endNode: *dtNode, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detourcrowd "?getPathToNode@dtNavMeshQuery@@AEBAIPEAUdtNode@@PEAIPEAHH@Z";

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
dtAllocNavMeshQuery :: () -> *dtNavMeshQuery #foreign lib/windows/detourcrowd "?dtAllocNavMeshQuery@@YAPEAVdtNavMeshQuery@@XZ";

/// Frees the specified query object using the Detour allocator.
///  @param[in]		query		A query object allocated using #dtAllocNavMeshQuery
/// @ingroup detour
dtFreeNavMeshQuery :: (query: *dtNavMeshQuery) -> void #foreign lib/windows/detourcrowd "?dtFreeNavMeshQuery@@YAXPEAVdtNavMeshQuery@@@Z";

dtObstacleCircle :: struct {
    p:    [3] float; ///< Position of the obstacle
    vel:  [3] float; ///< Velocity of the obstacle
    dvel: [3] float; ///< Velocity of the obstacle
    rad:  float; ///< Radius of the obstacle
    dp:   [3] float; ///< Use for side selection during sampling.
    np:   [3] float; ///< Use for side selection during sampling.
}

dtObstacleSegment :: struct {
    p:     [3] float; ///< End points of the obstacle segment
    q:     [3] float; ///< End points of the obstacle segment
    touch: bool;
}

dtObstacleAvoidanceDebugData :: struct {
    m_nsamples:   s32;
    m_maxSamples: s32;
    m_vel:        *float;
    m_ssize:      *float;
    m_pen:        *float;
    m_vpen:       *float;
    m_vcpen:      *float;
    m_spen:       *float;
    m_tpen:       *float;
}

DT_MAX_PATTERN_DIVS: s32 : 32; ///< Max numver of adaptive divs.
DT_MAX_PATTERN_RINGS: s32 : 4; ///< Max number of adaptive rings.

dtObstacleAvoidanceParams :: struct {
    velBias:       float;
    weightDesVel:  float;
    weightCurVel:  float;
    weightSide:    float;
    weightToi:     float;
    horizTime:     float;
    gridSize:      u8; ///< grid
    adaptiveDivs:  u8; ///< adaptive
    adaptiveRings: u8; ///< adaptive
    adaptiveDepth: u8; ///< adaptive
}

dtObstacleAvoidanceQuery :: struct {
    m_params:       dtObstacleAvoidanceParams;
    m_invHorizTime: float;
    m_vmax:         float;
    m_invVmax:      float;

    m_maxCircles:   s32;
    m_circles:      *dtObstacleCircle;
    m_ncircles:     s32;

    m_maxSegments:  s32;
    m_segments:     *dtObstacleSegment;
    m_nsegments:    s32;
}

dtLocalBoundary :: struct {
    MAX_LOCAL_SEGS:  s32 : 8;
    MAX_LOCAL_POLYS: s32 : 16;

    Segment :: struct {
        s: [6] float; ///< Segment start/end
        d: float; ///< Distance for pruning.
    }

    m_center:        [3] float;
    m_segs:          [8] Segment;
    m_nsegs:         s32;

    m_polys:         [16] dtPolyRef;
    m_npolys:        s32;
}

/// Represents a dynamic polygon corridor used to plan agent movement.
/// @ingroup crowd, detour
dtPathCorridor :: struct {
    m_pos:     [3] float;
    m_target:  [3] float;

    m_path:    *dtPolyRef;
    m_npath:   s32;
    m_maxPath: s32;
}

dtProximityGrid :: struct {
    m_cellSize:    float;
    m_invCellSize: float;

    Item :: struct {
        id:   u16;
        x:    s16;
        y:    s16;
        next: u16;
    }

    m_pool:        *Item;
    m_poolHead:    s32;
    m_poolSize:    s32;

    m_buckets:     *u16;
    m_bucketsSize: s32;

    m_bounds:      [4] s32;
}

DT_PATHQ_INVALID: u32 : 0;

dtPathQueueRef :: u32;

dtPathQueue :: struct {
    PathQuery :: struct {
        ref:       dtPathQueueRef;

        /// Path find start and end location.
        startPos:  [3] float;
        /// Path find start and end location.
        endPos:    [3] float;
        startRef:  dtPolyRef;
        endRef:    dtPolyRef;

        /// Result.
        path:      *dtPolyRef;
        npath:     s32;

        /// State.
        status:    dtStatus;
        keepAlive: s32;
        filter:    *dtQueryFilter; ///< TODO: This is potentially dangerous!
    }

    MAX_QUEUE:     s32 : 8;
    m_queue:       [8] PathQuery;
    m_nextHandle:  dtPathQueueRef;
    m_maxPathSize: s32;
    m_queueHead:   s32;
    m_navquery:    *dtNavMeshQuery;
}

/// The maximum number of neighbors that a crowd agent can take into account
/// for steering decisions.
/// @ingroup crowd
DT_CROWDAGENT_MAX_NEIGHBOURS: s32 : 6;

/// The maximum number of corners a crowd agent will look ahead in the path.
/// This value is used for sizing the crowd agent corner buffers.
/// Due to the behavior of the crowd manager, the actual number of useful
/// corners will be one less than this number.
/// @ingroup crowd
DT_CROWDAGENT_MAX_CORNERS: s32 : 4;

/// The maximum number of crowd avoidance configurations supported by the
/// crowd manager.
/// @ingroup crowd
/// @see dtObstacleAvoidanceParams, dtCrowd::setObstacleAvoidanceParams(), dtCrowd::getObstacleAvoidanceParams(),
///		 dtCrowdAgentParams::obstacleAvoidanceType
DT_CROWD_MAX_OBSTAVOIDANCE_PARAMS: s32 : 8;

/// The maximum number of query filter types supported by the crowd manager.
/// @ingroup crowd
/// @see dtQueryFilter, dtCrowd::getFilter() dtCrowd::getEditableFilter(),
///		dtCrowdAgentParams::queryFilterType
DT_CROWD_MAX_QUERY_FILTER_TYPE: s32 : 16;

/// Provides neighbor data for agents managed by the crowd.
/// @ingroup crowd
/// @see dtCrowdAgent::neis, dtCrowd
dtCrowdNeighbour :: struct {
    idx:  s32; ///< The index of the neighbor in the crowd.
    dist: float; ///< The distance between the current agent and the neighbor.
}

/// The type of navigation mesh polygon the agent is currently traversing.
/// @ingroup crowd
CrowdAgentState :: enum s32 {
    INVALID :: 0;
    WALKING :: 1;
    OFFMESH :: 2;

    DT_CROWDAGENT_STATE_INVALID :: INVALID;
    DT_CROWDAGENT_STATE_WALKING :: WALKING;
    DT_CROWDAGENT_STATE_OFFMESH :: OFFMESH;
}

/// Configuration parameters for a crowd agent.
/// @ingroup crowd
dtCrowdAgentParams :: struct {
    radius:                float; ///< Agent radius. [Limit: >= 0]
    height:                float; ///< Agent height. [Limit: > 0]
    maxAcceleration:       float; ///< Maximum allowed acceleration. [Limit: >= 0]
    maxSpeed:              float; ///< Maximum allowed speed. [Limit: >= 0]

    /// Defines how close a collision element must be before it is considered for steering behaviors. [Limits: > 0]
    collisionQueryRange:   float;

    pathOptimizationRange: float; ///< The path visibility optimization range. [Limit: > 0]

    /// How aggresive the agent manager should be at avoiding collisions with this agent. [Limit: >= 0]
    separationWeight:      float;

    /// Flags that impact steering behavior. (See: #UpdateFlags)
    updateFlags:           u8;

    /// The index of the avoidance configuration to use for the agent.
    /// [Limits: 0 <= value <= #DT_CROWD_MAX_OBSTAVOIDANCE_PARAMS]
    obstacleAvoidanceType: u8;

    /// The index of the query filter used by this agent.
    queryFilterType:       u8;

    /// User defined data attached to the agent.
    userData:              *void;
}

MoveRequestState :: enum s32 {
    NONE              :: 0;
    FAILED            :: 1;
    VALID             :: 2;
    REQUESTING        :: 3;
    WAITING_FOR_QUEUE :: 4;
    WAITING_FOR_PATH  :: 5;
    VELOCITY          :: 6;

    DT_CROWDAGENT_TARGET_NONE              :: NONE;
    DT_CROWDAGENT_TARGET_FAILED            :: FAILED;
    DT_CROWDAGENT_TARGET_VALID             :: VALID;
    DT_CROWDAGENT_TARGET_REQUESTING        :: REQUESTING;
    DT_CROWDAGENT_TARGET_WAITING_FOR_QUEUE :: WAITING_FOR_QUEUE;
    DT_CROWDAGENT_TARGET_WAITING_FOR_PATH  :: WAITING_FOR_PATH;
    DT_CROWDAGENT_TARGET_VELOCITY          :: VELOCITY;
}

/// Represents an agent managed by a #dtCrowd object.
/// @ingroup crowd
dtCrowdAgent :: struct {
    /// True if the agent is active, false if the agent is in an unused slot in the agent pool.
    active:           bool;

    /// The type of mesh polygon the agent is traversing. (See: #CrowdAgentState)
    state:            u8;

    /// True if the agent has valid path (targetState == DT_CROWDAGENT_TARGET_VALID) and the path does not lead to the requested position, else false.
    partial:          bool;

    /// The path corridor the agent is using.
    corridor:         dtPathCorridor;

    /// The local boundary data for the agent.
    boundary:         dtLocalBoundary;

    /// Time since the agent's path corridor was optimized.
    topologyOptTime:  float;

    /// The known neighbors of the agent.
    neis:             [6] dtCrowdNeighbour;

    /// The number of neighbors.
    nneis:            s32;

    /// The desired speed.
    desiredSpeed:     float;

    npos:             [3] float; ///< The current agent position. [(x, y, z)]
    disp:             [3] float; ///< A temporary value used to accumulate agent displacement during iterative collision resolution. [(x, y, z)]
    dvel:             [3] float; ///< The desired velocity of the agent. Based on the current path, calculated from scratch each frame. [(x, y, z)]
    nvel:             [3] float; ///< The desired velocity adjusted by obstacle avoidance, calculated from scratch each frame. [(x, y, z)]
    vel:              [3] float; ///< The actual velocity of the agent. The change from nvel -> vel is constrained by max acceleration. [(x, y, z)]

    /// The agent's configuration parameters.
    params:           dtCrowdAgentParams;

    /// The local path corridor corners for the agent. (Staight path.) [(x, y, z) * #ncorners]
    cornerVerts:      [12] float;

    /// The local path corridor corner flags. (See: #dtStraightPathFlags) [(flags) * #ncorners]
    cornerFlags:      [4] u8;

    /// The reference id of the polygon being entered at the corner. [(polyRef) * #ncorners]
    cornerPolys:      [4] dtPolyRef;

    /// The number of corners.
    ncorners:         s32;

    targetState:      u8; ///< State of the movement request.
    targetRef:        dtPolyRef; ///< Target polyref of the movement request.
    targetPos:        [3] float; ///< Target position of the movement request (or velocity in case of DT_CROWDAGENT_TARGET_VELOCITY).
    targetPathqRef:   dtPathQueueRef; ///< Path finder ref.
    targetReplan:     bool; ///< Flag indicating that the current path is being replanned.
    targetReplanTime: float;
}

dtCrowdAgentAnimation :: struct {
    active:   bool;
    initPos:  [3] float;
    startPos: [3] float;
    endPos:   [3] float;
    polyRef:  dtPolyRef;
    t:        float;
    tmax:     float;
}

/// Crowd agent update flags.
/// @ingroup crowd
/// @see dtCrowdAgentParams::updateFlags
UpdateFlags :: enum s32 {
    ANTICIPATE_TURNS   :: 1;
    OBSTACLE_AVOIDANCE :: 2;
    SEPARATION         :: 4;
    OPTIMIZE_VIS       :: 8;
    OPTIMIZE_TOPO      :: 16;

    DT_CROWD_ANTICIPATE_TURNS   :: ANTICIPATE_TURNS;
    DT_CROWD_OBSTACLE_AVOIDANCE :: OBSTACLE_AVOIDANCE;
    DT_CROWD_SEPARATION         :: SEPARATION;
    DT_CROWD_OPTIMIZE_VIS       :: OPTIMIZE_VIS;
    DT_CROWD_OPTIMIZE_TOPO      :: OPTIMIZE_TOPO;
}

dtCrowdAgentDebugInfo :: struct {
    idx:      s32;
    optStart: [3] float;
    optEnd:   [3] float;
    vod:      *dtObstacleAvoidanceDebugData;
}

/// Provides local steering behaviors for a group of agents.
/// @ingroup crowd
dtCrowd :: struct {
    m_maxAgents:                 s32;
    m_agents:                    *dtCrowdAgent;
    m_activeAgents:              **dtCrowdAgent;
    m_agentAnims:                *dtCrowdAgentAnimation;

    m_pathq:                     dtPathQueue;

    m_obstacleQueryParams:       [8] dtObstacleAvoidanceParams;
    m_obstacleQuery:             *dtObstacleAvoidanceQuery;

    m_grid:                      *dtProximityGrid;

    m_pathResult:                *dtPolyRef;
    m_maxPathResult:             s32;

    m_agentPlacementHalfExtents: [3] float;

    m_filters:                   [16] dtQueryFilter;

    m_maxAgentRadius:            float;

    m_velocitySampleCount:       s32;

    m_navquery:                  *dtNavMeshQuery;
}

#scope_file

#import "Basic"; // For assert

lib/windows/detourcrowd :: #library "./lib/windows/DetourCrowd";

#run {
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
        instance: dtObstacleCircle;
        assert(((cast(*void)(*instance.p)) - cast(*void)(*instance)) == 0, "dtObstacleCircle.p has unexpected offset % instead of 0", ((cast(*void)(*instance.p)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleCircle.p)) == 12, "dtObstacleCircle.p has unexpected size % instead of 12", size_of(type_of(dtObstacleCircle.p)));
        assert(((cast(*void)(*instance.vel)) - cast(*void)(*instance)) == 12, "dtObstacleCircle.vel has unexpected offset % instead of 12", ((cast(*void)(*instance.vel)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleCircle.vel)) == 12, "dtObstacleCircle.vel has unexpected size % instead of 12", size_of(type_of(dtObstacleCircle.vel)));
        assert(((cast(*void)(*instance.dvel)) - cast(*void)(*instance)) == 24, "dtObstacleCircle.dvel has unexpected offset % instead of 24", ((cast(*void)(*instance.dvel)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleCircle.dvel)) == 12, "dtObstacleCircle.dvel has unexpected size % instead of 12", size_of(type_of(dtObstacleCircle.dvel)));
        assert(((cast(*void)(*instance.rad)) - cast(*void)(*instance)) == 36, "dtObstacleCircle.rad has unexpected offset % instead of 36", ((cast(*void)(*instance.rad)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleCircle.rad)) == 4, "dtObstacleCircle.rad has unexpected size % instead of 4", size_of(type_of(dtObstacleCircle.rad)));
        assert(((cast(*void)(*instance.dp)) - cast(*void)(*instance)) == 40, "dtObstacleCircle.dp has unexpected offset % instead of 40", ((cast(*void)(*instance.dp)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleCircle.dp)) == 12, "dtObstacleCircle.dp has unexpected size % instead of 12", size_of(type_of(dtObstacleCircle.dp)));
        assert(((cast(*void)(*instance.np)) - cast(*void)(*instance)) == 52, "dtObstacleCircle.np has unexpected offset % instead of 52", ((cast(*void)(*instance.np)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleCircle.np)) == 12, "dtObstacleCircle.np has unexpected size % instead of 12", size_of(type_of(dtObstacleCircle.np)));
        assert(size_of(dtObstacleCircle) == 64, "dtObstacleCircle has size % instead of 64", size_of(dtObstacleCircle));
    }

    {
        instance: dtObstacleSegment;
        assert(((cast(*void)(*instance.p)) - cast(*void)(*instance)) == 0, "dtObstacleSegment.p has unexpected offset % instead of 0", ((cast(*void)(*instance.p)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleSegment.p)) == 12, "dtObstacleSegment.p has unexpected size % instead of 12", size_of(type_of(dtObstacleSegment.p)));
        assert(((cast(*void)(*instance.q)) - cast(*void)(*instance)) == 12, "dtObstacleSegment.q has unexpected offset % instead of 12", ((cast(*void)(*instance.q)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleSegment.q)) == 12, "dtObstacleSegment.q has unexpected size % instead of 12", size_of(type_of(dtObstacleSegment.q)));
        assert(((cast(*void)(*instance.touch)) - cast(*void)(*instance)) == 24, "dtObstacleSegment.touch has unexpected offset % instead of 24", ((cast(*void)(*instance.touch)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleSegment.touch)) == 1, "dtObstacleSegment.touch has unexpected size % instead of 1", size_of(type_of(dtObstacleSegment.touch)));
        assert(size_of(dtObstacleSegment) == 28, "dtObstacleSegment has size % instead of 28", size_of(dtObstacleSegment));
    }

    {
        instance: dtObstacleAvoidanceDebugData;
        assert(((cast(*void)(*instance.m_nsamples)) - cast(*void)(*instance)) == 0, "dtObstacleAvoidanceDebugData.m_nsamples has unexpected offset % instead of 0", ((cast(*void)(*instance.m_nsamples)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceDebugData.m_nsamples)) == 4, "dtObstacleAvoidanceDebugData.m_nsamples has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceDebugData.m_nsamples)));
        assert(((cast(*void)(*instance.m_maxSamples)) - cast(*void)(*instance)) == 4, "dtObstacleAvoidanceDebugData.m_maxSamples has unexpected offset % instead of 4", ((cast(*void)(*instance.m_maxSamples)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceDebugData.m_maxSamples)) == 4, "dtObstacleAvoidanceDebugData.m_maxSamples has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceDebugData.m_maxSamples)));
        assert(((cast(*void)(*instance.m_vel)) - cast(*void)(*instance)) == 8, "dtObstacleAvoidanceDebugData.m_vel has unexpected offset % instead of 8", ((cast(*void)(*instance.m_vel)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceDebugData.m_vel)) == 8, "dtObstacleAvoidanceDebugData.m_vel has unexpected size % instead of 8", size_of(type_of(dtObstacleAvoidanceDebugData.m_vel)));
        assert(((cast(*void)(*instance.m_ssize)) - cast(*void)(*instance)) == 16, "dtObstacleAvoidanceDebugData.m_ssize has unexpected offset % instead of 16", ((cast(*void)(*instance.m_ssize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceDebugData.m_ssize)) == 8, "dtObstacleAvoidanceDebugData.m_ssize has unexpected size % instead of 8", size_of(type_of(dtObstacleAvoidanceDebugData.m_ssize)));
        assert(((cast(*void)(*instance.m_pen)) - cast(*void)(*instance)) == 24, "dtObstacleAvoidanceDebugData.m_pen has unexpected offset % instead of 24", ((cast(*void)(*instance.m_pen)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceDebugData.m_pen)) == 8, "dtObstacleAvoidanceDebugData.m_pen has unexpected size % instead of 8", size_of(type_of(dtObstacleAvoidanceDebugData.m_pen)));
        assert(((cast(*void)(*instance.m_vpen)) - cast(*void)(*instance)) == 32, "dtObstacleAvoidanceDebugData.m_vpen has unexpected offset % instead of 32", ((cast(*void)(*instance.m_vpen)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceDebugData.m_vpen)) == 8, "dtObstacleAvoidanceDebugData.m_vpen has unexpected size % instead of 8", size_of(type_of(dtObstacleAvoidanceDebugData.m_vpen)));
        assert(((cast(*void)(*instance.m_vcpen)) - cast(*void)(*instance)) == 40, "dtObstacleAvoidanceDebugData.m_vcpen has unexpected offset % instead of 40", ((cast(*void)(*instance.m_vcpen)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceDebugData.m_vcpen)) == 8, "dtObstacleAvoidanceDebugData.m_vcpen has unexpected size % instead of 8", size_of(type_of(dtObstacleAvoidanceDebugData.m_vcpen)));
        assert(((cast(*void)(*instance.m_spen)) - cast(*void)(*instance)) == 48, "dtObstacleAvoidanceDebugData.m_spen has unexpected offset % instead of 48", ((cast(*void)(*instance.m_spen)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceDebugData.m_spen)) == 8, "dtObstacleAvoidanceDebugData.m_spen has unexpected size % instead of 8", size_of(type_of(dtObstacleAvoidanceDebugData.m_spen)));
        assert(((cast(*void)(*instance.m_tpen)) - cast(*void)(*instance)) == 56, "dtObstacleAvoidanceDebugData.m_tpen has unexpected offset % instead of 56", ((cast(*void)(*instance.m_tpen)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceDebugData.m_tpen)) == 8, "dtObstacleAvoidanceDebugData.m_tpen has unexpected size % instead of 8", size_of(type_of(dtObstacleAvoidanceDebugData.m_tpen)));
        assert(size_of(dtObstacleAvoidanceDebugData) == 64, "dtObstacleAvoidanceDebugData has size % instead of 64", size_of(dtObstacleAvoidanceDebugData));
    }

    {
        instance: dtObstacleAvoidanceParams;
        assert(((cast(*void)(*instance.velBias)) - cast(*void)(*instance)) == 0, "dtObstacleAvoidanceParams.velBias has unexpected offset % instead of 0", ((cast(*void)(*instance.velBias)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceParams.velBias)) == 4, "dtObstacleAvoidanceParams.velBias has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceParams.velBias)));
        assert(((cast(*void)(*instance.weightDesVel)) - cast(*void)(*instance)) == 4, "dtObstacleAvoidanceParams.weightDesVel has unexpected offset % instead of 4", ((cast(*void)(*instance.weightDesVel)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceParams.weightDesVel)) == 4, "dtObstacleAvoidanceParams.weightDesVel has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceParams.weightDesVel)));
        assert(((cast(*void)(*instance.weightCurVel)) - cast(*void)(*instance)) == 8, "dtObstacleAvoidanceParams.weightCurVel has unexpected offset % instead of 8", ((cast(*void)(*instance.weightCurVel)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceParams.weightCurVel)) == 4, "dtObstacleAvoidanceParams.weightCurVel has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceParams.weightCurVel)));
        assert(((cast(*void)(*instance.weightSide)) - cast(*void)(*instance)) == 12, "dtObstacleAvoidanceParams.weightSide has unexpected offset % instead of 12", ((cast(*void)(*instance.weightSide)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceParams.weightSide)) == 4, "dtObstacleAvoidanceParams.weightSide has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceParams.weightSide)));
        assert(((cast(*void)(*instance.weightToi)) - cast(*void)(*instance)) == 16, "dtObstacleAvoidanceParams.weightToi has unexpected offset % instead of 16", ((cast(*void)(*instance.weightToi)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceParams.weightToi)) == 4, "dtObstacleAvoidanceParams.weightToi has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceParams.weightToi)));
        assert(((cast(*void)(*instance.horizTime)) - cast(*void)(*instance)) == 20, "dtObstacleAvoidanceParams.horizTime has unexpected offset % instead of 20", ((cast(*void)(*instance.horizTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceParams.horizTime)) == 4, "dtObstacleAvoidanceParams.horizTime has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceParams.horizTime)));
        assert(((cast(*void)(*instance.gridSize)) - cast(*void)(*instance)) == 24, "dtObstacleAvoidanceParams.gridSize has unexpected offset % instead of 24", ((cast(*void)(*instance.gridSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceParams.gridSize)) == 1, "dtObstacleAvoidanceParams.gridSize has unexpected size % instead of 1", size_of(type_of(dtObstacleAvoidanceParams.gridSize)));
        assert(((cast(*void)(*instance.adaptiveDivs)) - cast(*void)(*instance)) == 25, "dtObstacleAvoidanceParams.adaptiveDivs has unexpected offset % instead of 25", ((cast(*void)(*instance.adaptiveDivs)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceParams.adaptiveDivs)) == 1, "dtObstacleAvoidanceParams.adaptiveDivs has unexpected size % instead of 1", size_of(type_of(dtObstacleAvoidanceParams.adaptiveDivs)));
        assert(((cast(*void)(*instance.adaptiveRings)) - cast(*void)(*instance)) == 26, "dtObstacleAvoidanceParams.adaptiveRings has unexpected offset % instead of 26", ((cast(*void)(*instance.adaptiveRings)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceParams.adaptiveRings)) == 1, "dtObstacleAvoidanceParams.adaptiveRings has unexpected size % instead of 1", size_of(type_of(dtObstacleAvoidanceParams.adaptiveRings)));
        assert(((cast(*void)(*instance.adaptiveDepth)) - cast(*void)(*instance)) == 27, "dtObstacleAvoidanceParams.adaptiveDepth has unexpected offset % instead of 27", ((cast(*void)(*instance.adaptiveDepth)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceParams.adaptiveDepth)) == 1, "dtObstacleAvoidanceParams.adaptiveDepth has unexpected size % instead of 1", size_of(type_of(dtObstacleAvoidanceParams.adaptiveDepth)));
        assert(size_of(dtObstacleAvoidanceParams) == 28, "dtObstacleAvoidanceParams has size % instead of 28", size_of(dtObstacleAvoidanceParams));
    }

    {
        instance: dtObstacleAvoidanceQuery;
        assert(((cast(*void)(*instance.m_params)) - cast(*void)(*instance)) == 0, "dtObstacleAvoidanceQuery.m_params has unexpected offset % instead of 0", ((cast(*void)(*instance.m_params)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceQuery.m_params)) == 28, "dtObstacleAvoidanceQuery.m_params has unexpected size % instead of 28", size_of(type_of(dtObstacleAvoidanceQuery.m_params)));
        assert(((cast(*void)(*instance.m_invHorizTime)) - cast(*void)(*instance)) == 28, "dtObstacleAvoidanceQuery.m_invHorizTime has unexpected offset % instead of 28", ((cast(*void)(*instance.m_invHorizTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceQuery.m_invHorizTime)) == 4, "dtObstacleAvoidanceQuery.m_invHorizTime has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceQuery.m_invHorizTime)));
        assert(((cast(*void)(*instance.m_vmax)) - cast(*void)(*instance)) == 32, "dtObstacleAvoidanceQuery.m_vmax has unexpected offset % instead of 32", ((cast(*void)(*instance.m_vmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceQuery.m_vmax)) == 4, "dtObstacleAvoidanceQuery.m_vmax has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceQuery.m_vmax)));
        assert(((cast(*void)(*instance.m_invVmax)) - cast(*void)(*instance)) == 36, "dtObstacleAvoidanceQuery.m_invVmax has unexpected offset % instead of 36", ((cast(*void)(*instance.m_invVmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceQuery.m_invVmax)) == 4, "dtObstacleAvoidanceQuery.m_invVmax has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceQuery.m_invVmax)));
        assert(((cast(*void)(*instance.m_maxCircles)) - cast(*void)(*instance)) == 40, "dtObstacleAvoidanceQuery.m_maxCircles has unexpected offset % instead of 40", ((cast(*void)(*instance.m_maxCircles)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceQuery.m_maxCircles)) == 4, "dtObstacleAvoidanceQuery.m_maxCircles has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceQuery.m_maxCircles)));
        assert(((cast(*void)(*instance.m_circles)) - cast(*void)(*instance)) == 48, "dtObstacleAvoidanceQuery.m_circles has unexpected offset % instead of 48", ((cast(*void)(*instance.m_circles)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceQuery.m_circles)) == 8, "dtObstacleAvoidanceQuery.m_circles has unexpected size % instead of 8", size_of(type_of(dtObstacleAvoidanceQuery.m_circles)));
        assert(((cast(*void)(*instance.m_ncircles)) - cast(*void)(*instance)) == 56, "dtObstacleAvoidanceQuery.m_ncircles has unexpected offset % instead of 56", ((cast(*void)(*instance.m_ncircles)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceQuery.m_ncircles)) == 4, "dtObstacleAvoidanceQuery.m_ncircles has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceQuery.m_ncircles)));
        assert(((cast(*void)(*instance.m_maxSegments)) - cast(*void)(*instance)) == 60, "dtObstacleAvoidanceQuery.m_maxSegments has unexpected offset % instead of 60", ((cast(*void)(*instance.m_maxSegments)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceQuery.m_maxSegments)) == 4, "dtObstacleAvoidanceQuery.m_maxSegments has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceQuery.m_maxSegments)));
        assert(((cast(*void)(*instance.m_segments)) - cast(*void)(*instance)) == 64, "dtObstacleAvoidanceQuery.m_segments has unexpected offset % instead of 64", ((cast(*void)(*instance.m_segments)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceQuery.m_segments)) == 8, "dtObstacleAvoidanceQuery.m_segments has unexpected size % instead of 8", size_of(type_of(dtObstacleAvoidanceQuery.m_segments)));
        assert(((cast(*void)(*instance.m_nsegments)) - cast(*void)(*instance)) == 72, "dtObstacleAvoidanceQuery.m_nsegments has unexpected offset % instead of 72", ((cast(*void)(*instance.m_nsegments)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtObstacleAvoidanceQuery.m_nsegments)) == 4, "dtObstacleAvoidanceQuery.m_nsegments has unexpected size % instead of 4", size_of(type_of(dtObstacleAvoidanceQuery.m_nsegments)));
        assert(size_of(dtObstacleAvoidanceQuery) == 80, "dtObstacleAvoidanceQuery has size % instead of 80", size_of(dtObstacleAvoidanceQuery));
    }

    {
        instance: dtLocalBoundary.Segment;
        assert(((cast(*void)(*instance.s)) - cast(*void)(*instance)) == 0, "dtLocalBoundary.Segment.s has unexpected offset % instead of 0", ((cast(*void)(*instance.s)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLocalBoundary.Segment.s)) == 24, "dtLocalBoundary.Segment.s has unexpected size % instead of 24", size_of(type_of(dtLocalBoundary.Segment.s)));
        assert(((cast(*void)(*instance.d)) - cast(*void)(*instance)) == 24, "dtLocalBoundary.Segment.d has unexpected offset % instead of 24", ((cast(*void)(*instance.d)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLocalBoundary.Segment.d)) == 4, "dtLocalBoundary.Segment.d has unexpected size % instead of 4", size_of(type_of(dtLocalBoundary.Segment.d)));
        assert(size_of(dtLocalBoundary.Segment) == 28, "dtLocalBoundary.Segment has size % instead of 28", size_of(dtLocalBoundary.Segment));
    }

    {
        instance: dtLocalBoundary;
        assert(((cast(*void)(*instance.m_center)) - cast(*void)(*instance)) == 0, "dtLocalBoundary.m_center has unexpected offset % instead of 0", ((cast(*void)(*instance.m_center)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLocalBoundary.m_center)) == 12, "dtLocalBoundary.m_center has unexpected size % instead of 12", size_of(type_of(dtLocalBoundary.m_center)));
        assert(((cast(*void)(*instance.m_segs)) - cast(*void)(*instance)) == 12, "dtLocalBoundary.m_segs has unexpected offset % instead of 12", ((cast(*void)(*instance.m_segs)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLocalBoundary.m_segs)) == 224, "dtLocalBoundary.m_segs has unexpected size % instead of 224", size_of(type_of(dtLocalBoundary.m_segs)));
        assert(((cast(*void)(*instance.m_nsegs)) - cast(*void)(*instance)) == 236, "dtLocalBoundary.m_nsegs has unexpected offset % instead of 236", ((cast(*void)(*instance.m_nsegs)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLocalBoundary.m_nsegs)) == 4, "dtLocalBoundary.m_nsegs has unexpected size % instead of 4", size_of(type_of(dtLocalBoundary.m_nsegs)));
        assert(((cast(*void)(*instance.m_polys)) - cast(*void)(*instance)) == 240, "dtLocalBoundary.m_polys has unexpected offset % instead of 240", ((cast(*void)(*instance.m_polys)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLocalBoundary.m_polys)) == 64, "dtLocalBoundary.m_polys has unexpected size % instead of 64", size_of(type_of(dtLocalBoundary.m_polys)));
        assert(((cast(*void)(*instance.m_npolys)) - cast(*void)(*instance)) == 304, "dtLocalBoundary.m_npolys has unexpected offset % instead of 304", ((cast(*void)(*instance.m_npolys)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtLocalBoundary.m_npolys)) == 4, "dtLocalBoundary.m_npolys has unexpected size % instead of 4", size_of(type_of(dtLocalBoundary.m_npolys)));
        assert(size_of(dtLocalBoundary) == 308, "dtLocalBoundary has size % instead of 308", size_of(dtLocalBoundary));
    }

    {
        instance: dtPathCorridor;
        assert(((cast(*void)(*instance.m_pos)) - cast(*void)(*instance)) == 0, "dtPathCorridor.m_pos has unexpected offset % instead of 0", ((cast(*void)(*instance.m_pos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathCorridor.m_pos)) == 12, "dtPathCorridor.m_pos has unexpected size % instead of 12", size_of(type_of(dtPathCorridor.m_pos)));
        assert(((cast(*void)(*instance.m_target)) - cast(*void)(*instance)) == 12, "dtPathCorridor.m_target has unexpected offset % instead of 12", ((cast(*void)(*instance.m_target)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathCorridor.m_target)) == 12, "dtPathCorridor.m_target has unexpected size % instead of 12", size_of(type_of(dtPathCorridor.m_target)));
        assert(((cast(*void)(*instance.m_path)) - cast(*void)(*instance)) == 24, "dtPathCorridor.m_path has unexpected offset % instead of 24", ((cast(*void)(*instance.m_path)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathCorridor.m_path)) == 8, "dtPathCorridor.m_path has unexpected size % instead of 8", size_of(type_of(dtPathCorridor.m_path)));
        assert(((cast(*void)(*instance.m_npath)) - cast(*void)(*instance)) == 32, "dtPathCorridor.m_npath has unexpected offset % instead of 32", ((cast(*void)(*instance.m_npath)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathCorridor.m_npath)) == 4, "dtPathCorridor.m_npath has unexpected size % instead of 4", size_of(type_of(dtPathCorridor.m_npath)));
        assert(((cast(*void)(*instance.m_maxPath)) - cast(*void)(*instance)) == 36, "dtPathCorridor.m_maxPath has unexpected offset % instead of 36", ((cast(*void)(*instance.m_maxPath)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathCorridor.m_maxPath)) == 4, "dtPathCorridor.m_maxPath has unexpected size % instead of 4", size_of(type_of(dtPathCorridor.m_maxPath)));
        assert(size_of(dtPathCorridor) == 40, "dtPathCorridor has size % instead of 40", size_of(dtPathCorridor));
    }

    {
        instance: dtProximityGrid.Item;
        assert(((cast(*void)(*instance.id)) - cast(*void)(*instance)) == 0, "dtProximityGrid.Item.id has unexpected offset % instead of 0", ((cast(*void)(*instance.id)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.Item.id)) == 2, "dtProximityGrid.Item.id has unexpected size % instead of 2", size_of(type_of(dtProximityGrid.Item.id)));
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 2, "dtProximityGrid.Item.x has unexpected offset % instead of 2", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.Item.x)) == 2, "dtProximityGrid.Item.x has unexpected size % instead of 2", size_of(type_of(dtProximityGrid.Item.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "dtProximityGrid.Item.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.Item.y)) == 2, "dtProximityGrid.Item.y has unexpected size % instead of 2", size_of(type_of(dtProximityGrid.Item.y)));
        assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 6, "dtProximityGrid.Item.next has unexpected offset % instead of 6", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.Item.next)) == 2, "dtProximityGrid.Item.next has unexpected size % instead of 2", size_of(type_of(dtProximityGrid.Item.next)));
        assert(size_of(dtProximityGrid.Item) == 8, "dtProximityGrid.Item has size % instead of 8", size_of(dtProximityGrid.Item));
    }

    {
        instance: dtProximityGrid;
        assert(((cast(*void)(*instance.m_cellSize)) - cast(*void)(*instance)) == 0, "dtProximityGrid.m_cellSize has unexpected offset % instead of 0", ((cast(*void)(*instance.m_cellSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.m_cellSize)) == 4, "dtProximityGrid.m_cellSize has unexpected size % instead of 4", size_of(type_of(dtProximityGrid.m_cellSize)));
        assert(((cast(*void)(*instance.m_invCellSize)) - cast(*void)(*instance)) == 4, "dtProximityGrid.m_invCellSize has unexpected offset % instead of 4", ((cast(*void)(*instance.m_invCellSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.m_invCellSize)) == 4, "dtProximityGrid.m_invCellSize has unexpected size % instead of 4", size_of(type_of(dtProximityGrid.m_invCellSize)));
        assert(((cast(*void)(*instance.m_pool)) - cast(*void)(*instance)) == 8, "dtProximityGrid.m_pool has unexpected offset % instead of 8", ((cast(*void)(*instance.m_pool)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.m_pool)) == 8, "dtProximityGrid.m_pool has unexpected size % instead of 8", size_of(type_of(dtProximityGrid.m_pool)));
        assert(((cast(*void)(*instance.m_poolHead)) - cast(*void)(*instance)) == 16, "dtProximityGrid.m_poolHead has unexpected offset % instead of 16", ((cast(*void)(*instance.m_poolHead)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.m_poolHead)) == 4, "dtProximityGrid.m_poolHead has unexpected size % instead of 4", size_of(type_of(dtProximityGrid.m_poolHead)));
        assert(((cast(*void)(*instance.m_poolSize)) - cast(*void)(*instance)) == 20, "dtProximityGrid.m_poolSize has unexpected offset % instead of 20", ((cast(*void)(*instance.m_poolSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.m_poolSize)) == 4, "dtProximityGrid.m_poolSize has unexpected size % instead of 4", size_of(type_of(dtProximityGrid.m_poolSize)));
        assert(((cast(*void)(*instance.m_buckets)) - cast(*void)(*instance)) == 24, "dtProximityGrid.m_buckets has unexpected offset % instead of 24", ((cast(*void)(*instance.m_buckets)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.m_buckets)) == 8, "dtProximityGrid.m_buckets has unexpected size % instead of 8", size_of(type_of(dtProximityGrid.m_buckets)));
        assert(((cast(*void)(*instance.m_bucketsSize)) - cast(*void)(*instance)) == 32, "dtProximityGrid.m_bucketsSize has unexpected offset % instead of 32", ((cast(*void)(*instance.m_bucketsSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.m_bucketsSize)) == 4, "dtProximityGrid.m_bucketsSize has unexpected size % instead of 4", size_of(type_of(dtProximityGrid.m_bucketsSize)));
        assert(((cast(*void)(*instance.m_bounds)) - cast(*void)(*instance)) == 36, "dtProximityGrid.m_bounds has unexpected offset % instead of 36", ((cast(*void)(*instance.m_bounds)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtProximityGrid.m_bounds)) == 16, "dtProximityGrid.m_bounds has unexpected size % instead of 16", size_of(type_of(dtProximityGrid.m_bounds)));
        assert(size_of(dtProximityGrid) == 56, "dtProximityGrid has size % instead of 56", size_of(dtProximityGrid));
    }

    {
        instance: dtPathQueue.PathQuery;
        assert(((cast(*void)(*instance.ref)) - cast(*void)(*instance)) == 0, "dtPathQueue.PathQuery.ref has unexpected offset % instead of 0", ((cast(*void)(*instance.ref)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.PathQuery.ref)) == 4, "dtPathQueue.PathQuery.ref has unexpected size % instead of 4", size_of(type_of(dtPathQueue.PathQuery.ref)));
        assert(((cast(*void)(*instance.startPos)) - cast(*void)(*instance)) == 4, "dtPathQueue.PathQuery.startPos has unexpected offset % instead of 4", ((cast(*void)(*instance.startPos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.PathQuery.startPos)) == 12, "dtPathQueue.PathQuery.startPos has unexpected size % instead of 12", size_of(type_of(dtPathQueue.PathQuery.startPos)));
        assert(((cast(*void)(*instance.endPos)) - cast(*void)(*instance)) == 16, "dtPathQueue.PathQuery.endPos has unexpected offset % instead of 16", ((cast(*void)(*instance.endPos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.PathQuery.endPos)) == 12, "dtPathQueue.PathQuery.endPos has unexpected size % instead of 12", size_of(type_of(dtPathQueue.PathQuery.endPos)));
        assert(((cast(*void)(*instance.startRef)) - cast(*void)(*instance)) == 28, "dtPathQueue.PathQuery.startRef has unexpected offset % instead of 28", ((cast(*void)(*instance.startRef)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.PathQuery.startRef)) == 4, "dtPathQueue.PathQuery.startRef has unexpected size % instead of 4", size_of(type_of(dtPathQueue.PathQuery.startRef)));
        assert(((cast(*void)(*instance.endRef)) - cast(*void)(*instance)) == 32, "dtPathQueue.PathQuery.endRef has unexpected offset % instead of 32", ((cast(*void)(*instance.endRef)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.PathQuery.endRef)) == 4, "dtPathQueue.PathQuery.endRef has unexpected size % instead of 4", size_of(type_of(dtPathQueue.PathQuery.endRef)));
        assert(((cast(*void)(*instance.path)) - cast(*void)(*instance)) == 40, "dtPathQueue.PathQuery.path has unexpected offset % instead of 40", ((cast(*void)(*instance.path)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.PathQuery.path)) == 8, "dtPathQueue.PathQuery.path has unexpected size % instead of 8", size_of(type_of(dtPathQueue.PathQuery.path)));
        assert(((cast(*void)(*instance.npath)) - cast(*void)(*instance)) == 48, "dtPathQueue.PathQuery.npath has unexpected offset % instead of 48", ((cast(*void)(*instance.npath)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.PathQuery.npath)) == 4, "dtPathQueue.PathQuery.npath has unexpected size % instead of 4", size_of(type_of(dtPathQueue.PathQuery.npath)));
        assert(((cast(*void)(*instance.status)) - cast(*void)(*instance)) == 52, "dtPathQueue.PathQuery.status has unexpected offset % instead of 52", ((cast(*void)(*instance.status)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.PathQuery.status)) == 4, "dtPathQueue.PathQuery.status has unexpected size % instead of 4", size_of(type_of(dtPathQueue.PathQuery.status)));
        assert(((cast(*void)(*instance.keepAlive)) - cast(*void)(*instance)) == 56, "dtPathQueue.PathQuery.keepAlive has unexpected offset % instead of 56", ((cast(*void)(*instance.keepAlive)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.PathQuery.keepAlive)) == 4, "dtPathQueue.PathQuery.keepAlive has unexpected size % instead of 4", size_of(type_of(dtPathQueue.PathQuery.keepAlive)));
        assert(((cast(*void)(*instance.filter)) - cast(*void)(*instance)) == 64, "dtPathQueue.PathQuery.filter has unexpected offset % instead of 64", ((cast(*void)(*instance.filter)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.PathQuery.filter)) == 8, "dtPathQueue.PathQuery.filter has unexpected size % instead of 8", size_of(type_of(dtPathQueue.PathQuery.filter)));
        assert(size_of(dtPathQueue.PathQuery) == 72, "dtPathQueue.PathQuery has size % instead of 72", size_of(dtPathQueue.PathQuery));
    }

    {
        instance: dtPathQueue;
        assert(((cast(*void)(*instance.m_queue)) - cast(*void)(*instance)) == 0, "dtPathQueue.m_queue has unexpected offset % instead of 0", ((cast(*void)(*instance.m_queue)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.m_queue)) == 576, "dtPathQueue.m_queue has unexpected size % instead of 576", size_of(type_of(dtPathQueue.m_queue)));
        assert(((cast(*void)(*instance.m_nextHandle)) - cast(*void)(*instance)) == 576, "dtPathQueue.m_nextHandle has unexpected offset % instead of 576", ((cast(*void)(*instance.m_nextHandle)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.m_nextHandle)) == 4, "dtPathQueue.m_nextHandle has unexpected size % instead of 4", size_of(type_of(dtPathQueue.m_nextHandle)));
        assert(((cast(*void)(*instance.m_maxPathSize)) - cast(*void)(*instance)) == 580, "dtPathQueue.m_maxPathSize has unexpected offset % instead of 580", ((cast(*void)(*instance.m_maxPathSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.m_maxPathSize)) == 4, "dtPathQueue.m_maxPathSize has unexpected size % instead of 4", size_of(type_of(dtPathQueue.m_maxPathSize)));
        assert(((cast(*void)(*instance.m_queueHead)) - cast(*void)(*instance)) == 584, "dtPathQueue.m_queueHead has unexpected offset % instead of 584", ((cast(*void)(*instance.m_queueHead)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.m_queueHead)) == 4, "dtPathQueue.m_queueHead has unexpected size % instead of 4", size_of(type_of(dtPathQueue.m_queueHead)));
        assert(((cast(*void)(*instance.m_navquery)) - cast(*void)(*instance)) == 592, "dtPathQueue.m_navquery has unexpected offset % instead of 592", ((cast(*void)(*instance.m_navquery)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtPathQueue.m_navquery)) == 8, "dtPathQueue.m_navquery has unexpected size % instead of 8", size_of(type_of(dtPathQueue.m_navquery)));
        assert(size_of(dtPathQueue) == 600, "dtPathQueue has size % instead of 600", size_of(dtPathQueue));
    }

    {
        instance: dtCrowdNeighbour;
        assert(((cast(*void)(*instance.idx)) - cast(*void)(*instance)) == 0, "dtCrowdNeighbour.idx has unexpected offset % instead of 0", ((cast(*void)(*instance.idx)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdNeighbour.idx)) == 4, "dtCrowdNeighbour.idx has unexpected size % instead of 4", size_of(type_of(dtCrowdNeighbour.idx)));
        assert(((cast(*void)(*instance.dist)) - cast(*void)(*instance)) == 4, "dtCrowdNeighbour.dist has unexpected offset % instead of 4", ((cast(*void)(*instance.dist)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdNeighbour.dist)) == 4, "dtCrowdNeighbour.dist has unexpected size % instead of 4", size_of(type_of(dtCrowdNeighbour.dist)));
        assert(size_of(dtCrowdNeighbour) == 8, "dtCrowdNeighbour has size % instead of 8", size_of(dtCrowdNeighbour));
    }

    {
        instance: dtCrowdAgentParams;
        assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 0, "dtCrowdAgentParams.radius has unexpected offset % instead of 0", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentParams.radius)) == 4, "dtCrowdAgentParams.radius has unexpected size % instead of 4", size_of(type_of(dtCrowdAgentParams.radius)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 4, "dtCrowdAgentParams.height has unexpected offset % instead of 4", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentParams.height)) == 4, "dtCrowdAgentParams.height has unexpected size % instead of 4", size_of(type_of(dtCrowdAgentParams.height)));
        assert(((cast(*void)(*instance.maxAcceleration)) - cast(*void)(*instance)) == 8, "dtCrowdAgentParams.maxAcceleration has unexpected offset % instead of 8", ((cast(*void)(*instance.maxAcceleration)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentParams.maxAcceleration)) == 4, "dtCrowdAgentParams.maxAcceleration has unexpected size % instead of 4", size_of(type_of(dtCrowdAgentParams.maxAcceleration)));
        assert(((cast(*void)(*instance.maxSpeed)) - cast(*void)(*instance)) == 12, "dtCrowdAgentParams.maxSpeed has unexpected offset % instead of 12", ((cast(*void)(*instance.maxSpeed)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentParams.maxSpeed)) == 4, "dtCrowdAgentParams.maxSpeed has unexpected size % instead of 4", size_of(type_of(dtCrowdAgentParams.maxSpeed)));
        assert(((cast(*void)(*instance.collisionQueryRange)) - cast(*void)(*instance)) == 16, "dtCrowdAgentParams.collisionQueryRange has unexpected offset % instead of 16", ((cast(*void)(*instance.collisionQueryRange)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentParams.collisionQueryRange)) == 4, "dtCrowdAgentParams.collisionQueryRange has unexpected size % instead of 4", size_of(type_of(dtCrowdAgentParams.collisionQueryRange)));
        assert(((cast(*void)(*instance.pathOptimizationRange)) - cast(*void)(*instance)) == 20, "dtCrowdAgentParams.pathOptimizationRange has unexpected offset % instead of 20", ((cast(*void)(*instance.pathOptimizationRange)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentParams.pathOptimizationRange)) == 4, "dtCrowdAgentParams.pathOptimizationRange has unexpected size % instead of 4", size_of(type_of(dtCrowdAgentParams.pathOptimizationRange)));
        assert(((cast(*void)(*instance.separationWeight)) - cast(*void)(*instance)) == 24, "dtCrowdAgentParams.separationWeight has unexpected offset % instead of 24", ((cast(*void)(*instance.separationWeight)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentParams.separationWeight)) == 4, "dtCrowdAgentParams.separationWeight has unexpected size % instead of 4", size_of(type_of(dtCrowdAgentParams.separationWeight)));
        assert(((cast(*void)(*instance.updateFlags)) - cast(*void)(*instance)) == 28, "dtCrowdAgentParams.updateFlags has unexpected offset % instead of 28", ((cast(*void)(*instance.updateFlags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentParams.updateFlags)) == 1, "dtCrowdAgentParams.updateFlags has unexpected size % instead of 1", size_of(type_of(dtCrowdAgentParams.updateFlags)));
        assert(((cast(*void)(*instance.obstacleAvoidanceType)) - cast(*void)(*instance)) == 29, "dtCrowdAgentParams.obstacleAvoidanceType has unexpected offset % instead of 29", ((cast(*void)(*instance.obstacleAvoidanceType)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentParams.obstacleAvoidanceType)) == 1, "dtCrowdAgentParams.obstacleAvoidanceType has unexpected size % instead of 1", size_of(type_of(dtCrowdAgentParams.obstacleAvoidanceType)));
        assert(((cast(*void)(*instance.queryFilterType)) - cast(*void)(*instance)) == 30, "dtCrowdAgentParams.queryFilterType has unexpected offset % instead of 30", ((cast(*void)(*instance.queryFilterType)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentParams.queryFilterType)) == 1, "dtCrowdAgentParams.queryFilterType has unexpected size % instead of 1", size_of(type_of(dtCrowdAgentParams.queryFilterType)));
        assert(((cast(*void)(*instance.userData)) - cast(*void)(*instance)) == 32, "dtCrowdAgentParams.userData has unexpected offset % instead of 32", ((cast(*void)(*instance.userData)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentParams.userData)) == 8, "dtCrowdAgentParams.userData has unexpected size % instead of 8", size_of(type_of(dtCrowdAgentParams.userData)));
        assert(size_of(dtCrowdAgentParams) == 40, "dtCrowdAgentParams has size % instead of 40", size_of(dtCrowdAgentParams));
    }

    {
        instance: dtCrowdAgent;
        assert(((cast(*void)(*instance.active)) - cast(*void)(*instance)) == 0, "dtCrowdAgent.active has unexpected offset % instead of 0", ((cast(*void)(*instance.active)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.active)) == 1, "dtCrowdAgent.active has unexpected size % instead of 1", size_of(type_of(dtCrowdAgent.active)));
        assert(((cast(*void)(*instance.state)) - cast(*void)(*instance)) == 1, "dtCrowdAgent.state has unexpected offset % instead of 1", ((cast(*void)(*instance.state)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.state)) == 1, "dtCrowdAgent.state has unexpected size % instead of 1", size_of(type_of(dtCrowdAgent.state)));
        assert(((cast(*void)(*instance.partial)) - cast(*void)(*instance)) == 2, "dtCrowdAgent.partial has unexpected offset % instead of 2", ((cast(*void)(*instance.partial)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.partial)) == 1, "dtCrowdAgent.partial has unexpected size % instead of 1", size_of(type_of(dtCrowdAgent.partial)));
        assert(((cast(*void)(*instance.corridor)) - cast(*void)(*instance)) == 8, "dtCrowdAgent.corridor has unexpected offset % instead of 8", ((cast(*void)(*instance.corridor)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.corridor)) == 40, "dtCrowdAgent.corridor has unexpected size % instead of 40", size_of(type_of(dtCrowdAgent.corridor)));
        assert(((cast(*void)(*instance.boundary)) - cast(*void)(*instance)) == 48, "dtCrowdAgent.boundary has unexpected offset % instead of 48", ((cast(*void)(*instance.boundary)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.boundary)) == 308, "dtCrowdAgent.boundary has unexpected size % instead of 308", size_of(type_of(dtCrowdAgent.boundary)));
        assert(((cast(*void)(*instance.topologyOptTime)) - cast(*void)(*instance)) == 356, "dtCrowdAgent.topologyOptTime has unexpected offset % instead of 356", ((cast(*void)(*instance.topologyOptTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.topologyOptTime)) == 4, "dtCrowdAgent.topologyOptTime has unexpected size % instead of 4", size_of(type_of(dtCrowdAgent.topologyOptTime)));
        assert(((cast(*void)(*instance.neis)) - cast(*void)(*instance)) == 360, "dtCrowdAgent.neis has unexpected offset % instead of 360", ((cast(*void)(*instance.neis)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.neis)) == 48, "dtCrowdAgent.neis has unexpected size % instead of 48", size_of(type_of(dtCrowdAgent.neis)));
        assert(((cast(*void)(*instance.nneis)) - cast(*void)(*instance)) == 408, "dtCrowdAgent.nneis has unexpected offset % instead of 408", ((cast(*void)(*instance.nneis)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.nneis)) == 4, "dtCrowdAgent.nneis has unexpected size % instead of 4", size_of(type_of(dtCrowdAgent.nneis)));
        assert(((cast(*void)(*instance.desiredSpeed)) - cast(*void)(*instance)) == 412, "dtCrowdAgent.desiredSpeed has unexpected offset % instead of 412", ((cast(*void)(*instance.desiredSpeed)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.desiredSpeed)) == 4, "dtCrowdAgent.desiredSpeed has unexpected size % instead of 4", size_of(type_of(dtCrowdAgent.desiredSpeed)));
        assert(((cast(*void)(*instance.npos)) - cast(*void)(*instance)) == 416, "dtCrowdAgent.npos has unexpected offset % instead of 416", ((cast(*void)(*instance.npos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.npos)) == 12, "dtCrowdAgent.npos has unexpected size % instead of 12", size_of(type_of(dtCrowdAgent.npos)));
        assert(((cast(*void)(*instance.disp)) - cast(*void)(*instance)) == 428, "dtCrowdAgent.disp has unexpected offset % instead of 428", ((cast(*void)(*instance.disp)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.disp)) == 12, "dtCrowdAgent.disp has unexpected size % instead of 12", size_of(type_of(dtCrowdAgent.disp)));
        assert(((cast(*void)(*instance.dvel)) - cast(*void)(*instance)) == 440, "dtCrowdAgent.dvel has unexpected offset % instead of 440", ((cast(*void)(*instance.dvel)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.dvel)) == 12, "dtCrowdAgent.dvel has unexpected size % instead of 12", size_of(type_of(dtCrowdAgent.dvel)));
        assert(((cast(*void)(*instance.nvel)) - cast(*void)(*instance)) == 452, "dtCrowdAgent.nvel has unexpected offset % instead of 452", ((cast(*void)(*instance.nvel)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.nvel)) == 12, "dtCrowdAgent.nvel has unexpected size % instead of 12", size_of(type_of(dtCrowdAgent.nvel)));
        assert(((cast(*void)(*instance.vel)) - cast(*void)(*instance)) == 464, "dtCrowdAgent.vel has unexpected offset % instead of 464", ((cast(*void)(*instance.vel)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.vel)) == 12, "dtCrowdAgent.vel has unexpected size % instead of 12", size_of(type_of(dtCrowdAgent.vel)));
        assert(((cast(*void)(*instance.params)) - cast(*void)(*instance)) == 480, "dtCrowdAgent.params has unexpected offset % instead of 480", ((cast(*void)(*instance.params)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.params)) == 40, "dtCrowdAgent.params has unexpected size % instead of 40", size_of(type_of(dtCrowdAgent.params)));
        assert(((cast(*void)(*instance.cornerVerts)) - cast(*void)(*instance)) == 520, "dtCrowdAgent.cornerVerts has unexpected offset % instead of 520", ((cast(*void)(*instance.cornerVerts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.cornerVerts)) == 48, "dtCrowdAgent.cornerVerts has unexpected size % instead of 48", size_of(type_of(dtCrowdAgent.cornerVerts)));
        assert(((cast(*void)(*instance.cornerFlags)) - cast(*void)(*instance)) == 568, "dtCrowdAgent.cornerFlags has unexpected offset % instead of 568", ((cast(*void)(*instance.cornerFlags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.cornerFlags)) == 4, "dtCrowdAgent.cornerFlags has unexpected size % instead of 4", size_of(type_of(dtCrowdAgent.cornerFlags)));
        assert(((cast(*void)(*instance.cornerPolys)) - cast(*void)(*instance)) == 572, "dtCrowdAgent.cornerPolys has unexpected offset % instead of 572", ((cast(*void)(*instance.cornerPolys)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.cornerPolys)) == 16, "dtCrowdAgent.cornerPolys has unexpected size % instead of 16", size_of(type_of(dtCrowdAgent.cornerPolys)));
        assert(((cast(*void)(*instance.ncorners)) - cast(*void)(*instance)) == 588, "dtCrowdAgent.ncorners has unexpected offset % instead of 588", ((cast(*void)(*instance.ncorners)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.ncorners)) == 4, "dtCrowdAgent.ncorners has unexpected size % instead of 4", size_of(type_of(dtCrowdAgent.ncorners)));
        assert(((cast(*void)(*instance.targetState)) - cast(*void)(*instance)) == 592, "dtCrowdAgent.targetState has unexpected offset % instead of 592", ((cast(*void)(*instance.targetState)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.targetState)) == 1, "dtCrowdAgent.targetState has unexpected size % instead of 1", size_of(type_of(dtCrowdAgent.targetState)));
        assert(((cast(*void)(*instance.targetRef)) - cast(*void)(*instance)) == 596, "dtCrowdAgent.targetRef has unexpected offset % instead of 596", ((cast(*void)(*instance.targetRef)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.targetRef)) == 4, "dtCrowdAgent.targetRef has unexpected size % instead of 4", size_of(type_of(dtCrowdAgent.targetRef)));
        assert(((cast(*void)(*instance.targetPos)) - cast(*void)(*instance)) == 600, "dtCrowdAgent.targetPos has unexpected offset % instead of 600", ((cast(*void)(*instance.targetPos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.targetPos)) == 12, "dtCrowdAgent.targetPos has unexpected size % instead of 12", size_of(type_of(dtCrowdAgent.targetPos)));
        assert(((cast(*void)(*instance.targetPathqRef)) - cast(*void)(*instance)) == 612, "dtCrowdAgent.targetPathqRef has unexpected offset % instead of 612", ((cast(*void)(*instance.targetPathqRef)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.targetPathqRef)) == 4, "dtCrowdAgent.targetPathqRef has unexpected size % instead of 4", size_of(type_of(dtCrowdAgent.targetPathqRef)));
        assert(((cast(*void)(*instance.targetReplan)) - cast(*void)(*instance)) == 616, "dtCrowdAgent.targetReplan has unexpected offset % instead of 616", ((cast(*void)(*instance.targetReplan)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.targetReplan)) == 1, "dtCrowdAgent.targetReplan has unexpected size % instead of 1", size_of(type_of(dtCrowdAgent.targetReplan)));
        assert(((cast(*void)(*instance.targetReplanTime)) - cast(*void)(*instance)) == 620, "dtCrowdAgent.targetReplanTime has unexpected offset % instead of 620", ((cast(*void)(*instance.targetReplanTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgent.targetReplanTime)) == 4, "dtCrowdAgent.targetReplanTime has unexpected size % instead of 4", size_of(type_of(dtCrowdAgent.targetReplanTime)));
        assert(size_of(dtCrowdAgent) == 624, "dtCrowdAgent has size % instead of 624", size_of(dtCrowdAgent));
    }

    {
        instance: dtCrowdAgentAnimation;
        assert(((cast(*void)(*instance.active)) - cast(*void)(*instance)) == 0, "dtCrowdAgentAnimation.active has unexpected offset % instead of 0", ((cast(*void)(*instance.active)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentAnimation.active)) == 1, "dtCrowdAgentAnimation.active has unexpected size % instead of 1", size_of(type_of(dtCrowdAgentAnimation.active)));
        assert(((cast(*void)(*instance.initPos)) - cast(*void)(*instance)) == 4, "dtCrowdAgentAnimation.initPos has unexpected offset % instead of 4", ((cast(*void)(*instance.initPos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentAnimation.initPos)) == 12, "dtCrowdAgentAnimation.initPos has unexpected size % instead of 12", size_of(type_of(dtCrowdAgentAnimation.initPos)));
        assert(((cast(*void)(*instance.startPos)) - cast(*void)(*instance)) == 16, "dtCrowdAgentAnimation.startPos has unexpected offset % instead of 16", ((cast(*void)(*instance.startPos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentAnimation.startPos)) == 12, "dtCrowdAgentAnimation.startPos has unexpected size % instead of 12", size_of(type_of(dtCrowdAgentAnimation.startPos)));
        assert(((cast(*void)(*instance.endPos)) - cast(*void)(*instance)) == 28, "dtCrowdAgentAnimation.endPos has unexpected offset % instead of 28", ((cast(*void)(*instance.endPos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentAnimation.endPos)) == 12, "dtCrowdAgentAnimation.endPos has unexpected size % instead of 12", size_of(type_of(dtCrowdAgentAnimation.endPos)));
        assert(((cast(*void)(*instance.polyRef)) - cast(*void)(*instance)) == 40, "dtCrowdAgentAnimation.polyRef has unexpected offset % instead of 40", ((cast(*void)(*instance.polyRef)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentAnimation.polyRef)) == 4, "dtCrowdAgentAnimation.polyRef has unexpected size % instead of 4", size_of(type_of(dtCrowdAgentAnimation.polyRef)));
        assert(((cast(*void)(*instance.t)) - cast(*void)(*instance)) == 44, "dtCrowdAgentAnimation.t has unexpected offset % instead of 44", ((cast(*void)(*instance.t)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentAnimation.t)) == 4, "dtCrowdAgentAnimation.t has unexpected size % instead of 4", size_of(type_of(dtCrowdAgentAnimation.t)));
        assert(((cast(*void)(*instance.tmax)) - cast(*void)(*instance)) == 48, "dtCrowdAgentAnimation.tmax has unexpected offset % instead of 48", ((cast(*void)(*instance.tmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentAnimation.tmax)) == 4, "dtCrowdAgentAnimation.tmax has unexpected size % instead of 4", size_of(type_of(dtCrowdAgentAnimation.tmax)));
        assert(size_of(dtCrowdAgentAnimation) == 52, "dtCrowdAgentAnimation has size % instead of 52", size_of(dtCrowdAgentAnimation));
    }

    {
        instance: dtCrowdAgentDebugInfo;
        assert(((cast(*void)(*instance.idx)) - cast(*void)(*instance)) == 0, "dtCrowdAgentDebugInfo.idx has unexpected offset % instead of 0", ((cast(*void)(*instance.idx)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentDebugInfo.idx)) == 4, "dtCrowdAgentDebugInfo.idx has unexpected size % instead of 4", size_of(type_of(dtCrowdAgentDebugInfo.idx)));
        assert(((cast(*void)(*instance.optStart)) - cast(*void)(*instance)) == 4, "dtCrowdAgentDebugInfo.optStart has unexpected offset % instead of 4", ((cast(*void)(*instance.optStart)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentDebugInfo.optStart)) == 12, "dtCrowdAgentDebugInfo.optStart has unexpected size % instead of 12", size_of(type_of(dtCrowdAgentDebugInfo.optStart)));
        assert(((cast(*void)(*instance.optEnd)) - cast(*void)(*instance)) == 16, "dtCrowdAgentDebugInfo.optEnd has unexpected offset % instead of 16", ((cast(*void)(*instance.optEnd)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentDebugInfo.optEnd)) == 12, "dtCrowdAgentDebugInfo.optEnd has unexpected size % instead of 12", size_of(type_of(dtCrowdAgentDebugInfo.optEnd)));
        assert(((cast(*void)(*instance.vod)) - cast(*void)(*instance)) == 32, "dtCrowdAgentDebugInfo.vod has unexpected offset % instead of 32", ((cast(*void)(*instance.vod)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowdAgentDebugInfo.vod)) == 8, "dtCrowdAgentDebugInfo.vod has unexpected size % instead of 8", size_of(type_of(dtCrowdAgentDebugInfo.vod)));
        assert(size_of(dtCrowdAgentDebugInfo) == 40, "dtCrowdAgentDebugInfo has size % instead of 40", size_of(dtCrowdAgentDebugInfo));
    }

    {
        instance: dtCrowd;
        assert(((cast(*void)(*instance.m_maxAgents)) - cast(*void)(*instance)) == 0, "dtCrowd.m_maxAgents has unexpected offset % instead of 0", ((cast(*void)(*instance.m_maxAgents)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_maxAgents)) == 4, "dtCrowd.m_maxAgents has unexpected size % instead of 4", size_of(type_of(dtCrowd.m_maxAgents)));
        assert(((cast(*void)(*instance.m_agents)) - cast(*void)(*instance)) == 8, "dtCrowd.m_agents has unexpected offset % instead of 8", ((cast(*void)(*instance.m_agents)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_agents)) == 8, "dtCrowd.m_agents has unexpected size % instead of 8", size_of(type_of(dtCrowd.m_agents)));
        assert(((cast(*void)(*instance.m_activeAgents)) - cast(*void)(*instance)) == 16, "dtCrowd.m_activeAgents has unexpected offset % instead of 16", ((cast(*void)(*instance.m_activeAgents)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_activeAgents)) == 8, "dtCrowd.m_activeAgents has unexpected size % instead of 8", size_of(type_of(dtCrowd.m_activeAgents)));
        assert(((cast(*void)(*instance.m_agentAnims)) - cast(*void)(*instance)) == 24, "dtCrowd.m_agentAnims has unexpected offset % instead of 24", ((cast(*void)(*instance.m_agentAnims)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_agentAnims)) == 8, "dtCrowd.m_agentAnims has unexpected size % instead of 8", size_of(type_of(dtCrowd.m_agentAnims)));
        assert(((cast(*void)(*instance.m_pathq)) - cast(*void)(*instance)) == 32, "dtCrowd.m_pathq has unexpected offset % instead of 32", ((cast(*void)(*instance.m_pathq)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_pathq)) == 600, "dtCrowd.m_pathq has unexpected size % instead of 600", size_of(type_of(dtCrowd.m_pathq)));
        assert(((cast(*void)(*instance.m_obstacleQueryParams)) - cast(*void)(*instance)) == 632, "dtCrowd.m_obstacleQueryParams has unexpected offset % instead of 632", ((cast(*void)(*instance.m_obstacleQueryParams)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_obstacleQueryParams)) == 224, "dtCrowd.m_obstacleQueryParams has unexpected size % instead of 224", size_of(type_of(dtCrowd.m_obstacleQueryParams)));
        assert(((cast(*void)(*instance.m_obstacleQuery)) - cast(*void)(*instance)) == 856, "dtCrowd.m_obstacleQuery has unexpected offset % instead of 856", ((cast(*void)(*instance.m_obstacleQuery)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_obstacleQuery)) == 8, "dtCrowd.m_obstacleQuery has unexpected size % instead of 8", size_of(type_of(dtCrowd.m_obstacleQuery)));
        assert(((cast(*void)(*instance.m_grid)) - cast(*void)(*instance)) == 864, "dtCrowd.m_grid has unexpected offset % instead of 864", ((cast(*void)(*instance.m_grid)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_grid)) == 8, "dtCrowd.m_grid has unexpected size % instead of 8", size_of(type_of(dtCrowd.m_grid)));
        assert(((cast(*void)(*instance.m_pathResult)) - cast(*void)(*instance)) == 872, "dtCrowd.m_pathResult has unexpected offset % instead of 872", ((cast(*void)(*instance.m_pathResult)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_pathResult)) == 8, "dtCrowd.m_pathResult has unexpected size % instead of 8", size_of(type_of(dtCrowd.m_pathResult)));
        assert(((cast(*void)(*instance.m_maxPathResult)) - cast(*void)(*instance)) == 880, "dtCrowd.m_maxPathResult has unexpected offset % instead of 880", ((cast(*void)(*instance.m_maxPathResult)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_maxPathResult)) == 4, "dtCrowd.m_maxPathResult has unexpected size % instead of 4", size_of(type_of(dtCrowd.m_maxPathResult)));
        assert(((cast(*void)(*instance.m_agentPlacementHalfExtents)) - cast(*void)(*instance)) == 884, "dtCrowd.m_agentPlacementHalfExtents has unexpected offset % instead of 884", ((cast(*void)(*instance.m_agentPlacementHalfExtents)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_agentPlacementHalfExtents)) == 12, "dtCrowd.m_agentPlacementHalfExtents has unexpected size % instead of 12", size_of(type_of(dtCrowd.m_agentPlacementHalfExtents)));
        assert(((cast(*void)(*instance.m_filters)) - cast(*void)(*instance)) == 896, "dtCrowd.m_filters has unexpected offset % instead of 896", ((cast(*void)(*instance.m_filters)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_filters)) == 4160, "dtCrowd.m_filters has unexpected size % instead of 4160", size_of(type_of(dtCrowd.m_filters)));
        assert(((cast(*void)(*instance.m_maxAgentRadius)) - cast(*void)(*instance)) == 5056, "dtCrowd.m_maxAgentRadius has unexpected offset % instead of 5056", ((cast(*void)(*instance.m_maxAgentRadius)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_maxAgentRadius)) == 4, "dtCrowd.m_maxAgentRadius has unexpected size % instead of 4", size_of(type_of(dtCrowd.m_maxAgentRadius)));
        assert(((cast(*void)(*instance.m_velocitySampleCount)) - cast(*void)(*instance)) == 5060, "dtCrowd.m_velocitySampleCount has unexpected offset % instead of 5060", ((cast(*void)(*instance.m_velocitySampleCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_velocitySampleCount)) == 4, "dtCrowd.m_velocitySampleCount has unexpected size % instead of 4", size_of(type_of(dtCrowd.m_velocitySampleCount)));
        assert(((cast(*void)(*instance.m_navquery)) - cast(*void)(*instance)) == 5064, "dtCrowd.m_navquery has unexpected offset % instead of 5064", ((cast(*void)(*instance.m_navquery)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtCrowd.m_navquery)) == 8, "dtCrowd.m_navquery has unexpected size % instead of 8", size_of(type_of(dtCrowd.m_navquery)));
        assert(size_of(dtCrowd) == 5072, "dtCrowd has size % instead of 5072", size_of(dtCrowd));
    }
}

