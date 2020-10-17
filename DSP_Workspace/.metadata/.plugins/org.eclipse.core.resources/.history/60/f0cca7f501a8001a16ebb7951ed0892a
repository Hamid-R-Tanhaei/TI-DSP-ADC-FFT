################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

CG_TOOL_ROOT := C:/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS

GEN_OPTS__FLAG := 
GEN_CMDS__FLAG := 

ORDERED_OBJS += \
"./main.obj" \
"./Source/DSP2803x_CSMPasswords.obj" \
"./Source/DSP2803x_CodeStartBranch.obj" \
"./Source/DSP2803x_CpuTimers.obj" \
"./Source/DSP2803x_DefaultIsr.obj" \
"./Source/DSP2803x_GlobalVariableDefs.obj" \
"./Source/DSP2803x_PieCtrl.obj" \
"./Source/DSP2803x_PieVect.obj" \
"./Source/DSP2803x_SysCtrl.obj" \
"./Source/DSP2803x_usDelay.obj" \
"../DSP2803x_Headers_nonBIOS.cmd" \
"../F28033.cmd" \
$(GEN_CMDS__FLAG) \
-llibc.a \

-include ../makefile.init

RM := DEL /F
RMDIR := RMDIR /S/Q

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir_vars.mk
-include Source/subdir_vars.mk
-include subdir_rules.mk
-include Source/subdir_rules.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C55_DEPS)),)
-include $(C55_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(S67_DEPS)),)
-include $(S67_DEPS)
endif
ifneq ($(strip $(S62_DEPS)),)
-include $(S62_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(OPT_DEPS)),)
-include $(OPT_DEPS)
endif
ifneq ($(strip $(C??_DEPS)),)
-include $(C??_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(S??_DEPS)),)
-include $(S??_DEPS)
endif
ifneq ($(strip $(C64_DEPS)),)
-include $(C64_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(S64_DEPS)),)
-include $(S64_DEPS)
endif
ifneq ($(strip $(INO_DEPS)),)
-include $(INO_DEPS)
endif
ifneq ($(strip $(CLA_DEPS)),)
-include $(CLA_DEPS)
endif
ifneq ($(strip $(S55_DEPS)),)
-include $(S55_DEPS)
endif
ifneq ($(strip $(SV7A_DEPS)),)
-include $(SV7A_DEPS)
endif
ifneq ($(strip $(C62_DEPS)),)
-include $(C62_DEPS)
endif
ifneq ($(strip $(C67_DEPS)),)
-include $(C67_DEPS)
endif
ifneq ($(strip $(PDE_DEPS)),)
-include $(PDE_DEPS)
endif
ifneq ($(strip $(K_DEPS)),)
-include $(K_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C43_DEPS)),)
-include $(C43_DEPS)
endif
ifneq ($(strip $(S43_DEPS)),)
-include $(S43_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(SA_DEPS)),)
-include $(SA_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXE_OUTPUTS += \
DSP_ADC_FFT.out \

EXE_OUTPUTS__QUOTED += \
"DSP_ADC_FFT.out" \

BIN_OUTPUTS += \
DSP_ADC_FFT.hex \

BIN_OUTPUTS__QUOTED += \
"DSP_ADC_FFT.hex" \


# All Target
all: $(OBJS) $(CMD_SRCS) $(GEN_CMDS)
	@$(MAKE) --no-print-directory -Onone "DSP_ADC_FFT.out"

# Tool invocations
DSP_ADC_FFT.out: $(OBJS) $(CMD_SRCS) $(GEN_CMDS)
	@echo 'Building target: "$@"'
	@echo 'Invoking: C2000 Linker'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla0 -O3 --advice:performance=all -g --diag_warning=225 --diag_wrap=off --display_error_number -z -m"DSP_ADC_FFT.map" --stack_size=0x300 --warn_sections -i"C:/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/lib" -i"C:/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/include" --reread_libs --diag_wrap=off --display_error_number --xml_link_info="DSP_ADC_FFT_linkInfo.xml" --rom_model -o "DSP_ADC_FFT.out" $(ORDERED_OBJS)
	@echo 'Finished building target: "$@"'
	@echo ' '

DSP_ADC_FFT.hex: $(EXE_OUTPUTS)
	@echo 'Building files: $(strip $(EXE_OUTPUTS__QUOTED))'
	@echo 'Invoking: C2000 Hex Utility'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.6.LTS/bin/hex2000" --memwidth=16 --romwidth=16 --intel -o "DSP_ADC_FFT.hex" $(EXE_OUTPUTS__QUOTED)
	@echo 'Finished building: $(strip $(EXE_OUTPUTS__QUOTED))'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(BIN_OUTPUTS__QUOTED)$(EXE_OUTPUTS__QUOTED)
	-$(RM) "main.obj" "Source\DSP2803x_CSMPasswords.obj" "Source\DSP2803x_CodeStartBranch.obj" "Source\DSP2803x_CpuTimers.obj" "Source\DSP2803x_DefaultIsr.obj" "Source\DSP2803x_GlobalVariableDefs.obj" "Source\DSP2803x_PieCtrl.obj" "Source\DSP2803x_PieVect.obj" "Source\DSP2803x_SysCtrl.obj" "Source\DSP2803x_usDelay.obj" 
	-$(RM) "main.d" "Source\DSP2803x_CpuTimers.d" "Source\DSP2803x_DefaultIsr.d" "Source\DSP2803x_GlobalVariableDefs.d" "Source\DSP2803x_PieCtrl.d" "Source\DSP2803x_PieVect.d" "Source\DSP2803x_SysCtrl.d" 
	-$(RM) "Source\DSP2803x_CSMPasswords.d" "Source\DSP2803x_CodeStartBranch.d" "Source\DSP2803x_usDelay.d" 
	-@echo 'Finished clean'
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

