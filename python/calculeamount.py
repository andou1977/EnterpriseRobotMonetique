def calculate_total_amount(file_path: str) -> int:
    """
    Lit un fichier batch et calcule la somme de tous les AMOUNT=xx.
    Exemple de lignes :
    PAYMENT;ID=1001;AMOUNT=50
    PAYMENT;ID=1002;AMOUNT=70
    """
    total = 0

    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            if "AMOUNT=" in line:
                # extrait la partie après AMOUNT=
                amount_str = line.split("AMOUNT=")[1].strip()
                total += int(amount_str)

    return total







