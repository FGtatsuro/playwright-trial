import { setTimeout } from 'timers/promises'

import { test } from '@playwright/test'

test('basic test', async ({ page }) => {
  await page.goto('http://example.com')
  await setTimeout(5000)
});
