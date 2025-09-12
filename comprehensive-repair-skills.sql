-- Comprehensive Repair Skills for Full Repair Center
-- All technicians can learn all skills - teams are for specialization focus only

-- First, update existing tasks to be available to all teams
UPDATE tasks SET team = 'Both' WHERE team IN ('PR', 'TR');

-- Insert comprehensive repair skills covering all device types
INSERT INTO tasks (id, category, subcategory, name, tier, target_mins, qc_checks, tools, risk, description, team) VALUES

-- ===== CORE FOUNDATION SKILLS =====
('C001', 'Core', 'Safety', 'ESD compliance & safe workspace setup', '1 - Foundation', 5, 3, 'ESD mat, strap, grounding tester', 'Low', 'Set up ESD workstation, verify ground, inspect tools for safety.', 'Both'),
('C002', 'Core', 'Safety', 'Tool calibration & maintenance', '1 - Foundation', 15, 5, 'Calibration kit, multimeter', 'Low', 'Check torque drivers, multimeters, hot air stations, soldering irons.', 'Both'),
('C003', 'Core', 'Safety', 'Workspace organization & cleanup', '1 - Foundation', 10, 3, 'Cleaning supplies, organization tools', 'Low', 'Organize tools, clean workspace, dispose waste properly, maintain 5S.', 'Both'),
('C004', 'Core', 'Safety', 'Chemical safety & handling', '1 - Foundation', 20, 5, 'Safety data sheets, PPE', 'Medium', 'Handle isopropyl alcohol, flux, adhesives safely with proper PPE.', 'Both'),
('C005', 'Core', 'Safety', 'Battery disposal & recycling', '1 - Foundation', 10, 3, 'Safety container, gloves, fire extinguisher', 'Medium', 'Properly dispose of damaged batteries, follow environmental regulations.', 'Both'),
('C006', 'Core', 'Safety', 'Mains isolation & capacitor discharge', '2 - Advanced', 20, 8, 'Insulated tools, HV resistor, LOTO kit', 'High', 'LOTO procedures, verify isolation, discharge HV capacitors safely.', 'Both'),

-- ===== DIAGNOSTIC & TESTING =====
('D001', 'Diagnostic', 'Software', 'Device diagnostics & testing', '1 - Foundation', 20, 5, 'Diagnostic software, cables, test fixtures', 'Low', 'Run comprehensive device diagnostics, identify issues.', 'Both'),
('D002', 'Diagnostic', 'Hardware', 'Component testing & verification', '2 - Advanced', 30, 8, 'Multimeter, oscilloscope, logic analyzer', 'Low', 'Test individual components, verify functionality, measure signals.', 'Both'),
('D003', 'Diagnostic', 'Performance', 'Performance benchmarking', '2 - Advanced', 25, 6, 'Benchmark software, thermal camera, power meter', 'Low', 'Run performance tests, check thermal behavior, power consumption.', 'Both'),
('D004', 'Diagnostic', 'Network', 'Network connectivity testing', '1 - Foundation', 15, 4, 'Network tools, cables, test devices', 'Low', 'Test WiFi, Bluetooth, cellular connectivity, network protocols.', 'Both'),
('D005', 'Diagnostic', 'Audio', 'Audio system testing', '1 - Foundation', 15, 4, 'Audio test equipment, test files', 'Low', 'Test speakers, microphones, audio quality, noise levels.', 'Both'),
('D006', 'Diagnostic', 'Display', 'Display quality testing', '1 - Foundation', 20, 5, 'Color calibration tools, test patterns', 'Low', 'Test display brightness, color accuracy, touch sensitivity, dead pixels.', 'Both'),

-- ===== SMARTPHONE REPAIRS =====
-- iPhone Series
('P001', 'iPhone', 'Battery', 'iPhone Battery replacement (standard)', '2 - Advanced', 25, 8, 'Diagnostic battery, torque driver, adhesive', 'Low', 'Replace iPhone battery, calibrate, test charging cycles.', 'Both'),
('P002', 'iPhone', 'Battery', 'iPhone Battery replacement (with errors)', '3 - Expert', 40, 12, 'Programmer, diagnostic tools, calibration kit', 'Medium', 'Clear battery error codes, calibrate new battery, restore functionality.', 'Both'),
('P003', 'iPhone', 'Display', 'iPhone Display replacement + True Tone', '2 - Advanced', 35, 10, 'Programmer, True Tone calibrator, dust control', 'Low', 'Replace display, restore True Tone, maintain dust-free environment.', 'Both'),
('P004', 'iPhone', 'Display', 'iPhone Back glass replacement', '3 - Expert', 60, 12, 'Heat mat, cards, laser, precision tools', 'Medium', 'Remove back glass safely, replace with new unit, maintain water resistance.', 'Both'),
('P005', 'iPhone', 'Camera', 'iPhone Camera replacement', '2 - Advanced', 30, 8, 'Torque driver, camera tester, alignment tools', 'Medium', 'Replace camera module, test all functions, ensure proper alignment.', 'Both'),
('P006', 'iPhone', 'Camera', 'iPhone Camera lens replacement', '2 - Advanced', 20, 6, 'Heat mat, precision tools, lens cleaner', 'Low', 'Replace cracked camera lens, clean internal components.', 'Both'),
('P007', 'iPhone', 'Charging', 'iPhone Lightning port replacement', '2 - Advanced', 35, 8, 'Heat mat, precision tools, port cleaner', 'Medium', 'Replace Lightning port assembly, test charging and data transfer.', 'Both'),
('P008', 'iPhone', 'Audio', 'iPhone Speaker replacement', '2 - Advanced', 25, 6, 'Torque driver, audio tester', 'Low', 'Replace speaker assembly, test audio quality and volume.', 'Both'),
('P009', 'iPhone', 'Audio', 'iPhone Microphone replacement', '2 - Advanced', 20, 6, 'Torque driver, microphone tester', 'Low', 'Replace microphone assembly, test recording quality.', 'Both'),
('P010', 'iPhone', 'Logic Board', 'iPhone Logic Board repair', '4 - Master', 180, 25, 'Microscope, hot air station, BGA tools', 'High', 'Component-level repair, power management, data recovery.', 'Both'),
('P011', 'iPhone', 'Logic Board', 'iPhone Water damage repair', '4 - Master', 120, 20, 'Ultrasonic cleaner, microscope, corrosion treatment', 'High', 'Clean corrosion, replace damaged components, restore functionality.', 'Both'),
('P012', 'iPhone', 'Wireless', 'iPhone Wireless charging repair', '2 - Advanced', 30, 8, 'Wireless charger tester, precision tools', 'Medium', 'Repair wireless charging coil, test charging efficiency.', 'Both'),

-- Samsung Galaxy Series
('P021', 'Samsung Galaxy', 'Display', 'Samsung AMOLED + FP calibration', '3 - Expert', 45, 12, 'Service app, fingerprint jig, calibration tools', 'Medium', 'Replace AMOLED display, run fingerprint calibration, test touch.', 'Both'),
('P022', 'Samsung Galaxy', 'Display', 'Samsung Back glass replacement', '3 - Expert', 50, 10, 'Heat mat, precision tools, laser', 'Medium', 'Remove back glass, replace with new unit, maintain design integrity.', 'Both'),
('P023', 'Samsung Galaxy', 'Battery', 'Samsung Battery replacement', '2 - Advanced', 35, 8, 'Heat mat, precision tools, battery tester', 'Medium', 'Remove back glass, replace battery, test charging cycles.', 'Both'),
('P024', 'Samsung Galaxy', 'Charging', 'Samsung USB-C port replacement', '2 - Advanced', 30, 6, 'Heat mat, precision tools, port cleaner', 'Low', 'Replace USB-C port assembly, test charging and data transfer.', 'Both'),
('P025', 'Samsung Galaxy', 'Camera', 'Samsung Camera replacement', '2 - Advanced', 35, 8, 'Torque driver, camera tester, alignment tools', 'Medium', 'Replace camera module, test all functions, ensure proper alignment.', 'Both'),
('P026', 'Samsung Galaxy', 'Audio', 'Samsung Speaker replacement', '2 - Advanced', 25, 6, 'Torque driver, audio tester', 'Low', 'Replace speaker assembly, test audio quality and volume.', 'Both'),
('P027', 'Samsung Galaxy', 'Logic Board', 'Samsung Logic Board repair', '4 - Master', 150, 20, 'Microscope, hot air station, BGA tools', 'High', 'Component-level repair, power management, data recovery.', 'Both'),
('P028', 'Samsung Galaxy', 'Wireless', 'Samsung Wireless charging repair', '2 - Advanced', 30, 8, 'Wireless charger tester, precision tools', 'Medium', 'Repair wireless charging coil, test charging efficiency.', 'Both'),

-- Google Pixel Series
('P031', 'Google Pixel', 'Display', 'Pixel Display replacement', '2 - Advanced', 30, 8, 'Heat mat, precision tools, display tester', 'Medium', 'Replace Pixel display, test touch sensitivity and color accuracy.', 'Both'),
('P032', 'Google Pixel', 'Battery', 'Pixel Battery replacement', '2 - Advanced', 25, 6, 'Heat mat, precision tools, battery tester', 'Low', 'Replace Pixel battery, test charging cycles and battery health.', 'Both'),
('P033', 'Google Pixel', 'Camera', 'Pixel Camera replacement', '2 - Advanced', 30, 8, 'Torque driver, camera tester, alignment tools', 'Medium', 'Replace camera module, test all functions, ensure proper alignment.', 'Both'),

-- OnePlus Series
('P041', 'OnePlus', 'Display', 'OnePlus Display replacement', '2 - Advanced', 30, 8, 'Heat mat, precision tools, display tester', 'Medium', 'Replace OnePlus display, test touch sensitivity and refresh rate.', 'Both'),
('P042', 'OnePlus', 'Battery', 'OnePlus Battery replacement', '2 - Advanced', 25, 6, 'Heat mat, precision tools, battery tester', 'Low', 'Replace OnePlus battery, test fast charging capabilities.', 'Both'),

-- ===== TABLET REPAIRS =====
-- iPad Series
('T001', 'iPad', 'Battery', 'iPad Battery replacement', '3 - Expert', 60, 15, 'Isopropyl alcohol, precision tools, adhesive', 'Medium', 'Remove screen safely, lift battery cells, reseal with proper adhesive.', 'Both'),
('T002', 'iPad', 'Display', 'iPad Display replacement', '3 - Expert', 75, 18, 'Heat mat, suction cups, precision tools', 'Medium', 'Remove display assembly, replace with new unit, test all functions.', 'Both'),
('T003', 'iPad', 'Home Button', 'iPad Home Button replacement', '2 - Advanced', 40, 10, 'Torque driver, adhesive, Touch ID tester', 'Low', 'Replace home button, test Touch ID functionality.', 'Both'),
('T004', 'iPad', 'Charging', 'iPad Lightning port replacement', '2 - Advanced', 45, 10, 'Heat mat, precision tools, port cleaner', 'Medium', 'Replace Lightning port assembly, test charging and data transfer.', 'Both'),
('T005', 'iPad', 'Audio', 'iPad Speaker replacement', '2 - Advanced', 30, 8, 'Torque driver, audio tester', 'Low', 'Replace speaker assembly, test audio quality and volume.', 'Both'),
('T006', 'iPad', 'Logic Board', 'iPad Logic Board repair', '4 - Master', 180, 25, 'Microscope, hot air station, BGA tools', 'High', 'Component-level repair, power management, data recovery.', 'Both'),

-- Android Tablets
('T011', 'Android Tablet', 'Display', 'Android Tablet Display replacement', '2 - Advanced', 50, 12, 'Heat mat, precision tools, display tester', 'Medium', 'Replace Android tablet display, test touch sensitivity.', 'Both'),
('T012', 'Android Tablet', 'Battery', 'Android Tablet Battery replacement', '2 - Advanced', 45, 10, 'Heat mat, precision tools, battery tester', 'Medium', 'Remove back cover, replace battery, test charging cycles.', 'Both'),
('T013', 'Android Tablet', 'Charging', 'Android Tablet USB-C port replacement', '2 - Advanced', 30, 8, 'Heat mat, precision tools, port cleaner', 'Low', 'Replace USB-C port assembly, test charging and data transfer.', 'Both'),

-- ===== LAPTOP REPAIRS =====
-- MacBook Series
('L001', 'MacBook', 'Keyboard', 'MacBook Keyboard replacement', '3 - Expert', 150, 20, 'Rivet kit, precision drivers, backlight tester', 'Medium', 'Split top case, transfer rivets and screws, test backlight functionality.', 'Both'),
('L002', 'MacBook', 'Display', 'MacBook Display replacement', '3 - Expert', 120, 15, 'Torque driver, adhesive, display tester', 'Medium', 'Replace display assembly, test all functions and color accuracy.', 'Both'),
('L003', 'MacBook', 'Logic Board', 'MacBook Logic Board repair', '4 - Master', 240, 30, 'Microscope, hot air station, BGA rework station', 'High', 'Component-level repair, power management, data recovery.', 'Both'),
('L004', 'MacBook', 'Power', 'MacBook MagSafe port replacement', '2 - Advanced', 75, 12, 'Torque driver, precision tools, port tester', 'Medium', 'Replace MagSafe port assembly, test charging functionality.', 'Both'),
('L005', 'MacBook', 'Storage', 'MacBook SSD replacement', '2 - Advanced', 60, 10, 'Torque driver, precision tools, data migration tools', 'Low', 'Replace SSD, restore from backup, test performance.', 'Both'),
('L006', 'MacBook', 'Audio', 'MacBook Speaker replacement', '2 - Advanced', 50, 10, 'Torque driver, audio tester', 'Low', 'Replace speaker assembly, test audio quality and volume.', 'Both'),
('L007', 'MacBook', 'Trackpad', 'MacBook Trackpad replacement', '3 - Expert', 90, 15, 'Precision tools, trackpad tester', 'Medium', 'Replace trackpad assembly, test multi-touch functionality.', 'Both'),

-- Windows Laptops
('L011', 'Windows Laptop', 'Power', 'Laptop DC jack replacement', '3 - Expert', 60, 12, 'Soldering iron, wick, flux, strain relief', 'Medium', 'Desolder/solder DC jack, add strain relief, test charging.', 'Both'),
('L012', 'Windows Laptop', 'Keyboard', 'Laptop Keyboard replacement', '2 - Advanced', 75, 12, 'Torque driver, ribbon cable tools', 'Low', 'Remove keyboard assembly, replace with new unit, test all keys.', 'Both'),
('L013', 'Windows Laptop', 'Display', 'Laptop Display replacement', '2 - Advanced', 60, 10, 'Torque driver, adhesive, display tester', 'Low', 'Replace display panel, test all functions and color accuracy.', 'Both'),
('L014', 'Windows Laptop', 'Storage', 'Laptop HDD/SSD replacement', '1 - Foundation', 30, 6, 'Torque driver, data migration tools', 'Low', 'Replace storage drive, reinstall OS, migrate data.', 'Both'),
('L015', 'Windows Laptop', 'Memory', 'Laptop RAM replacement', '1 - Foundation', 20, 4, 'Torque driver, memory tester', 'Low', 'Replace RAM modules, test memory functionality.', 'Both'),
('L016', 'Windows Laptop', 'Audio', 'Laptop Speaker replacement', '2 - Advanced', 45, 8, 'Torque driver, audio tester', 'Low', 'Replace speaker assembly, test audio quality and volume.', 'Both'),
('L017', 'Windows Laptop', 'Logic Board', 'Laptop Logic Board repair', '4 - Master', 180, 25, 'Microscope, hot air station, BGA tools', 'High', 'Component-level repair, power management, data recovery.', 'Both'),
('L018', 'Windows Laptop', 'Cooling', 'Laptop Cooling system repair', '2 - Advanced', 60, 10, 'Thermal paste, cleaning tools, temperature tester', 'Medium', 'Clean fans, replace thermal paste, test cooling efficiency.', 'Both'),

-- ===== GAMING CONSOLE REPAIRS =====
-- PlayStation Series
('G001', 'PlayStation', 'HDMI', 'PlayStation HDMI port replacement', '4 - Master', 120, 20, 'Hot air station, microscope, BGA tools', 'High', 'Hot air + iron work, pad repair, retimer chip replacement.', 'Both'),
('G002', 'PlayStation', 'Power', 'PlayStation Power supply replacement', '2 - Advanced', 45, 10, 'Torque driver, power tester', 'Medium', 'Replace power supply unit, test power delivery.', 'Both'),
('G003', 'PlayStation', 'Storage', 'PlayStation HDD/SSD replacement', '1 - Foundation', 30, 6, 'Torque driver, data migration tools', 'Low', 'Replace storage drive, reinstall OS, migrate data.', 'Both'),
('G004', 'PlayStation', 'Optical', 'PlayStation Disc drive replacement', '3 - Expert', 90, 15, 'Precision tools, disc drive tester', 'Medium', 'Replace optical disc drive, test disc reading functionality.', 'Both'),
('G005', 'PlayStation', 'Controller', 'PlayStation Controller repair', '2 - Advanced', 45, 10, 'Precision tools, controller tester', 'Low', 'Repair analog sticks, buttons, triggers, test all functions.', 'Both'),

-- Xbox Series
('G011', 'Xbox', 'HDMI', 'Xbox HDMI port replacement', '4 - Master', 120, 20, 'Hot air station, microscope, BGA tools', 'High', 'Hot air + iron work, pad repair, retimer chip replacement.', 'Both'),
('G012', 'Xbox', 'Power', 'Xbox Power supply replacement', '2 - Advanced', 45, 10, 'Torque driver, power tester', 'Medium', 'Replace power supply unit, test power delivery.', 'Both'),
('G013', 'Xbox', 'Storage', 'Xbox HDD/SSD replacement', '1 - Foundation', 30, 6, 'Torque driver, data migration tools', 'Low', 'Replace storage drive, reinstall OS, migrate data.', 'Both'),
('G014', 'Xbox', 'Optical', 'Xbox Disc drive replacement', '3 - Expert', 90, 15, 'Precision tools, disc drive tester', 'Medium', 'Replace optical disc drive, test disc reading functionality.', 'Both'),
('G015', 'Xbox', 'Controller', 'Xbox Controller repair', '2 - Advanced', 45, 10, 'Precision tools, controller tester', 'Low', 'Repair analog sticks, buttons, triggers, test all functions.', 'Both'),

-- Nintendo Switch
('G021', 'Nintendo Switch', 'Joy-Con', 'Nintendo Switch Joy-Con repair', '3 - Expert', 60, 12, 'Precision tools, Joy-Con tester', 'Medium', 'Fix drift, replace buttons, test all functions and connectivity.', 'Both'),
('G022', 'Nintendo Switch', 'Display', 'Nintendo Switch Screen replacement', '3 - Expert', 60, 12, 'Heat mat, precision tools, display tester', 'Medium', 'Replace screen, test touch functionality and brightness.', 'Both'),
('G023', 'Nintendo Switch', 'Charging', 'Nintendo Switch USB-C port replacement', '2 - Advanced', 45, 10, 'Heat mat, precision tools, port tester', 'Medium', 'Replace USB-C port assembly, test charging and data transfer.', 'Both'),
('G024', 'Nintendo Switch', 'Dock', 'Nintendo Switch Dock repair', '2 - Advanced', 30, 8, 'Torque driver, dock tester', 'Low', 'Repair dock functionality, test video output and charging.', 'Both'),

-- ===== SMARTWATCH REPAIRS =====
-- Apple Watch
('W001', 'Apple Watch', 'Display', 'Apple Watch Screen replacement', '3 - Expert', 75, 15, 'Heat mat, precision clamps, water tester', 'Medium', 'Heat separation, seal replacement, water resistance testing.', 'Both'),
('W002', 'Apple Watch', 'Battery', 'Apple Watch Battery replacement', '3 - Expert', 60, 12, 'Heat mat, precision tools, battery tester', 'Medium', 'Remove screen, replace battery, reseal with proper adhesive.', 'Both'),
('W003', 'Apple Watch', 'Crown', 'Apple Watch Digital Crown replacement', '2 - Advanced', 45, 10, 'Torque driver, crown tester', 'Medium', 'Replace Digital Crown, test rotation and press functionality.', 'Both'),
('W004', 'Apple Watch', 'Band', 'Apple Watch Band replacement', '1 - Foundation', 10, 3, 'Band tool, band tester', 'Low', 'Replace watch band, test secure attachment and comfort.', 'Both'),

-- Android Smartwatches
('W011', 'Android Smartwatch', 'Display', 'Android Smartwatch Screen replacement', '3 - Expert', 60, 12, 'Heat mat, precision tools, display tester', 'Medium', 'Replace screen, test touch functionality and brightness.', 'Both'),
('W012', 'Android Smartwatch', 'Battery', 'Android Smartwatch Battery replacement', '3 - Expert', 45, 10, 'Heat mat, precision tools, battery tester', 'Medium', 'Remove back cover, replace battery, test charging cycles.', 'Both'),
('W013', 'Android Smartwatch', 'Band', 'Android Smartwatch Band replacement', '1 - Foundation', 10, 3, 'Band tool, band tester', 'Low', 'Replace watch band, test secure attachment and comfort.', 'Both'),

-- ===== AUDIO DEVICE REPAIRS =====
-- AirPods
('A001', 'AirPods', 'Battery', 'AirPods Battery replacement', '3 - Expert', 60, 15, 'Precision tools, battery tester, sealant', 'Medium', 'Replace AirPods battery, maintain water resistance, test charging.', 'Both'),
('A002', 'AirPods', 'Case', 'AirPods Case repair', '2 - Advanced', 45, 10, 'Precision tools, case tester', 'Medium', 'Repair charging case, test charging and connectivity.', 'Both'),
('A003', 'AirPods', 'Speaker', 'AirPods Speaker replacement', '3 - Expert', 75, 15, 'Precision tools, audio tester', 'Medium', 'Replace speaker driver, test audio quality and noise cancellation.', 'Both'),

-- Headphones
('A011', 'Headphones', 'Driver', 'Headphone Driver replacement', '3 - Expert', 90, 18, 'Precision tools, audio tester, soldering iron', 'Medium', 'Replace headphone drivers, test audio quality and frequency response.', 'Both'),
('A012', 'Headphones', 'Cable', 'Headphone Cable replacement', '2 - Advanced', 45, 10, 'Soldering iron, cable tester, strain relief', 'Low', 'Replace headphone cable, test audio and microphone functionality.', 'Both'),
('A013', 'Headphones', 'Ear Pads', 'Headphone Ear Pad replacement', '1 - Foundation', 15, 4, 'Ear pad tool, comfort tester', 'Low', 'Replace ear pads, test comfort and seal quality.', 'Both'),

-- ===== DATA RECOVERY & FORENSICS =====
('R001', 'Data Recovery', 'Software', 'Data backup & recovery', '3 - Expert', 120, 20, 'Data recovery software, cables, storage devices', 'Medium', 'Backup data, recover from damaged devices, maintain data integrity.', 'Both'),
('R002', 'Data Recovery', 'Hardware', 'Storage device repair', '4 - Master', 180, 25, 'Microscope, hot air station, data recovery tools', 'High', 'Repair damaged storage devices, recover data from failed drives.', 'Both'),
('R003', 'Data Recovery', 'Forensics', 'Digital forensics analysis', '4 - Master', 240, 30, 'Forensic tools, write blockers, analysis software', 'High', 'Analyze devices for evidence, maintain chain of custody.', 'Both'),

-- ===== CUSTOM & SPECIALIZED =====
('S001', 'Custom', 'Modification', 'Device modification & customization', '4 - Master', 180, 25, 'Custom tools, specialized equipment', 'High', 'Custom modifications, specialized repairs, unique solutions.', 'Both'),
('S002', 'Custom', 'Prototype', 'Prototype development & testing', '4 - Master', 240, 30, 'Prototyping tools, test equipment', 'High', 'Develop and test new repair techniques, create custom solutions.', 'Both'),
('S003', 'Custom', 'Waterproofing', 'Device waterproofing', '3 - Expert', 120, 20, 'Sealant, pressure tester, precision tools', 'High', 'Apply waterproofing treatments, test water resistance.', 'Both'),

-- ===== QUALITY CONTROL & TESTING =====
('Q001', 'Quality Control', 'Testing', 'Comprehensive device testing', '2 - Advanced', 60, 15, 'Test equipment, quality checklists', 'Low', 'Perform comprehensive testing, document results, ensure quality.', 'Both'),
('Q002', 'Quality Control', 'Calibration', 'Device calibration', '3 - Expert', 90, 20, 'Calibration tools, reference standards', 'Medium', 'Calibrate devices to manufacturer specifications.', 'Both'),
('Q003', 'Quality Control', 'Certification', 'Repair certification', '3 - Expert', 120, 25, 'Certification tools, documentation', 'Medium', 'Certify repairs meet industry standards, maintain records.', 'Both')

ON CONFLICT (id) DO NOTHING;

-- Update team descriptions to reflect separate companies
UPDATE teams SET description = 'PR Company - Premium Repair Services' WHERE id = 'PR';
UPDATE teams SET description = 'TR Company - Technical Repair Services' WHERE id = 'TR';
