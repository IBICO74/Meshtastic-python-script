#!/bin/bash

NODE_IP="000.000.000.000"
OUTPUT_FILE="${HOME}/meshtastic_config_backup_$(date +%Y%m%d_%H%M%S).txt"
PAUSE_SECS=5 # Juster denne hvis du fortsatt får tilkoblingsfeil

echo "Dumping Meshtastic konfigurasjon for node: ${NODE_IP}" | tee -a "${OUTPUT_FILE}"
echo "Lagrer til fil: ${OUTPUT_FILE}" | tee -a "${OUTPUT_FILE}"
echo "Starter dumping..." | tee -a "${OUTPUT_FILE}"
echo "---------------------------------------------------" | tee -a "${OUTPUT_FILE}"
echo "" | tee -a "${OUTPUT_FILE}"

# Funksjon for å hente og logge en innstilling
get_setting() {
    SETTING_PATH=$1
    echo "Henter: ${SETTING_PATH}" | tee -a "${OUTPUT_FILE}"
    meshtastic --host "${NODE_IP}" --get "${SETTING_PATH}" | tee -a "${OUTPUT_FILE}"
    echo "" | tee -a "${OUTPUT_FILE}"
    sleep "${PAUSE_SECS}" # Pause mellom hver kommando
}

# Device settings
echo "### Device Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting device.button_gpio
get_setting device.buzzer_gpio
get_setting device.buzzer_mode
get_setting device.disable_triple_click
get_setting device.double_tap_as_button_press
get_setting device.is_managed
get_setting device.led_heartbeat_disabled
get_setting device.node_info_broadcast_secs
get_setting device.rebroadcast_mode
get_setting device.role
get_setting device.serial_enabled
get_setting device.tzdef

# Position settings
echo "### Position Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting position.broadcast_smart_minimum_distance
get_setting position.broadcast_smart_minimum_interval_secs
get_setting position.fixed_position
get_setting position.gps_attempt_time
get_setting position.gps_en_gpio
get_setting position.gps_enabled
get_setting position.gps_mode
get_setting position.gps_update_interval
get_setting position.position_broadcast_secs
get_setting position.position_broadcast_smart_enabled
get_setting position.position_flags
get_setting position.rx_gpio
get_setting position.tx_gpio

# Power settings
echo "### Power Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting power.adc_multiplier_override
get_setting power.device_battery_ina_address
get_setting power.is_power_saving
get_setting power.ls_secs
get_setting power.min_wake_secs
get_setting power.on_battery_shutdown_after_secs
get_setting power.powermon_enables
get_setting power.sds_secs
get_setting power.wait_bluetooth_secs

# Network settings
echo "### Network Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting network.address_mode
get_setting network.enabled_protocols
get_setting network.eth_enabled
get_setting network.ipv4_config
get_setting network.ipv6_enabled
get_setting network.ntp_server
get_setting network.rsyslog_server
get_setting network.wifi_enabled
get_setting network.wifi_psk
get_setting network.wifi_ssid

# Display settings
echo "### Display Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting display.auto_screen_carousel_secs
get_setting display.compass_north_top
get_setting display.compass_orientation
get_setting display.displaymode
get_setting display.flip_screen
get_setting display.gps_format
get_setting display.heading_bold
get_setting display.oled
get_setting display.screen_on_secs
get_setting display.units
get_setting display.use_12h_clock
get_setting display.wake_on_tap_or_motion

# LoRa settings
echo "### LoRa Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting lora.bandwidth
get_setting lora.channel_num
get_setting lora.coding_rate
get_setting lora.config_ok_to_mqtt
get_setting lora.frequency_offset
get_setting lora.hop_limit
get_setting lora.ignore_incoming
get_setting lora.ignore_mqtt
get_setting lora.modem_preset
get_setting lora.override_duty_cycle
get_setting lora.override_frequency
get_setting lora.pa_fan_disabled
get_setting lora.region
get_setting lora.spread_factor
get_setting lora.sx126x_rx_boosted_gain
get_setting lora.tx_enabled
get_setting lora.tx_power
get_setting lora.use_preset

# Bluetooth settings
echo "### Bluetooth Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting bluetooth.enabled
get_setting bluetooth.fixed_pin
get_setting bluetooth.mode

# Security settings
echo "### Security Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting security.admin_channel_enabled
get_setting security.admin_key
get_setting security.debug_log_api_enabled
get_setting security.is_managed
get_setting security.private_key
get_setting security.public_key
get_setting security.serial_enabled

# MQTT settings
echo "### MQTT Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting mqtt.address
get_setting mqtt.enabled
get_setting mqtt.encryption_enabled
get_setting mqtt.json_enabled
get_setting mqtt.map_report_settings
get_setting mqtt.map_reporting_enabled
get_setting mqtt.password
get_setting mqtt.proxy_to_client_enabled
get_setting mqtt.root
get_setting mqtt.tls_enabled
get_setting mqtt.username

# Serial settings
echo "### Serial Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting serial.baud
get_setting serial.echo
get_setting serial.enabled
get_setting serial.mode
get_setting serial.override_console_serial_port
get_setting serial.rxd
get_setting serial.timeout
get_setting serial.txd

# External Notification settings
echo "### External Notification Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting external_notification.active
get_setting external_notification.alert_bell
get_setting external_notification.alert_bell_buzzer
get_setting external_notification.alert_bell_vibra
get_setting external_notification.alert_message
get_setting external_notification.alert_message_buzzer
get_setting external_notification.alert_message_vibra
get_setting external_notification.enabled
get_setting external_notification.nag_timeout
get_setting external_notification.output
get_setting external_notification.output_buzzer
get_setting external_notification.output_ms
get_setting external_notification.output_vibra
get_setting external_notification.use_i2s_as_buzzer
get_setting external_notification.use_pwm

# Store and Forward settings
echo "### Store and Forward Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting store_forward.enabled
get_setting store_forward.heartbeat
get_setting store_forward.history_return_max
get_setting store_forward.history_return_window
get_setting store_forward.is_server
get_setting store_forward.records

# Range Test settings
echo "### Range Test Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting range_test.enabled
get_setting range_test.save
get_setting range_test.sender

# Telemetry settings
echo "### Telemetry Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting telemetry.air_quality_enabled
get_setting telemetry.air_quality_interval
get_setting telemetry.device_update_interval
get_setting telemetry.environment_display_fahrenheit
get_setting telemetry.environment_measurement_enabled
get_setting telemetry.environment_screen_enabled
get_setting telemetry.environment_update_interval
get_setting telemetry.health_measurement_enabled
get_setting telemetry.health_screen_enabled
get_setting telemetry.health_update_interval
get_setting telemetry.power_measurement_enabled
get_setting telemetry.power_screen_enabled
get_setting telemetry.power_update_interval

# Canned Message settings
echo "### Canned Message Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting canned_message.allow_input_source
get_setting canned_message.enabled
get_setting canned_message.inputbroker_event_ccw
get_setting canned_message.inputbroker_event_cw
get_setting canned_message.inputbroker_event_press
get_setting canned_message.inputbroker_pin_a
get_setting canned_message.inputbroker_pin_b
get_setting canned_message.inputbroker_pin_press
get_setting canned_message.rotary1_enabled
get_setting canned_message.send_bell
get_setting canned_message.updown1_enabled

# Audio settings
echo "### Audio Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting audio.bitrate
get_setting audio.codec2_enabled
get_setting audio.i2s_din
get_setting audio.i2s_sck
get_setting audio.i2s_sd
get_setting audio.i2s_ws
get_setting audio.ptt_pin

# Remote Hardware settings
echo "### Remote Hardware Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting remote_hardware.allow_undefined_pin_access
get_setting remote_hardware.available_pins
get_setting remote_hardware.enabled

# Neighbor Info settings
echo "### Neighbor Info Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting neighbor_info.enabled
get_setting neighbor_info.transmit_over_lora
get_setting neighbor_info.update_interval

# Ambient Lighting settings
echo "### Ambient Lighting Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting ambient_lighting.blue
get_setting ambient_lighting.current
get_setting ambient_lighting.green
get_setting ambient_lighting.led_state
get_setting ambient_lighting.red

# Detection Sensor settings
echo "### Detection Sensor Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting detection_sensor.detection_trigger_type
get_setting detection_sensor.enabled
get_setting detection_sensor.minimum_broadcast_secs
get_setting detection_sensor.monitor_pin
get_setting detection_sensor.name
get_setting detection_sensor.send_bell
get_setting detection_sensor.state_broadcast_secs
get_setting detection_sensor.use_pullup

# Paxcounter settings
echo "### Paxcounter Settings ###" | tee -a "${OUTPUT_FILE}"
get_setting paxcounter.ble_threshold
get_setting paxcounter.enabled
get_setting paxcounter.paxcounter_update_interval
get_setting paxcounter.wifi_threshold

echo "---------------------------------------------------" | tee -a "${OUTPUT_FILE}"
echo "Konfigurasjonsdump fullført og lagret til ${OUTPUT_FILE}" | tee -a "${OUTPUT_FILE}"
