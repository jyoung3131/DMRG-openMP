#Global Settings used to generate this library
set(KOKKOS_PATH /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install CACHE PATH "Kokkos installation path")
set(KOKKOS_DEVICES OpenMP CACHE STRING "Kokkos devices list")
set(KOKKOS_ARCH Power8 CACHE STRING "Kokkos architecture flags")
set(KOKKOS_DEBUG OFF CACHE BOOL "Kokkos debug enabled ?)")
set(KOKKOS_USE_TPLS  CACHE STRING "Kokkos templates list")
set(KOKKOS_CXX_STANDARD c++11 CACHE STRING "Kokkos C++ standard")
set(KOKKOS_OPTIONS compiler_warnings CACHE STRING "Kokkos options")
set(KOKKOS_CUDA_OPTIONS  CACHE STRING "Kokkos Cuda options")
if(NOT NV{CXX})
  message(WARNING "You are currently using compiler ${CMAKE_CXX_COMPILER} while Kokkos was built with g++ ; make sure this is the behavior you intended to be.")
endif()
if(NOT DEFINED ENV{NVCC_WRAPPER})
  set(NVCC_WRAPPER "/lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/bin/nvcc_wrapper" CACHE FILEPATH "Path to command nvcc_wrapper")
else()
  set(NVCC_WRAPPER $ENV{NVCC_WRAPPER} CACHE FILEPATH "Path to command nvcc_wrapper")
endif()

#Source and Header files of Kokkos relative to KOKKOS_PATH
set(KOKKOS_HEADERS " /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Serial.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Parallel.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_ExecPolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_OpenMPTarget.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Array.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Qthreads.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Macros.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_NumericTraits.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Timer.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Pair.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_UniqueToken.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_OpenMP.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Vectorization.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Atomic.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Crs.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_CudaSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_ScratchSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Core_fwd.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_WorkGraphPolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Parallel_Reduce.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_hwloc.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_ROCmSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_ROCm.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_HBWSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_TaskScheduler.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Cuda.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/KokkosExp_MDRangePolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Core.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Complex.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_OpenMPTargetSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_HostSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_View.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_MasterLock.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_MemoryPool.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_TaskPolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_MemoryTraits.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Concepts.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Threads.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Layout.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_OldMacros.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Profiling_DeviceInfo.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ConcurrentBitset.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Fetch_Sub.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Windows.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Memory_Fence.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_HostThreadTeam.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_FunctorAnalysis.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Timer.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/KokkosExp_ViewMapping.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Tags.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_SharedAlloc.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Rendezvous.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Volatile_Load.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Fetch_Add.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Generic.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_FunctorAdapter.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Serial_WorkGraphPolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Utilities.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_AnalyzePolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ViewCtor.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_TaskQueue.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_CPUDiscovery.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ViewArray.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_PhysicalLayout.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_TaskQueue_impl.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Error.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_View.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Profiling_Interface.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Spinwait.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/KokkosExp_Host_IterateTile.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ClockTic.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Compare_Exchange_Strong.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Exchange.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Fetch_And.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_StaticAssert.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Assembly.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Serial_Task.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_BitOps.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Traits.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Increment.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ViewTile.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Decrement.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ViewMapping.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Fetch_Or.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_DynRankView.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Vector.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_StaticCrsGraph.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Functional.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_DualView.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_DynamicView.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Bitset.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_UnorderedMap.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_ErrorReporter.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_StaticCrsGraph_factory.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Functional_impl.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Bitset_impl.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_UnorderedMap_impl.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Random.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Sort.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_Task.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_Exec.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_Parallel.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_WorkGraphPolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_Team.hpp" CACHE STRING "Kokkos headers list")
set(KOKKOS_SRC "/lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ExecPolicy.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_HostThreadTeam.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Rendezvous.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_SharedAlloc.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Spinwait.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Profiling_Interface.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_CPUDiscovery.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_hwloc.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Core.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Error.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_HostSpace.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_UnorderedMap_impl.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_Task.cpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_Exec.cpp" CACHE STRING "Kokkos source list")

#Variables used in application Makefiles
set(KOKKOS_CPP_DEPENDS "KokkosCore_config.h  /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Serial.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Parallel.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_ExecPolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_OpenMPTarget.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Array.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Qthreads.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Macros.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_NumericTraits.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Timer.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Pair.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_UniqueToken.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_OpenMP.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Vectorization.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Atomic.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Crs.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_CudaSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_ScratchSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Core_fwd.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_WorkGraphPolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Parallel_Reduce.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_hwloc.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_ROCmSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_ROCm.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_HBWSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_TaskScheduler.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Cuda.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/KokkosExp_MDRangePolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Core.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Complex.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_OpenMPTargetSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_HostSpace.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_View.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_MasterLock.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_MemoryPool.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_TaskPolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_MemoryTraits.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Concepts.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Threads.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Layout.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_OldMacros.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Profiling_DeviceInfo.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ConcurrentBitset.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Fetch_Sub.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Windows.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Memory_Fence.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_HostThreadTeam.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_FunctorAnalysis.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Timer.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/KokkosExp_ViewMapping.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Tags.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_SharedAlloc.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Rendezvous.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Volatile_Load.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Fetch_Add.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Generic.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_FunctorAdapter.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Serial_WorkGraphPolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Utilities.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_AnalyzePolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ViewCtor.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_TaskQueue.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_CPUDiscovery.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ViewArray.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_PhysicalLayout.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_TaskQueue_impl.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Error.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_View.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Profiling_Interface.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Spinwait.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/KokkosExp_Host_IterateTile.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ClockTic.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Compare_Exchange_Strong.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Exchange.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Fetch_And.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_StaticAssert.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Assembly.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Serial_Task.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_BitOps.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Traits.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Increment.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ViewTile.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Decrement.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_ViewMapping.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Atomic_Fetch_Or.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_DynRankView.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Vector.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_StaticCrsGraph.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Functional.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_DualView.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_DynamicView.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Bitset.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_UnorderedMap.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_ErrorReporter.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_StaticCrsGraph_factory.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Functional_impl.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_Bitset_impl.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/impl/Kokkos_UnorderedMap_impl.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Random.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/Kokkos_Sort.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_Task.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_Exec.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_Parallel.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_WorkGraphPolicy.hpp /lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include/OpenMP/Kokkos_OpenMP_Team.hpp" CACHE STRING "")
set(KOKKOS_CXXFLAGS " -Wall -Wshadow -pedantic -Wsign-compare -Wtype-limits -Wignored-qualifiers -Wempty-body -Wclobbered -Wuninitialized --std=c++11 -mcpu=power8 -mtune=power8 -fopenmp" CACHE STRING "")
set(KOKKOS_CPPFLAGS "-I./ -I/lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include -I/lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include -I/lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/include" CACHE STRING "")
set(KOKKOS_LINK_DEPENDS "libkokkos.a" CACHE STRING "")
set(KOKKOS_LIBS "-lkokkos -ldl" CACHE STRING "")
set(KOKKOS_LDFLAGS "-L/lustre/atlas/scratch/arghyac/csc205/summit_miniapp/miniapp_ronnie/kokkos/kokkos/build/gcc_6.3/openMP/install/lib -mcpu=power8 -mtune=power8 -fopenmp" CACHE STRING "")

#Internal settings which need to propagated for Kokkos examples
set(KOKKOS_INTERNAL_USE_CUDA "0" CACHE STRING "")
set(KOKKOS_INTERNAL_USE_OPENMP "1" CACHE STRING "")
set(KOKKOS_INTERNAL_USE_PTHREADS "0" CACHE STRING "")
mark_as_advanced(KOKKOS_HEADERS KOKKOS_SRC KOKKOS_INTERNAL_USE_CUDA KOKKOS_INTERNAL_USE_OPENMP KOKKOS_INTERNAL_USE_PTHREADS)
