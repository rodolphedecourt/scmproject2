<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="9008000">
	<Property Name="varPersistentID:{19767B78-3B5A-47BC-95C0-33C60D71FD61}" Type="Ref">/RT CompactRIO Target/Chassis/Mod1/AI2</Property>
	<Property Name="varPersistentID:{3530DC5C-F9C2-432B-8713-66CAC058A664}" Type="Ref">/RT CompactRIO Target/Chassis/Mod1/AI1</Property>
	<Property Name="varPersistentID:{356A9813-98B1-4727-894B-CA0D5AAC4D89}" Type="Ref">/RT CompactRIO Target/Untitled Library 1.lvlib/Variable2</Property>
	<Property Name="varPersistentID:{452AA771-995B-4E20-88F9-AEE70FC7C824}" Type="Ref">/RT CompactRIO Target/Chassis/Mod1/AI4</Property>
	<Property Name="varPersistentID:{52D0AA33-F0D2-467D-B26A-0586C6BB5329}" Type="Ref">/RT CompactRIO Target/Chassis/Mod1/AI3</Property>
	<Property Name="varPersistentID:{5CBD7F98-0998-4513-818B-BCFB1645C4B6}" Type="Ref">/RT CompactRIO Target/Chassis/Mod1/AI0</Property>
	<Property Name="varPersistentID:{664E9A79-5F72-4D29-90D8-E7EDCD523433}" Type="Ref">/RT CompactRIO Target/Chassis/Mod1/AI5</Property>
	<Property Name="varPersistentID:{749479E2-B075-4CB0-B53D-95A673E164E0}" Type="Ref">/RT CompactRIO Target/Chassis/Mod1/AI7</Property>
	<Property Name="varPersistentID:{7EC9677E-2AA4-42E5-A3A5-7CD039EEEFA6}" Type="Ref">/RT CompactRIO Target/Chassis/Mod1/AI6</Property>
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
		<Item Name="Main.vi" Type="VI" URL="../Main.vi"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
	<Item Name="RT CompactRIO Target" Type="RT CompactRIO">
		<Property Name="alias.name" Type="Str">RT CompactRIO Target</Property>
		<Property Name="alias.value" Type="Str">0.0.0.0</Property>
		<Property Name="CCSymbols" Type="Str">OS,VxWorks;CPU,PowerPC;TARGET_TYPE,RT;</Property>
		<Property Name="crio.family" Type="Str">901x</Property>
		<Property Name="host.ResponsivenessCheckEnabled" Type="Bool">true</Property>
		<Property Name="host.ResponsivenessCheckPingDelay" Type="UInt">5000</Property>
		<Property Name="host.ResponsivenessCheckPingTimeout" Type="UInt">1000</Property>
		<Property Name="host.TargetCPUID" Type="UInt">2</Property>
		<Property Name="host.TargetOSID" Type="UInt">14</Property>
		<Property Name="target.__WSDefaultSecurityAPIKey" Type="Str">PqVr/ifkAQh+lVrdPIykXlFvg12GhhQFR8H9cUhphgg=:pTe9HRlQuMfJxAG6QCGq7UvoUpJzAzWGKy5SbZ+roSU=</Property>
		<Property Name="target.cleanupVisa" Type="Bool">false</Property>
		<Property Name="target.FPProtocolGlobals_ControlTimeLimit" Type="Int">300</Property>
		<Property Name="target.getDefault-&gt;WebServer.Port" Type="Int">80</Property>
		<Property Name="target.getDefault-&gt;WebServer.Timeout" Type="Int">60</Property>
		<Property Name="target.IOScan.Faults" Type="Str">1.0,0;</Property>
		<Property Name="target.IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="target.IOScan.Period" Type="UInt">10000</Property>
		<Property Name="target.IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="target.IOScan.Priority" Type="UInt">0</Property>
		<Property Name="target.IOScan.ReportModeConflict" Type="Bool">false</Property>
		<Property Name="target.IOScan.StartEngineOnDeploy" Type="Bool">false</Property>
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
		<Property Name="target.server.tcp.serviceName" Type="Str">Main Application Instance/VI Server</Property>
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
		<Property Name="target.webservices.ValidTimestampWindow" Type="UInt">15</Property>
		<Property Name="TargetOSID" Type="Str">VxWorks-PPC603</Property>
		<Item Name="Chassis" Type="cRIO Chassis">
			<Property Name="crio.ProgrammingMode" Type="Str">fpga</Property>
			<Property Name="crio.ResourceID" Type="Str">RIO0</Property>
			<Property Name="crio.Type" Type="Str">cRIO-9074</Property>
			<Item Name="Mod1" Type="RIO C Series Module">
				<Property Name="crio.Calibration" Type="Str">1</Property>
				<Property Name="crio.Location" Type="Str">Slot 1</Property>
				<Property Name="crio.RequiresValidation" Type="Bool">false</Property>
				<Property Name="crio.SupportsDynamicRes" Type="Bool">false</Property>
				<Property Name="crio.Type" Type="Str">NI 9201</Property>
				<Property Name="cRIOModule.MinConvTime" Type="Str">2,000000E+0</Property>
				<Item Name="AI0" Type="Variable">
					<Property Name="featurePacks" Type="Str">Industrial</Property>
					<Property Name="Industrial:ChannelIndex" Type="Str">0</Property>
					<Property Name="Industrial:IODirection" Type="Str">Input</Property>
					<Property Name="Industrial:IsNetworkPublished" Type="Str">True</Property>
					<Property Name="Industrial:Mode" Type="Str">1</Property>
					<Property Name="Industrial:PhysicalName" Type="Str">AI0</Property>
					<Property Name="Network:UseBinding" Type="Str">False</Property>
					<Property Name="Network:UseBuffering" Type="Str">False</Property>
					<Property Name="path" Type="Str"></Property>
					<Property Name="type" Type="Str">Industrial</Property>
					<Property Name="typeDefPath" Type="Str"></Property>
					<Property Name="typeDesc" Type="Bin">(1!!!!E!A!!!!!!"!!5!#A!!!1!!!!!!!!!!!!!!!!!!</Property>
				</Item>
				<Item Name="AI1" Type="Variable">
					<Property Name="featurePacks" Type="Str">Industrial</Property>
					<Property Name="Industrial:ChannelIndex" Type="Str">1</Property>
					<Property Name="Industrial:IODirection" Type="Str">Input</Property>
					<Property Name="Industrial:IsNetworkPublished" Type="Str">True</Property>
					<Property Name="Industrial:Mode" Type="Str">1</Property>
					<Property Name="Industrial:PhysicalName" Type="Str">AI1</Property>
					<Property Name="Network:UseBinding" Type="Str">False</Property>
					<Property Name="Network:UseBuffering" Type="Str">False</Property>
					<Property Name="path" Type="Str"></Property>
					<Property Name="type" Type="Str">Industrial</Property>
					<Property Name="typeDefPath" Type="Str"></Property>
					<Property Name="typeDesc" Type="Bin">(1!!!!E!A!!!!!!"!!5!#A!!!1!!!!!!!!!!!!!!!!!!</Property>
				</Item>
				<Item Name="AI2" Type="Variable">
					<Property Name="featurePacks" Type="Str">Industrial</Property>
					<Property Name="Industrial:ChannelIndex" Type="Str">2</Property>
					<Property Name="Industrial:IODirection" Type="Str">Input</Property>
					<Property Name="Industrial:IsNetworkPublished" Type="Str">True</Property>
					<Property Name="Industrial:Mode" Type="Str">1</Property>
					<Property Name="Industrial:PhysicalName" Type="Str">AI2</Property>
					<Property Name="Network:UseBinding" Type="Str">False</Property>
					<Property Name="Network:UseBuffering" Type="Str">False</Property>
					<Property Name="path" Type="Str"></Property>
					<Property Name="type" Type="Str">Industrial</Property>
					<Property Name="typeDefPath" Type="Str"></Property>
					<Property Name="typeDesc" Type="Bin">(1!!!!E!A!!!!!!"!!5!#A!!!1!!!!!!!!!!!!!!!!!!</Property>
				</Item>
				<Item Name="AI3" Type="Variable">
					<Property Name="featurePacks" Type="Str">Industrial</Property>
					<Property Name="Industrial:ChannelIndex" Type="Str">3</Property>
					<Property Name="Industrial:IODirection" Type="Str">Input</Property>
					<Property Name="Industrial:IsNetworkPublished" Type="Str">True</Property>
					<Property Name="Industrial:Mode" Type="Str">1</Property>
					<Property Name="Industrial:PhysicalName" Type="Str">AI3</Property>
					<Property Name="Network:UseBinding" Type="Str">False</Property>
					<Property Name="Network:UseBuffering" Type="Str">False</Property>
					<Property Name="path" Type="Str"></Property>
					<Property Name="type" Type="Str">Industrial</Property>
					<Property Name="typeDefPath" Type="Str"></Property>
					<Property Name="typeDesc" Type="Bin">(1!!!!E!A!!!!!!"!!5!#A!!!1!!!!!!!!!!!!!!!!!!</Property>
				</Item>
				<Item Name="AI4" Type="Variable">
					<Property Name="featurePacks" Type="Str">Industrial</Property>
					<Property Name="Industrial:ChannelIndex" Type="Str">4</Property>
					<Property Name="Industrial:IODirection" Type="Str">Input</Property>
					<Property Name="Industrial:IsNetworkPublished" Type="Str">True</Property>
					<Property Name="Industrial:Mode" Type="Str">1</Property>
					<Property Name="Industrial:PhysicalName" Type="Str">AI4</Property>
					<Property Name="Network:UseBinding" Type="Str">False</Property>
					<Property Name="Network:UseBuffering" Type="Str">False</Property>
					<Property Name="path" Type="Str"></Property>
					<Property Name="type" Type="Str">Industrial</Property>
					<Property Name="typeDefPath" Type="Str"></Property>
					<Property Name="typeDesc" Type="Bin">(1!!!!E!A!!!!!!"!!5!#A!!!1!!!!!!!!!!!!!!!!!!</Property>
				</Item>
				<Item Name="AI5" Type="Variable">
					<Property Name="featurePacks" Type="Str">Industrial</Property>
					<Property Name="Industrial:ChannelIndex" Type="Str">5</Property>
					<Property Name="Industrial:IODirection" Type="Str">Input</Property>
					<Property Name="Industrial:IsNetworkPublished" Type="Str">True</Property>
					<Property Name="Industrial:Mode" Type="Str">1</Property>
					<Property Name="Industrial:PhysicalName" Type="Str">AI5</Property>
					<Property Name="Network:UseBinding" Type="Str">False</Property>
					<Property Name="Network:UseBuffering" Type="Str">False</Property>
					<Property Name="path" Type="Str"></Property>
					<Property Name="type" Type="Str">Industrial</Property>
					<Property Name="typeDefPath" Type="Str"></Property>
					<Property Name="typeDesc" Type="Bin">(1!!!!E!A!!!!!!"!!5!#A!!!1!!!!!!!!!!!!!!!!!!</Property>
				</Item>
				<Item Name="AI6" Type="Variable">
					<Property Name="featurePacks" Type="Str">Industrial</Property>
					<Property Name="Industrial:ChannelIndex" Type="Str">6</Property>
					<Property Name="Industrial:IODirection" Type="Str">Input</Property>
					<Property Name="Industrial:IsNetworkPublished" Type="Str">True</Property>
					<Property Name="Industrial:Mode" Type="Str">1</Property>
					<Property Name="Industrial:PhysicalName" Type="Str">AI6</Property>
					<Property Name="Network:UseBinding" Type="Str">False</Property>
					<Property Name="Network:UseBuffering" Type="Str">False</Property>
					<Property Name="path" Type="Str"></Property>
					<Property Name="type" Type="Str">Industrial</Property>
					<Property Name="typeDefPath" Type="Str"></Property>
					<Property Name="typeDesc" Type="Bin">(1!!!!E!A!!!!!!"!!5!#A!!!1!!!!!!!!!!!!!!!!!!</Property>
				</Item>
				<Item Name="AI7" Type="Variable">
					<Property Name="featurePacks" Type="Str">Industrial</Property>
					<Property Name="Industrial:ChannelIndex" Type="Str">7</Property>
					<Property Name="Industrial:IODirection" Type="Str">Input</Property>
					<Property Name="Industrial:IsNetworkPublished" Type="Str">True</Property>
					<Property Name="Industrial:Mode" Type="Str">1</Property>
					<Property Name="Industrial:PhysicalName" Type="Str">AI7</Property>
					<Property Name="Network:UseBinding" Type="Str">False</Property>
					<Property Name="Network:UseBuffering" Type="Str">False</Property>
					<Property Name="path" Type="Str"></Property>
					<Property Name="type" Type="Str">Industrial</Property>
					<Property Name="typeDefPath" Type="Str"></Property>
					<Property Name="typeDesc" Type="Bin">(1!!!!E!A!!!!!!"!!5!#A!!!1!!!!!!!!!!!!!!!!!!</Property>
				</Item>
			</Item>
		</Item>
		<Item Name="Untitled Library 1.lvlib" Type="Library" URL="../Untitled Library 1.lvlib"/>
		<Item Name="Untitled 1.vi" Type="VI" URL="../Untitled 1.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="NI_PID_pid.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/control/pid/NI_PID_pid.lvlib"/>
				<Item Name="NI_PID__prctrl compat.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/control/pid/NI_PID__prctrl compat.lvlib"/>
				<Item Name="lvpidtkt.dll" Type="Document" URL="/&lt;vilib&gt;/addons/control/pid/lvpidtkt.dll"/>
			</Item>
			<Item Name="XDNodeRunTimeDep.lvlib" Type="Library" URL="/&lt;vilib&gt;/Platform/TimedLoop/XDataNode/XDNodeRunTimeDep.lvlib"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
