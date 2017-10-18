## -*- coding: utf-8 -*-
import unittest

import time
from appium import webdriver

class SimpleCalculatorTests(unittest.TestCase):
    def setUp(self):
        # set up appium
        desired_caps = {}
        desired_caps["app"] = "jp.co.sharp.ebook.ebookapp_h35559jr9hy9m!jp.co.sharp.ebook.ebookapp"
        desired_caps["deviceName"] = "WindowsPC"
        desired_caps["platformName"] = "Windows"
        # desired_caps["app"] = "Microsoft.WindowsCalculator_8wekyb3d8bbwe"
        self.driver = webdriver.Remote(
            command_executor='http://127.0.0.1:4723/wd/hub',
            desired_capabilities=desired_caps)

    def tearDown(self):
        self.driver.quit()

    def test_1(self):
        # self.driver.find_element_by_name('タイトルを検索').click()
        # self.driver.find_element_by_name('タイトルを検索').send_keys('asdfklj')
        # self.driver.find_element_by_name('購入日が新しい').click()
        # time.sleep(3)
        # self.driver.find_element_by_name('すべて').click()
        self.driver.find_element_by_name('グループのメモ辞書検索').click()




    # def test_addition(self):
    #     self.driver.find_element_by_name("One").click()
    #     self.driver.find_element_by_name("Plus").click()
    #     self.driver.find_element_by_name("Seven").click()
    #     self.driver.find_element_by_name("Equals").click()
    #
    #     result = self.driver.find_element_by_accessibility_id("CalculatorResults")
    #     self.assertEqual(str(result.text), "Display is 8")



if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(SimpleCalculatorTests)
    unittest.TextTestRunner(verbosity=2).run(suite)