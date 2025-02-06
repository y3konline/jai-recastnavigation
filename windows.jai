//
// This file was auto-generated using the following command:
//
// jai ./generate.jai - -compile
//



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
    Constructor :: (this: *rcContext, state := true) -> void #cpp_method #foreign debugutils "??0rcContext@@QEAA@_N@Z";

    /// Enables or disables logging.
    ///  @param[in]		state	TRUE if logging should be enabled.
    enableLog :: (this: *rcContext, state: bool) -> void #cpp_method #foreign debugutils "?enableLog@rcContext@@QEAAX_N@Z";

    /// Clears all log entries.
    resetLog :: (this: *rcContext) -> void #cpp_method #foreign debugutils "?resetLog@rcContext@@QEAAXXZ";

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
    log_CFormat :: (this: *rcContext, category: rcLogCategory, format: *u8, __args: ..Any) -> void #cpp_method #foreign debugutils "?log@rcContext@@QEAAXW4rcLogCategory@@PEBDZZ";
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
    enableTimer :: (this: *rcContext, state: bool) -> void #cpp_method #foreign debugutils "?enableTimer@rcContext@@QEAAX_N@Z";

    /// Clears all performance timers. (Resets all to unused.)
    resetTimers :: (this: *rcContext) -> void #cpp_method #foreign debugutils "?resetTimers@rcContext@@QEAAXXZ";

    /// Starts the specified performance timer.
    /// @param	label	The category of the timer.
    startTimer :: (this: *rcContext, label: rcTimerLabel) -> void #cpp_method #foreign debugutils "?startTimer@rcContext@@QEAAXW4rcTimerLabel@@@Z";

    /// Stops the specified performance timer.
    /// @param	label	The category of the timer.
    stopTimer :: (this: *rcContext, label: rcTimerLabel) -> void #cpp_method #foreign debugutils "?stopTimer@rcContext@@QEAAXW4rcTimerLabel@@@Z";

    /// Returns the total accumulated time of the specified performance timer.
    /// @param	label	The category of the timer.
    /// @return The accumulated time of the timer, or -1 if timers are disabled or the timer has never been started.
    getAccumulatedTime :: (this: *rcContext, label: rcTimerLabel) -> s32 #cpp_method #foreign debugutils "?getAccumulatedTime@rcContext@@QEBAHW4rcTimerLabel@@@Z";

    /// True if logging is enabled.
    m_logEnabled:   bool;

    /// True if the performance timers are enabled.
    m_timerEnabled: bool;

    // Virtual functions:
    // Normally you should call them via the vtable.
    // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
    // or need to create a vtable yourself.

    virtual_Destructor :: (this: *rcContext, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign debugutils "??1rcContext@@UEAA@XZ";

    /// Clears all log entries.
    virtual_doResetLog :: (this: *rcContext) -> void #cpp_method #foreign debugutils "?doResetLog@rcContext@@MEAAXXZ";

    /// Logs a message.
    /// @param[in]		category	The category of the message.
    /// @param[in]		msg			The formatted message.
    /// @param[in]		len			The length of the formatted message.
    virtual_doLog :: (this: *rcContext, category: rcLogCategory, msg: *u8, len: s32) -> void #cpp_method #foreign debugutils "?doLog@rcContext@@MEAAXW4rcLogCategory@@PEBDH@Z";

    /// Clears all timers. (Resets all to unused.)
    virtual_doResetTimers :: (this: *rcContext) -> void #cpp_method #foreign debugutils "?doResetTimers@rcContext@@MEAAXXZ";

    /// Starts the specified performance timer.
    /// @param[in]		label	The category of timer.
    virtual_doStartTimer :: (this: *rcContext, label: rcTimerLabel) -> void #cpp_method #foreign debugutils "?doStartTimer@rcContext@@MEAAXW4rcTimerLabel@@@Z";

    /// Stops the specified performance timer.
    /// @param[in]		label	The category of the timer.
    virtual_doStopTimer :: (this: *rcContext, label: rcTimerLabel) -> void #cpp_method #foreign debugutils "?doStopTimer@rcContext@@MEAAXW4rcTimerLabel@@@Z";

    /// Returns the total accumulated time of the specified performance timer.
    /// @param[in]		label	The category of the timer.
    /// @return The accumulated time of the timer, or -1 if timers are disabled or the timer has never been started.
    virtual_doGetAccumulatedTime :: (this: *rcContext, label: rcTimerLabel) -> s32 #cpp_method #foreign debugutils "?doGetAccumulatedTime@rcContext@@MEBAHW4rcTimerLabel@@@Z";
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
    Constructor :: (this: *rcScopedTimer, ctx: *rcContext, label: rcTimerLabel) -> void #cpp_method #foreign debugutils "??0rcScopedTimer@@QEAA@PEAVrcContext@@W4rcTimerLabel@@@Z";
    Destructor :: (this: *rcScopedTimer) -> void #cpp_method #foreign debugutils "??1rcScopedTimer@@QEAA@XZ";

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
rcAllocHeightfield :: () -> *rcHeightfield #foreign debugutils "?rcAllocHeightfield@@YAPEAUrcHeightfield@@XZ";

/// Frees the specified heightfield object using the Recast allocator.
/// @param[in]		heightfield	A heightfield allocated using #rcAllocHeightfield
/// @ingroup recast
/// @see rcAllocHeightfield
rcFreeHeightField :: (heightfield: *rcHeightfield) -> void #foreign debugutils "?rcFreeHeightField@@YAXPEAUrcHeightfield@@@Z";

/// Allocates a compact heightfield object using the Recast allocator.
/// @return A compact heightfield that is ready for initialization, or null on failure.
/// @ingroup recast
/// @see rcBuildCompactHeightfield, rcFreeCompactHeightfield
rcAllocCompactHeightfield :: () -> *rcCompactHeightfield #foreign debugutils "?rcAllocCompactHeightfield@@YAPEAUrcCompactHeightfield@@XZ";

/// Frees the specified compact heightfield object using the Recast allocator.
/// @param[in]		compactHeightfield		A compact heightfield allocated using #rcAllocCompactHeightfield
/// @ingroup recast
/// @see rcAllocCompactHeightfield
rcFreeCompactHeightfield :: (compactHeightfield: *rcCompactHeightfield) -> void #foreign debugutils "?rcFreeCompactHeightfield@@YAXPEAUrcCompactHeightfield@@@Z";

/// Allocates a heightfield layer set using the Recast allocator.
/// @return A heightfield layer set that is ready for initialization, or null on failure.
/// @ingroup recast
/// @see rcBuildHeightfieldLayers, rcFreeHeightfieldLayerSet
rcAllocHeightfieldLayerSet :: () -> *rcHeightfieldLayerSet #foreign debugutils "?rcAllocHeightfieldLayerSet@@YAPEAUrcHeightfieldLayerSet@@XZ";

/// Frees the specified heightfield layer set using the Recast allocator.
/// @param[in]		layerSet	A heightfield layer set allocated using #rcAllocHeightfieldLayerSet
/// @ingroup recast
/// @see rcAllocHeightfieldLayerSet
rcFreeHeightfieldLayerSet :: (layerSet: *rcHeightfieldLayerSet) -> void #foreign debugutils "?rcFreeHeightfieldLayerSet@@YAXPEAUrcHeightfieldLayerSet@@@Z";

/// Allocates a contour set object using the Recast allocator.
/// @return A contour set that is ready for initialization, or null on failure.
/// @ingroup recast
/// @see rcBuildContours, rcFreeContourSet
rcAllocContourSet :: () -> *rcContourSet #foreign debugutils "?rcAllocContourSet@@YAPEAUrcContourSet@@XZ";

/// Frees the specified contour set using the Recast allocator.
/// @param[in]		contourSet	A contour set allocated using #rcAllocContourSet
/// @ingroup recast
/// @see rcAllocContourSet
rcFreeContourSet :: (contourSet: *rcContourSet) -> void #foreign debugutils "?rcFreeContourSet@@YAXPEAUrcContourSet@@@Z";

/// Allocates a polygon mesh object using the Recast allocator.
/// @return A polygon mesh that is ready for initialization, or null on failure.
/// @ingroup recast
/// @see rcBuildPolyMesh, rcFreePolyMesh
rcAllocPolyMesh :: () -> *rcPolyMesh #foreign debugutils "?rcAllocPolyMesh@@YAPEAUrcPolyMesh@@XZ";

/// Frees the specified polygon mesh using the Recast allocator.
/// @param[in]		polyMesh	A polygon mesh allocated using #rcAllocPolyMesh
/// @ingroup recast
/// @see rcAllocPolyMesh
rcFreePolyMesh :: (polyMesh: *rcPolyMesh) -> void #foreign debugutils "?rcFreePolyMesh@@YAXPEAUrcPolyMesh@@@Z";

/// Allocates a detail mesh object using the Recast allocator.
/// @return A detail mesh that is ready for initialization, or null on failure.
/// @ingroup recast
/// @see rcBuildPolyMeshDetail, rcFreePolyMeshDetail
rcAllocPolyMeshDetail :: () -> *rcPolyMeshDetail #foreign debugutils "?rcAllocPolyMeshDetail@@YAPEAUrcPolyMeshDetail@@XZ";

/// Frees the specified detail mesh using the Recast allocator.
/// @param[in]		detailMesh	A detail mesh allocated using #rcAllocPolyMeshDetail
/// @ingroup recast
/// @see rcAllocPolyMeshDetail
rcFreePolyMeshDetail :: (detailMesh: *rcPolyMeshDetail) -> void #foreign debugutils "?rcFreePolyMeshDetail@@YAXPEAUrcPolyMeshDetail@@@Z";

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
rcSqrt :: (x: float) -> float #foreign debugutils "?rcSqrt@@YAMM@Z";

/// Derives the cross product of two vectors. (@p v1 x @p v2)
/// @param[out]		dest	The cross product. [(x, y, z)]
/// @param[in]		v1		A Vector [(x, y, z)]
/// @param[in]		v2		A vector [(x, y, z)]
rcVcross :: (dest: *float, v1: *float, v2: *float) -> void #foreign debugutils "?rcVcross@@YAXPEAMPEBM1@Z";

/// Derives the dot product of two vectors. (@p v1 . @p v2)
/// @param[in]		v1	A Vector [(x, y, z)]
/// @param[in]		v2	A vector [(x, y, z)]
/// @return The dot product.
rcVdot :: (v1: *float, v2: *float) -> float #foreign debugutils "?rcVdot@@YAMPEBM0@Z";

/// Performs a scaled vector addition. (@p v1 + (@p v2 * @p s))
/// @param[out]		dest	The result vector. [(x, y, z)]
/// @param[in]		v1		The base vector. [(x, y, z)]
/// @param[in]		v2		The vector to scale and add to @p v1. [(x, y, z)]
/// @param[in]		s		The amount to scale @p v2 by before adding to @p v1.
rcVmad :: (dest: *float, v1: *float, v2: *float, s: float) -> void #foreign debugutils "?rcVmad@@YAXPEAMPEBM1M@Z";

/// Performs a vector addition. (@p v1 + @p v2)
/// @param[out]		dest	The result vector. [(x, y, z)]
/// @param[in]		v1		The base vector. [(x, y, z)]
/// @param[in]		v2		The vector to add to @p v1. [(x, y, z)]
rcVadd :: (dest: *float, v1: *float, v2: *float) -> void #foreign debugutils "?rcVadd@@YAXPEAMPEBM1@Z";

/// Performs a vector subtraction. (@p v1 - @p v2)
/// @param[out]		dest	The result vector. [(x, y, z)]
/// @param[in]		v1		The base vector. [(x, y, z)]
/// @param[in]		v2		The vector to subtract from @p v1. [(x, y, z)]
rcVsub :: (dest: *float, v1: *float, v2: *float) -> void #foreign debugutils "?rcVsub@@YAXPEAMPEBM1@Z";

/// Selects the minimum value of each element from the specified vectors.
/// @param[in,out]	mn	A vector.  (Will be updated with the result.) [(x, y, z)]
/// @param[in]		v	A vector. [(x, y, z)]
rcVmin :: (mn: *float, v: *float) -> void #foreign debugutils "?rcVmin@@YAXPEAMPEBM@Z";

/// Selects the maximum value of each element from the specified vectors.
/// @param[in,out]	mx	A vector.  (Will be updated with the result.) [(x, y, z)]
/// @param[in]		v	A vector. [(x, y, z)]
rcVmax :: (mx: *float, v: *float) -> void #foreign debugutils "?rcVmax@@YAXPEAMPEBM@Z";

/// Performs a vector copy.
/// @param[out]		dest	The result. [(x, y, z)]
/// @param[in]		v		The vector to copy. [(x, y, z)]
rcVcopy :: (dest: *float, v: *float) -> void #foreign debugutils "?rcVcopy@@YAXPEAMPEBM@Z";

/// Returns the distance between two points.
/// @param[in]		v1	A point. [(x, y, z)]
/// @param[in]		v2	A point. [(x, y, z)]
/// @return The distance between the two points.
rcVdist :: (v1: *float, v2: *float) -> float #foreign debugutils "?rcVdist@@YAMPEBM0@Z";

/// Returns the square of the distance between two points.
/// @param[in]		v1	A point. [(x, y, z)]
/// @param[in]		v2	A point. [(x, y, z)]
/// @return The square of the distance between the two points.
rcVdistSqr :: (v1: *float, v2: *float) -> float #foreign debugutils "?rcVdistSqr@@YAMPEBM0@Z";

/// Normalizes the vector.
/// @param[in,out]	v	The vector to normalize. [(x, y, z)]
rcVnormalize :: (v: *float) -> void #foreign debugutils "?rcVnormalize@@YAXPEAM@Z";

/// Calculates the bounding box of an array of vertices.
/// @ingroup recast
/// @param[in]		verts		An array of vertices. [(x, y, z) * @p nv]
/// @param[in]		numVerts	The number of vertices in the @p verts array.
/// @param[out]		minBounds	The minimum bounds of the AABB. [(x, y, z)] [Units: wu]
/// @param[out]		maxBounds	The maximum bounds of the AABB. [(x, y, z)] [Units: wu]
rcCalcBounds :: (verts: *float, numVerts: s32, minBounds: *float, maxBounds: *float) -> void #foreign debugutils "?rcCalcBounds@@YAXPEBMHPEAM1@Z";

/// Calculates the grid size based on the bounding box and grid cell size.
/// @ingroup recast
/// @param[in]		minBounds	The minimum bounds of the AABB. [(x, y, z)] [Units: wu]
/// @param[in]		maxBounds	The maximum bounds of the AABB. [(x, y, z)] [Units: wu]
/// @param[in]		cellSize	The xz-plane cell size. [Limit: > 0] [Units: wu]
/// @param[out]		sizeX		The width along the x-axis. [Limit: >= 0] [Units: vx]
/// @param[out]		sizeZ		The height along the z-axis. [Limit: >= 0] [Units: vx]
rcCalcGridSize :: (minBounds: *float, maxBounds: *float, cellSize: float, sizeX: *s32, sizeZ: *s32) -> void #foreign debugutils "?rcCalcGridSize@@YAXPEBM0MPEAH1@Z";

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
rcCreateHeightfield :: (_context: *rcContext, heightfield: *rcHeightfield, sizeX: s32, sizeZ: s32, minBounds: *float, maxBounds: *float, cellSize: float, cellHeight: float) -> bool #foreign debugutils "?rcCreateHeightfield@@YA_NPEAVrcContext@@AEAUrcHeightfield@@HHPEBM2MM@Z";

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
rcMarkWalkableTriangles :: (_context: *rcContext, walkableSlopeAngle: float, verts: *float, numVerts: s32, tris: *s32, numTris: s32, triAreaIDs: *u8) -> void #foreign debugutils "?rcMarkWalkableTriangles@@YAXPEAVrcContext@@MPEBMHPEBHHPEAE@Z";

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
rcClearUnwalkableTriangles :: (_context: *rcContext, walkableSlopeAngle: float, verts: *float, numVerts: s32, tris: *s32, numTris: s32, triAreaIDs: *u8) -> void #foreign debugutils "?rcClearUnwalkableTriangles@@YAXPEAVrcContext@@MPEBMHPEBHHPEAE@Z";

/// Returns the number of spans contained in the specified heightfield.
///  @ingroup recast
///  @param[in,out]	context		The build context to use during the operation.
///  @param[in]		heightfield	An initialized heightfield.
///  @returns The number of spans in the heightfield.
rcGetHeightFieldSpanCount :: (_context: *rcContext, heightfield: *rcHeightfield) -> s32 #foreign debugutils "?rcGetHeightFieldSpanCount@@YAHPEAVrcContext@@AEBUrcHeightfield@@@Z";
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
rcBuildCompactHeightfield :: (_context: *rcContext, walkableHeight: s32, walkableClimb: s32, heightfield: *rcHeightfield, compactHeightfield: *rcCompactHeightfield) -> bool #foreign debugutils "?rcBuildCompactHeightfield@@YA_NPEAVrcContext@@HHAEBUrcHeightfield@@AEAUrcCompactHeightfield@@@Z";
rcBuildCompactHeightfield :: (_context: *rcContext, walkableHeight: s32, walkableClimb: s32, heightfield: rcHeightfield, compactHeightfield: *rcCompactHeightfield) -> bool #no_context {
    return rcBuildCompactHeightfield(_context, walkableHeight, walkableClimb, *heightfield, compactHeightfield);
}

#scope_file

#import "Basic"; // For assert, push_context

debugutils :: #library "lib/windows/DebugUtils";

#run {
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
}

