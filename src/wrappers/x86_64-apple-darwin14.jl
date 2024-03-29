# Autogenerated wrapper script for FFTW_jll for x86_64-apple-darwin14
export libfftw3f, libfftw3

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"

# Relative path to `libfftw3f`
const libfftw3f_splitpath = ["lib", "libfftw3f.3.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libfftw3f_path = ""

# libfftw3f-specific global declaration
# This will be filled out by __init__()
libfftw3f_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libfftw3f = "@rpath/libfftw3f.3.dylib"


# Relative path to `libfftw3`
const libfftw3_splitpath = ["lib", "libfftw3.3.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libfftw3_path = ""

# libfftw3-specific global declaration
# This will be filled out by __init__()
libfftw3_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libfftw3 = "@rpath/libfftw3.3.dylib"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libfftw3f_path = abspath(joinpath(artifact"FFTW", libfftw3f_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libfftw3f_handle = dlopen(libfftw3f_path)
    push!(LIBPATH_list, dirname(libfftw3f_path))

    global libfftw3_path = abspath(joinpath(artifact"FFTW", libfftw3_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libfftw3_handle = dlopen(libfftw3_path)
    push!(LIBPATH_list, dirname(libfftw3_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

