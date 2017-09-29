import time
import pyautogui


class KeyboardHandler(object):
    def __init__(self):
        pass

    def press_TAB(self):
        pyautogui.hotkey('tab')

    def press_SHFIT_TAB(self):
        pyautogui.hotkey('shiftleft', 'tab')