validCOM = 0;
while(validCOM == 0)
    %Keep asking for COM port until a valid port is given
    answer = input('What COM port is the DSP on?\nYou can check the port from the command line with MODE.com\nIt is probably the highest number port.\n' );
    try
        C8X_DEBUG('init', answer, 3) %Initialize C8X to selected port, skips the valid flag set if there is an error.
        validCOM = 1;
    catch
    end
end

C8X_DEBUG('run', 'MatLabDSPTesting.out'); %Load the binary on the 

while(answer ~= -1)
    answer = input('Set volume multiplier. Integer valued. -1 to exit.\n');
    try
        C8X_DEBUG('wis',answer,'_soundEnable',1) %Write the value to the variable soundEnable
    catch
    end
end
  
disp('Reset the DSP befor running the script again.')