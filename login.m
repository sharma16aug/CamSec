log = inputdlg({'username','password'},'login',1);
if strcmp(log(1),'admin')==1
    if strcmp(log(2),'admin')==1
        TRAIN
    end
elseif strcmp(log(1),'gaurd')==1
    if strcmp(log(2),'gaurd')==1
        GAURD
    end
else
    warndlg('Invalid Input');
end
