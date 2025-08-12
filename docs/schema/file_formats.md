# File Format Schema — MCCCA

## transactions.csv
- **transaction_id**: String
- **timestamp**: DateTime
- **amount**: Float
- **sender_account**: String
- **receiver_account**: String
- **transaction_type**: String

## contracts/
- Folder of PDF/TXT files: `contract_<id>.pdf`

## biometrics.csv
- **person_id**: String
- **fingerprint_hash**: String
- **face_embedding**: String (JSON array)
- **timestamp**: DateTime
