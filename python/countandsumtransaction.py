def countandsum(thepath):
    nb_success = 0
    total_success = 0

    with open(thepath, 'r') as f:
        for line in f:
            # Nettoyer la ligne
            parts = [p.strip() for p in line.split("|")]

            # parts = [DATE, TYPE, AMOUNT, CURRENCY, STATUS, REFERENCE]
            status = parts[4]
            amount = float(parts[2])

            if status == "SUCCESS":
                nb_success += 1
                total_success += amount

    return nb_success, total_success


