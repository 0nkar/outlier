def is_valid_string(s):
    if len(s) < 6:
        return False
    
    count_digits = sum(1 for c in s if c.isdigit())
    if count_digits < 2 or count_digits > 3:
        return False
    
    import re
    pattern = r'^(?:\D*\d\D+){2,3}\D*$'
    return bool(re.fullmatch(pattern, s))
