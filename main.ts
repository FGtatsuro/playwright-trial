import { setTimeout } from 'timers/promises'

import { chromium } from '@playwright/test'

(async () => {
  const options = {
    headless: true
  }

  if (process.env['HEADLESS'] === 'false') {
    options['headless'] = false
  }

  const browser = await chromium.launch(options)
  const page = await browser.newPage()
  await page.goto('https://example.com')
  await setTimeout(5000)
  await browser.close();
})();
