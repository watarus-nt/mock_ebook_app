

class StringHandler(object):
    """
    The helper to handle string related actions
    """
    def __init__(self):
        pass

    def check_if_string_contains(self, input_text, text_to_verify):
        print "*INFO* Start check_if_string_contains() keyword..."
        if input_text.find(text_to_verify) == -1:
            print "*INFO* %s does not contain %s" % (input_text, text_to_verify)
            return 1
        else:
            print "*INFO* %s contains %s" % (input_text, text_to_verify)
            return 0

    def validate_input_param(self, expected_input_param, actual_input_param):
        print "*INFO* validate_input_param() - valdating input param"
        _result = 1
        if actual_input_param == expected_input_param:
            _result = 0

        return _result
