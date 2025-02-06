# Jai Recast Navigation

[Recast Navigation](https://github.com/recastnavigation/recastnavigation) bindings for Jai.

Includes Recast/Detour and all modules:

- Recast
- Detour
- DetourTileCache
- DetourCrowd
- DebugUtils

These bindings stay true to the original C++ library and we aren't yet trying to wrap anything in a "Jai-like" way.

Take care to call Constructors and Destructors on any objects you create.

## Generating / Building

To generate bindings, run generate.jai, optionally adding the -compile flag:

```sh
# Without compiling:
jai generate.jai

# Or, also compile C++ source:
jai generate.jai - -compile
```

**Note:** The source contained here has been modified to add `__declspec(dllexport)` to functions and classes.
If you update the source, you will need to also add these modifiers.
