# Relational Database Schema — MCCCA

## Overview
This document defines the relational database tables, fields, constraints, and relationships used in MCCCA.

---

## Tables

### 1. cases
| Column              | Type        | Constraints                         | Description |
|---------------------|-------------|--------------------------------------|-------------|
| case_id             | UUID        | PK                                   | Unique identifier for case |
| title               | VARCHAR(255)| NOT NULL                             | Case title |
| description         | TEXT        |                                      | Case description |
| status              | ENUM('open','in_progress','closed') | DEFAULT 'open' | Current case status |
| created_at          | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP            | Creation date |
| updated_at          | TIMESTAMP   |                                      | Last update date |
| assigned_investigator_id | UUID   | FK → investigators(investigator_id)  | Lead investigator |

### 2. investigators
| Column        | Type        | Constraints              | Description |
|---------------|-------------|--------------------------|-------------|
| investigator_id | UUID      | PK                       | Unique investigator ID |
| name          | VARCHAR(100)| NOT NULL                 | Investigator name |
| email         | VARCHAR(150)| UNIQUE NOT NULL          | Contact email |
| role          | ENUM('lead','analyst','reviewer') | | Role |
| active        | BOOLEAN     | DEFAULT TRUE             | Status |

### 3. evidence
| Column        | Type        | Constraints              | Description |
|---------------|-------------|--------------------------|-------------|
| evidence_id   | UUID        | PK                       | Unique evidence ID |
| case_id       | UUID        | FK → cases(case_id)      | Linked case |
| type          | ENUM('document','image','video','dataset') | | Type of evidence |
| source_uri    | TEXT        |                          | Storage location |
| metadata      | JSONB       |                          | Additional details |
| uploaded_at   | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP | Upload date |

### 4. analysis_results
| Column         | Type        | Constraints              | Description |
|----------------|-------------|--------------------------|-------------|
| analysis_id    | UUID        | PK                       | Unique analysis ID |
| evidence_id    | UUID        | FK → evidence(evidence_id)| Evidence reference |
| model_id       | UUID        | FK → model_registry(model_id)| Model used |
| result_data    | JSONB       |                          | Analysis output |
| confidence_score | FLOAT     |                          | Model confidence |
| created_at     | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP| Analysis date |

### 5. model_registry
| Column         | Type        | Constraints              | Description |
|----------------|-------------|--------------------------|-------------|
| model_id       | UUID        | PK                       | Model identifier |
| name           | VARCHAR(100)| NOT NULL                 | Model name |
| version        | VARCHAR(20) | NOT NULL                 | Version string |
| type           | ENUM('nlp','cv','multimodal','tabular') | | Model type |
| description    | TEXT        |                          | Details |
| storage_location | TEXT      |                          | Model storage path |
| created_at     | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP| Registered date |
VV