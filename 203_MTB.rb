####我来试试git功能

##MTB电话
if ARG[0] == 1 then
   startNum = :200_P_Telephone1:
   SVAL0 = rdstr(300, startNum, 0, 20, 99, 0)
   DISP_VAL = SVAL0
end

##MTB输入
if ARG[0] == 8
   if :200_A_MaintainSetFocus: == 4 then
      startNum = :200_P_MaintainDate:
      wrstr(300,startNum,0,20,400,99,0)
   end   
   if :200_A_MaintainSetFocus: == 5
      startNum = :200_P_MaintainNo:
      wrstr(300,startNum,0,20,400,99,0)
   end   
end

##MTB机床类型
if ARG[0] == 9 then
   startNum = :200_P_MaintainType:
   SVAL0 = rdstr(300, startNum, 0, 20, 99, 0)
   DISP_VAL = SVAL0
end

##MTB出厂日期
if ARG[0] == 10 then
   startNum = :200_P_MaintainDate:
   SVAL0 = rdstr(300, startNum, 0, 20, 99, 0)
   DISP_VAL = SVAL0
end

##MTB机床编号
if ARG[0] == 11 then
   startNum = :200_P_MaintainNo:
   SVAL0 = rdstr(300, startNum, 0, 20, 99, 0)
   DISP_VAL = SVAL0
end

##MTB热线电话
if ARG[0] == 12 then
   startNum = :200_P_MaintainHotline:
   SVAL0 = rdstr(300, startNum, 0, 20, 99, 0)
   DISP_VAL = SVAL0
end

##版本号
if ARG[0] == 20
        begin
                SVAL0 = ""
                sMsg = ""
                nErrorPara = 0

                nPara8661 = rdparam(8661, 0, 6)
                if nPara8661 != 50
                        nErrorPara = 1
                        sMsg = sMsg + "No.8661请设50       "
                end
                nPara8662 = rdparam(8662, 0, 6)
                if nPara8662 != 13
                        nErrorPara = 1
                        sMsg = sMsg + "No.8662请设13       "
                end
                nPara8781 = rdparam(8781, 0, 5)
                if nPara8781 != 92
                        nErrorPara = 1
                        sMsg = sMsg + "No.8781请设92       "
                end
                nPara9050 = rdparam(9050, 0, 5)
                if nPara9050 != 1
                        nErrorPara = 1
                        sMsg = sMsg + "No.9050请设1        "
                end
                nPara9054 = rdparam(9054, 0, 9)
                if nPara9054 < 20000
                        nErrorPara = 1
                        sMsg = sMsg + "No.9054请设20000    "
                end

                if nErrorPara == 1
                        raise sMsg
                end

                #[20000] = :200_S_Vertion:
                if #[20000] != #[20001]
                        raise "宏执行器版本不匹配  "
                end

                :200_A_PreCheck: = 1
                :200_A_HandlerNum: = 201
                if :200_A_First: == 0 && :200_AK_NoCallScreen: == 0
                        set_handlerasync(901,2,:200_S_Delay:,0,0)
                        :200_A_First: = 1
                end

        rescue Exception => e
                SVAL0 = e.message
        ensure
                DISP_VAL = SVAL0
        end
end