def check_failed_payments(file_path):
    with open(file_path, "r") as f:
        content = f.read()

    count_failed = content.count("FAILED")

    print("Nombre de FAILED :", count_failed)

    if count_failed == 0:
        print("OK : aucun paiement en erreur")
    else:
        print("ERREUR : il y a des paiements en FAILED")

    return count_failed

