def get_error_lines(file_path, keyword="failed"):
    errors = []
    with open(file_path, "r") as f:
        for line in f:
            if keyword in line:
                errors.append(line.strip())
    return errors




