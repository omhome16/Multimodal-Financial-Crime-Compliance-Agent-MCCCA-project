# Vector Database Schema — MCCCA

## Table: evidence_embeddings
| Column         | Type          | Description |
|----------------|--------------|-------------|
| embedding_id   | UUID          | Primary key |
| evidence_id    | UUID          | FK → evidence(evidence_id) |
| vector         | ARRAY[float]  | Embedding vector |
| model_name     | VARCHAR(100)  | Model used to generate embedding |
| created_at     | TIMESTAMP     | Creation date |

**Index:** ANN (HNSW or IVF) for fast retrieval.
