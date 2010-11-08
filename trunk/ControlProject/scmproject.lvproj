<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="9008000">
	<Property Name="varPersistentID:{211B47DE-6E85-45E5-87D6-BE42AA46BADD}" Type="Ref">/My Computer/FPGA.lvlib/FPGA_Ref</Property>
	<Property Name="varPersistentID:{269D229A-A78A-438B-9499-F4805C7733B2}" Type="Ref">/My Computer/Servo.lvlib/Servo_Config</Property>
	<Property Name="varPersistentID:{5FFB20CE-4D78-4FBD-9FD6-3A897E152826}" Type="Ref">/My Computer/Utility.lvlib/Settings_Variable</Property>
	<Property Name="varPersistentID:{719C38D4-E9B7-431D-8C76-CB8D86C9DAEE}" Type="Ref">/My Computer/Servo.lvlib/Servo_Angles</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="PWMTest.vi" Type="VI" URL="../PWMTest.vi"/>
		<Item Name="PWM.lvlib" Type="Library" URL="../PWM.lvlib"/>
		<Item Name="Servo.lvlib" Type="Library" URL="../Servo.lvlib"/>
		<Item Name="Motor.lvlib" Type="Library" URL="../Motor.lvlib"/>
		<Item Name="Drive.lvlib" Type="Library" URL="../Drive.lvlib"/>
		<Item Name="DriveTest.vi" Type="VI" URL="../DriveTest.vi"/>
		<Item Name="FPGA.lvlib" Type="Library" URL="../FPGA.lvlib"/>
		<Item Name="Servo_test.vi" Type="VI" URL="../Servo/Servo_test.vi"/>
		<Item Name="Utility.lvlib" Type="Library" URL="../Utility.lvlib"/>
		<Item Name="RobotSettings.ini" Type="Document" URL="../RobotSettings.ini"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Merge Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Merge Errors.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
			</Item>
			<Item Name="niriosrv.dll" Type="Document" URL="niriosrv.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="scmproject.lvproj_FPGA Target_RobotFPGA.vi.lvbitx" Type="Document" URL="../FPGA Bitfiles/scmproject.lvproj_FPGA Target_RobotFPGA.vi.lvbitx"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
	<Item Name="RT CompactRIO Target" Type="RT CompactRIO">
		<Property Name="alias.name" Type="Str">RT CompactRIO Target</Property>
		<Property Name="alias.value" Type="Str">10.0.0.52</Property>
		<Property Name="CCSymbols" Type="Str">OS,VxWorks;CPU,PowerPC;TARGET_TYPE,RT;</Property>
		<Property Name="crio.family" Type="Str">901x</Property>
		<Property Name="host.ResponsivenessCheckEnabled" Type="Bool">true</Property>
		<Property Name="host.ResponsivenessCheckPingDelay" Type="UInt">5000</Property>
		<Property Name="host.ResponsivenessCheckPingTimeout" Type="UInt">1000</Property>
		<Property Name="host.TargetCPUID" Type="UInt">2</Property>
		<Property Name="host.TargetOSID" Type="UInt">14</Property>
		<Property Name="target.cleanupVisa" Type="Bool">false</Property>
		<Property Name="target.FPProtocolGlobals_ControlTimeLimit" Type="Int">300</Property>
		<Property Name="target.getDefault-&gt;WebServer.Port" Type="Int">80</Property>
		<Property Name="target.getDefault-&gt;WebServer.Timeout" Type="Int">60</Property>
		<Property Name="target.IOScan.Faults" Type="Str"></Property>
		<Property Name="target.IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="target.IOScan.Period" Type="UInt">10000</Property>
		<Property Name="target.IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="target.IOScan.Priority" Type="UInt">0</Property>
		<Property Name="target.IOScan.ReportModeConflict" Type="Bool">false</Property>
		<Property Name="target.IsRemotePanelSupported" Type="Bool">true</Property>
		<Property Name="target.RTCPULoadMonitoringEnabled" Type="Bool">true</Property>
		<Property Name="target.RTTarget.ApplicationPath" Type="Path">/c/ni-rt/startup/startup.rtexe</Property>
		<Property Name="target.RTTarget.EnableFileSharing" Type="Bool">true</Property>
		<Property Name="target.RTTarget.IPAccess" Type="Str">+*</Property>
		<Property Name="target.RTTarget.LaunchAppAtBoot" Type="Bool">false</Property>
		<Property Name="target.RTTarget.VIPath" Type="Path">/c/ni-rt/startup</Property>
		<Property Name="target.server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.server.tcp.access" Type="Str">+*</Property>
		<Property Name="target.server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="target.server.tcp.paranoid" Type="Bool">true</Property>
		<Property Name="target.server.tcp.port" Type="Int">3363</Property>
		<Property Name="target.server.tcp.serviceName" Type="Str"></Property>
		<Property Name="target.server.tcp.serviceName.default" Type="Str">Main Application Instance/VI Server</Property>
		<Property Name="target.server.vi.access" Type="Str">+*</Property>
		<Property Name="target.server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="target.server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.WebServer.Enabled" Type="Bool">false</Property>
		<Property Name="target.WebServer.LogEnabled" Type="Bool">false</Property>
		<Property Name="target.WebServer.LogPath" Type="Path">/c/ni-rt/system/www/www.log</Property>
		<Property Name="target.WebServer.Port" Type="Int">80</Property>
		<Property Name="target.WebServer.RootPath" Type="Path">/c/ni-rt/system/www</Property>
		<Property Name="target.WebServer.TcpAccess" Type="Str">c+*</Property>
		<Property Name="target.WebServer.Timeout" Type="Int">60</Property>
		<Property Name="target.WebServer.ViAccess" Type="Str">+*</Property>
		<Property Name="target.webservices.SecurityAPIKey" Type="Str">PqVr/ifkAQh+lVrdPIykXlFvg12GhhQFR8H9cUhphgg=:pTe9HRlQuMfJxAG6QCGq7UvoUpJzAzWGKy5SbZ+roSU=</Property>
		<Property Name="target.webservices.ValidTimestampWindow" Type="Int">15</Property>
		<Property Name="TargetOSID" Type="Str">VxWorks-PPC603</Property>
		<Item Name="Chassis" Type="cRIO Chassis">
			<Property Name="crio.ProgrammingMode" Type="Str">fpga</Property>
			<Property Name="crio.ResourceID" Type="Str">RIO0</Property>
			<Property Name="crio.Type" Type="Str">cRIO-9074</Property>
			<Item Name="FPGA Target" Type="FPGA Target">
				<Property Name="AutoRun" Type="Bool">false</Property>
				<Property Name="configString.guid" Type="Str">{0821C250-8D76-4365-BCA4-924EF958F1C6}resource=/crio_Mod4/DIO11;0;ReadMethodType=bool;WriteMethodType=bool{0E626545-B038-438F-A0E5-859E90F9A3C4}resource=/crio_Mod4/DIO24;0;ReadMethodType=bool;WriteMethodType=bool{1794AAE0-08C2-4681-AC51-69D42856C932}resource=/crio_Mod4/DIO23;0;ReadMethodType=bool;WriteMethodType=bool{1B347F5D-B8B5-467F-84B9-F27DB9C85357}resource=/crio_Mod4/DIO17;0;ReadMethodType=bool;WriteMethodType=bool{1C85CD82-4650-4951-A609-8759CD652FDC}resource=/crio_Mod4/DIO29;0;ReadMethodType=bool;WriteMethodType=bool{2C357E29-12D6-47DD-BA26-7FFDEB76BE1E}resource=/crio_Mod4/DIO1;0;ReadMethodType=bool;WriteMethodType=bool{350B040E-80DE-4F22-996B-5DC00CF21715}resource=/crio_Mod4/DIO18;0;ReadMethodType=bool;WriteMethodType=bool{3C94EF33-4AE2-44D4-A409-7151EFC34081}resource=/Sleep;0;ReadMethodType=bool;WriteMethodType=bool{41950625-4073-40B2-BE7A-3733DC53C7AF}resource=/crio_Mod4/DIO20;0;ReadMethodType=bool;WriteMethodType=bool{4B0ECFF0-492F-4862-B39E-4BCD4E707FE7}resource=/crio_Mod4/DIO4;0;ReadMethodType=bool;WriteMethodType=bool{52D8CE75-4FA0-4252-8331-A7B87678F7F0}resource=/crio_Mod4/DIO8;0;ReadMethodType=bool;WriteMethodType=bool{56534C7C-D675-454A-9548-2A3F02A1B8BF}resource=/FPGA LED;0;ReadMethodType=bool;WriteMethodType=bool{5C4384C1-5DEC-4CA1-B413-A0D7C2B1C903}NI 9403,Slot 4,1,cRIOModule.DigitalIOMode=0,cRIOModule.DisableArbitration=false,cRIOModule.EnableHsInput=false,cRIOModule.EnableHsOutput=false,cRIOModule.EnableSpecialtyDigital=false,cRIOModule.Initial Line Direction=11111111111111111111111111111111{5F8B7876-9C63-44F0-B025-79B818AACC78}resource=/Chassis Temperature;0;ReadMethodType=i16{6070E299-90E5-4B10-AAB2-BC638E93E52D}resource=/crio_Mod4/DIO30;0;ReadMethodType=bool;WriteMethodType=bool{61079C6C-B36F-4BA0-BDAB-16E02FCAEBB9}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000,000000;MaxFreq=40000000,000000;VariableFreq=0;NomFreq=40000000,000000;PeakPeriodJitter=250,000000;MinDutyCycle=50,000000;MaxDutyCycle=50,000000;Accuracy=100,000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E{65C5BF1F-DEBC-443B-9F5B-AF3B939F37D0}resource=/crio_Mod4/DIO31;0;ReadMethodType=bool;WriteMethodType=bool{6994E470-F247-46D5-89AC-3CE625396993}resource=/crio_Mod4/DIO13;0;ReadMethodType=bool;WriteMethodType=bool{6C89EB14-BBE5-4887-9F54-ADD1CE1B6E0E}resource=/crio_Mod4/DIO16;0;ReadMethodType=bool;WriteMethodType=bool{753CC18B-9A8C-4FC2-B048-2DAFDA1FFC5C}resource=/crio_Mod4/DIO23:16;0;ReadMethodType=u8;WriteMethodType=u8{759EA9B2-A53E-45E3-AD3E-4A6608605BD1}resource=/crio_Mod4/DIO15;0;ReadMethodType=bool;WriteMethodType=bool{88E08A98-8C8C-46BC-9119-B09C36EC8CFB}resource=/crio_Mod4/DIO26;0;ReadMethodType=bool;WriteMethodType=bool{8C74BAD0-B1D4-4543-A6D5-703402F980F2}resource=/crio_Mod4/DIO12;0;ReadMethodType=bool;WriteMethodType=bool{8DC88558-E5CE-4AC9-B6BB-3959202B24E2}resource=/Scan Clock;0;ReadMethodType=bool{977D3FE7-30AE-400B-B8BE-B8C92EF350CF}resource=/crio_Mod4/DIO27;0;ReadMethodType=bool;WriteMethodType=bool{9E81A587-DA1D-497E-BA1B-F9C4264D3862}resource=/crio_Mod4/DIO14;0;ReadMethodType=bool;WriteMethodType=bool{A614A9A5-4FEE-4FCC-8163-09C84A9DCC97}resource=/crio_Mod4/DIO22;0;ReadMethodType=bool;WriteMethodType=bool{A883106D-2F2F-46BD-8B83-3B393F15DECF}resource=/crio_Mod4/DIO2;0;ReadMethodType=bool;WriteMethodType=bool{A934D878-4B33-41D0-BF58-8A154BACC4B9}resource=/crio_Mod4/DIO9;0;ReadMethodType=bool;WriteMethodType=bool{A9CED8A9-3AEC-4DAD-85F5-1598CD3802AF}resource=/crio_Mod4/DIO31:24;0;ReadMethodType=u8;WriteMethodType=u8{AB96B328-4BE3-4800-A0B6-E59263CD6399}resource=/crio_Mod4/DIO7;0;ReadMethodType=bool;WriteMethodType=bool{B09EAD89-F57C-4C9C-A43F-797E64BCDAA1}resource=/crio_Mod4/DIO0;0;ReadMethodType=bool;WriteMethodType=bool{B27EF61F-08AD-43E0-B425-93BA262C83A7}resource=/crio_Mod4/DIO25;0;ReadMethodType=bool;WriteMethodType=bool{C0C66C24-F188-46A2-AEC7-781CF556DBE2}resource=/crio_Mod4/DIO19;0;ReadMethodType=bool;WriteMethodType=bool{C24E9322-1C5B-47EE-81E1-A336999D9BBA}resource=/System Reset;0;ReadMethodType=bool;WriteMethodType=bool{CE84AC7E-CF52-48A9-8859-739A75BB51F0}resource=/crio_Mod4/DIO15:8;0;ReadMethodType=u8;WriteMethodType=u8{D00974A4-E462-4956-91D5-AC16B2923A72}resource=/crio_Mod4/DIO21;0;ReadMethodType=bool;WriteMethodType=bool{E122E325-99A3-428A-A204-C01C95EA9528}resource=/crio_Mod4/DIO31:0;0;ReadMethodType=u32;WriteMethodType=u32{E35C9178-9190-4A1B-A578-4B28907D4B08}resource=/crio_Mod4/DIO28;0;ReadMethodType=bool;WriteMethodType=bool{E6C0AA06-ED7D-47F2-B25A-3AB6D15222AB}resource=/crio_Mod4/DIO6;0;ReadMethodType=bool;WriteMethodType=bool{ED96FCA3-17A6-4D4D-8183-811F6F40CD07}resource=/crio_Mod4/DIO5;0;ReadMethodType=bool;WriteMethodType=bool{F136638C-A286-4CE3-A48A-18CC23D8C09F}resource=/crio_Mod4/DIO10;0;ReadMethodType=bool;WriteMethodType=bool{F4CB4157-3F64-408A-A410-44DCD30C7DF4}resource=/crio_Mod4/DIO3;0;ReadMethodType=bool;WriteMethodType=bool{FF048B63-D45C-46EC-A862-EBF3DAA9F9F9}resource=/crio_Mod4/DIO7:0;0;ReadMethodType=u8;WriteMethodType=u8cRIO-9074/Clk40/falseTARGET_TYPEFPGA</Property>
				<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000,000000;MaxFreq=40000000,000000;VariableFreq=0;NomFreq=40000000,000000;PeakPeriodJitter=250,000000;MinDutyCycle=50,000000;MaxDutyCycle=50,000000;Accuracy=100,000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427EChassis Temperatureresource=/Chassis Temperature;0;ReadMethodType=i16cRIO-9074/Clk40/falseTARGET_TYPEFPGAFPGA LEDresource=/FPGA LED;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO0resource=/crio_Mod4/DIO0;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO10resource=/crio_Mod4/DIO10;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO11resource=/crio_Mod4/DIO11;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO12resource=/crio_Mod4/DIO12;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO13resource=/crio_Mod4/DIO13;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO14resource=/crio_Mod4/DIO14;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO15:8resource=/crio_Mod4/DIO15:8;0;ReadMethodType=u8;WriteMethodType=u8Mod4/DIO15resource=/crio_Mod4/DIO15;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO16resource=/crio_Mod4/DIO16;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO17resource=/crio_Mod4/DIO17;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO18resource=/crio_Mod4/DIO18;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO19resource=/crio_Mod4/DIO19;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO1resource=/crio_Mod4/DIO1;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO20resource=/crio_Mod4/DIO20;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO21resource=/crio_Mod4/DIO21;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO22resource=/crio_Mod4/DIO22;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO23:16resource=/crio_Mod4/DIO23:16;0;ReadMethodType=u8;WriteMethodType=u8Mod4/DIO23resource=/crio_Mod4/DIO23;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO24resource=/crio_Mod4/DIO24;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO25resource=/crio_Mod4/DIO25;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO26resource=/crio_Mod4/DIO26;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO27resource=/crio_Mod4/DIO27;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO28resource=/crio_Mod4/DIO28;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO29resource=/crio_Mod4/DIO29;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO2resource=/crio_Mod4/DIO2;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO30resource=/crio_Mod4/DIO30;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO31:0resource=/crio_Mod4/DIO31:0;0;ReadMethodType=u32;WriteMethodType=u32Mod4/DIO31:24resource=/crio_Mod4/DIO31:24;0;ReadMethodType=u8;WriteMethodType=u8Mod4/DIO31resource=/crio_Mod4/DIO31;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO3resource=/crio_Mod4/DIO3;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO4resource=/crio_Mod4/DIO4;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO5resource=/crio_Mod4/DIO5;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO6resource=/crio_Mod4/DIO6;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO7:0resource=/crio_Mod4/DIO7:0;0;ReadMethodType=u8;WriteMethodType=u8Mod4/DIO7resource=/crio_Mod4/DIO7;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO8resource=/crio_Mod4/DIO8;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO9resource=/crio_Mod4/DIO9;0;ReadMethodType=bool;WriteMethodType=boolMod4NI 9403,Slot 4,1,cRIOModule.DigitalIOMode=0,cRIOModule.DisableArbitration=false,cRIOModule.EnableHsInput=false,cRIOModule.EnableHsOutput=false,cRIOModule.EnableSpecialtyDigital=false,cRIOModule.Initial Line Direction=11111111111111111111111111111111Scan Clockresource=/Scan Clock;0;ReadMethodType=boolSleepresource=/Sleep;0;ReadMethodType=bool;WriteMethodType=boolSystem Resetresource=/System Reset;0;ReadMethodType=bool;WriteMethodType=bool</Property>
				<Property Name="Mode" Type="Int">0</Property>
				<Property Name="NI.LV.FPGA.CompileConfigString" Type="Str">cRIO-9074/Clk40/falseTARGET_TYPEFPGA</Property>
				<Property Name="NI.LV.FPGA.Version" Type="Int">4</Property>
				<Property Name="Resource Name" Type="Str">RIO0</Property>
				<Property Name="SWEmulationSubMode" Type="UInt">0</Property>
				<Property Name="SWEmulationVIPath" Type="Path">/D/Work/LabView/scmproject/Sim.vi</Property>
				<Property Name="Target Class" Type="Str">cRIO-9074</Property>
				<Property Name="Top-Level Timing Source" Type="Str">40 MHz Onboard Clock</Property>
				<Property Name="Top-Level Timing Source Is Default" Type="Bool">true</Property>
				<Item Name="Chassis I/O" Type="Folder">
					<Item Name="Chassis Temperature" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/Chassis Temperature</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{5F8B7876-9C63-44F0-B025-79B818AACC78}</Property>
					</Item>
					<Item Name="Sleep" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/Sleep</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{3C94EF33-4AE2-44D4-A409-7151EFC34081}</Property>
					</Item>
					<Item Name="System Reset" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/System Reset</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{C24E9322-1C5B-47EE-81E1-A336999D9BBA}</Property>
					</Item>
					<Item Name="FPGA LED" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/FPGA LED</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{56534C7C-D675-454A-9548-2A3F02A1B8BF}</Property>
					</Item>
					<Item Name="Scan Clock" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/Scan Clock</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{8DC88558-E5CE-4AC9-B6BB-3959202B24E2}</Property>
					</Item>
				</Item>
				<Item Name="Mod4" Type="Folder">
					<Item Name="Mod4/DIO0" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO0</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{B09EAD89-F57C-4C9C-A43F-797E64BCDAA1}</Property>
					</Item>
					<Item Name="Mod4/DIO1" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO1</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{2C357E29-12D6-47DD-BA26-7FFDEB76BE1E}</Property>
					</Item>
					<Item Name="Mod4/DIO2" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO2</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{A883106D-2F2F-46BD-8B83-3B393F15DECF}</Property>
					</Item>
					<Item Name="Mod4/DIO3" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO3</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{F4CB4157-3F64-408A-A410-44DCD30C7DF4}</Property>
					</Item>
					<Item Name="Mod4/DIO4" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO4</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{4B0ECFF0-492F-4862-B39E-4BCD4E707FE7}</Property>
					</Item>
					<Item Name="Mod4/DIO5" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO5</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{ED96FCA3-17A6-4D4D-8183-811F6F40CD07}</Property>
					</Item>
					<Item Name="Mod4/DIO6" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO6</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{E6C0AA06-ED7D-47F2-B25A-3AB6D15222AB}</Property>
					</Item>
					<Item Name="Mod4/DIO7" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO7</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{AB96B328-4BE3-4800-A0B6-E59263CD6399}</Property>
					</Item>
					<Item Name="Mod4/DIO8" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO8</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{52D8CE75-4FA0-4252-8331-A7B87678F7F0}</Property>
					</Item>
					<Item Name="Mod4/DIO9" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO9</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{A934D878-4B33-41D0-BF58-8A154BACC4B9}</Property>
					</Item>
					<Item Name="Mod4/DIO10" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO10</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{F136638C-A286-4CE3-A48A-18CC23D8C09F}</Property>
					</Item>
					<Item Name="Mod4/DIO11" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO11</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{0821C250-8D76-4365-BCA4-924EF958F1C6}</Property>
					</Item>
					<Item Name="Mod4/DIO12" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO12</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{8C74BAD0-B1D4-4543-A6D5-703402F980F2}</Property>
					</Item>
					<Item Name="Mod4/DIO13" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO13</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{6994E470-F247-46D5-89AC-3CE625396993}</Property>
					</Item>
					<Item Name="Mod4/DIO14" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO14</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{9E81A587-DA1D-497E-BA1B-F9C4264D3862}</Property>
					</Item>
					<Item Name="Mod4/DIO15" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO15</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{759EA9B2-A53E-45E3-AD3E-4A6608605BD1}</Property>
					</Item>
					<Item Name="Mod4/DIO16" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO16</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{6C89EB14-BBE5-4887-9F54-ADD1CE1B6E0E}</Property>
					</Item>
					<Item Name="Mod4/DIO17" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO17</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{1B347F5D-B8B5-467F-84B9-F27DB9C85357}</Property>
					</Item>
					<Item Name="Mod4/DIO18" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO18</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{350B040E-80DE-4F22-996B-5DC00CF21715}</Property>
					</Item>
					<Item Name="Mod4/DIO19" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO19</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{C0C66C24-F188-46A2-AEC7-781CF556DBE2}</Property>
					</Item>
					<Item Name="Mod4/DIO20" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO20</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{41950625-4073-40B2-BE7A-3733DC53C7AF}</Property>
					</Item>
					<Item Name="Mod4/DIO21" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO21</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{D00974A4-E462-4956-91D5-AC16B2923A72}</Property>
					</Item>
					<Item Name="Mod4/DIO22" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO22</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{A614A9A5-4FEE-4FCC-8163-09C84A9DCC97}</Property>
					</Item>
					<Item Name="Mod4/DIO23" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO23</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{1794AAE0-08C2-4681-AC51-69D42856C932}</Property>
					</Item>
					<Item Name="Mod4/DIO24" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO24</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{0E626545-B038-438F-A0E5-859E90F9A3C4}</Property>
					</Item>
					<Item Name="Mod4/DIO25" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO25</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{B27EF61F-08AD-43E0-B425-93BA262C83A7}</Property>
					</Item>
					<Item Name="Mod4/DIO26" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO26</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{88E08A98-8C8C-46BC-9119-B09C36EC8CFB}</Property>
					</Item>
					<Item Name="Mod4/DIO27" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO27</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{977D3FE7-30AE-400B-B8BE-B8C92EF350CF}</Property>
					</Item>
					<Item Name="Mod4/DIO28" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO28</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{E35C9178-9190-4A1B-A578-4B28907D4B08}</Property>
					</Item>
					<Item Name="Mod4/DIO29" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO29</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{1C85CD82-4650-4951-A609-8759CD652FDC}</Property>
					</Item>
					<Item Name="Mod4/DIO30" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO30</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{6070E299-90E5-4B10-AAB2-BC638E93E52D}</Property>
					</Item>
					<Item Name="Mod4/DIO31" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO31</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{65C5BF1F-DEBC-443B-9F5B-AF3B939F37D0}</Property>
					</Item>
					<Item Name="Mod4/DIO7:0" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO7:0</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{FF048B63-D45C-46EC-A862-EBF3DAA9F9F9}</Property>
					</Item>
					<Item Name="Mod4/DIO15:8" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO15:8</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{CE84AC7E-CF52-48A9-8859-739A75BB51F0}</Property>
					</Item>
					<Item Name="Mod4/DIO23:16" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO23:16</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{753CC18B-9A8C-4FC2-B048-2DAFDA1FFC5C}</Property>
					</Item>
					<Item Name="Mod4/DIO31:24" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO31:24</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{A9CED8A9-3AEC-4DAD-85F5-1598CD3802AF}</Property>
					</Item>
					<Item Name="Mod4/DIO31:0" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod4/DIO31:0</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{E122E325-99A3-428A-A204-C01C95EA9528}</Property>
					</Item>
				</Item>
				<Item Name="40 MHz Onboard Clock" Type="FPGA Base Clock">
					<Property Name="FPGA.PersistentID" Type="Str">{61079C6C-B36F-4BA0-BDAB-16E02FCAEBB9}</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig" Type="Str">ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000,000000;MaxFreq=40000000,000000;VariableFreq=0;NomFreq=40000000,000000;PeakPeriodJitter=250,000000;MinDutyCycle=50,000000;MaxDutyCycle=50,000000;Accuracy=100,000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.Accuracy" Type="Dbl">100</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.ClockSignalName" Type="Str">Clk40</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MaxDutyCycle" Type="Dbl">50</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MaxFrequency" Type="Dbl">40000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MinDutyCycle" Type="Dbl">50</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MinFrequency" Type="Dbl">40000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.NominalFrequency" Type="Dbl">40000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.PeakPeriodJitter" Type="Dbl">250</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.ResourceName" Type="Str">40 MHz Onboard Clock</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.SupportAndRequireRuntimeEnableDisable" Type="Bool">false</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.TopSignalConnect" Type="Str">Clk40</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.VariableFrequency" Type="Bool">false</Property>
					<Property Name="NI.LV.FPGA.Valid" Type="Bool">true</Property>
					<Property Name="NI.LV.FPGA.Version" Type="Int">4</Property>
				</Item>
				<Item Name="Mod4" Type="RIO C Series Module">
					<Property Name="crio.Calibration" Type="Str">1</Property>
					<Property Name="crio.Location" Type="Str">Slot 4</Property>
					<Property Name="crio.RequiresValidation" Type="Bool">false</Property>
					<Property Name="crio.SDcounterSlaveChannelMask" Type="Str">0</Property>
					<Property Name="crio.SDCounterSlaveMasterSlot" Type="Str">0</Property>
					<Property Name="crio.SDInputFilter" Type="Str">128</Property>
					<Property Name="crio.SupportsDynamicRes" Type="Bool">true</Property>
					<Property Name="crio.Type" Type="Str">NI 9403</Property>
					<Property Name="cRIOModule.DigitalIOMode" Type="Str">0</Property>
					<Property Name="cRIOModule.DisableArbitration" Type="Str">false</Property>
					<Property Name="cRIOModule.EnableSpecialtyDigital" Type="Str">false</Property>
					<Property Name="cRIOModule.Initial Line Direction" Type="Str">11111111111111111111111111111111</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{5C4384C1-5DEC-4CA1-B413-A0D7C2B1C903}</Property>
				</Item>
				<Item Name="RobotFPGA.vi" Type="VI" URL="../RobotFPGA.vi">
					<Property Name="configString.guid" Type="Str">{0821C250-8D76-4365-BCA4-924EF958F1C6}resource=/crio_Mod4/DIO11;0;ReadMethodType=bool;WriteMethodType=bool{0E626545-B038-438F-A0E5-859E90F9A3C4}resource=/crio_Mod4/DIO24;0;ReadMethodType=bool;WriteMethodType=bool{1794AAE0-08C2-4681-AC51-69D42856C932}resource=/crio_Mod4/DIO23;0;ReadMethodType=bool;WriteMethodType=bool{1B347F5D-B8B5-467F-84B9-F27DB9C85357}resource=/crio_Mod4/DIO17;0;ReadMethodType=bool;WriteMethodType=bool{1C85CD82-4650-4951-A609-8759CD652FDC}resource=/crio_Mod4/DIO29;0;ReadMethodType=bool;WriteMethodType=bool{2C357E29-12D6-47DD-BA26-7FFDEB76BE1E}resource=/crio_Mod4/DIO1;0;ReadMethodType=bool;WriteMethodType=bool{350B040E-80DE-4F22-996B-5DC00CF21715}resource=/crio_Mod4/DIO18;0;ReadMethodType=bool;WriteMethodType=bool{3C94EF33-4AE2-44D4-A409-7151EFC34081}resource=/Sleep;0;ReadMethodType=bool;WriteMethodType=bool{41950625-4073-40B2-BE7A-3733DC53C7AF}resource=/crio_Mod4/DIO20;0;ReadMethodType=bool;WriteMethodType=bool{4B0ECFF0-492F-4862-B39E-4BCD4E707FE7}resource=/crio_Mod4/DIO4;0;ReadMethodType=bool;WriteMethodType=bool{52D8CE75-4FA0-4252-8331-A7B87678F7F0}resource=/crio_Mod4/DIO8;0;ReadMethodType=bool;WriteMethodType=bool{56534C7C-D675-454A-9548-2A3F02A1B8BF}resource=/FPGA LED;0;ReadMethodType=bool;WriteMethodType=bool{5C4384C1-5DEC-4CA1-B413-A0D7C2B1C903}NI 9403,Slot 4,1,cRIOModule.DigitalIOMode=0,cRIOModule.DisableArbitration=false,cRIOModule.EnableHsInput=false,cRIOModule.EnableHsOutput=false,cRIOModule.EnableSpecialtyDigital=false,cRIOModule.Initial Line Direction=11111111111111111111111111111111{5F8B7876-9C63-44F0-B025-79B818AACC78}resource=/Chassis Temperature;0;ReadMethodType=i16{6070E299-90E5-4B10-AAB2-BC638E93E52D}resource=/crio_Mod4/DIO30;0;ReadMethodType=bool;WriteMethodType=bool{61079C6C-B36F-4BA0-BDAB-16E02FCAEBB9}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000,000000;MaxFreq=40000000,000000;VariableFreq=0;NomFreq=40000000,000000;PeakPeriodJitter=250,000000;MinDutyCycle=50,000000;MaxDutyCycle=50,000000;Accuracy=100,000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E{65C5BF1F-DEBC-443B-9F5B-AF3B939F37D0}resource=/crio_Mod4/DIO31;0;ReadMethodType=bool;WriteMethodType=bool{6994E470-F247-46D5-89AC-3CE625396993}resource=/crio_Mod4/DIO13;0;ReadMethodType=bool;WriteMethodType=bool{6C89EB14-BBE5-4887-9F54-ADD1CE1B6E0E}resource=/crio_Mod4/DIO16;0;ReadMethodType=bool;WriteMethodType=bool{753CC18B-9A8C-4FC2-B048-2DAFDA1FFC5C}resource=/crio_Mod4/DIO23:16;0;ReadMethodType=u8;WriteMethodType=u8{759EA9B2-A53E-45E3-AD3E-4A6608605BD1}resource=/crio_Mod4/DIO15;0;ReadMethodType=bool;WriteMethodType=bool{88E08A98-8C8C-46BC-9119-B09C36EC8CFB}resource=/crio_Mod4/DIO26;0;ReadMethodType=bool;WriteMethodType=bool{8C74BAD0-B1D4-4543-A6D5-703402F980F2}resource=/crio_Mod4/DIO12;0;ReadMethodType=bool;WriteMethodType=bool{8DC88558-E5CE-4AC9-B6BB-3959202B24E2}resource=/Scan Clock;0;ReadMethodType=bool{977D3FE7-30AE-400B-B8BE-B8C92EF350CF}resource=/crio_Mod4/DIO27;0;ReadMethodType=bool;WriteMethodType=bool{9E81A587-DA1D-497E-BA1B-F9C4264D3862}resource=/crio_Mod4/DIO14;0;ReadMethodType=bool;WriteMethodType=bool{A614A9A5-4FEE-4FCC-8163-09C84A9DCC97}resource=/crio_Mod4/DIO22;0;ReadMethodType=bool;WriteMethodType=bool{A883106D-2F2F-46BD-8B83-3B393F15DECF}resource=/crio_Mod4/DIO2;0;ReadMethodType=bool;WriteMethodType=bool{A934D878-4B33-41D0-BF58-8A154BACC4B9}resource=/crio_Mod4/DIO9;0;ReadMethodType=bool;WriteMethodType=bool{A9CED8A9-3AEC-4DAD-85F5-1598CD3802AF}resource=/crio_Mod4/DIO31:24;0;ReadMethodType=u8;WriteMethodType=u8{AB96B328-4BE3-4800-A0B6-E59263CD6399}resource=/crio_Mod4/DIO7;0;ReadMethodType=bool;WriteMethodType=bool{B09EAD89-F57C-4C9C-A43F-797E64BCDAA1}resource=/crio_Mod4/DIO0;0;ReadMethodType=bool;WriteMethodType=bool{B27EF61F-08AD-43E0-B425-93BA262C83A7}resource=/crio_Mod4/DIO25;0;ReadMethodType=bool;WriteMethodType=bool{C0C66C24-F188-46A2-AEC7-781CF556DBE2}resource=/crio_Mod4/DIO19;0;ReadMethodType=bool;WriteMethodType=bool{C24E9322-1C5B-47EE-81E1-A336999D9BBA}resource=/System Reset;0;ReadMethodType=bool;WriteMethodType=bool{CE84AC7E-CF52-48A9-8859-739A75BB51F0}resource=/crio_Mod4/DIO15:8;0;ReadMethodType=u8;WriteMethodType=u8{D00974A4-E462-4956-91D5-AC16B2923A72}resource=/crio_Mod4/DIO21;0;ReadMethodType=bool;WriteMethodType=bool{E122E325-99A3-428A-A204-C01C95EA9528}resource=/crio_Mod4/DIO31:0;0;ReadMethodType=u32;WriteMethodType=u32{E35C9178-9190-4A1B-A578-4B28907D4B08}resource=/crio_Mod4/DIO28;0;ReadMethodType=bool;WriteMethodType=bool{E6C0AA06-ED7D-47F2-B25A-3AB6D15222AB}resource=/crio_Mod4/DIO6;0;ReadMethodType=bool;WriteMethodType=bool{ED96FCA3-17A6-4D4D-8183-811F6F40CD07}resource=/crio_Mod4/DIO5;0;ReadMethodType=bool;WriteMethodType=bool{F136638C-A286-4CE3-A48A-18CC23D8C09F}resource=/crio_Mod4/DIO10;0;ReadMethodType=bool;WriteMethodType=bool{F4CB4157-3F64-408A-A410-44DCD30C7DF4}resource=/crio_Mod4/DIO3;0;ReadMethodType=bool;WriteMethodType=bool{FF048B63-D45C-46EC-A862-EBF3DAA9F9F9}resource=/crio_Mod4/DIO7:0;0;ReadMethodType=u8;WriteMethodType=u8cRIO-9074/Clk40/falseTARGET_TYPEFPGA</Property>
					<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000,000000;MaxFreq=40000000,000000;VariableFreq=0;NomFreq=40000000,000000;PeakPeriodJitter=250,000000;MinDutyCycle=50,000000;MaxDutyCycle=50,000000;Accuracy=100,000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427EChassis Temperatureresource=/Chassis Temperature;0;ReadMethodType=i16cRIO-9074/Clk40/falseTARGET_TYPEFPGAFPGA LEDresource=/FPGA LED;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO0resource=/crio_Mod4/DIO0;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO10resource=/crio_Mod4/DIO10;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO11resource=/crio_Mod4/DIO11;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO12resource=/crio_Mod4/DIO12;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO13resource=/crio_Mod4/DIO13;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO14resource=/crio_Mod4/DIO14;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO15:8resource=/crio_Mod4/DIO15:8;0;ReadMethodType=u8;WriteMethodType=u8Mod4/DIO15resource=/crio_Mod4/DIO15;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO16resource=/crio_Mod4/DIO16;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO17resource=/crio_Mod4/DIO17;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO18resource=/crio_Mod4/DIO18;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO19resource=/crio_Mod4/DIO19;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO1resource=/crio_Mod4/DIO1;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO20resource=/crio_Mod4/DIO20;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO21resource=/crio_Mod4/DIO21;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO22resource=/crio_Mod4/DIO22;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO23:16resource=/crio_Mod4/DIO23:16;0;ReadMethodType=u8;WriteMethodType=u8Mod4/DIO23resource=/crio_Mod4/DIO23;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO24resource=/crio_Mod4/DIO24;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO25resource=/crio_Mod4/DIO25;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO26resource=/crio_Mod4/DIO26;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO27resource=/crio_Mod4/DIO27;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO28resource=/crio_Mod4/DIO28;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO29resource=/crio_Mod4/DIO29;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO2resource=/crio_Mod4/DIO2;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO30resource=/crio_Mod4/DIO30;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO31:0resource=/crio_Mod4/DIO31:0;0;ReadMethodType=u32;WriteMethodType=u32Mod4/DIO31:24resource=/crio_Mod4/DIO31:24;0;ReadMethodType=u8;WriteMethodType=u8Mod4/DIO31resource=/crio_Mod4/DIO31;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO3resource=/crio_Mod4/DIO3;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO4resource=/crio_Mod4/DIO4;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO5resource=/crio_Mod4/DIO5;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO6resource=/crio_Mod4/DIO6;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO7:0resource=/crio_Mod4/DIO7:0;0;ReadMethodType=u8;WriteMethodType=u8Mod4/DIO7resource=/crio_Mod4/DIO7;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO8resource=/crio_Mod4/DIO8;0;ReadMethodType=bool;WriteMethodType=boolMod4/DIO9resource=/crio_Mod4/DIO9;0;ReadMethodType=bool;WriteMethodType=boolMod4NI 9403,Slot 4,1,cRIOModule.DigitalIOMode=0,cRIOModule.DisableArbitration=false,cRIOModule.EnableHsInput=false,cRIOModule.EnableHsOutput=false,cRIOModule.EnableSpecialtyDigital=false,cRIOModule.Initial Line Direction=11111111111111111111111111111111Scan Clockresource=/Scan Clock;0;ReadMethodType=boolSleepresource=/Sleep;0;ReadMethodType=bool;WriteMethodType=boolSystem Resetresource=/System Reset;0;ReadMethodType=bool;WriteMethodType=bool</Property>
					<Property Name="NI.LV.FPGA.InterfaceBitfile" Type="Str">D:\Work\LabView\scmproject\FPGA Bitfiles\scmproject.lvproj_FPGA Target_RobotFPGA.vi.lvbitx</Property>
				</Item>
				<Item Name="Dependencies" Type="Dependencies"/>
				<Item Name="Build Specifications" Type="Build"/>
			</Item>
		</Item>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
