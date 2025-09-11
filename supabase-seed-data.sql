-- Seed data for TechSkills Workshop System

-- Insert teams
INSERT INTO teams (id, name, type, description) VALUES
('PR', 'PR Team', 'PR', 'Premium Repair Team - Apple devices, MacBooks, iPads, iPhones'),
('TR', 'TR Team', 'TR', 'Technical Repair Team - Android, Samsung, Gaming consoles, Windows laptops')
ON CONFLICT (id) DO NOTHING;

-- Insert PR technicians
INSERT INTO technicians (id, name, team, location, role, notes) VALUES
('PR001', 'PR Technician 1', 'PR', 'Workshop A', 'Senior Tech', 'iPhone specialist'),
('PR002', 'PR Technician 2', 'PR', 'Workshop A', 'Tech', 'iPad specialist'),
('PR003', 'PR Technician 3', 'PR', 'Workshop B', 'Senior Tech', 'MacBook specialist'),
('PR004', 'PR Technician 4', 'PR', 'Workshop B', 'Tech', 'Apple Watch specialist'),
('PR005', 'PR Technician 5', 'PR', 'Workshop A', 'Junior Tech', 'Learning iPhone repairs'),
('PR006', 'PR Technician 6', 'PR', 'Workshop B', 'Junior Tech', 'Learning MacBook repairs')
ON CONFLICT (id) DO NOTHING;

-- Insert TR technicians
INSERT INTO technicians (id, name, team, location, role, notes) VALUES
('TR001', 'TR Technician 1', 'TR', 'Workshop C', 'Senior Tech', 'Samsung specialist'),
('TR002', 'TR Technician 2', 'TR', 'Workshop C', 'Tech', 'Android specialist'),
('TR003', 'TR Technician 3', 'TR', 'Workshop D', 'Senior Tech', 'Gaming console specialist'),
('TR004', 'TR Technician 4', 'TR', 'Workshop D', 'Tech', 'Windows laptop specialist'),
('TR005', 'TR Technician 5', 'TR', 'Workshop C', 'Junior Tech', 'Learning Android repairs'),
('TR006', 'TR Technician 6', 'TR', 'Workshop D', 'Junior Tech', 'Learning console repairs')
ON CONFLICT (id) DO NOTHING;

-- Insert comprehensive repair tasks
INSERT INTO tasks (id, category, subcategory, name, tier, target_mins, qc_checks, tools, risk, description, team) VALUES
-- Core Safety & Process
('T001', 'Core', 'Safety/Process', 'ESD compliance & safe workspace', '1 - Swap-level', 3, 3, 'ESD mat, strap', 'Low', 'Set up ESD, verify ground, inspect tools.', 'Both'),
('T002', 'Core', 'Safety/Process', 'Tool calibration & maintenance', '1 - Swap-level', 10, 5, 'Calibration kit', 'Low', 'Check torque drivers, multimeters, hot air stations.', 'Both'),
('T003', 'Core', 'Safety/Process', 'Workspace organization & cleanup', '1 - Swap-level', 5, 3, 'Cleaning supplies', 'Low', 'Organize tools, clean workspace, dispose waste properly.', 'Both'),

-- iPhone Repairs
('T010', 'iPhone', 'Battery', 'iPhone Battery replacement (no error)', '2 - Advanced', 25, 8, 'Diagnostic battery, torque driver', 'Low', 'Use diagnostic battery/programmer where lawful; calibrate.', 'PR'),
('T011', 'iPhone', 'Battery', 'iPhone Battery replacement (with error)', '2 - Advanced', 35, 10, 'Programmer, diagnostic battery', 'Medium', 'Clear battery error codes; calibrate new battery.', 'PR'),
('T012', 'iPhone', 'Display', 'iPhone Display replacement + True Tone', '2 - Advanced', 30, 10, 'Programmer', 'Low', 'Restore True Tone, dust control.', 'PR'),
('T013', 'iPhone', 'Display', 'iPhone Back glass replacement', '2 - Advanced', 45, 8, 'Heat mat, cards, laser', 'Medium', 'Remove back glass; replace with new unit.', 'PR'),
('T014', 'iPhone', 'Camera', 'iPhone Camera replacement', '2 - Advanced', 35, 8, 'Torque driver, camera tester', 'Medium', 'Replace camera module; test all functions.', 'PR'),
('T015', 'iPhone', 'Camera', 'iPhone Camera lens replacement', '2 - Advanced', 20, 5, 'Heat mat, cards', 'Low', 'Replace cracked camera lens.', 'PR'),
('T016', 'iPhone', 'Charging', 'iPhone Lightning port replacement', '2 - Advanced', 30, 6, 'Heat mat, cards', 'Medium', 'Replace Lightning port assembly.', 'PR'),
('T017', 'iPhone', 'Audio', 'iPhone Speaker replacement', '2 - Advanced', 25, 5, 'Torque driver, cards', 'Low', 'Replace speaker assembly; test audio.', 'PR'),
('T018', 'iPhone', 'Audio', 'iPhone Microphone replacement', '2 - Advanced', 20, 5, 'Torque driver, cards', 'Low', 'Replace microphone assembly; test recording.', 'PR'),
('T019', 'iPhone', 'Logic Board', 'iPhone Logic Board repair', '3 - Board-level', 120, 15, 'Microscope, hot air, multimeter', 'High', 'Component-level repair; power management.', 'PR'),
('T020', 'iPhone', 'Logic Board', 'iPhone Water damage repair', '3 - Board-level', 90, 12, 'Ultrasonic cleaner, microscope', 'High', 'Clean corrosion; replace damaged components.', 'PR'),

-- Samsung Galaxy Repairs
('T021', 'Samsung Galaxy', 'Display', 'Samsung AMOLED + FP calibration', '2 - Advanced', 40, 8, 'Service app/jig', 'Medium', 'Replace AMOLED; run fingerprint calibration.', 'TR'),
('T022', 'Samsung Galaxy', 'Display', 'Samsung Back glass replacement', '2 - Advanced', 35, 6, 'Heat mat, cards', 'Medium', 'Remove back glass; replace with new unit.', 'TR'),
('T023', 'Samsung Galaxy', 'Battery', 'Samsung Battery replacement', '2 - Advanced', 30, 6, 'Heat mat, cards', 'Medium', 'Remove back glass; replace battery.', 'TR'),
('T024', 'Samsung Galaxy', 'Charging', 'Samsung Charging port replacement', '2 - Advanced', 25, 5, 'Heat mat, cards', 'Low', 'Replace USB-C port assembly.', 'TR'),
('T025', 'Samsung Galaxy', 'Camera', 'Samsung Camera replacement', '2 - Advanced', 30, 6, 'Torque driver, cards', 'Medium', 'Replace camera module; test all functions.', 'TR'),
('T026', 'Samsung Galaxy', 'Audio', 'Samsung Speaker replacement', '2 - Advanced', 20, 4, 'Torque driver, cards', 'Low', 'Replace speaker assembly; test audio.', 'TR'),
('T027', 'Samsung Galaxy', 'Logic Board', 'Samsung Logic Board repair', '3 - Board-level', 100, 12, 'Microscope, hot air, multimeter', 'High', 'Component-level repair; power management.', 'TR'),

-- iPad Repairs
('T031', 'iPad', 'Battery', 'iPad Battery replacement', '2 - Advanced', 40, 8, 'Isopropyl, cards', 'Medium', 'Remove screen safely; lift cells; reseal.', 'PR'),
('T032', 'iPad', 'Display', 'iPad Display replacement', '2 - Advanced', 45, 10, 'Heat mat, suction cups', 'Medium', 'Remove display; replace with new unit.', 'PR'),
('T033', 'iPad', 'Home Button', 'iPad Home Button replacement', '2 - Advanced', 30, 6, 'Torque driver, adhesive', 'Low', 'Replace home button; test Touch ID.', 'PR'),
('T034', 'iPad', 'Charging', 'iPad Lightning port replacement', '2 - Advanced', 35, 6, 'Heat mat, cards', 'Medium', 'Replace Lightning port assembly.', 'PR'),
('T035', 'iPad', 'Audio', 'iPad Speaker replacement', '2 - Advanced', 25, 5, 'Torque driver, cards', 'Low', 'Replace speaker assembly; test audio.', 'PR'),
('T036', 'iPad', 'Logic Board', 'iPad Logic Board repair', '3 - Board-level', 120, 15, 'Microscope, hot air, multimeter', 'High', 'Component-level repair; power management.', 'PR'),

-- MacBook Repairs
('T041', 'MacBook', 'Keyboard', 'MacBook Keyboard replacement', '2 - Advanced', 120, 10, 'Rivet kit, drivers', 'Medium', 'Split top case; transfer rivets/screws; backlight check.', 'PR'),
('T042', 'MacBook', 'Display', 'MacBook Display replacement', '2 - Advanced', 90, 8, 'Torque driver, adhesive', 'Medium', 'Replace display assembly; test all functions.', 'PR'),
('T043', 'MacBook', 'Logic Board', 'MacBook Logic Board repair', '3 - Board-level', 180, 20, 'Microscope, hot air, BGA rework', 'High', 'Component-level repair; power management.', 'PR'),
('T044', 'MacBook', 'Power', 'MacBook MagSafe port replacement', '2 - Advanced', 60, 8, 'Torque driver, cards', 'Medium', 'Replace MagSafe port assembly.', 'PR'),
('T045', 'MacBook', 'Storage', 'MacBook SSD replacement', '2 - Advanced', 45, 6, 'Torque driver, cards', 'Low', 'Replace SSD; restore from backup.', 'PR'),
('T046', 'MacBook', 'Audio', 'MacBook Speaker replacement', '2 - Advanced', 40, 6, 'Torque driver, cards', 'Low', 'Replace speaker assembly; test audio.', 'PR'),

-- Gaming Console Repairs
('T060', 'PlayStation', 'HDMI', 'PlayStation HDMI port replacement', '3 - Board-level', 75, 10, 'Hot air, microscope', 'High', 'Hot air + iron; pad repair; retimer check.', 'TR'),
('T061', 'PlayStation', 'Power', 'PlayStation Power supply replacement', '2 - Advanced', 30, 6, 'Torque driver, cards', 'Medium', 'Replace power supply unit.', 'TR'),
('T062', 'PlayStation', 'Storage', 'PlayStation HDD/SSD replacement', '2 - Advanced', 25, 4, 'Torque driver, cards', 'Low', 'Replace storage drive; reinstall OS.', 'TR'),
('T063', 'Xbox', 'HDMI', 'Xbox HDMI port replacement', '3 - Board-level', 75, 10, 'Hot air, microscope', 'High', 'Hot air + iron; pad repair; retimer check.', 'TR'),
('T064', 'Xbox', 'Power', 'Xbox Power supply replacement', '2 - Advanced', 30, 6, 'Torque driver, cards', 'Medium', 'Replace power supply unit.', 'TR'),
('T065', 'Xbox', 'Storage', 'Xbox HDD/SSD replacement', '2 - Advanced', 25, 4, 'Torque driver, cards', 'Low', 'Replace storage drive; reinstall OS.', 'TR'),
('T066', 'Nintendo Switch', 'Joy-Con', 'Nintendo Switch Joy-Con repair', '2 - Advanced', 45, 8, 'Torque driver, ribbon cables', 'Medium', 'Fix drift, replace buttons, test all functions.', 'TR'),
('T067', 'Nintendo Switch', 'Display', 'Nintendo Switch Screen replacement', '2 - Advanced', 40, 6, 'Heat mat, cards', 'Medium', 'Replace screen; test touch functionality.', 'TR'),
('T068', 'Nintendo Switch', 'Charging', 'Nintendo Switch USB-C port replacement', '2 - Advanced', 35, 6, 'Heat mat, cards', 'Medium', 'Replace USB-C port assembly.', 'TR'),

-- Apple Watch Repairs
('T070', 'Apple Watch', 'Display', 'Apple Watch Screen replacement', '2 - Advanced', 45, 8, 'Heat mat, clamps', 'Medium', 'Heat separation; seal replacement; water test.', 'PR'),
('T071', 'Apple Watch', 'Battery', 'Apple Watch Battery replacement', '2 - Advanced', 35, 6, 'Heat mat, cards', 'Medium', 'Remove screen; replace battery; reseal.', 'PR'),
('T072', 'Apple Watch', 'Crown', 'Apple Watch Digital Crown replacement', '2 - Advanced', 30, 6, 'Torque driver, cards', 'Medium', 'Replace Digital Crown; test rotation and press.', 'PR'),
('T073', 'Apple Watch', 'Band', 'Apple Watch Band replacement', '1 - Swap-level', 5, 2, 'Band tool', 'Low', 'Replace watch band; test secure attachment.', 'PR'),

-- Windows Laptop Repairs
('T052', 'Windows Laptop', 'Power', 'Laptop DC jack replacement', '2 - Advanced', 45, 6, 'Iron, wick, flux', 'Medium', 'Desolder/solder jack; strain relief.', 'TR'),
('T053', 'Windows Laptop', 'Keyboard', 'Laptop Keyboard replacement', '2 - Advanced', 60, 8, 'Torque driver, ribbon cables', 'Low', 'Remove keyboard; replace with new unit.', 'TR'),
('T054', 'Windows Laptop', 'Display', 'Laptop Display replacement', '2 - Advanced', 50, 6, 'Torque driver, adhesive', 'Low', 'Replace display panel; test all functions.', 'TR'),
('T055', 'Windows Laptop', 'Storage', 'Laptop HDD/SSD replacement', '2 - Advanced', 30, 4, 'Torque driver, cards', 'Low', 'Replace storage drive; reinstall OS.', 'TR'),
('T056', 'Windows Laptop', 'Memory', 'Laptop RAM replacement', '1 - Swap-level', 15, 3, 'Torque driver, cards', 'Low', 'Replace RAM modules; test memory.', 'TR'),
('T057', 'Windows Laptop', 'Audio', 'Laptop Speaker replacement', '2 - Advanced', 35, 5, 'Torque driver, cards', 'Low', 'Replace speaker assembly; test audio.', 'TR'),
('T058', 'Windows Laptop', 'Logic Board', 'Laptop Logic Board repair', '3 - Board-level', 120, 15, 'Microscope, hot air, multimeter', 'High', 'Component-level repair; power management.', 'TR'),

-- Android Phone Repairs
('T080', 'Android Phone', 'Display', 'Android Display replacement', '2 - Advanced', 35, 6, 'Heat mat, cards', 'Medium', 'Replace display assembly; test touch.', 'TR'),
('T081', 'Android Phone', 'Battery', 'Android Battery replacement', '2 - Advanced', 25, 5, 'Heat mat, cards', 'Medium', 'Remove back cover; replace battery.', 'TR'),
('T082', 'Android Phone', 'Charging', 'Android USB-C port replacement', '2 - Advanced', 20, 4, 'Heat mat, cards', 'Low', 'Replace USB-C port assembly.', 'TR'),
('T083', 'Android Phone', 'Camera', 'Android Camera replacement', '2 - Advanced', 25, 5, 'Torque driver, cards', 'Medium', 'Replace camera module; test all functions.', 'TR'),
('T084', 'Android Phone', 'Audio', 'Android Speaker replacement', '2 - Advanced', 20, 4, 'Torque driver, cards', 'Low', 'Replace speaker assembly; test audio.', 'TR'),

-- Tablet Repairs
('T090', 'Tablet', 'Display', 'Android Tablet Display replacement', '2 - Advanced', 40, 6, 'Heat mat, cards', 'Medium', 'Replace display assembly; test touch.', 'TR'),
('T091', 'Tablet', 'Battery', 'Android Tablet Battery replacement', '2 - Advanced', 35, 6, 'Heat mat, cards', 'Medium', 'Remove back cover; replace battery.', 'TR'),
('T092', 'Tablet', 'Charging', 'Android Tablet USB-C port replacement', '2 - Advanced', 25, 4, 'Heat mat, cards', 'Low', 'Replace USB-C port assembly.', 'TR'),

-- Smartwatch Repairs
('T100', 'Smartwatch', 'Display', 'Android Smartwatch Screen replacement', '2 - Advanced', 40, 6, 'Heat mat, cards', 'Medium', 'Replace screen; test touch functionality.', 'TR'),
('T101', 'Smartwatch', 'Battery', 'Android Smartwatch Battery replacement', '2 - Advanced', 30, 5, 'Heat mat, cards', 'Medium', 'Remove back cover; replace battery.', 'TR'),
('T102', 'Smartwatch', 'Band', 'Smartwatch Band replacement', '1 - Swap-level', 5, 2, 'Band tool', 'Low', 'Replace watch band; test secure attachment.', 'TR'),

-- Safety & Advanced
('T110', 'Safety', 'Electrical', 'Mains isolation & capacitor discharge', '2 - Advanced', 15, 5, 'Insulated tools, HV resistor', 'High', 'LOTO; verify isolation; discharge HV caps.', 'Both'),
('T111', 'Safety', 'Chemical', 'Battery disposal & recycling', '1 - Swap-level', 10, 3, 'Safety container, gloves', 'Medium', 'Properly dispose of damaged batteries.', 'Both'),
('T112', 'Safety', 'Environmental', 'Workspace ventilation & air quality', '1 - Swap-level', 5, 2, 'Air quality monitor', 'Low', 'Check ventilation; monitor air quality.', 'Both'),

-- Diagnostic & Testing
('T120', 'Diagnostic', 'Software', 'Device diagnostics & testing', '1 - Swap-level', 15, 5, 'Diagnostic software, cables', 'Low', 'Run comprehensive device diagnostics.', 'Both'),
('T121', 'Diagnostic', 'Hardware', 'Component testing & verification', '2 - Advanced', 20, 6, 'Multimeter, oscilloscope', 'Low', 'Test individual components; verify functionality.', 'Both'),
('T122', 'Diagnostic', 'Performance', 'Performance benchmarking', '2 - Advanced', 25, 8, 'Benchmark software, thermal camera', 'Low', 'Run performance tests; check thermal behavior.', 'Both'),

-- Data Recovery
('T130', 'Data Recovery', 'Software', 'Data backup & recovery', '2 - Advanced', 60, 10, 'Data recovery software, cables', 'Medium', 'Backup data; recover from damaged devices.', 'Both'),
('T131', 'Data Recovery', 'Hardware', 'Storage device repair', '3 - Board-level', 90, 12, 'Microscope, hot air, data recovery tools', 'High', 'Repair damaged storage devices; recover data.', 'Both'),

-- Custom & Specialized
('T140', 'Custom', 'Modification', 'Device modification & customization', '3 - Board-level', 120, 15, 'Custom tools, specialized equipment', 'High', 'Custom modifications; specialized repairs.', 'Both'),
('T141', 'Custom', 'Prototype', 'Prototype development & testing', '3 - Board-level', 180, 20, 'Prototyping tools, test equipment', 'High', 'Develop and test new repair techniques.', 'Both')
ON CONFLICT (id) DO NOTHING;

-- Insert sample assessments
INSERT INTO assessments (id, tech_id, task_id, level, observed, supervised, unsupervised_pass_90, rework_90, avg_time, last_performed, assessed_by, assessment_date) VALUES
-- PR Team assessments
('A001', 'PR001', 'T010', 5, 10, 5, 8, 0, 22, '2024-01-15', 'Admin', '2024-01-15'),
('A002', 'PR001', 'T012', 5, 12, 6, 10, 1, 28, '2024-01-10', 'Admin', '2024-01-10'),
('A003', 'PR002', 'T031', 4, 8, 4, 6, 0, 38, '2024-01-12', 'Admin', '2024-01-12'),
('A004', 'PR003', 'T041', 5, 15, 8, 12, 1, 115, '2024-01-08', 'Admin', '2024-01-08'),
('A005', 'PR004', 'T070', 4, 6, 3, 5, 0, 42, '2024-01-14', 'Admin', '2024-01-14'),

-- TR Team assessments
('A006', 'TR001', 'T021', 5, 10, 5, 8, 0, 38, '2024-01-13', 'Admin', '2024-01-13'),
('A007', 'TR001', 'T023', 4, 8, 4, 6, 1, 28, '2024-01-11', 'Admin', '2024-01-11'),
('A008', 'TR002', 'T080', 4, 7, 3, 5, 0, 33, '2024-01-09', 'Admin', '2024-01-09'),
('A009', 'TR003', 'T060', 5, 12, 6, 10, 1, 72, '2024-01-07', 'Admin', '2024-01-07'),
('A010', 'TR004', 'T052', 4, 9, 4, 7, 0, 42, '2024-01-06', 'Admin', '2024-01-06'),

-- Some stale assessments for testing reminders
('A011', 'PR005', 'T010', 2, 3, 2, 1, 0, 35, '2023-10-15', 'Admin', '2023-10-15'),
('A012', 'TR005', 'T021', 2, 2, 1, 1, 0, 45, '2023-11-20', 'Admin', '2023-11-20')
ON CONFLICT (id) DO NOTHING;
