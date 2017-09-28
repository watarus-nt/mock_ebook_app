"""
//******************************************************************************
//
// Copyright (c) 2016 Microsoft Corporation. All rights reserved.
//
// This code is licensed under the MIT License (MIT).
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//******************************************************************************
"""

import unittest
from appium import webdriver
from ImageHandler import ImageHandler
from MouseHandler import MouseHandler
import time

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

        self.imageHandler = ImageHandler()
        self.mouseHandler = MouseHandler()

    def tearDown(self):
        # self.driver.close()
        pass


    def test_initialize(self):
        x, y = self.imageHandler.get_image_location('../../images/book3title.PNG')
        self.mouseHandler.click_at_coordinate(x, y - 80)

        self.switch_window()
        self.driver.find_element_by_accessibility_id('button-bookmark').click()
        time.sleep(5)

    def switch_window(self):
        current = self.driver.current_window_handle
        for window in self.driver.window_handles:
            if window != current:
                self.driver.switch_to.window(window)


    


if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(SimpleCalculatorTests)
    unittest.TextTestRunner(verbosity=2).run(suite)