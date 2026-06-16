INSERT INTO stations (name, code) VALUES
  ('Roma Termini', 'ROM'),
  ('Milano Centrale', 'MIL'),
  ('Napoli Centrale', 'NAP'),
  ('Firenze SMN', 'FIR'),
  ('Venezia Santa Lucia', 'VEN'),
  ('Torino Porta Nuova', 'TOR'),
  ('Bologna Centrale', 'BOL'),
  ('Genova Piazza Principe', 'GEN'),
  ('Palermo Centrale', 'PAL'),
  ('Bari Centrale', 'BAR')
ON CONFLICT (code) DO NOTHING;
