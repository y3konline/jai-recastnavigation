//
// This file was auto-generated using the following command:
//
// jai ./generate.jai - -compile
//



/// Derives the closest point on a triangle from the specified reference point.
///  @param[out]	closest	The closest point on the triangle.
///  @param[in]		p		The reference point from which to test. [(x, y, z)]
///  @param[in]		a		Vertex A of triangle ABC. [(x, y, z)]
///  @param[in]		b		Vertex B of triangle ABC. [(x, y, z)]
///  @param[in]		c		Vertex C of triangle ABC. [(x, y, z)]
dtClosestPtPointTriangle :: (closest: *float, p: *float, a: *float, b: *float, c: *float) -> void #foreign lib/windows/detour "?dtClosestPtPointTriangle@@YAXPEAMPEBM111@Z";

/// Derives the y-axis height of the closest point on the triangle from the specified reference point.
///  @param[in]		p		The reference point from which to test. [(x, y, z)]
///  @param[in]		a		Vertex A of triangle ABC. [(x, y, z)]
///  @param[in]		b		Vertex B of triangle ABC. [(x, y, z)]
///  @param[in]		c		Vertex C of triangle ABC. [(x, y, z)]
///  @param[out]	h		The resulting height.
dtClosestHeightPointTriangle :: (p: *float, a: *float, b: *float, c: *float, h: *float) -> bool #foreign lib/windows/detour "?dtClosestHeightPointTriangle@@YA_NPEBM000AEAM@Z";

dtIntersectSegmentPoly2D :: (p0: *float, p1: *float, verts: *float, nverts: s32, tmin: *float, tmax: *float, segMin: *s32, segMax: *s32) -> bool #foreign lib/windows/detour "?dtIntersectSegmentPoly2D@@YA_NPEBM00HAEAM1AEAH2@Z";

dtIntersectSegSeg2D :: (ap: *float, aq: *float, bp: *float, bq: *float, s: *float, t: *float) -> bool #foreign lib/windows/detour "?dtIntersectSegSeg2D@@YA_NPEBM000AEAM1@Z";

/// Determines if the specified point is inside the convex polygon on the xz-plane.
///  @param[in]		pt		The point to check. [(x, y, z)]
///  @param[in]		verts	The polygon vertices. [(x, y, z) * @p nverts]
///  @param[in]		nverts	The number of vertices. [Limit: >= 3]
/// @return True if the point is inside the polygon.
dtPointInPolygon :: (pt: *float, verts: *float, nverts: s32) -> bool #foreign lib/windows/detour "?dtPointInPolygon@@YA_NPEBM0H@Z";

dtDistancePtPolyEdgesSqr :: (pt: *float, verts: *float, nverts: s32, ed: *float, et: *float) -> bool #foreign lib/windows/detour "?dtDistancePtPolyEdgesSqr@@YA_NPEBM0HPEAM1@Z";

dtDistancePtSegSqr2D :: (pt: *float, p: *float, q: *float, t: *float) -> float #foreign lib/windows/detour "?dtDistancePtSegSqr2D@@YAMPEBM00AEAM@Z";

/// Derives the centroid of a convex polygon.
///  @param[out]	tc		The centroid of the polgyon. [(x, y, z)]
///  @param[in]		idx		The polygon indices. [(vertIndex) * @p nidx]
///  @param[in]		nidx	The number of indices in the polygon. [Limit: >= 3]
///  @param[in]		verts	The polygon vertices. [(x, y, z) * vertCount]
dtCalcPolyCenter :: (tc: *float, idx: *u16, nidx: s32, verts: *float) -> void #foreign lib/windows/detour "?dtCalcPolyCenter@@YAXPEAMPEBGHPEBM@Z";

/// Determines if the two convex polygons overlap on the xz-plane.
///  @param[in]		polya		Polygon A vertices.	[(x, y, z) * @p npolya]
///  @param[in]		npolya		The number of vertices in polygon A.
///  @param[in]		polyb		Polygon B vertices.	[(x, y, z) * @p npolyb]
///  @param[in]		npolyb		The number of vertices in polygon B.
/// @return True if the two polygons overlap.
dtOverlapPolyPoly2D :: (polya: *float, npolya: s32, polyb: *float, npolyb: s32) -> bool #foreign lib/windows/detour "?dtOverlapPolyPoly2D@@YA_NPEBMH0H@Z";

dtRandomPointInConvexPoly :: (pts: *float, npts: s32, areas: *float, s: float, t: float, out: *float) -> void #foreign lib/windows/detour "?dtRandomPointInConvexPoly@@YAXPEBMHPEAMMM1@Z";

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
dtAllocSetCustom :: (allocFunc: dtAllocFunc, freeFunc: dtFreeFunc) -> void #foreign lib/windows/detour "?dtAllocSetCustom@@YAXP6APEAX_KW4dtAllocHint@@@ZP6AXPEAX@Z@Z";

/// Allocates a memory block.
///  @param[in]		size	The size, in bytes of memory, to allocate.
///  @param[in]		hint	A hint to the allocator on how long the memory is expected to be in use.
///  @return A pointer to the beginning of the allocated memory block, or null if the allocation failed.
/// @see dtFree
dtAlloc :: (size: u64, hint: dtAllocHint) -> *void #foreign lib/windows/detour "?dtAlloc@@YAPEAX_KW4dtAllocHint@@@Z";

/// Deallocates a memory block.
///  @param[in]		ptr		A pointer to a memory block previously allocated using #dtAlloc.
/// @see dtAlloc
dtFree :: (ptr: *void) -> void #foreign lib/windows/detour "?dtFree@@YAXPEAX@Z";

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
dtStatusSucceed :: (status: dtStatus) -> bool #foreign lib/windows/detour "?dtStatusSucceed@@YA_NI@Z";

// Returns true of status is failure.
dtStatusFailed :: (status: dtStatus) -> bool #foreign lib/windows/detour "?dtStatusFailed@@YA_NI@Z";

// Returns true of status is in progress.
dtStatusInProgress :: (status: dtStatus) -> bool #foreign lib/windows/detour "?dtStatusInProgress@@YA_NI@Z";

// Returns true if specific detail is set.
dtStatusDetail :: (status: dtStatus, detail: u32) -> bool #foreign lib/windows/detour "?dtStatusDetail@@YA_NII@Z";

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
    Constructor :: (this: *dtNavMesh) -> void #cpp_method #foreign lib/windows/detour "??0dtNavMesh@@QEAA@XZ";
    Destructor :: (this: *dtNavMesh) -> void #cpp_method #foreign lib/windows/detour "??1dtNavMesh@@QEAA@XZ";

    /// Initializes the navigation mesh for tiled use.
    ///  @param[in]	params		Initialization parameters.
    /// @return The status flags for the operation.
    init :: (this: *dtNavMesh, params: *dtNavMeshParams) -> dtStatus #cpp_method #foreign lib/windows/detour "?init@dtNavMesh@@QEAAIPEBUdtNavMeshParams@@@Z";

    /// Initializes the navigation mesh for single tile use.
    ///  @param[in]	data		Data of the new tile. (See: #dtCreateNavMeshData)
    ///  @param[in]	dataSize	The data size of the new tile.
    ///  @param[in]	flags		The tile flags. (See: #dtTileFlags)
    /// @return The status flags for the operation.
    ///  @see dtCreateNavMeshData
    init :: (this: *dtNavMesh, data: *u8, dataSize: s32, flags: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?init@dtNavMesh@@QEAAIPEAEHH@Z";

    /// The navigation mesh initialization params.
    getParams :: (this: *dtNavMesh) -> *dtNavMeshParams #cpp_method #foreign lib/windows/detour "?getParams@dtNavMesh@@QEBAPEBUdtNavMeshParams@@XZ";

    /// Adds a tile to the navigation mesh.
    ///  @param[in]		data		Data for the new tile mesh. (See: #dtCreateNavMeshData)
    ///  @param[in]		dataSize	Data size of the new tile mesh.
    ///  @param[in]		flags		Tile flags. (See: #dtTileFlags)
    ///  @param[in]		lastRef		The desired reference for the tile. (When reloading a tile.) [opt] [Default: 0]
    ///  @param[out]	result		The tile reference. (If the tile was succesfully added.) [opt]
    /// @return The status flags for the operation.
    addTile :: (this: *dtNavMesh, data: *u8, dataSize: s32, flags: s32, lastRef: dtTileRef, result: *dtTileRef) -> dtStatus #cpp_method #foreign lib/windows/detour "?addTile@dtNavMesh@@QEAAIPEAEHHIPEAI@Z";

    /// Removes the specified tile from the navigation mesh.
    ///  @param[in]		ref			The reference of the tile to remove.
    ///  @param[out]	data		Data associated with deleted tile.
    ///  @param[out]	dataSize	Size of the data associated with deleted tile.
    /// @return The status flags for the operation.
    removeTile :: (this: *dtNavMesh, ref: dtTileRef, data: **u8, dataSize: *s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?removeTile@dtNavMesh@@QEAAIIPEAPEAEPEAH@Z";

    /// Calculates the tile grid location for the specified world position.
    ///  @param[in]	pos  The world position for the query. [(x, y, z)]
    ///  @param[out]	tx		The tile's x-location. (x, y)
    ///  @param[out]	ty		The tile's y-location. (x, y)
    calcTileLoc :: (this: *dtNavMesh, pos: *float, tx: *s32, ty: *s32) -> void #cpp_method #foreign lib/windows/detour "?calcTileLoc@dtNavMesh@@QEBAXPEBMPEAH1@Z";

    /// Gets the tile at the specified grid location.
    ///  @param[in]	x		The tile's x-location. (x, y, layer)
    ///  @param[in]	y		The tile's y-location. (x, y, layer)
    ///  @param[in]	layer	The tile's layer. (x, y, layer)
    /// @return The tile, or null if the tile does not exist.
    getTileAt :: (this: *dtNavMesh, x: s32, y: s32, layer: s32) -> *dtMeshTile #cpp_method #foreign lib/windows/detour "?getTileAt@dtNavMesh@@QEBAPEBUdtMeshTile@@HHH@Z";

    /// Gets all tiles at the specified grid location. (All layers.)
    ///  @param[in]		x			The tile's x-location. (x, y)
    ///  @param[in]		y			The tile's y-location. (x, y)
    ///  @param[out]	tiles		A pointer to an array of tiles that will hold the result.
    ///  @param[in]		maxTiles	The maximum tiles the tiles parameter can hold.
    /// @return The number of tiles returned in the tiles array.
    getTilesAt :: (this: /*const*/ *dtNavMesh, x: /*const*/ s32, y: /*const*/ s32, tiles: **dtMeshTile, maxTiles: /*const*/ s32) -> s32 #cpp_method #foreign lib/windows/detour "?getTilesAt@dtNavMesh@@QEBAHHHPEAPEBUdtMeshTile@@H@Z";

    /// Gets the tile reference for the tile at specified grid location.
    ///  @param[in]	x		The tile's x-location. (x, y, layer)
    ///  @param[in]	y		The tile's y-location. (x, y, layer)
    ///  @param[in]	layer	The tile's layer. (x, y, layer)
    /// @return The tile reference of the tile, or 0 if there is none.
    getTileRefAt :: (this: *dtNavMesh, x: s32, y: s32, layer: s32) -> dtTileRef #cpp_method #foreign lib/windows/detour "?getTileRefAt@dtNavMesh@@QEBAIHHH@Z";

    /// Gets the tile reference for the specified tile.
    ///  @param[in]	tile	The tile.
    /// @return The tile reference of the tile.
    getTileRef :: (this: *dtNavMesh, tile: *dtMeshTile) -> dtTileRef #cpp_method #foreign lib/windows/detour "?getTileRef@dtNavMesh@@QEBAIPEBUdtMeshTile@@@Z";

    /// Gets the tile for the specified tile reference.
    ///  @param[in]	ref		The tile reference of the tile to retrieve.
    /// @return The tile for the specified reference, or null if the
    ///		reference is invalid.
    getTileByRef :: (this: *dtNavMesh, ref: dtTileRef) -> *dtMeshTile #cpp_method #foreign lib/windows/detour "?getTileByRef@dtNavMesh@@QEBAPEBUdtMeshTile@@I@Z";

    /// The maximum number of tiles supported by the navigation mesh.
    /// @return The maximum number of tiles supported by the navigation mesh.
    getMaxTiles :: (this: *dtNavMesh) -> s32 #cpp_method #foreign lib/windows/detour "?getMaxTiles@dtNavMesh@@QEBAHXZ";

    /// Gets the tile at the specified index.
    ///  @param[in]	i		The tile index. [Limit: 0 >= index < #getMaxTiles()]
    /// @return The tile at the specified index.
    getTile :: (this: /*const*/ *dtNavMesh, i: s32) -> *dtMeshTile #cpp_method #foreign lib/windows/detour "?getTile@dtNavMesh@@QEBAPEBUdtMeshTile@@H@Z";

    /// Gets the tile and polygon for the specified polygon reference.
    ///  @param[in]		ref		The reference for the a polygon.
    ///  @param[out]	tile	The tile containing the polygon.
    ///  @param[out]	poly	The polygon.
    /// @return The status flags for the operation.
    getTileAndPolyByRef :: (this: *dtNavMesh, ref: dtPolyRef, tile: **dtMeshTile, poly: **dtPoly) -> dtStatus #cpp_method #foreign lib/windows/detour "?getTileAndPolyByRef@dtNavMesh@@QEBAIIPEAPEBUdtMeshTile@@PEAPEBUdtPoly@@@Z";

    /// Returns the tile and polygon for the specified polygon reference.
    ///  @param[in]		ref		A known valid reference for a polygon.
    ///  @param[out]	tile	The tile containing the polygon.
    ///  @param[out]	poly	The polygon.
    getTileAndPolyByRefUnsafe :: (this: *dtNavMesh, ref: dtPolyRef, tile: **dtMeshTile, poly: **dtPoly) -> void #cpp_method #foreign lib/windows/detour "?getTileAndPolyByRefUnsafe@dtNavMesh@@QEBAXIPEAPEBUdtMeshTile@@PEAPEBUdtPoly@@@Z";

    /// Checks the validity of a polygon reference.
    ///  @param[in]	ref		The polygon reference to check.
    /// @return True if polygon reference is valid for the navigation mesh.
    isValidPolyRef :: (this: *dtNavMesh, ref: dtPolyRef) -> bool #cpp_method #foreign lib/windows/detour "?isValidPolyRef@dtNavMesh@@QEBA_NI@Z";

    /// Gets the polygon reference for the tile's base polygon.
    ///  @param[in]	tile		The tile.
    /// @return The polygon reference for the base polygon in the specified tile.
    getPolyRefBase :: (this: *dtNavMesh, tile: *dtMeshTile) -> dtPolyRef #cpp_method #foreign lib/windows/detour "?getPolyRefBase@dtNavMesh@@QEBAIPEBUdtMeshTile@@@Z";

    /// Gets the endpoints for an off-mesh connection, ordered by "direction of travel".
    ///  @param[in]		prevRef		The reference of the polygon before the connection.
    ///  @param[in]		polyRef		The reference of the off-mesh connection polygon.
    ///  @param[out]	startPos	The start position of the off-mesh connection. [(x, y, z)]
    ///  @param[out]	endPos		The end position of the off-mesh connection. [(x, y, z)]
    /// @return The status flags for the operation.
    getOffMeshConnectionPolyEndPoints :: (this: *dtNavMesh, prevRef: dtPolyRef, polyRef: dtPolyRef, startPos: *float, endPos: *float) -> dtStatus #cpp_method #foreign lib/windows/detour "?getOffMeshConnectionPolyEndPoints@dtNavMesh@@QEBAIIIPEAM0@Z";

    /// Gets the specified off-mesh connection.
    ///  @param[in]	ref		The polygon reference of the off-mesh connection.
    /// @return The specified off-mesh connection, or null if the polygon reference is not valid.
    getOffMeshConnectionByRef :: (this: *dtNavMesh, ref: dtPolyRef) -> *dtOffMeshConnection #cpp_method #foreign lib/windows/detour "?getOffMeshConnectionByRef@dtNavMesh@@QEBAPEBUdtOffMeshConnection@@I@Z";

    /// Sets the user defined flags for the specified polygon.
    ///  @param[in]	ref		The polygon reference.
    ///  @param[in]	flags	The new flags for the polygon.
    /// @return The status flags for the operation.
    setPolyFlags :: (this: *dtNavMesh, ref: dtPolyRef, flags: u16) -> dtStatus #cpp_method #foreign lib/windows/detour "?setPolyFlags@dtNavMesh@@QEAAIIG@Z";

    /// Gets the user defined flags for the specified polygon.
    ///  @param[in]		ref				The polygon reference.
    ///  @param[out]	resultFlags		The polygon flags.
    /// @return The status flags for the operation.
    getPolyFlags :: (this: *dtNavMesh, ref: dtPolyRef, resultFlags: *u16) -> dtStatus #cpp_method #foreign lib/windows/detour "?getPolyFlags@dtNavMesh@@QEBAIIPEAG@Z";

    /// Sets the user defined area for the specified polygon.
    ///  @param[in]	ref		The polygon reference.
    ///  @param[in]	area	The new area id for the polygon. [Limit: < #DT_MAX_AREAS]
    /// @return The status flags for the operation.
    setPolyArea :: (this: *dtNavMesh, ref: dtPolyRef, area: u8) -> dtStatus #cpp_method #foreign lib/windows/detour "?setPolyArea@dtNavMesh@@QEAAIIE@Z";

    /// Gets the user defined area for the specified polygon.
    ///  @param[in]		ref			The polygon reference.
    ///  @param[out]	resultArea	The area id for the polygon.
    /// @return The status flags for the operation.
    getPolyArea :: (this: *dtNavMesh, ref: dtPolyRef, resultArea: *u8) -> dtStatus #cpp_method #foreign lib/windows/detour "?getPolyArea@dtNavMesh@@QEBAIIPEAE@Z";

    /// Gets the size of the buffer required by #storeTileState to store the specified tile's state.
    ///  @param[in]	tile	The tile.
    /// @return The size of the buffer required to store the state.
    getTileStateSize :: (this: *dtNavMesh, tile: *dtMeshTile) -> s32 #cpp_method #foreign lib/windows/detour "?getTileStateSize@dtNavMesh@@QEBAHPEBUdtMeshTile@@@Z";

    /// Stores the non-structural state of the tile in the specified buffer. (Flags, area ids, etc.)
    ///  @param[in]		tile			The tile.
    ///  @param[out]	data			The buffer to store the tile's state in.
    ///  @param[in]		maxDataSize		The size of the data buffer. [Limit: >= #getTileStateSize]
    /// @return The status flags for the operation.
    storeTileState :: (this: *dtNavMesh, tile: *dtMeshTile, data: *u8, maxDataSize: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?storeTileState@dtNavMesh@@QEBAIPEBUdtMeshTile@@PEAEH@Z";

    /// Restores the state of the tile.
    ///  @param[in]	tile			The tile.
    ///  @param[in]	data			The new state. (Obtained from #storeTileState.)
    ///  @param[in]	maxDataSize		The size of the state within the data buffer.
    /// @return The status flags for the operation.
    restoreTileState :: (this: *dtNavMesh, tile: *dtMeshTile, data: *u8, maxDataSize: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?restoreTileState@dtNavMesh@@QEAAIPEAUdtMeshTile@@PEBEH@Z";

    /// Derives a standard polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	salt	The tile's salt value.
    ///  @param[in]	it		The index of the tile.
    ///  @param[in]	ip		The index of the polygon within the tile.
    encodePolyId :: (this: *dtNavMesh, salt: u32, it: u32, ip: u32) -> dtPolyRef #cpp_method #foreign lib/windows/detour "?encodePolyId@dtNavMesh@@QEBAIIII@Z";

    /// Decodes a standard polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref   The polygon reference to decode.
    ///  @param[out]	salt	The tile's salt value.
    ///  @param[out]	it		The index of the tile.
    ///  @param[out]	ip		The index of the polygon within the tile.
    ///  @see #encodePolyId
    decodePolyId :: (this: *dtNavMesh, ref: dtPolyRef, salt: *u32, it: *u32, ip: *u32) -> void #cpp_method #foreign lib/windows/detour "?decodePolyId@dtNavMesh@@QEBAXIAEAI00@Z";

    /// Extracts a tile's salt value from the specified polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref		The polygon reference.
    ///  @see #encodePolyId
    decodePolyIdSalt :: (this: *dtNavMesh, ref: dtPolyRef) -> u32 #cpp_method #foreign lib/windows/detour "?decodePolyIdSalt@dtNavMesh@@QEBAII@Z";

    /// Extracts the tile's index from the specified polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref		The polygon reference.
    ///  @see #encodePolyId
    decodePolyIdTile :: (this: *dtNavMesh, ref: dtPolyRef) -> u32 #cpp_method #foreign lib/windows/detour "?decodePolyIdTile@dtNavMesh@@QEBAII@Z";

    /// Extracts the polygon's index (within its tile) from the specified polygon reference.
    ///  @note This function is generally meant for internal use only.
    ///  @param[in]	ref		The polygon reference.
    ///  @see #encodePolyId
    decodePolyIdPoly :: (this: *dtNavMesh, ref: dtPolyRef) -> u32 #cpp_method #foreign lib/windows/detour "?decodePolyIdPoly@dtNavMesh@@QEBAII@Z";

    /// Returns pointer to tile in the tile array.
    getTile_1 :: (this: *dtNavMesh, i: s32) -> *dtMeshTile #cpp_method #foreign lib/windows/detour "?getTile@dtNavMesh@@AEAAPEAUdtMeshTile@@H@Z";

    /// Returns neighbour tile based on side.
    getTilesAt_1 :: (this: /*const*/ *dtNavMesh, x: /*const*/ s32, y: /*const*/ s32, tiles: **dtMeshTile, maxTiles: /*const*/ s32) -> s32 #cpp_method #foreign lib/windows/detour "?getTilesAt@dtNavMesh@@AEBAHHHPEAPEAUdtMeshTile@@H@Z";

    /// Returns neighbour tile based on side.
    getNeighbourTilesAt :: (this: *dtNavMesh, x: s32, y: s32, side: s32, tiles: **dtMeshTile, maxTiles: s32) -> s32 #cpp_method #foreign lib/windows/detour "?getNeighbourTilesAt@dtNavMesh@@AEBAHHHHPEAPEAUdtMeshTile@@H@Z";

    /// Returns all polygons in neighbour tile based on portal defined by the segment.
    findConnectingPolys :: (this: *dtNavMesh, va: *float, vb: *float, tile: *dtMeshTile, side: s32, con: *dtPolyRef, conarea: *float, maxcon: s32) -> s32 #cpp_method #foreign lib/windows/detour "?findConnectingPolys@dtNavMesh@@AEBAHPEBM0PEBUdtMeshTile@@HPEAIPEAMH@Z";

    /// Builds internal polygons links for a tile.
    connectIntLinks :: (this: *dtNavMesh, tile: *dtMeshTile) -> void #cpp_method #foreign lib/windows/detour "?connectIntLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@@Z";

    /// Builds internal polygons links for a tile.
    baseOffMeshLinks :: (this: *dtNavMesh, tile: *dtMeshTile) -> void #cpp_method #foreign lib/windows/detour "?baseOffMeshLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@@Z";

    /// Builds external polygon links for a tile.
    connectExtLinks :: (this: *dtNavMesh, tile: *dtMeshTile, target: *dtMeshTile, side: s32) -> void #cpp_method #foreign lib/windows/detour "?connectExtLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@0H@Z";

    /// Builds external polygon links for a tile.
    connectExtOffMeshLinks :: (this: *dtNavMesh, tile: *dtMeshTile, target: *dtMeshTile, side: s32) -> void #cpp_method #foreign lib/windows/detour "?connectExtOffMeshLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@0H@Z";

    /// Removes external links at specified side.
    unconnectLinks :: (this: *dtNavMesh, tile: *dtMeshTile, target: *dtMeshTile) -> void #cpp_method #foreign lib/windows/detour "?unconnectLinks@dtNavMesh@@AEAAXPEAUdtMeshTile@@0@Z";

    /// Queries polygons within a tile.
    queryPolygonsInTile :: (this: *dtNavMesh, tile: *dtMeshTile, qmin: *float, qmax: *float, polys: *dtPolyRef, maxPolys: s32) -> s32 #cpp_method #foreign lib/windows/detour "?queryPolygonsInTile@dtNavMesh@@AEBAHPEBUdtMeshTile@@PEBM1PEAIH@Z";

    /// Find nearest polygon within a tile.
    findNearestPolyInTile :: (this: *dtNavMesh, tile: *dtMeshTile, center: *float, halfExtents: *float, nearestPt: *float) -> dtPolyRef #cpp_method #foreign lib/windows/detour "?findNearestPolyInTile@dtNavMesh@@AEBAIPEBUdtMeshTile@@PEBM1PEAM@Z";

    /// Returns whether position is over the poly and the height at the position if so.
    getPolyHeight :: (this: *dtNavMesh, tile: *dtMeshTile, poly: *dtPoly, pos: *float, height: *float) -> bool #cpp_method #foreign lib/windows/detour "?getPolyHeight@dtNavMesh@@AEBA_NPEBUdtMeshTile@@PEBUdtPoly@@PEBMPEAM@Z";

    /// Returns closest point on polygon.
    closestPointOnPoly :: (this: *dtNavMesh, ref: dtPolyRef, pos: *float, closest: *float, posOverPoly: *bool) -> void #cpp_method #foreign lib/windows/detour "?closestPointOnPoly@dtNavMesh@@AEBAXIPEBMPEAMPEA_N@Z";

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
dtAllocNavMesh :: () -> *dtNavMesh #foreign lib/windows/detour "?dtAllocNavMesh@@YAPEAVdtNavMesh@@XZ";

/// Frees the specified navigation mesh object using the Detour allocator.
///  @param[in]	navmesh		A navigation mesh allocated using #dtAllocNavMesh
///  @ingroup detour
dtFreeNavMesh :: (navmesh: *dtNavMesh) -> void #foreign lib/windows/detour "?dtFreeNavMesh@@YAXPEAVdtNavMesh@@@Z";

/// Represents the source data used to build an navigation mesh tile.
/// @ingroup detour
dtNavMeshCreateParams :: struct {
    verts:            *u16; ///< The polygon mesh vertices. [(x, y, z) * #vertCount] [Unit: vx]
    vertCount:        s32; ///< The number vertices in the polygon mesh. [Limit: >= 3]
    polys:            *u16; ///< The polygon data. [Size: #polyCount * 2 * #nvp]
    polyFlags:        *u16; ///< The user defined flags assigned to each polygon. [Size: #polyCount]
    polyAreas:        *u8; ///< The user defined area ids assigned to each polygon. [Size: #polyCount]
    polyCount:        s32; ///< Number of polygons in the mesh. [Limit: >= 1]
    nvp:              s32; ///< Number maximum number of vertices per polygon. [Limit: >= 3]

    detailMeshes:     *u32; ///< The height detail sub-mesh data. [Size: 4 * #polyCount]
    detailVerts:      *float; ///< The detail mesh vertices. [Size: 3 * #detailVertsCount] [Unit: wu]
    detailVertsCount: s32; ///< The number of vertices in the detail mesh.
    detailTris:       *u8; ///< The detail mesh triangles. [Size: 4 * #detailTriCount]
    detailTriCount:   s32; ///< The number of triangles in the detail mesh.

    /// Off-mesh connection vertices. [(ax, ay, az, bx, by, bz) * #offMeshConCount] [Unit: wu]
    offMeshConVerts:  *float;

    /// Off-mesh connection radii. [Size: #offMeshConCount] [Unit: wu]
    offMeshConRad:    *float;

    /// User defined flags assigned to the off-mesh connections. [Size: #offMeshConCount]
    offMeshConFlags:  *u16;

    /// User defined area ids assigned to the off-mesh connections. [Size: #offMeshConCount]
    offMeshConAreas:  *u8;

    /// The permitted travel direction of the off-mesh connections. [Size: #offMeshConCount]
    ///
    /// 0 = Travel only from endpoint A to endpoint B.<br/>
    /// #DT_OFFMESH_CON_BIDIR = Bidirectional travel.
    offMeshConDir:    *u8;

    /// The user defined ids of the off-mesh connection. [Size: #offMeshConCount]
    offMeshConUserID: *u32;

    /// The number of off-mesh connections. [Limit: >= 0]
    offMeshConCount:  s32;

    userId:           u32; ///< The user defined id of the tile.
    tileX:            s32; ///< The tile's x-grid location within the multi-tile destination mesh. (Along the x-axis.)
    tileY:            s32; ///< The tile's y-grid location within the multi-tile destination mesh. (Along the z-axis.)
    tileLayer:        s32; ///< The tile's layer within the layered destination mesh. [Limit: >= 0] (Along the y-axis.)
    bmin:             [3] float; ///< The minimum bounds of the tile. [(x, y, z)] [Unit: wu]
    bmax:             [3] float; ///< The maximum bounds of the tile. [(x, y, z)] [Unit: wu]

    walkableHeight:   float; ///< The agent height. [Unit: wu]
    walkableRadius:   float; ///< The agent radius. [Unit: wu]
    walkableClimb:    float; ///< The agent maximum traversable ledge. (Up/Down) [Unit: wu]
    cs:               float; ///< The xz-plane cell size of the polygon mesh. [Limit: > 0] [Unit: wu]
    ch:               float; ///< The y-axis cell height of the polygon mesh. [Limit: > 0] [Unit: wu]

    /// True if a bounding volume tree should be built for the tile.
    /// @note The BVTree is not normally needed for layered navigation meshes.
    buildBvTree:      bool;
}

/// Builds navigation mesh tile data from the provided tile creation data.
/// @ingroup detour
///  @param[in]		params		Tile creation data.
///  @param[out]	outData		The resulting tile data.
///  @param[out]	outDataSize	The size of the tile data array.
/// @return True if the tile data was successfully created.
dtCreateNavMeshData :: (params: *dtNavMeshCreateParams, outData: **u8, outDataSize: *s32) -> bool #foreign lib/windows/detour "?dtCreateNavMeshData@@YA_NPEAUdtNavMeshCreateParams@@PEAPEAEPEAH@Z";

/// Swaps the endianness of the tile data's header (#dtMeshHeader).
///  @param[in,out]	data		The tile data array.
///  @param[in]		dataSize	The size of the data array.
dtNavMeshHeaderSwapEndian :: (data: *u8, dataSize: s32) -> bool #foreign lib/windows/detour "?dtNavMeshHeaderSwapEndian@@YA_NPEAEH@Z";

/// Swaps endianness of the tile data.
///  @param[in,out]	data		The tile data array.
///  @param[in]		dataSize	The size of the data array.
dtNavMeshDataSwapEndian :: (data: *u8, dataSize: s32) -> bool #foreign lib/windows/detour "?dtNavMeshDataSwapEndian@@YA_NPEAEH@Z";

/// Defines polygon filtering and traversal costs for navigation mesh query operations.
/// @ingroup detour
dtQueryFilter :: struct {
    m_areaCost:     [64] float; ///< Cost per area type. (Used by default implementation.)
    m_includeFlags: u16; ///< Flags for polygons that can be visited. (Used by default implementation.)
    m_excludeFlags: u16; ///< Flags for polygons that should not be visited. (Used by default implementation.)

    Constructor :: (this: *dtQueryFilter) -> void #cpp_method #foreign lib/windows/detour "??0dtQueryFilter@@QEAA@XZ";

    passFilter :: (this: *dtQueryFilter, ref: dtPolyRef, tile: *dtMeshTile, poly: *dtPoly) -> bool #cpp_method #foreign lib/windows/detour "?passFilter@dtQueryFilter@@QEBA_NIPEBUdtMeshTile@@PEBUdtPoly@@@Z";

    getCost :: (this: *dtQueryFilter, pa: *float, pb: *float, prevRef: dtPolyRef, prevTile: *dtMeshTile, prevPoly: *dtPoly, curRef: dtPolyRef, curTile: *dtMeshTile, curPoly: *dtPoly, nextRef: dtPolyRef, nextTile: *dtMeshTile, nextPoly: *dtPoly) -> float #cpp_method #foreign lib/windows/detour "?getCost@dtQueryFilter@@QEBAMPEBM0IPEBUdtMeshTile@@PEBUdtPoly@@I12I12@Z";

    /// Returns the traversal cost of the area.
    ///  @param[in]		i		The id of the area.
    /// @returns The traversal cost of the area.
    getAreaCost :: (this: *dtQueryFilter, i: s32) -> float #cpp_method #foreign lib/windows/detour "?getAreaCost@dtQueryFilter@@QEBAMH@Z";

    /// Sets the traversal cost of the area.
    ///  @param[in]		i		The id of the area.
    ///  @param[in]		cost	The new cost of traversing the area.
    setAreaCost :: (this: *dtQueryFilter, i: s32, cost: float) -> void #cpp_method #foreign lib/windows/detour "?setAreaCost@dtQueryFilter@@QEAAXHM@Z";

    /// Returns the include flags for the filter.
    /// Any polygons that include one or more of these flags will be
    /// included in the operation.
    getIncludeFlags :: (this: *dtQueryFilter) -> u16 #cpp_method #foreign lib/windows/detour "?getIncludeFlags@dtQueryFilter@@QEBAGXZ";

    /// Sets the include flags for the filter.
    /// @param[in]		flags	The new flags.
    setIncludeFlags :: (this: *dtQueryFilter, flags: u16) -> void #cpp_method #foreign lib/windows/detour "?setIncludeFlags@dtQueryFilter@@QEAAXG@Z";

    /// Returns the exclude flags for the filter.
    /// Any polygons that include one ore more of these flags will be
    /// excluded from the operation.
    getExcludeFlags :: (this: *dtQueryFilter) -> u16 #cpp_method #foreign lib/windows/detour "?getExcludeFlags@dtQueryFilter@@QEBAGXZ";

    /// Sets the exclude flags for the filter.
    /// @param[in]		flags		The new flags.
    setExcludeFlags :: (this: *dtQueryFilter, flags: u16) -> void #cpp_method #foreign lib/windows/detour "?setExcludeFlags@dtQueryFilter@@QEAAXG@Z";
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
    virtual_Destructor :: (this: *dtPolyQuery, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign lib/windows/detour "??1dtPolyQuery@@UEAA@XZ";
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
    Constructor :: (this: *dtNavMeshQuery) -> void #cpp_method #foreign lib/windows/detour "??0dtNavMeshQuery@@QEAA@XZ";
    Destructor :: (this: *dtNavMeshQuery) -> void #cpp_method #foreign lib/windows/detour "??1dtNavMeshQuery@@QEAA@XZ";

    /// Initializes the query object.
    ///  @param[in]		nav			Pointer to the dtNavMesh object to use for all queries.
    ///  @param[in]		maxNodes	Maximum number of search nodes. [Limits: 0 < value <= 65535]
    /// @returns The status flags for the query.
    init :: (this: *dtNavMeshQuery, nav: *dtNavMesh, maxNodes: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?init@dtNavMeshQuery@@QEAAIPEBVdtNavMesh@@H@Z";

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
    findPath :: (this: *dtNavMeshQuery, startRef: dtPolyRef, endRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?findPath@dtNavMeshQuery@@QEBAIIIPEBM0PEBVdtQueryFilter@@PEAIPEAHH@Z";

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
    findStraightPath :: (this: *dtNavMeshQuery, startPos: *float, endPos: *float, path: *dtPolyRef, pathSize: s32, straightPath: *float, straightPathFlags: *u8, straightPathRefs: *dtPolyRef, straightPathCount: *s32, maxStraightPath: s32, options: s32 = 0) -> dtStatus #cpp_method #foreign lib/windows/detour "?findStraightPath@dtNavMeshQuery@@QEBAIPEBM0PEBIHPEAMPEAEPEAIPEAHHH@Z";

    /// Initializes a sliced path query.
    ///  @param[in]		startRef	The reference id of the start polygon.
    ///  @param[in]		endRef		The reference id of the end polygon.
    ///  @param[in]		startPos	A position within the start polygon. [(x, y, z)]
    ///  @param[in]		endPos		A position within the end polygon. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[in]		options		query options (see: #dtFindPathOptions)
    /// @returns The status flags for the query.
    initSlicedFindPath :: (this: *dtNavMeshQuery, startRef: dtPolyRef, endRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, options: u32 = 0) -> dtStatus #cpp_method #foreign lib/windows/detour "?initSlicedFindPath@dtNavMeshQuery@@QEAAIIIPEBM0PEBVdtQueryFilter@@I@Z";

    /// Updates an in-progress sliced path query.
    ///  @param[in]		maxIter		The maximum number of iterations to perform.
    ///  @param[out]	doneIters	The actual number of iterations completed. [opt]
    /// @returns The status flags for the query.
    updateSlicedFindPath :: (this: *dtNavMeshQuery, maxIter: s32, doneIters: *s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?updateSlicedFindPath@dtNavMeshQuery@@QEAAIHPEAH@Z";

    /// Finalizes and returns the results of a sliced path query.
    ///  @param[out]	path		An ordered list of polygon references representing the path. (Start to end.)
    ///  							[(polyRef) * @p pathCount]
    ///  @param[out]	pathCount	The number of polygons returned in the @p path array.
    ///  @param[in]		maxPath		The max number of polygons the path array can hold. [Limit: >= 1]
    /// @returns The status flags for the query.
    finalizeSlicedFindPath :: (this: *dtNavMeshQuery, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?finalizeSlicedFindPath@dtNavMeshQuery@@QEAAIPEAIPEAHH@Z";

    /// Finalizes and returns the results of an incomplete sliced path query, returning the path to the furthest
    /// polygon on the existing path that was visited during the search.
    ///  @param[in]		existing		An array of polygon references for the existing path.
    ///  @param[in]		existingSize	The number of polygon in the @p existing array.
    ///  @param[out]	path			An ordered list of polygon references representing the path. (Start to end.)
    ///  								[(polyRef) * @p pathCount]
    ///  @param[out]	pathCount		The number of polygons returned in the @p path array.
    ///  @param[in]		maxPath			The max number of polygons the @p path array can hold. [Limit: >= 1]
    /// @returns The status flags for the query.
    finalizeSlicedFindPathPartial :: (this: *dtNavMeshQuery, existing: *dtPolyRef, existingSize: s32, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?finalizeSlicedFindPathPartial@dtNavMeshQuery@@QEAAIPEBIHPEAIPEAHH@Z";

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
    findPolysAroundCircle :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, radius: float, filter: *dtQueryFilter, resultRef: *dtPolyRef, resultParent: *dtPolyRef, resultCost: *float, resultCount: *s32, maxResult: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?findPolysAroundCircle@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@PEAI2PEAMPEAHH@Z";

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
    findPolysAroundShape :: (this: *dtNavMeshQuery, startRef: dtPolyRef, verts: *float, nverts: s32, filter: *dtQueryFilter, resultRef: *dtPolyRef, resultParent: *dtPolyRef, resultCost: *float, resultCount: *s32, maxResult: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?findPolysAroundShape@dtNavMeshQuery@@QEBAIIPEBMHPEBVdtQueryFilter@@PEAI2PEAMPEAHH@Z";

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
    getPathFromDijkstraSearch :: (this: *dtNavMeshQuery, endRef: dtPolyRef, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?getPathFromDijkstraSearch@dtNavMeshQuery@@QEBAIIPEAIPEAHH@Z";

    /// Finds the polygon nearest to the specified center point.
    /// [opt] means the specified parameter can be a null pointer, in that case the output parameter will not be set.
    ///
    ///  @param[in]		center		The center of the search box. [(x, y, z)]
    ///  @param[in]		halfExtents	The search distance along each axis. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[out]	nearestRef	The reference id of the nearest polygon. Will be set to 0 if no polygon is found.
    ///  @param[out]	nearestPt	The nearest point on the polygon. Unchanged if no polygon is found. [opt] [(x, y, z)]
    /// @returns The status flags for the query.
    findNearestPoly :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, nearestRef: *dtPolyRef, nearestPt: *float) -> dtStatus #cpp_method #foreign lib/windows/detour "?findNearestPoly@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAIPEAM@Z";

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
    findNearestPoly :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, nearestRef: *dtPolyRef, nearestPt: *float, isOverPoly: *bool) -> dtStatus #cpp_method #foreign lib/windows/detour "?findNearestPoly@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAIPEAMPEA_N@Z";

    /// Finds polygons that overlap the search box.
    ///  @param[in]		center		The center of the search box. [(x, y, z)]
    ///  @param[in]		halfExtents		The search distance along each axis. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[out]	polys		The reference ids of the polygons that overlap the query box.
    ///  @param[out]	polyCount	The number of polygons in the search result.
    ///  @param[in]		maxPolys	The maximum number of polygons the search result can hold.
    /// @returns The status flags for the query.
    queryPolygons :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, polys: *dtPolyRef, polyCount: *s32, maxPolys: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?queryPolygons@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAIPEAHH@Z";

    /// Finds polygons that overlap the search box.
    ///  @param[in]		center		The center of the search box. [(x, y, z)]
    ///  @param[in]		halfExtents		The search distance along each axis. [(x, y, z)]
    ///  @param[in]		filter		The polygon filter to apply to the query.
    ///  @param[in]		query		The query. Polygons found will be batched together and passed to this query.
    queryPolygons :: (this: *dtNavMeshQuery, center: *float, halfExtents: *float, filter: *dtQueryFilter, query: *dtPolyQuery) -> dtStatus #cpp_method #foreign lib/windows/detour "?queryPolygons@dtNavMeshQuery@@QEBAIPEBM0PEBVdtQueryFilter@@PEAVdtPolyQuery@@@Z";

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
    findLocalNeighbourhood :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, radius: float, filter: *dtQueryFilter, resultRef: *dtPolyRef, resultParent: *dtPolyRef, resultCount: *s32, maxResult: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?findLocalNeighbourhood@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@PEAI2PEAHH@Z";

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
    moveAlongSurface :: (this: *dtNavMeshQuery, startRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, resultPos: *float, visited: *dtPolyRef, visitedCount: *s32, maxVisitedSize: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?moveAlongSurface@dtNavMeshQuery@@QEBAIIPEBM0PEBVdtQueryFilter@@PEAMPEAIPEAHH@Z";

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
    raycast :: (this: *dtNavMeshQuery, startRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, t: *float, hitNormal: *float, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?raycast@dtNavMeshQuery@@QEBAIIPEBM0PEBVdtQueryFilter@@PEAM2PEAIPEAHH@Z";

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
    raycast :: (this: *dtNavMeshQuery, startRef: dtPolyRef, startPos: *float, endPos: *float, filter: *dtQueryFilter, options: u32, hit: *dtRaycastHit, prevRef: dtPolyRef = 0) -> dtStatus #cpp_method #foreign lib/windows/detour "?raycast@dtNavMeshQuery@@QEBAIIPEBM0PEBVdtQueryFilter@@IPEAUdtRaycastHit@@I@Z";

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
    findDistanceToWall :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, maxRadius: float, filter: *dtQueryFilter, hitDist: *float, hitPos: *float, hitNormal: *float) -> dtStatus #cpp_method #foreign lib/windows/detour "?findDistanceToWall@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@PEAM22@Z";

    /// Returns the segments for the specified polygon, optionally including portals.
    ///  @param[in]		ref				The reference id of the polygon.
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[out]	segmentVerts	The segments. [(ax, ay, az, bx, by, bz) * segmentCount]
    ///  @param[out]	segmentRefs		The reference ids of each segment's neighbor polygon.
    ///  								Or zero if the segment is a wall. [opt] [(parentRef) * @p segmentCount]
    ///  @param[out]	segmentCount	The number of segments returned.
    ///  @param[in]		maxSegments		The maximum number of segments the result arrays can hold.
    /// @returns The status flags for the query.
    getPolyWallSegments :: (this: *dtNavMeshQuery, ref: dtPolyRef, filter: *dtQueryFilter, segmentVerts: *float, segmentRefs: *dtPolyRef, segmentCount: *s32, maxSegments: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?getPolyWallSegments@dtNavMeshQuery@@QEBAIIPEBVdtQueryFilter@@PEAMPEAIPEAHH@Z";

    /// Returns random location on navmesh.
    /// Polygons are chosen weighted by area. The search runs in linear related to number of polygon.
    ///  @param[in]		filter			The polygon filter to apply to the query.
    ///  @param[in]		frand			Function returning a random number [0..1).
    ///  @param[out]	randomRef		The reference id of the random location.
    ///  @param[out]	randomPt		The random location.
    /// @returns The status flags for the query.
    findRandomPoint :: (this: *dtNavMeshQuery, filter: *dtQueryFilter, frand: #type () -> float #c_call, randomRef: *dtPolyRef, randomPt: *float) -> dtStatus #cpp_method #foreign lib/windows/detour "?findRandomPoint@dtNavMeshQuery@@QEBAIPEBVdtQueryFilter@@P6AMXZPEAIPEAM@Z";

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
    findRandomPointAroundCircle :: (this: *dtNavMeshQuery, startRef: dtPolyRef, centerPos: *float, maxRadius: float, filter: *dtQueryFilter, frand: #type () -> float #c_call, randomRef: *dtPolyRef, randomPt: *float) -> dtStatus #cpp_method #foreign lib/windows/detour "?findRandomPointAroundCircle@dtNavMeshQuery@@QEBAIIPEBMMPEBVdtQueryFilter@@P6AMXZPEAIPEAM@Z";

    /// Finds the closest point on the specified polygon.
    ///  @param[in]		ref			The reference id of the polygon.
    ///  @param[in]		pos			The position to check. [(x, y, z)]
    ///  @param[out]	closest		The closest point on the polygon. [(x, y, z)]
    ///  @param[out]	posOverPoly	True of the position is over the polygon.
    /// @returns The status flags for the query.
    closestPointOnPoly :: (this: *dtNavMeshQuery, ref: dtPolyRef, pos: *float, closest: *float, posOverPoly: *bool) -> dtStatus #cpp_method #foreign lib/windows/detour "?closestPointOnPoly@dtNavMeshQuery@@QEBAIIPEBMPEAMPEA_N@Z";

    /// Returns a point on the boundary closest to the source point if the source point is outside the
    /// polygon's xz-bounds.
    ///  @param[in]		ref			The reference id to the polygon.
    ///  @param[in]		pos			The position to check. [(x, y, z)]
    ///  @param[out]	closest		The closest point. [(x, y, z)]
    /// @returns The status flags for the query.
    closestPointOnPolyBoundary :: (this: *dtNavMeshQuery, ref: dtPolyRef, pos: *float, closest: *float) -> dtStatus #cpp_method #foreign lib/windows/detour "?closestPointOnPolyBoundary@dtNavMeshQuery@@QEBAIIPEBMPEAM@Z";

    /// Gets the height of the polygon at the provided position using the height detail. (Most accurate.)
    ///  @param[in]		ref			The reference id of the polygon.
    ///  @param[in]		pos			A position within the xz-bounds of the polygon. [(x, y, z)]
    ///  @param[out]	height		The height at the surface of the polygon.
    /// @returns The status flags for the query.
    getPolyHeight :: (this: *dtNavMeshQuery, ref: dtPolyRef, pos: *float, height: *float) -> dtStatus #cpp_method #foreign lib/windows/detour "?getPolyHeight@dtNavMeshQuery@@QEBAIIPEBMPEAM@Z";

    /// Returns true if the polygon reference is valid and passes the filter restrictions.
    ///  @param[in]		ref			The polygon reference to check.
    ///  @param[in]		filter		The filter to apply.
    isValidPolyRef :: (this: *dtNavMeshQuery, ref: dtPolyRef, filter: *dtQueryFilter) -> bool #cpp_method #foreign lib/windows/detour "?isValidPolyRef@dtNavMeshQuery@@QEBA_NIPEBVdtQueryFilter@@@Z";

    /// Returns true if the polygon reference is in the closed list.
    ///  @param[in]		ref		The reference id of the polygon to check.
    /// @returns True if the polygon is in closed list.
    isInClosedList :: (this: *dtNavMeshQuery, ref: dtPolyRef) -> bool #cpp_method #foreign lib/windows/detour "?isInClosedList@dtNavMeshQuery@@QEBA_NI@Z";

    /// Gets the node pool.
    /// @returns The node pool.
    getNodePool :: (this: *dtNavMeshQuery) -> *dtNodePool #cpp_method #foreign lib/windows/detour "?getNodePool@dtNavMeshQuery@@QEBAPEAVdtNodePool@@XZ";

    /// Gets the navigation mesh the query object is using.
    /// @return The navigation mesh the query object is using.
    getAttachedNavMesh :: (this: *dtNavMeshQuery) -> *dtNavMesh #cpp_method #foreign lib/windows/detour "?getAttachedNavMesh@dtNavMeshQuery@@QEBAPEBVdtNavMesh@@XZ";

    /// Queries polygons within a tile.
    queryPolygonsInTile :: (this: *dtNavMeshQuery, tile: *dtMeshTile, qmin: *float, qmax: *float, filter: *dtQueryFilter, query: *dtPolyQuery) -> void #cpp_method #foreign lib/windows/detour "?queryPolygonsInTile@dtNavMeshQuery@@AEBAXPEBUdtMeshTile@@PEBM1PEBVdtQueryFilter@@PEAVdtPolyQuery@@@Z";

    /// Returns portal points between two polygons.
    getPortalPoints :: (this: *dtNavMeshQuery, from: dtPolyRef, to: dtPolyRef, left: *float, right: *float, fromType: *u8, toType: *u8) -> dtStatus #cpp_method #foreign lib/windows/detour "?getPortalPoints@dtNavMeshQuery@@AEBAIIIPEAM0AEAE1@Z";

    getPortalPoints :: (this: *dtNavMeshQuery, from: dtPolyRef, fromPoly: *dtPoly, fromTile: *dtMeshTile, to: dtPolyRef, toPoly: *dtPoly, toTile: *dtMeshTile, left: *float, right: *float) -> dtStatus #cpp_method #foreign lib/windows/detour "?getPortalPoints@dtNavMeshQuery@@AEBAIIPEBUdtPoly@@PEBUdtMeshTile@@I01PEAM2@Z";

    /// Returns edge mid point between two polygons.
    getEdgeMidPoint :: (this: *dtNavMeshQuery, from: dtPolyRef, to: dtPolyRef, mid: *float) -> dtStatus #cpp_method #foreign lib/windows/detour "?getEdgeMidPoint@dtNavMeshQuery@@AEBAIIIPEAM@Z";
    getEdgeMidPoint :: (this: *dtNavMeshQuery, from: dtPolyRef, fromPoly: *dtPoly, fromTile: *dtMeshTile, to: dtPolyRef, toPoly: *dtPoly, toTile: *dtMeshTile, mid: *float) -> dtStatus #cpp_method #foreign lib/windows/detour "?getEdgeMidPoint@dtNavMeshQuery@@AEBAIIPEBUdtPoly@@PEBUdtMeshTile@@I01PEAM@Z";

    // Appends vertex to a straight path
    appendVertex :: (this: *dtNavMeshQuery, pos: *float, flags: u8, ref: dtPolyRef, straightPath: *float, straightPathFlags: *u8, straightPathRefs: *dtPolyRef, straightPathCount: *s32, maxStraightPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?appendVertex@dtNavMeshQuery@@AEBAIPEBMEIPEAMPEAEPEAIPEAHH@Z";

    // Appends intermediate portal points to a straight path.
    appendPortals :: (this: *dtNavMeshQuery, startIdx: s32, endIdx: s32, endPos: *float, path: *dtPolyRef, straightPath: *float, straightPathFlags: *u8, straightPathRefs: *dtPolyRef, straightPathCount: *s32, maxStraightPath: s32, options: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?appendPortals@dtNavMeshQuery@@AEBAIHHPEBMPEBIPEAMPEAEPEAIPEAHHH@Z";

    // Gets the path leading to the specified end node.
    getPathToNode :: (this: *dtNavMeshQuery, endNode: *dtNode, path: *dtPolyRef, pathCount: *s32, maxPath: s32) -> dtStatus #cpp_method #foreign lib/windows/detour "?getPathToNode@dtNavMeshQuery@@AEBAIPEAUdtNode@@PEAIPEAHH@Z";

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
    m_openList:     *dtNodeQueue; ///< Pointer to open list queue.
}

/// Allocates a query object using the Detour allocator.
/// @return An allocated query object, or null on failure.
/// @ingroup detour
dtAllocNavMeshQuery :: () -> *dtNavMeshQuery #foreign lib/windows/detour "?dtAllocNavMeshQuery@@YAPEAVdtNavMeshQuery@@XZ";

/// Frees the specified query object using the Detour allocator.
///  @param[in]		query		A query object allocated using #dtAllocNavMeshQuery
/// @ingroup detour
dtFreeNavMeshQuery :: (query: *dtNavMeshQuery) -> void #foreign lib/windows/detour "?dtFreeNavMeshQuery@@YAXPEAVdtNavMeshQuery@@@Z";

dtNodeFlags :: enum s32 {
    OPEN            :: 1;
    CLOSED          :: 2;
    PARENT_DETACHED :: 4;

    DT_NODE_OPEN            :: OPEN;
    DT_NODE_CLOSED          :: CLOSED;
    DT_NODE_PARENT_DETACHED :: PARENT_DETACHED;
}

dtNodeIndex :: u16;
DT_NULL_IDX: dtNodeIndex : ~0;

DT_NODE_PARENT_BITS: s32 : 24;
DT_NODE_STATE_BITS: s32 : 2;
dtNode :: struct {
    pos:   [3] float; ///< Position of the node.
    cost:  float; ///< Cost from previous node to current node.
    total: float; ///< Cost up to the node.
    pidx:  u32; ///< Index to parent node.
    #place pidx; /*bitfield 24*/ state: u32; ///< extra state information. A polyRef can have multiple nodes with different extra info. see DT_MAX_STATES_PER_NODE
    #place pidx; /*bitfield 26*/ flags: u32; ///< Node flags. A combination of dtNodeFlags.
    id:    dtPolyRef; ///< Polygon ref the node corresponds to.
}

DT_MAX_STATES_PER_NODE: s32 : 1 << DT_NODE_STATE_BITS; // number of extra states per node. See dtNode::state

dtNodePool :: struct {
    Constructor :: (this: *dtNodePool, maxNodes: s32, hashSize: s32) -> void #cpp_method #foreign lib/windows/detour "??0dtNodePool@@QEAA@HH@Z";
    Destructor :: (this: *dtNodePool) -> void #cpp_method #foreign lib/windows/detour "??1dtNodePool@@QEAA@XZ";
    clear :: (this: *dtNodePool) -> void #cpp_method #foreign lib/windows/detour "?clear@dtNodePool@@QEAAXXZ";

    // Get a dtNode by ref and extra state information. If there is none then - allocate
    // There can be more than one node for the same polyRef but with different extra state information
    getNode :: (this: *dtNodePool, id: dtPolyRef, state: u8 = 0) -> *dtNode #cpp_method #foreign lib/windows/detour "?getNode@dtNodePool@@QEAAPEAUdtNode@@IE@Z";
    findNode :: (this: *dtNodePool, id: dtPolyRef, state: u8) -> *dtNode #cpp_method #foreign lib/windows/detour "?findNode@dtNodePool@@QEAAPEAUdtNode@@IE@Z";
    findNodes :: (this: *dtNodePool, id: dtPolyRef, nodes: **dtNode, maxNodes: s32) -> u32 #cpp_method #foreign lib/windows/detour "?findNodes@dtNodePool@@QEAAIIPEAPEAUdtNode@@H@Z";

    getNodeIdx :: (this: *dtNodePool, node: *dtNode) -> u32 #cpp_method #foreign lib/windows/detour "?getNodeIdx@dtNodePool@@QEBAIPEBUdtNode@@@Z";

    getNodeAtIdx :: (this: *dtNodePool, idx: u32) -> *dtNode #cpp_method #foreign lib/windows/detour "?getNodeAtIdx@dtNodePool@@QEAAPEAUdtNode@@I@Z";

    getNodeAtIdx_1 :: (this: /*const*/ *dtNodePool, idx: u32) -> *dtNode #cpp_method #foreign lib/windows/detour "?getNodeAtIdx@dtNodePool@@QEBAPEBUdtNode@@I@Z";

    getMemUsed :: (this: *dtNodePool) -> s32 #cpp_method #foreign lib/windows/detour "?getMemUsed@dtNodePool@@QEBAHXZ";

    getMaxNodes :: (this: *dtNodePool) -> s32 #cpp_method #foreign lib/windows/detour "?getMaxNodes@dtNodePool@@QEBAHXZ";

    getHashSize :: (this: *dtNodePool) -> s32 #cpp_method #foreign lib/windows/detour "?getHashSize@dtNodePool@@QEBAHXZ";
    getFirst :: (this: *dtNodePool, bucket: s32) -> dtNodeIndex #cpp_method #foreign lib/windows/detour "?getFirst@dtNodePool@@QEBAGH@Z";
    getNext :: (this: *dtNodePool, i: s32) -> dtNodeIndex #cpp_method #foreign lib/windows/detour "?getNext@dtNodePool@@QEBAGH@Z";
    getNodeCount :: (this: *dtNodePool) -> s32 #cpp_method #foreign lib/windows/detour "?getNodeCount@dtNodePool@@QEBAHXZ";

    m_nodes:     *dtNode;
    m_first:     *dtNodeIndex;
    m_next:      *dtNodeIndex;
    m_maxNodes:  s32;
    m_hashSize:  s32;
    m_nodeCount: s32;
}

dtNodeQueue :: struct {
    Constructor :: (this: *dtNodeQueue, n: s32) -> void #cpp_method #foreign lib/windows/detour "??0dtNodeQueue@@QEAA@H@Z";
    Destructor :: (this: *dtNodeQueue) -> void #cpp_method #foreign lib/windows/detour "??1dtNodeQueue@@QEAA@XZ";

    clear :: (this: *dtNodeQueue) -> void #cpp_method #foreign lib/windows/detour "?clear@dtNodeQueue@@QEAAXXZ";

    top :: (this: *dtNodeQueue) -> *dtNode #cpp_method #foreign lib/windows/detour "?top@dtNodeQueue@@QEAAPEAUdtNode@@XZ";

    pop :: (this: *dtNodeQueue) -> *dtNode #cpp_method #foreign lib/windows/detour "?pop@dtNodeQueue@@QEAAPEAUdtNode@@XZ";

    push :: (this: *dtNodeQueue, node: *dtNode) -> void #cpp_method #foreign lib/windows/detour "?push@dtNodeQueue@@QEAAXPEAUdtNode@@@Z";

    modify :: (this: *dtNodeQueue, node: *dtNode) -> void #cpp_method #foreign lib/windows/detour "?modify@dtNodeQueue@@QEAAXPEAUdtNode@@@Z";

    empty :: (this: *dtNodeQueue) -> bool #cpp_method #foreign lib/windows/detour "?empty@dtNodeQueue@@QEBA_NXZ";

    getMemUsed :: (this: *dtNodeQueue) -> s32 #cpp_method #foreign lib/windows/detour "?getMemUsed@dtNodeQueue@@QEBAHXZ";

    getCapacity :: (this: *dtNodeQueue) -> s32 #cpp_method #foreign lib/windows/detour "?getCapacity@dtNodeQueue@@QEBAHXZ";

    bubbleUp :: (this: *dtNodeQueue, i: s32, node: *dtNode) -> void #cpp_method #foreign lib/windows/detour "?bubbleUp@dtNodeQueue@@AEAAXHPEAUdtNode@@@Z";
    trickleDown :: (this: *dtNodeQueue, i: s32, node: *dtNode) -> void #cpp_method #foreign lib/windows/detour "?trickleDown@dtNodeQueue@@AEAAXHPEAUdtNode@@@Z";

    m_heap:     **dtNode;
    m_capacity: s32;
    m_size:     s32;
}

#scope_file

#import "Basic"; // For assert

lib/windows/detour :: #library "./lib/windows/Detour";

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
        instance: dtNavMeshCreateParams;
        assert(((cast(*void)(*instance.verts)) - cast(*void)(*instance)) == 0, "dtNavMeshCreateParams.verts has unexpected offset % instead of 0", ((cast(*void)(*instance.verts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.verts)) == 8, "dtNavMeshCreateParams.verts has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.verts)));
        assert(((cast(*void)(*instance.vertCount)) - cast(*void)(*instance)) == 8, "dtNavMeshCreateParams.vertCount has unexpected offset % instead of 8", ((cast(*void)(*instance.vertCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.vertCount)) == 4, "dtNavMeshCreateParams.vertCount has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.vertCount)));
        assert(((cast(*void)(*instance.polys)) - cast(*void)(*instance)) == 16, "dtNavMeshCreateParams.polys has unexpected offset % instead of 16", ((cast(*void)(*instance.polys)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.polys)) == 8, "dtNavMeshCreateParams.polys has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.polys)));
        assert(((cast(*void)(*instance.polyFlags)) - cast(*void)(*instance)) == 24, "dtNavMeshCreateParams.polyFlags has unexpected offset % instead of 24", ((cast(*void)(*instance.polyFlags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.polyFlags)) == 8, "dtNavMeshCreateParams.polyFlags has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.polyFlags)));
        assert(((cast(*void)(*instance.polyAreas)) - cast(*void)(*instance)) == 32, "dtNavMeshCreateParams.polyAreas has unexpected offset % instead of 32", ((cast(*void)(*instance.polyAreas)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.polyAreas)) == 8, "dtNavMeshCreateParams.polyAreas has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.polyAreas)));
        assert(((cast(*void)(*instance.polyCount)) - cast(*void)(*instance)) == 40, "dtNavMeshCreateParams.polyCount has unexpected offset % instead of 40", ((cast(*void)(*instance.polyCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.polyCount)) == 4, "dtNavMeshCreateParams.polyCount has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.polyCount)));
        assert(((cast(*void)(*instance.nvp)) - cast(*void)(*instance)) == 44, "dtNavMeshCreateParams.nvp has unexpected offset % instead of 44", ((cast(*void)(*instance.nvp)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.nvp)) == 4, "dtNavMeshCreateParams.nvp has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.nvp)));
        assert(((cast(*void)(*instance.detailMeshes)) - cast(*void)(*instance)) == 48, "dtNavMeshCreateParams.detailMeshes has unexpected offset % instead of 48", ((cast(*void)(*instance.detailMeshes)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.detailMeshes)) == 8, "dtNavMeshCreateParams.detailMeshes has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.detailMeshes)));
        assert(((cast(*void)(*instance.detailVerts)) - cast(*void)(*instance)) == 56, "dtNavMeshCreateParams.detailVerts has unexpected offset % instead of 56", ((cast(*void)(*instance.detailVerts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.detailVerts)) == 8, "dtNavMeshCreateParams.detailVerts has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.detailVerts)));
        assert(((cast(*void)(*instance.detailVertsCount)) - cast(*void)(*instance)) == 64, "dtNavMeshCreateParams.detailVertsCount has unexpected offset % instead of 64", ((cast(*void)(*instance.detailVertsCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.detailVertsCount)) == 4, "dtNavMeshCreateParams.detailVertsCount has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.detailVertsCount)));
        assert(((cast(*void)(*instance.detailTris)) - cast(*void)(*instance)) == 72, "dtNavMeshCreateParams.detailTris has unexpected offset % instead of 72", ((cast(*void)(*instance.detailTris)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.detailTris)) == 8, "dtNavMeshCreateParams.detailTris has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.detailTris)));
        assert(((cast(*void)(*instance.detailTriCount)) - cast(*void)(*instance)) == 80, "dtNavMeshCreateParams.detailTriCount has unexpected offset % instead of 80", ((cast(*void)(*instance.detailTriCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.detailTriCount)) == 4, "dtNavMeshCreateParams.detailTriCount has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.detailTriCount)));
        assert(((cast(*void)(*instance.offMeshConVerts)) - cast(*void)(*instance)) == 88, "dtNavMeshCreateParams.offMeshConVerts has unexpected offset % instead of 88", ((cast(*void)(*instance.offMeshConVerts)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.offMeshConVerts)) == 8, "dtNavMeshCreateParams.offMeshConVerts has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.offMeshConVerts)));
        assert(((cast(*void)(*instance.offMeshConRad)) - cast(*void)(*instance)) == 96, "dtNavMeshCreateParams.offMeshConRad has unexpected offset % instead of 96", ((cast(*void)(*instance.offMeshConRad)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.offMeshConRad)) == 8, "dtNavMeshCreateParams.offMeshConRad has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.offMeshConRad)));
        assert(((cast(*void)(*instance.offMeshConFlags)) - cast(*void)(*instance)) == 104, "dtNavMeshCreateParams.offMeshConFlags has unexpected offset % instead of 104", ((cast(*void)(*instance.offMeshConFlags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.offMeshConFlags)) == 8, "dtNavMeshCreateParams.offMeshConFlags has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.offMeshConFlags)));
        assert(((cast(*void)(*instance.offMeshConAreas)) - cast(*void)(*instance)) == 112, "dtNavMeshCreateParams.offMeshConAreas has unexpected offset % instead of 112", ((cast(*void)(*instance.offMeshConAreas)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.offMeshConAreas)) == 8, "dtNavMeshCreateParams.offMeshConAreas has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.offMeshConAreas)));
        assert(((cast(*void)(*instance.offMeshConDir)) - cast(*void)(*instance)) == 120, "dtNavMeshCreateParams.offMeshConDir has unexpected offset % instead of 120", ((cast(*void)(*instance.offMeshConDir)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.offMeshConDir)) == 8, "dtNavMeshCreateParams.offMeshConDir has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.offMeshConDir)));
        assert(((cast(*void)(*instance.offMeshConUserID)) - cast(*void)(*instance)) == 128, "dtNavMeshCreateParams.offMeshConUserID has unexpected offset % instead of 128", ((cast(*void)(*instance.offMeshConUserID)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.offMeshConUserID)) == 8, "dtNavMeshCreateParams.offMeshConUserID has unexpected size % instead of 8", size_of(type_of(dtNavMeshCreateParams.offMeshConUserID)));
        assert(((cast(*void)(*instance.offMeshConCount)) - cast(*void)(*instance)) == 136, "dtNavMeshCreateParams.offMeshConCount has unexpected offset % instead of 136", ((cast(*void)(*instance.offMeshConCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.offMeshConCount)) == 4, "dtNavMeshCreateParams.offMeshConCount has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.offMeshConCount)));
        assert(((cast(*void)(*instance.userId)) - cast(*void)(*instance)) == 140, "dtNavMeshCreateParams.userId has unexpected offset % instead of 140", ((cast(*void)(*instance.userId)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.userId)) == 4, "dtNavMeshCreateParams.userId has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.userId)));
        assert(((cast(*void)(*instance.tileX)) - cast(*void)(*instance)) == 144, "dtNavMeshCreateParams.tileX has unexpected offset % instead of 144", ((cast(*void)(*instance.tileX)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.tileX)) == 4, "dtNavMeshCreateParams.tileX has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.tileX)));
        assert(((cast(*void)(*instance.tileY)) - cast(*void)(*instance)) == 148, "dtNavMeshCreateParams.tileY has unexpected offset % instead of 148", ((cast(*void)(*instance.tileY)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.tileY)) == 4, "dtNavMeshCreateParams.tileY has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.tileY)));
        assert(((cast(*void)(*instance.tileLayer)) - cast(*void)(*instance)) == 152, "dtNavMeshCreateParams.tileLayer has unexpected offset % instead of 152", ((cast(*void)(*instance.tileLayer)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.tileLayer)) == 4, "dtNavMeshCreateParams.tileLayer has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.tileLayer)));
        assert(((cast(*void)(*instance.bmin)) - cast(*void)(*instance)) == 156, "dtNavMeshCreateParams.bmin has unexpected offset % instead of 156", ((cast(*void)(*instance.bmin)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.bmin)) == 12, "dtNavMeshCreateParams.bmin has unexpected size % instead of 12", size_of(type_of(dtNavMeshCreateParams.bmin)));
        assert(((cast(*void)(*instance.bmax)) - cast(*void)(*instance)) == 168, "dtNavMeshCreateParams.bmax has unexpected offset % instead of 168", ((cast(*void)(*instance.bmax)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.bmax)) == 12, "dtNavMeshCreateParams.bmax has unexpected size % instead of 12", size_of(type_of(dtNavMeshCreateParams.bmax)));
        assert(((cast(*void)(*instance.walkableHeight)) - cast(*void)(*instance)) == 180, "dtNavMeshCreateParams.walkableHeight has unexpected offset % instead of 180", ((cast(*void)(*instance.walkableHeight)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.walkableHeight)) == 4, "dtNavMeshCreateParams.walkableHeight has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.walkableHeight)));
        assert(((cast(*void)(*instance.walkableRadius)) - cast(*void)(*instance)) == 184, "dtNavMeshCreateParams.walkableRadius has unexpected offset % instead of 184", ((cast(*void)(*instance.walkableRadius)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.walkableRadius)) == 4, "dtNavMeshCreateParams.walkableRadius has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.walkableRadius)));
        assert(((cast(*void)(*instance.walkableClimb)) - cast(*void)(*instance)) == 188, "dtNavMeshCreateParams.walkableClimb has unexpected offset % instead of 188", ((cast(*void)(*instance.walkableClimb)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.walkableClimb)) == 4, "dtNavMeshCreateParams.walkableClimb has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.walkableClimb)));
        assert(((cast(*void)(*instance.cs)) - cast(*void)(*instance)) == 192, "dtNavMeshCreateParams.cs has unexpected offset % instead of 192", ((cast(*void)(*instance.cs)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.cs)) == 4, "dtNavMeshCreateParams.cs has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.cs)));
        assert(((cast(*void)(*instance.ch)) - cast(*void)(*instance)) == 196, "dtNavMeshCreateParams.ch has unexpected offset % instead of 196", ((cast(*void)(*instance.ch)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.ch)) == 4, "dtNavMeshCreateParams.ch has unexpected size % instead of 4", size_of(type_of(dtNavMeshCreateParams.ch)));
        assert(((cast(*void)(*instance.buildBvTree)) - cast(*void)(*instance)) == 200, "dtNavMeshCreateParams.buildBvTree has unexpected offset % instead of 200", ((cast(*void)(*instance.buildBvTree)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNavMeshCreateParams.buildBvTree)) == 1, "dtNavMeshCreateParams.buildBvTree has unexpected size % instead of 1", size_of(type_of(dtNavMeshCreateParams.buildBvTree)));
        assert(size_of(dtNavMeshCreateParams) == 208, "dtNavMeshCreateParams has size % instead of 208", size_of(dtNavMeshCreateParams));
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
        instance: dtNode;
        assert(((cast(*void)(*instance.pos)) - cast(*void)(*instance)) == 0, "dtNode.pos has unexpected offset % instead of 0", ((cast(*void)(*instance.pos)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNode.pos)) == 12, "dtNode.pos has unexpected size % instead of 12", size_of(type_of(dtNode.pos)));
        assert(((cast(*void)(*instance.cost)) - cast(*void)(*instance)) == 12, "dtNode.cost has unexpected offset % instead of 12", ((cast(*void)(*instance.cost)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNode.cost)) == 4, "dtNode.cost has unexpected size % instead of 4", size_of(type_of(dtNode.cost)));
        assert(((cast(*void)(*instance.total)) - cast(*void)(*instance)) == 16, "dtNode.total has unexpected offset % instead of 16", ((cast(*void)(*instance.total)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNode.total)) == 4, "dtNode.total has unexpected size % instead of 4", size_of(type_of(dtNode.total)));
        // Bitfields are currently not correctly aligned
        // assert(((cast(*void)(*instance.pidx)) - cast(*void)(*instance)) == 20, "dtNode.pidx has unexpected offset % instead of 20", ((cast(*void)(*instance.pidx)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNode.pidx)) == 4, "dtNode.pidx has unexpected size % instead of 4", size_of(type_of(dtNode.pidx)));
        // Bitfields are currently not correctly aligned
        // assert(((cast(*void)(*instance.state)) - cast(*void)(*instance)) == 23, "dtNode.state has unexpected offset % instead of 23", ((cast(*void)(*instance.state)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNode.state)) == 4, "dtNode.state has unexpected size % instead of 4", size_of(type_of(dtNode.state)));
        // Bitfields are currently not correctly aligned
        // assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 23, "dtNode.flags has unexpected offset % instead of 23", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNode.flags)) == 4, "dtNode.flags has unexpected size % instead of 4", size_of(type_of(dtNode.flags)));
        assert(((cast(*void)(*instance.id)) - cast(*void)(*instance)) == 24, "dtNode.id has unexpected offset % instead of 24", ((cast(*void)(*instance.id)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNode.id)) == 4, "dtNode.id has unexpected size % instead of 4", size_of(type_of(dtNode.id)));
        assert(size_of(dtNode) == 28, "dtNode has size % instead of 28", size_of(dtNode));
    }

    {
        instance: dtNodePool;
        assert(((cast(*void)(*instance.m_nodes)) - cast(*void)(*instance)) == 0, "dtNodePool.m_nodes has unexpected offset % instead of 0", ((cast(*void)(*instance.m_nodes)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNodePool.m_nodes)) == 8, "dtNodePool.m_nodes has unexpected size % instead of 8", size_of(type_of(dtNodePool.m_nodes)));
        assert(((cast(*void)(*instance.m_first)) - cast(*void)(*instance)) == 8, "dtNodePool.m_first has unexpected offset % instead of 8", ((cast(*void)(*instance.m_first)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNodePool.m_first)) == 8, "dtNodePool.m_first has unexpected size % instead of 8", size_of(type_of(dtNodePool.m_first)));
        assert(((cast(*void)(*instance.m_next)) - cast(*void)(*instance)) == 16, "dtNodePool.m_next has unexpected offset % instead of 16", ((cast(*void)(*instance.m_next)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNodePool.m_next)) == 8, "dtNodePool.m_next has unexpected size % instead of 8", size_of(type_of(dtNodePool.m_next)));
        assert(((cast(*void)(*instance.m_maxNodes)) - cast(*void)(*instance)) == 24, "dtNodePool.m_maxNodes has unexpected offset % instead of 24", ((cast(*void)(*instance.m_maxNodes)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNodePool.m_maxNodes)) == 4, "dtNodePool.m_maxNodes has unexpected size % instead of 4", size_of(type_of(dtNodePool.m_maxNodes)));
        assert(((cast(*void)(*instance.m_hashSize)) - cast(*void)(*instance)) == 28, "dtNodePool.m_hashSize has unexpected offset % instead of 28", ((cast(*void)(*instance.m_hashSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNodePool.m_hashSize)) == 4, "dtNodePool.m_hashSize has unexpected size % instead of 4", size_of(type_of(dtNodePool.m_hashSize)));
        assert(((cast(*void)(*instance.m_nodeCount)) - cast(*void)(*instance)) == 32, "dtNodePool.m_nodeCount has unexpected offset % instead of 32", ((cast(*void)(*instance.m_nodeCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNodePool.m_nodeCount)) == 4, "dtNodePool.m_nodeCount has unexpected size % instead of 4", size_of(type_of(dtNodePool.m_nodeCount)));
        assert(size_of(dtNodePool) == 40, "dtNodePool has size % instead of 40", size_of(dtNodePool));
    }

    {
        instance: dtNodeQueue;
        assert(((cast(*void)(*instance.m_heap)) - cast(*void)(*instance)) == 0, "dtNodeQueue.m_heap has unexpected offset % instead of 0", ((cast(*void)(*instance.m_heap)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNodeQueue.m_heap)) == 8, "dtNodeQueue.m_heap has unexpected size % instead of 8", size_of(type_of(dtNodeQueue.m_heap)));
        assert(((cast(*void)(*instance.m_capacity)) - cast(*void)(*instance)) == 8, "dtNodeQueue.m_capacity has unexpected offset % instead of 8", ((cast(*void)(*instance.m_capacity)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNodeQueue.m_capacity)) == 4, "dtNodeQueue.m_capacity has unexpected size % instead of 4", size_of(type_of(dtNodeQueue.m_capacity)));
        assert(((cast(*void)(*instance.m_size)) - cast(*void)(*instance)) == 12, "dtNodeQueue.m_size has unexpected offset % instead of 12", ((cast(*void)(*instance.m_size)) - cast(*void)(*instance)));
        assert(size_of(type_of(dtNodeQueue.m_size)) == 4, "dtNodeQueue.m_size has unexpected size % instead of 4", size_of(type_of(dtNodeQueue.m_size)));
        assert(size_of(dtNodeQueue) == 16, "dtNodeQueue has size % instead of 16", size_of(dtNodeQueue));
    }
}

