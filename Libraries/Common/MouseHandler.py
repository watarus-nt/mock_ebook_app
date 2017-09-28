import time
import pyautogui


class MouseHandler(object):
    def __init__(self):
        pass

    def draw_a_square(self, location_x, location_y):
        time.sleep(1)
        pyautogui.click(location_x, location_y)  # click to put drawing program in focus
        distance = 100
        pyautogui.dragRel(-distance, 0, duration=0.5)  # move left
        pyautogui.dragRel(0, distance, duration=0.5)  # move down
        pyautogui.dragRel(distance, 0, duration=0.5)  # move right
        pyautogui.dragRel(0, -distance, duration=0.5)  # move up

    def move_to(self, location_x, location_y):
        print "INFO - move_to() - moving to x=%d, y=%d" % (location_x, location_y)
        pyautogui.moveTo(location_x, location_y, duration=0.5)

    def click_at_coordinate(self, location_x, location_y):
        print "INFO - click_at_coordinate() - clicking at x=%d, y=%d" % (location_x, location_y)
        pyautogui.click(location_x, location_y)

    def get_current_mouse_position(self):
        """
        return current mouse position
        :return:
        """
        print "*INFO* get_current_mouse_position() - Getting current mouse position..."
        _x, _y =  pyautogui.position()
        print "*INFO*  get_current_mouse_position() - Current mouse position is: x= %d\ty=%d" % (_x, _y)
        return _x, _y

    def mouse_click(self, x, y, button='left', duration=0.5):
        """
        implement pyautogui.click()
        :return:
        """
        print "*INFO* mouse_click() - Clicking with input params: x=%d\ty=%d\tbutton=%s\tduration=%r" % (x, y, button, duration)
        pyautogui.click(x, y, button, duration)