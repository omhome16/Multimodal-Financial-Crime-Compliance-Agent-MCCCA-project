# ML Feature Schema — MCCCA Fraud Detection

## Feature Table: transactions_features
| Column              | Type     | Description |
|---------------------|----------|-------------|
| transaction_id      | STRING   | Transaction unique ID |
| amount              | FLOAT    | Transaction amount |
| time_of_day         | INT      | Hour of transaction |
| day_of_week         | INT      | Day of week (0=Monday) |
| sender_account_age  | INT      | Days since sender account creation |
| receiver_account_age| INT      | Days since receiver account creation |
| geo_distance        | FLOAT    | Distance between sender/receiver locations |
| transaction_type    | STRING   | Type of transaction |
| is_foreign_transfer | BOOLEAN  | Whether transfer is cross-border |
| label               | BOOLEAN  | Fraud (1) or Not Fraud (0) |
