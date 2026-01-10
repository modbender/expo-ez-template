# {{APP_NAME}} - Agent Documentation

## Project Overview

**{{APP_NAME}}** is a mobile application built with React Native and Expo.

## Tech Stack

| Layer               | Technology                                   |
| ------------------- | -------------------------------------------- |
| **Framework**       | React Native + Expo (~54.0)                  |
| **Architecture**    | New Architecture (Fabric)                    |
| **Router**          | Expo Router (~6.0)                           |
| **State**           | Zustand (^5.0)                               |
| **Language**        | TypeScript (~5.9)                            |
| **Package Manager** | Bun (1.2.x)                                  |

## Key Directives

1. **Dev Client Only**: Do NOT use Expo Go. Run with `bun run android`.
2. **New Architecture**: `newArchEnabled: true` is set in `app.config.js`.

## Project Structure

```
{{APP_SLUG}}/
├── app/                  # Expo Router pages
├── assets/
│   └── images/           # Icons, splash
├── components/           # UI components
├── services/             # Business logic
├── store/                # Zustand state
├── app.config.js         # Dynamic Expo config
├── eas.json              # EAS Build profiles
└── AGENTS.md             # This file
```

## Scripts

| Command           | Description                               |
| ----------------- | ----------------------------------------- |
| `bun start`       | Dev server (tunnel mode)                  |
| `bun run android` | Build and run on Android device           |
| `bun run apk`     | Local APK build (preview profile)         |
| `bun run aab`     | Local AAB build (production)              |
| `bun run submit`  | Submit AAB to Play Store                  |
| `bun run release` | Create release with changelog             |
| `bun run lint`    | Run ESLint                                |
| `bun test`        | Run Jest tests                            |

## Development

### Setup
```bash
bun install
bun run android  # Build dev client and launch
```

## Resources

- [Expo Docs](https://docs.expo.dev/)
- [Expo Router](https://docs.expo.dev/router/introduction/)
- [Zustand](https://zustand-demo.pmnd.rs/)
