vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ednolan/transform_view
    REF "v0.1.1"
    SHA512 cb5976e82617c40418b21b816dd057f721723f9ccce9c055926ceb3350a5111e73e36271253f2dbec572f412fbb54ccfe60dcc1a3e472b0fd8cbef891dd9dc63
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_TRANSFORM_VIEW_BUILD_TESTS=OFF
        -DBEMAN_TRANSFORM_VIEW_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.transform_view
    CONFIG_PATH lib/cmake/beman.transform_view
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
