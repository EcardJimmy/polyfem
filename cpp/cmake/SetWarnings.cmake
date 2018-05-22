################################################################################
cmake_minimum_required(VERSION 2.6.3)
################################################################################
# See comments and discussions here:
# http://stackoverflow.com/questions/5088460/flags-to-enable-thorough-and-verbose-g-warnings
################################################################################

set(MY_FLAGS
		-Wall
		-Wextra
		-pedantic

		# -Wconversion
		#-Wunsafe-loop-optimizations # broken with C++11 loops
		-Wunused

		-Wno-long-long
		-Wpointer-arith
		-Wformat=2
		-Wuninitialized
		-Wcast-qual
		-Wmissing-noreturn
		-Wmissing-format-attribute
		-Wredundant-decls

		-Werror=implicit
		-Werror=nonnull
		-Werror=init-self
		-Werror=main
		-Werror=missing-braces
		-Werror=sequence-point
		-Werror=return-type
		-Werror=trigraphs
		-Werror=array-bounds
		-Werror=write-strings
		-Werror=address
		-Werror=int-to-pointer-cast
		-Werror=pointer-to-int-cast

		-Wno-unused-variable
		-Wunused-but-set-variable
		-Wno-unused-parameter

		#-Weffc++
		-Wno-old-style-cast
		# -Wno-sign-conversion
		#-Wsign-conversion

		-Wshadow

		-Wstrict-null-sentinel
		-Woverloaded-virtual
		-Wsign-promo
		-Wstack-protector
		-Wstrict-aliasing
		-Wstrict-aliasing=2
		-Wswitch-default
		-Wswitch-enum
		-Wswitch-unreachable

		-Wcast-align
		-Wdisabled-optimization
		#-Winline # produces warning on default implicit destructor
		-Winvalid-pch
		# -Wmissing-include-dirs
		-Wpacked
		-Wno-padded
		-Wstrict-overflow
		-Wstrict-overflow=2

		-Wctor-dtor-privacy
		-Wlogical-op
		-Wnoexcept
		-Woverloaded-virtual
		# -Wundef

		-Wnon-virtual-dtor
		-Wdelete-non-virtual-dtor

		-wno-sign-compare

		###########
		# GCC 6.1 #
		###########

		-Wnull-dereference
		-fdelete-null-pointer-checks
		-Wduplicated-cond
		-Wmisleading-indentation

		#-Weverything

		###########################
		# Enabled by -Weverything #
		###########################

		#-Wdocumentation
		#-Wdocumentation-unknown-command
		#-Wfloat-equal
		#-Wcovered-switch-default

		#-Wglobal-constructors
		#-Wexit-time-destructors
		#-Wmissing-variable-declarations
		#-Wextra-semi
		#-Wweak-vtables
		#-Wno-source-uses-openmp
		#-Wdeprecated
		#-Wnewline-eof
		#-Wmissing-prototypes

		#-Wno-c++98-compat
		#-Wno-c++98-compat-pedantic

		###########################
		# Need to check if those are still valid today
		###########################

		#-Wimplicit-atomic-properties
		#-Wmissing-declarations
		#-Wmissing-prototypes
		#-Wstrict-selector-match
		#-Wundeclared-selector
		#-Wunreachable-code

		# Not a warning, but enable link-time-optimization
		#-flto

		# Gives meaningful stack traces
		-fno-omit-frame-pointer
		-fno-optimize-sibling-calls
)

# Flags above don't make sense for MSVC
if(MSVC)
	set(MY_FLAGS)
endif()

include(CheckCXXCompilerFlag)

set(ALL_WARNINGS)
foreach(FLAG ${MY_FLAGS})
	check_cxx_compiler_flag("${FLAG}" IS_SUPPORTED_${FLAG})
	if(IS_SUPPORTED_${FLAG})
		set(ALL_WARNINGS ${ALL_WARNINGS} ${FLAG})
	endif()
endforeach()
