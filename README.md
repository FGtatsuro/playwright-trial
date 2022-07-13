# playwright-trial

Trial of Playwright

## Build

```bash
$ make docker/clean docker/build
```

## Run

```bash
$ make docker/rm docker/run
```

## Run on local (For Development)

```bash
$ npm install
$ npx playwright install chromium
```

```bash
# Run with Playwright CLI
$ npx playwright test --headed main.spec.ts

# Run without Playwright CLI
$ HEADLESS=false npx ts-node main.ts
```
