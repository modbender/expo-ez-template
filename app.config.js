const pkg = require('./package.json');

// Auto-increment versionCode using timestamp (unique per build)
const versionCode = Math.floor(Date.now() / 1000);

export default {
    expo: {
        name: '{{APP_NAME}}',
        slug: '{{APP_SLUG}}',
        version: pkg.version,
        orientation: 'portrait',
        icon: './assets/images/icon.png',
        scheme: '{{APP_SLUG}}',
        userInterfaceStyle: 'automatic',
        newArchEnabled: true,
        splash: {
            image: './assets/images/splash-icon.png',
            resizeMode: 'contain',
            backgroundColor: '#ffffff',
        },
        ios: {
            supportsTablet: true,
            bundleIdentifier: 'com.{{AUTHOR}}.{{APP_SLUG}}',
        },
        android: {
            package: 'com.{{AUTHOR}}.{{APP_SLUG}}',
            versionCode: versionCode,
            adaptiveIcon: {
                foregroundImage: './assets/images/android-icon-foreground.png',
                backgroundImage: './assets/images/android-icon-background.png',
                backgroundColor: '#ffffff',
            },
            edgeToEdgeEnabled: true,
            predictiveBackGestureEnabled: false,
            permissions: [],
            blockedPermissions: [
                'android.permission.READ_EXTERNAL_STORAGE',
                'android.permission.WRITE_EXTERNAL_STORAGE',
                'android.permission.READ_MEDIA_IMAGES',
                'android.permission.READ_MEDIA_VIDEO',
            ],
        },
        web: {
            bundler: 'metro',
            output: 'static',
            favicon: './assets/images/favicon.png',
        },
        plugins: [
            'expo-router',
            'expo-font',
            [
                'expo-build-properties',
                {
                    android: {
                        enableProguardInReleaseBuilds: true,
                        enableShrinkResources: true,
                        // 16KB page size support for Android 15+ devices
                        useLegacyPackaging: false,
                        ndkVersion: '28.0.13004108',
                    },
                },
            ],
        ],
        experiments: {
            typedRoutes: true,
        },
        extra: {
            router: {},
            eas: {
                projectId: '', // Set after `eas init`
            },
        },
    },
};
