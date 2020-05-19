#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "PolitoceanCommon::logger" for configuration "Debug"
set_property(TARGET PolitoceanCommon::logger APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(PolitoceanCommon::logger PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/liblogger.so"
  IMPORTED_SONAME_DEBUG "liblogger.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS PolitoceanCommon::logger )
list(APPEND _IMPORT_CHECK_FILES_FOR_PolitoceanCommon::logger "${_IMPORT_PREFIX}/lib/liblogger.so" )

# Import target "PolitoceanCommon::mqttLogger" for configuration "Debug"
set_property(TARGET PolitoceanCommon::mqttLogger APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(PolitoceanCommon::mqttLogger PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libmqttLogger.so"
  IMPORTED_SONAME_DEBUG "libmqttLogger.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS PolitoceanCommon::mqttLogger )
list(APPEND _IMPORT_CHECK_FILES_FOR_PolitoceanCommon::mqttLogger "${_IMPORT_PREFIX}/lib/libmqttLogger.so" )

# Import target "PolitoceanCommon::Sensor" for configuration "Debug"
set_property(TARGET PolitoceanCommon::Sensor APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(PolitoceanCommon::Sensor PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libSensor.so"
  IMPORTED_SONAME_DEBUG "libSensor.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS PolitoceanCommon::Sensor )
list(APPEND _IMPORT_CHECK_FILES_FOR_PolitoceanCommon::Sensor "${_IMPORT_PREFIX}/lib/libSensor.so" )

# Import target "PolitoceanCommon::MqttClient" for configuration "Debug"
set_property(TARGET PolitoceanCommon::MqttClient APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(PolitoceanCommon::MqttClient PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libMqttClient.so"
  IMPORTED_SONAME_DEBUG "libMqttClient.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS PolitoceanCommon::MqttClient )
list(APPEND _IMPORT_CHECK_FILES_FOR_PolitoceanCommon::MqttClient "${_IMPORT_PREFIX}/lib/libMqttClient.so" )

# Import target "PolitoceanCommon::Component" for configuration "Debug"
set_property(TARGET PolitoceanCommon::Component APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(PolitoceanCommon::Component PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libComponent.so"
  IMPORTED_SONAME_DEBUG "libComponent.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS PolitoceanCommon::Component )
list(APPEND _IMPORT_CHECK_FILES_FOR_PolitoceanCommon::Component "${_IMPORT_PREFIX}/lib/libComponent.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
