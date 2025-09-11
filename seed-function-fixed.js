async function seedEverything(){
  if(!confirm('Reset and seed complete workshop system? This will clear existing data.')) return;
  try {
    // Clear existing data
    await supabase.from('assessments').delete().neq('id', '');
    await supabase.from('technicians').delete().neq('id', '');
    await supabase.from('tasks').delete().neq('id', '');
    await supabase.from('teams').delete().neq('id', '');
    
    // Insert teams
    const { error: teamsError } = await supabase
      .from('teams')
      .insert([
        {id: 'PR', name: 'PR Team', type: 'PR', description: 'Premium Repair Team - Apple devices, MacBooks, iPads, iPhones'},
        {id: 'TR', name: 'TR Team', type: 'TR', description: 'Technical Repair Team - Android, Samsung, Gaming consoles, Windows laptops'}
      ]);
    
    if (teamsError) throw teamsError;
    
    // Insert technicians
    const technicians = [
      {id: 'PR001', name: 'PR Technician 1', team: 'PR', location: 'Workshop A', role: 'Senior Tech', notes: 'iPhone specialist'},
      {id: 'PR002', name: 'PR Technician 2', team: 'PR', location: 'Workshop A', role: 'Tech', notes: 'iPad specialist'},
      {id: 'PR003', name: 'PR Technician 3', team: 'PR', location: 'Workshop B', role: 'Senior Tech', notes: 'MacBook specialist'},
      {id: 'PR004', name: 'PR Technician 4', team: 'PR', location: 'Workshop B', role: 'Tech', notes: 'Apple Watch specialist'},
      {id: 'PR005', name: 'PR Technician 5', team: 'PR', location: 'Workshop A', role: 'Junior Tech', notes: 'Learning iPhone repairs'},
      {id: 'PR006', name: 'PR Technician 6', team: 'PR', location: 'Workshop B', role: 'Junior Tech', notes: 'Learning MacBook repairs'},
      {id: 'TR001', name: 'TR Technician 1', team: 'TR', location: 'Workshop C', role: 'Senior Tech', notes: 'Samsung specialist'},
      {id: 'TR002', name: 'TR Technician 2', team: 'TR', location: 'Workshop C', role: 'Tech', notes: 'Android specialist'},
      {id: 'TR003', name: 'TR Technician 3', team: 'TR', location: 'Workshop D', role: 'Senior Tech', notes: 'Gaming console specialist'},
      {id: 'TR004', name: 'TR Technician 4', team: 'TR', location: 'Workshop D', role: 'Tech', notes: 'Windows laptop specialist'},
      {id: 'TR005', name: 'TR Technician 5', team: 'TR', location: 'Workshop C', role: 'Junior Tech', notes: 'Learning Android repairs'},
      {id: 'TR006', name: 'TR Technician 6', team: 'TR', location: 'Workshop D', role: 'Junior Tech', notes: 'Learning console repairs'}
    ];
    
    const { error: techsError } = await supabase.from('technicians').insert(technicians);
    if (techsError) throw techsError;
    
    // Insert comprehensive repair tasks
    const tasks = [
      // Core Safety & Process
      {id: 'T001', category: 'Core', subcategory: 'Safety/Process', name: 'ESD compliance & safe workspace', tier: '1 - Swap-level', target_mins: 3, qc_checks: 3, tools: 'ESD mat, strap', risk: 'Low', description: 'Set up ESD, verify ground, inspect tools.', team: 'Both'},
      {id: 'T002', category: 'Core', subcategory: 'Safety/Process', name: 'Tool calibration & maintenance', tier: '1 - Swap-level', target_mins: 10, qc_checks: 5, tools: 'Calibration kit', risk: 'Low', description: 'Check torque drivers, multimeters, hot air stations.', team: 'Both'},
      {id: 'T003', category: 'Core', subcategory: 'Safety/Process', name: 'Workspace organization & cleanup', tier: '1 - Swap-level', target_mins: 5, qc_checks: 3, tools: 'Cleaning supplies', risk: 'Low', description: 'Organize tools, clean workspace, dispose waste properly.', team: 'Both'},
      
      // iPhone Repairs
      {id: 'T010', category: 'iPhone', subcategory: 'Battery', name: 'iPhone Battery replacement (no error)', tier: '2 - Advanced', target_mins: 25, qc_checks: 8, tools: 'Diagnostic battery, torque driver', risk: 'Low', description: 'Use diagnostic battery/programmer where lawful; calibrate.', team: 'PR'},
      {id: 'T011', category: 'iPhone', subcategory: 'Battery', name: 'iPhone Battery replacement (with error)', tier: '2 - Advanced', target_mins: 35, qc_checks: 10, tools: 'Programmer, diagnostic battery', risk: 'Medium', description: 'Clear battery error codes; calibrate new battery.', team: 'PR'},
      {id: 'T012', category: 'iPhone', subcategory: 'Display', name: 'iPhone Display replacement + True Tone', tier: '2 - Advanced', target_mins: 30, qc_checks: 10, tools: 'Programmer', risk: 'Low', description: 'Restore True Tone, dust control.', team: 'PR'},
      {id: 'T013', category: 'iPhone', subcategory: 'Display', name: 'iPhone Back glass replacement', tier: '2 - Advanced', target_mins: 45, qc_checks: 8, tools: 'Heat mat, cards, laser', risk: 'Medium', description: 'Remove back glass; replace with new unit.', team: 'PR'},
      {id: 'T014', category: 'iPhone', subcategory: 'Camera', name: 'iPhone Camera replacement', tier: '2 - Advanced', target_mins: 35, qc_checks: 8, tools: 'Torque driver, camera tester', risk: 'Medium', description: 'Replace camera module; test all functions.', team: 'PR'},
      {id: 'T015', category: 'iPhone', subcategory: 'Camera', name: 'iPhone Camera lens replacement', tier: '2 - Advanced', target_mins: 20, qc_checks: 5, tools: 'Heat mat, cards', risk: 'Low', description: 'Replace cracked camera lens.', team: 'PR'},
      {id: 'T016', category: 'iPhone', subcategory: 'Charging', name: 'iPhone Lightning port replacement', tier: '2 - Advanced', target_mins: 30, qc_checks: 6, tools: 'Heat mat, cards', risk: 'Medium', description: 'Replace Lightning port assembly.', team: 'PR'},
      {id: 'T017', category: 'iPhone', subcategory: 'Audio', name: 'iPhone Speaker replacement', tier: '2 - Advanced', target_mins: 25, qc_checks: 5, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace speaker assembly; test audio.', team: 'PR'},
      {id: 'T018', category: 'iPhone', subcategory: 'Audio', name: 'iPhone Microphone replacement', tier: '2 - Advanced', target_mins: 20, qc_checks: 5, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace microphone assembly; test recording.', team: 'PR'},
      {id: 'T019', category: 'iPhone', subcategory: 'Logic Board', name: 'iPhone Logic Board repair', tier: '3 - Board-level', target_mins: 120, qc_checks: 15, tools: 'Microscope, hot air, multimeter', risk: 'High', description: 'Component-level repair; power management.', team: 'PR'},
      {id: 'T020', category: 'iPhone', subcategory: 'Logic Board', name: 'iPhone Water damage repair', tier: '3 - Board-level', target_mins: 90, qc_checks: 12, tools: 'Ultrasonic cleaner, microscope', risk: 'High', description: 'Clean corrosion; replace damaged components.', team: 'PR'},
      
      // Samsung Galaxy Repairs
      {id: 'T021', category: 'Samsung Galaxy', subcategory: 'Display', name: 'Samsung AMOLED + FP calibration', tier: '2 - Advanced', target_mins: 40, qc_checks: 8, tools: 'Service app/jig', risk: 'Medium', description: 'Replace AMOLED; run fingerprint calibration.', team: 'TR'},
      {id: 'T022', category: 'Samsung Galaxy', subcategory: 'Display', name: 'Samsung Back glass replacement', tier: '2 - Advanced', target_mins: 35, qc_checks: 6, tools: 'Heat mat, cards', risk: 'Medium', description: 'Remove back glass; replace with new unit.', team: 'TR'},
      {id: 'T023', category: 'Samsung Galaxy', subcategory: 'Battery', name: 'Samsung Battery replacement', tier: '2 - Advanced', target_mins: 30, qc_checks: 6, tools: 'Heat mat, cards', risk: 'Medium', description: 'Remove back glass; replace battery.', team: 'TR'},
      {id: 'T024', category: 'Samsung Galaxy', subcategory: 'Charging', name: 'Samsung Charging port replacement', tier: '2 - Advanced', target_mins: 25, qc_checks: 5, tools: 'Heat mat, cards', risk: 'Low', description: 'Replace USB-C port assembly.', team: 'TR'},
      {id: 'T025', category: 'Samsung Galaxy', subcategory: 'Camera', name: 'Samsung Camera replacement', tier: '2 - Advanced', target_mins: 30, qc_checks: 6, tools: 'Torque driver, cards', risk: 'Medium', description: 'Replace camera module; test all functions.', team: 'TR'},
      {id: 'T026', category: 'Samsung Galaxy', subcategory: 'Audio', name: 'Samsung Speaker replacement', tier: '2 - Advanced', target_mins: 20, qc_checks: 4, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace speaker assembly; test audio.', team: 'TR'},
      {id: 'T027', category: 'Samsung Galaxy', subcategory: 'Logic Board', name: 'Samsung Logic Board repair', tier: '3 - Board-level', target_mins: 100, qc_checks: 12, tools: 'Microscope, hot air, multimeter', risk: 'High', description: 'Component-level repair; power management.', team: 'TR'},
      
      // iPad Repairs
      {id: 'T031', category: 'iPad', subcategory: 'Battery', name: 'iPad Battery replacement', tier: '2 - Advanced', target_mins: 40, qc_checks: 8, tools: 'Isopropyl, cards', risk: 'Medium', description: 'Remove screen safely; lift cells; reseal.', team: 'PR'},
      {id: 'T032', category: 'iPad', subcategory: 'Display', name: 'iPad Display replacement', tier: '2 - Advanced', target_mins: 45, qc_checks: 10, tools: 'Heat mat, suction cups', risk: 'Medium', description: 'Remove display; replace with new unit.', team: 'PR'},
      {id: 'T033', category: 'iPad', subcategory: 'Home Button', name: 'iPad Home Button replacement', tier: '2 - Advanced', target_mins: 30, qc_checks: 6, tools: 'Torque driver, adhesive', risk: 'Low', description: 'Replace home button; test Touch ID.', team: 'PR'},
      {id: 'T034', category: 'iPad', subcategory: 'Charging', name: 'iPad Lightning port replacement', tier: '2 - Advanced', target_mins: 35, qc_checks: 6, tools: 'Heat mat, cards', risk: 'Medium', description: 'Replace Lightning port assembly.', team: 'PR'},
      {id: 'T035', category: 'iPad', subcategory: 'Audio', name: 'iPad Speaker replacement', tier: '2 - Advanced', target_mins: 25, qc_checks: 5, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace speaker assembly; test audio.', team: 'PR'},
      {id: 'T036', category: 'iPad', subcategory: 'Logic Board', name: 'iPad Logic Board repair', tier: '3 - Board-level', target_mins: 120, qc_checks: 15, tools: 'Microscope, hot air, multimeter', risk: 'High', description: 'Component-level repair; power management.', team: 'PR'},
      
      // MacBook Repairs
      {id: 'T041', category: 'MacBook', subcategory: 'Keyboard', name: 'MacBook Keyboard replacement', tier: '2 - Advanced', target_mins: 120, qc_checks: 10, tools: 'Rivet kit, drivers', risk: 'Medium', description: 'Split top case; transfer rivets/screws; backlight check.', team: 'PR'},
      {id: 'T042', category: 'MacBook', subcategory: 'Display', name: 'MacBook Display replacement', tier: '2 - Advanced', target_mins: 90, qc_checks: 8, tools: 'Torque driver, adhesive', risk: 'Medium', description: 'Replace display assembly; test all functions.', team: 'PR'},
      {id: 'T043', category: 'MacBook', subcategory: 'Logic Board', name: 'MacBook Logic Board repair', tier: '3 - Board-level', target_mins: 180, qc_checks: 20, tools: 'Microscope, hot air, BGA rework', risk: 'High', description: 'Component-level repair; power management.', team: 'PR'},
      {id: 'T044', category: 'MacBook', subcategory: 'Power', name: 'MacBook MagSafe port replacement', tier: '2 - Advanced', target_mins: 60, qc_checks: 8, tools: 'Torque driver, cards', risk: 'Medium', description: 'Replace MagSafe port assembly.', team: 'PR'},
      {id: 'T045', category: 'MacBook', subcategory: 'Storage', name: 'MacBook SSD replacement', tier: '2 - Advanced', target_mins: 45, qc_checks: 6, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace SSD; restore from backup.', team: 'PR'},
      {id: 'T046', category: 'MacBook', subcategory: 'Audio', name: 'MacBook Speaker replacement', tier: '2 - Advanced', target_mins: 40, qc_checks: 6, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace speaker assembly; test audio.', team: 'PR'},
      
      // Gaming Console Repairs
      {id: 'T060', category: 'PlayStation', subcategory: 'HDMI', name: 'PlayStation HDMI port replacement', tier: '3 - Board-level', target_mins: 75, qc_checks: 10, tools: 'Hot air, microscope', risk: 'High', description: 'Hot air + iron; pad repair; retimer check.', team: 'TR'},
      {id: 'T061', category: 'PlayStation', subcategory: 'Power', name: 'PlayStation Power supply replacement', tier: '2 - Advanced', target_mins: 30, qc_checks: 6, tools: 'Torque driver, cards', risk: 'Medium', description: 'Replace power supply unit.', team: 'TR'},
      {id: 'T062', category: 'PlayStation', subcategory: 'Storage', name: 'PlayStation HDD/SSD replacement', tier: '2 - Advanced', target_mins: 25, qc_checks: 4, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace storage drive; reinstall OS.', team: 'TR'},
      {id: 'T063', category: 'Xbox', subcategory: 'HDMI', name: 'Xbox HDMI port replacement', tier: '3 - Board-level', target_mins: 75, qc_checks: 10, tools: 'Hot air, microscope', risk: 'High', description: 'Hot air + iron; pad repair; retimer check.', team: 'TR'},
      {id: 'T064', category: 'Xbox', subcategory: 'Power', name: 'Xbox Power supply replacement', tier: '2 - Advanced', target_mins: 30, qc_checks: 6, tools: 'Torque driver, cards', risk: 'Medium', description: 'Replace power supply unit.', team: 'TR'},
      {id: 'T065', category: 'Xbox', subcategory: 'Storage', name: 'Xbox HDD/SSD replacement', tier: '2 - Advanced', target_mins: 25, qc_checks: 4, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace storage drive; reinstall OS.', team: 'TR'},
      {id: 'T066', category: 'Nintendo Switch', subcategory: 'Joy-Con', name: 'Nintendo Switch Joy-Con repair', tier: '2 - Advanced', target_mins: 45, qc_checks: 8, tools: 'Torque driver, ribbon cables', risk: 'Medium', description: 'Fix drift, replace buttons, test all functions.', team: 'TR'},
      {id: 'T067', category: 'Nintendo Switch', subcategory: 'Display', name: 'Nintendo Switch Screen replacement', tier: '2 - Advanced', target_mins: 40, qc_checks: 6, tools: 'Heat mat, cards', risk: 'Medium', description: 'Replace screen; test touch functionality.', team: 'TR'},
      {id: 'T068', category: 'Nintendo Switch', subcategory: 'Charging', name: 'Nintendo Switch USB-C port replacement', tier: '2 - Advanced', target_mins: 35, qc_checks: 6, tools: 'Heat mat, cards', risk: 'Medium', description: 'Replace USB-C port assembly.', team: 'TR'},
      
      // Apple Watch Repairs
      {id: 'T070', category: 'Apple Watch', subcategory: 'Display', name: 'Apple Watch Screen replacement', tier: '2 - Advanced', target_mins: 45, qc_checks: 8, tools: 'Heat mat, clamps', risk: 'Medium', description: 'Heat separation; seal replacement; water test.', team: 'PR'},
      {id: 'T071', category: 'Apple Watch', subcategory: 'Battery', name: 'Apple Watch Battery replacement', tier: '2 - Advanced', target_mins: 35, qc_checks: 6, tools: 'Heat mat, cards', risk: 'Medium', description: 'Remove screen; replace battery; reseal.', team: 'PR'},
      {id: 'T072', category: 'Apple Watch', subcategory: 'Crown', name: 'Apple Watch Digital Crown replacement', tier: '2 - Advanced', target_mins: 30, qc_checks: 6, tools: 'Torque driver, cards', risk: 'Medium', description: 'Replace Digital Crown; test rotation and press.', team: 'PR'},
      {id: 'T073', category: 'Apple Watch', subcategory: 'Band', name: 'Apple Watch Band replacement', tier: '1 - Swap-level', target_mins: 5, qc_checks: 2, tools: 'Band tool', risk: 'Low', description: 'Replace watch band; test secure attachment.', team: 'PR'},
      
      // Windows Laptop Repairs
      {id: 'T052', category: 'Windows Laptop', subcategory: 'Power', name: 'Laptop DC jack replacement', tier: '2 - Advanced', target_mins: 45, qc_checks: 6, tools: 'Iron, wick, flux', risk: 'Medium', description: 'Desolder/solder jack; strain relief.', team: 'TR'},
      {id: 'T053', category: 'Windows Laptop', subcategory: 'Keyboard', name: 'Laptop Keyboard replacement', tier: '2 - Advanced', target_mins: 60, qc_checks: 8, tools: 'Torque driver, ribbon cables', risk: 'Low', description: 'Remove keyboard; replace with new unit.', team: 'TR'},
      {id: 'T054', category: 'Windows Laptop', subcategory: 'Display', name: 'Laptop Display replacement', tier: '2 - Advanced', target_mins: 50, qc_checks: 6, tools: 'Torque driver, adhesive', risk: 'Low', description: 'Replace display panel; test all functions.', team: 'TR'},
      {id: 'T055', category: 'Windows Laptop', subcategory: 'Storage', name: 'Laptop HDD/SSD replacement', tier: '2 - Advanced', target_mins: 30, qc_checks: 4, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace storage drive; reinstall OS.', team: 'TR'},
      {id: 'T056', category: 'Windows Laptop', subcategory: 'Memory', name: 'Laptop RAM replacement', tier: '1 - Swap-level', target_mins: 15, qc_checks: 3, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace RAM modules; test memory.', team: 'TR'},
      {id: 'T057', category: 'Windows Laptop', subcategory: 'Audio', name: 'Laptop Speaker replacement', tier: '2 - Advanced', target_mins: 35, qc_checks: 5, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace speaker assembly; test audio.', team: 'TR'},
      {id: 'T058', category: 'Windows Laptop', subcategory: 'Logic Board', name: 'Laptop Logic Board repair', tier: '3 - Board-level', target_mins: 120, qc_checks: 15, tools: 'Microscope, hot air, multimeter', risk: 'High', description: 'Component-level repair; power management.', team: 'TR'},
      
      // Android Phone Repairs
      {id: 'T080', category: 'Android Phone', subcategory: 'Display', name: 'Android Display replacement', tier: '2 - Advanced', target_mins: 35, qc_checks: 6, tools: 'Heat mat, cards', risk: 'Medium', description: 'Replace display assembly; test touch.', team: 'TR'},
      {id: 'T081', category: 'Android Phone', subcategory: 'Battery', name: 'Android Battery replacement', tier: '2 - Advanced', target_mins: 25, qc_checks: 5, tools: 'Heat mat, cards', risk: 'Medium', description: 'Remove back cover; replace battery.', team: 'TR'},
      {id: 'T082', category: 'Android Phone', subcategory: 'Charging', name: 'Android USB-C port replacement', tier: '2 - Advanced', target_mins: 20, qc_checks: 4, tools: 'Heat mat, cards', risk: 'Low', description: 'Replace USB-C port assembly.', team: 'TR'},
      {id: 'T083', category: 'Android Phone', subcategory: 'Camera', name: 'Android Camera replacement', tier: '2 - Advanced', target_mins: 25, qc_checks: 5, tools: 'Torque driver, cards', risk: 'Medium', description: 'Replace camera module; test all functions.', team: 'TR'},
      {id: 'T084', category: 'Android Phone', subcategory: 'Audio', name: 'Android Speaker replacement', tier: '2 - Advanced', target_mins: 20, qc_checks: 4, tools: 'Torque driver, cards', risk: 'Low', description: 'Replace speaker assembly; test audio.', team: 'TR'},
      
      // Tablet Repairs
      {id: 'T090', category: 'Tablet', subcategory: 'Display', name: 'Android Tablet Display replacement', tier: '2 - Advanced', target_mins: 40, qc_checks: 6, tools: 'Heat mat, cards', risk: 'Medium', description: 'Replace display assembly; test touch.', team: 'TR'},
      {id: 'T091', category: 'Tablet', subcategory: 'Battery', name: 'Android Tablet Battery replacement', tier: '2 - Advanced', target_mins: 35, qc_checks: 6, tools: 'Heat mat, cards', risk: 'Medium', description: 'Remove back cover; replace battery.', team: 'TR'},
      {id: 'T092', category: 'Tablet', subcategory: 'Charging', name: 'Android Tablet USB-C port replacement', tier: '2 - Advanced', target_mins: 25, qc_checks: 4, tools: 'Heat mat, cards', risk: 'Low', description: 'Replace USB-C port assembly.', team: 'TR'},
      
      // Smartwatch Repairs
      {id: 'T100', category: 'Smartwatch', subcategory: 'Display', name: 'Android Smartwatch Screen replacement', tier: '2 - Advanced', target_mins: 40, qc_checks: 6, tools: 'Heat mat, cards', risk: 'Medium', description: 'Replace screen; test touch functionality.', team: 'TR'},
      {id: 'T101', category: 'Smartwatch', subcategory: 'Battery', name: 'Android Smartwatch Battery replacement', tier: '2 - Advanced', target_mins: 30, qc_checks: 5, tools: 'Heat mat, cards', risk: 'Medium', description: 'Remove back cover; replace battery.', team: 'TR'},
      {id: 'T102', category: 'Smartwatch', subcategory: 'Band', name: 'Smartwatch Band replacement', tier: '1 - Swap-level', target_mins: 5, qc_checks: 2, tools: 'Band tool', risk: 'Low', description: 'Replace watch band; test secure attachment.', team: 'TR'},
      
      // Safety & Advanced
      {id: 'T110', category: 'Safety', subcategory: 'Electrical', name: 'Mains isolation & capacitor discharge', tier: '2 - Advanced', target_mins: 15, qc_checks: 5, tools: 'Insulated tools, HV resistor', risk: 'High', description: 'LOTO; verify isolation; discharge HV caps.', team: 'Both'},
      {id: 'T111', category: 'Safety', subcategory: 'Chemical', name: 'Battery disposal & recycling', tier: '1 - Swap-level', target_mins: 10, qc_checks: 3, tools: 'Safety container, gloves', risk: 'Medium', description: 'Properly dispose of damaged batteries.', team: 'Both'},
      {id: 'T112', category: 'Safety', subcategory: 'Environmental', name: 'Workspace ventilation & air quality', tier: '1 - Swap-level', target_mins: 5, qc_checks: 2, tools: 'Air quality monitor', risk: 'Low', description: 'Check ventilation; monitor air quality.', team: 'Both'},
      
      // Diagnostic & Testing
      {id: 'T120', category: 'Diagnostic', subcategory: 'Software', name: 'Device diagnostics & testing', tier: '1 - Swap-level', target_mins: 15, qc_checks: 5, tools: 'Diagnostic software, cables', risk: 'Low', description: 'Run comprehensive device diagnostics.', team: 'Both'},
      {id: 'T121', category: 'Diagnostic', subcategory: 'Hardware', name: 'Component testing & verification', tier: '2 - Advanced', target_mins: 20, qc_checks: 6, tools: 'Multimeter, oscilloscope', risk: 'Low', description: 'Test individual components; verify functionality.', team: 'Both'},
      {id: 'T122', category: 'Diagnostic', subcategory: 'Performance', name: 'Performance benchmarking', tier: '2 - Advanced', target_mins: 25, qc_checks: 8, tools: 'Benchmark software, thermal camera', risk: 'Low', description: 'Run performance tests; check thermal behavior.', team: 'Both'},
      
      // Data Recovery
      {id: 'T130', category: 'Data Recovery', subcategory: 'Software', name: 'Data backup & recovery', tier: '2 - Advanced', target_mins: 60, qc_checks: 10, tools: 'Data recovery software, cables', risk: 'Medium', description: 'Backup data; recover from damaged devices.', team: 'Both'},
      {id: 'T131', category: 'Data Recovery', subcategory: 'Hardware', name: 'Storage device repair', tier: '3 - Board-level', target_mins: 90, qc_checks: 12, tools: 'Microscope, hot air, data recovery tools', risk: 'High', description: 'Repair damaged storage devices; recover data.', team: 'Both'},
      
      // Custom & Specialized
      {id: 'T140', category: 'Custom', subcategory: 'Modification', name: 'Device modification & customization', tier: '3 - Board-level', target_mins: 120, qc_checks: 15, tools: 'Custom tools, specialized equipment', risk: 'High', description: 'Custom modifications; specialized repairs.', team: 'Both'},
      {id: 'T141', category: 'Custom', subcategory: 'Prototype', name: 'Prototype development & testing', tier: '3 - Board-level', target_mins: 180, qc_checks: 20, tools: 'Prototyping tools, test equipment', risk: 'High', description: 'Develop and test new repair techniques.', team: 'Both'}
    ];
    
    const { error: tasksError } = await supabase.from('tasks').insert(tasks);
    if (tasksError) throw tasksError;
    
    // Insert sample assessments
    const assessments = [
      // PR Team assessments
      {id: 'A001', tech_id: 'PR001', task_id: 'T010', level: 5, observed: 10, supervised: 5, unsupervised_pass_90: 8, rework_90: 0, avg_time: 22, last_performed: '2024-01-15', assessed_by: 'Admin', assessment_date: '2024-01-15'},
      {id: 'A002', tech_id: 'PR001', task_id: 'T012', level: 5, observed: 12, supervised: 6, unsupervised_pass_90: 10, rework_90: 1, avg_time: 28, last_performed: '2024-01-10', assessed_by: 'Admin', assessment_date: '2024-01-10'},
      {id: 'A003', tech_id: 'PR002', task_id: 'T031', level: 4, observed: 8, supervised: 4, unsupervised_pass_90: 6, rework_90: 0, avg_time: 38, last_performed: '2024-01-12', assessed_by: 'Admin', assessment_date: '2024-01-12'},
      {id: 'A004', tech_id: 'PR003', task_id: 'T041', level: 5, observed: 15, supervised: 8, unsupervised_pass_90: 12, rework_90: 1, avg_time: 115, last_performed: '2024-01-08', assessed_by: 'Admin', assessment_date: '2024-01-08'},
      {id: 'A005', tech_id: 'PR004', task_id: 'T070', level: 4, observed: 6, supervised: 3, unsupervised_pass_90: 5, rework_90: 0, avg_time: 42, last_performed: '2024-01-14', assessed_by: 'Admin', assessment_date: '2024-01-14'},
      
      // TR Team assessments
      {id: 'A006', tech_id: 'TR001', task_id: 'T021', level: 5, observed: 10, supervised: 5, unsupervised_pass_90: 8, rework_90: 0, avg_time: 38, last_performed: '2024-01-13', assessed_by: 'Admin', assessment_date: '2024-01-13'},
      {id: 'A007', tech_id: 'TR001', task_id: 'T023', level: 4, observed: 8, supervised: 4, unsupervised_pass_90: 6, rework_90: 1, avg_time: 28, last_performed: '2024-01-11', assessed_by: 'Admin', assessment_date: '2024-01-11'},
      {id: 'A008', tech_id: 'TR002', task_id: 'T080', level: 4, observed: 7, supervised: 3, unsupervised_pass_90: 5, rework_90: 0, avg_time: 33, last_performed: '2024-01-09', assessed_by: 'Admin', assessment_date: '2024-01-09'},
      {id: 'A009', tech_id: 'TR003', task_id: 'T060', level: 5, observed: 12, supervised: 6, unsupervised_pass_90: 10, rework_90: 1, avg_time: 72, last_performed: '2024-01-07', assessed_by: 'Admin', assessment_date: '2024-01-07'},
      {id: 'A010', tech_id: 'TR004', task_id: 'T052', level: 4, observed: 9, supervised: 4, unsupervised_pass_90: 7, rework_90: 0, avg_time: 42, last_performed: '2024-01-06', assessed_by: 'Admin', assessment_date: '2024-01-06'},
      
      // Some stale assessments for testing reminders
      {id: 'A011', tech_id: 'PR005', task_id: 'T010', level: 2, observed: 3, supervised: 2, unsupervised_pass_90: 1, rework_90: 0, avg_time: 35, last_performed: '2023-10-15', assessed_by: 'Admin', assessment_date: '2023-10-15'},
      {id: 'A012', tech_id: 'TR005', task_id: 'T021', level: 2, observed: 2, supervised: 1, unsupervised_pass_90: 1, rework_90: 0, avg_time: 45, last_performed: '2023-11-20', assessed_by: 'Admin', assessment_date: '2023-11-20'}
    ];
    
    const { error: assessError } = await supabase.from('assessments').insert(assessments);
    if (assessError) throw assessError;
    
    alert('Complete workshop system seeded successfully!\n\n✅ 2 Teams (PR & TR)\n✅ 12 Technicians\n✅ 50+ Repair Tasks\n✅ 12 Sample Assessments\n\nData is now stored in Supabase database!');
  } catch (error) {
    alert('Error seeding system: ' + error.message);
  }
}
