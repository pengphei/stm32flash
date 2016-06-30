#
# main building script
#

Import('genv')

parsers_script = "parsers/SConscript"
parsers_files = genv.SConscript(parsers_script)
genv.Install(genv["out"], parsers_files)

stm32flash_script = "src/SConscript"
stm32flash_files = genv.SConscript(stm32flash_script)
genv.Install(genv["out"], stm32flash_files)
