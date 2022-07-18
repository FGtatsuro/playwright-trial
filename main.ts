import { setTimeout } from 'timers/promises'

import { chromium } from '@playwright/test'

(async () => {
  const browser = await chromium.launch()
  const page = await browser.newPage()
  await page.goto('https://example.com')

  // Ref: https://playwright.dev/docs/debug#run-in-debug-mode
  if (process.env['PWDEBUG'] === 'console') {
    await setTimeout(5000)
  }
  await browser.close();
})();
