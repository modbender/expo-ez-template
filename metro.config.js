const { getDefaultConfig } = require('expo/metro-config');

/** @type {import('expo/metro-config').MetroConfig} */
const config = getDefaultConfig(__dirname);

// Add .mjs extension (Expo 49+ compatibility)
config.resolver.sourceExts.push('mjs');

// Uncomment below for ML models if needed:
// config.resolver.assetExts.push('pte');   // ExecuTorch
// config.resolver.assetExts.push('onnx');  // ONNX
// config.resolver.assetExts.push('tflite'); // TensorFlow Lite

module.exports = config;
