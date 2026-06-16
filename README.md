# Image Mode - Database

PostgreSQL 16 database tier for the Train Tickets booking application, packaged as a RHEL bootc image-mode container.

## Schema

### stations

| Column | Type | Description |
|--------|------|-------------|
| `id` | `SERIAL` | Primary key |
| `name` | `VARCHAR(100)` | Station name (e.g. Roma Termini) |
| `code` | `VARCHAR(5)` | Unique station code (e.g. ROM) |

### tickets

| Column | Type | Description |
|--------|------|-------------|
| `id` | `UUID` | Primary key (auto-generated) |
| `train_number` | `VARCHAR(20)` | Train identifier |
| `train_type` | `VARCHAR(20)` | Frecciarossa, Frecciargento, Intercity, Regionale |
| `source_station_id` | `INT` | FK to stations |
| `destination_station_id` | `INT` | FK to stations |
| `departure_date` | `DATE` | Travel date |
| `departure_time` | `TIME` | Departure time |
| `customer_first_name` | `VARCHAR(100)` | Passenger first name |
| `customer_last_name` | `VARCHAR(100)` | Passenger last name |
| `customer_email` | `VARCHAR(255)` | Passenger email |
| `price` | `DECIMAL(10,2)` | Ticket price |
| `created_at` | `TIMESTAMPTZ` | Booking timestamp |

## Seed Data

10 Italian rail stations are seeded on first boot: Roma Termini, Milano Centrale, Napoli Centrale, Firenze SMN, Venezia Santa Lucia, Torino Porta Nuova, Bologna Centrale, Genova Piazza Principe, Palermo Centrale, Bari Centrale.

## How it works

On first boot, `train-tickets-db-init.service` runs as a oneshot:
1. Initializes the PostgreSQL data directory
2. Creates the `train_tickets` database
3. Applies schema and seed data
4. Sets the `postgres` user password to `postgres`
5. Configures `pg_hba.conf` for MD5 auth and remote connections

Subsequent boots skip init (guarded by `ConditionPathExists=!/var/lib/pgsql/data/PG_VERSION`).

Default credentials: `postgres` / `postgres`, database `train_tickets`, port `5432`.

## Build

```bash
podman build -t quay.io/kubealex/image-mode-db:pg16 .
```

Base image: `quay.io/kubealex/image-mode-baseos:latest`
