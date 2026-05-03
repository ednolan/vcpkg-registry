vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/transform_view
    REF "enolan_modules3"
    SHA512 f01200d59ef138fa6ea5ff2530d3e381f7ea72f81a05972c8d8e14e5397f26c58f4c2fe6318dfc05702eecdc13ea155d1c609d963995bb36688d6cc682f2107b
    HEAD_REF main
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        modules   BEMAN_TRANSFORM_VIEW_USE_MODULES
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DBEMAN_TRANSFORM_VIEW_BUILD_TESTS=OFF
        -DBEMAN_TRANSFORM_VIEW_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.transform_view
    CONFIG_PATH lib/cmake/beman.transform_view
)

if(NOT "modules" IN_LIST FEATURES)
    file(REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug"
        "${CURRENT_PACKAGES_DIR}/lib"
    )
endif()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
