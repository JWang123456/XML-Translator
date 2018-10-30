<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <link rel="stylesheet" type="text/css" href="mycss.css"/>
<html> 
<body>
   
<!--System Info-->
<div>
    <h2>System Info</h2>

    <h5>Hardware Detials</h5>  
<table>
    <tr bgcolor="#B3ADED">
      <th style="text-align:left" rowspan="2">SerialNumber</th>
        <th style="text-align:left" colspan="5">Fan Status</th>
          <th style="text-align:left" rowspan="2">Temperature</th>

    </tr>
      <tr bgcolor="#EEECEB">
        <xsl:for-each select="Status/SystemUnit/Hardware/Monitoring/Fan">
            <th style="text-align:left">Item:<xsl:value-of select="@item"/></th>
        </xsl:for-each>
      </tr>
    
    <xsl:for-each select="Status/SystemUnit/Hardware">
    <tr>
      <td><xsl:value-of select="Module/SerialNumber"/></td>
        <xsl:for-each select="Monitoring/Fan">
        <td><xsl:value-of select="Status"/></td>
        </xsl:for-each>
      <td><xsl:value-of select="Temperature"/></td>
    </tr>
    </xsl:for-each>
  </table>
    
    <h5>Software Detials</h5>
    <table>
        <tr bgcolor="#B3ADED">
      <th style="text-align:left" rowspan="2">Name</th>
           
            <th style="text-align:left" colspan="4">OptionKeys</th>
            <th style="text-align:left" rowspan="2">ReleaseDate</th>
            <th style="text-align:left" rowspan="2">Version</th>
    </tr>
    <tr bgcolor="#B3ADED">
     <th style="text-align:left">Encryption</th>
        <th style="text-align:left">MultiSite</th>
        <th style="text-align:left">PremiumResolution</th>
        <th style="text-align:left">RemoteMonitoring</th>

    </tr>
        
        
    <xsl:for-each select="Status/SystemUnit/Software">
    <tr>
      <td><xsl:value-of select="Name"/></td>
        <td><xsl:value-of select="OptionKeys/Encryption"/></td>
        <td><xsl:value-of select="OptionKeys/MultiSite"/></td>
        <td><xsl:value-of select="OptionKeys/PremiumResolution"/></td>
        <td><xsl:value-of select="OptionKeys/RemoteMonitoring"/></td>
        <td><xsl:value-of select="ReleaseDate"/></td>
        <td><xsl:value-of select="Version"/></td>
    </tr>
    </xsl:for-each>
        
  </table>
    
    <h5>Diagnostic Information</h5>
    <table>
    <tr bgcolor="#B3ADED">
      <th style="text-align:left" rowspan="2">LastRun</th>
        <xsl:for-each select="Status/SystemUnit/Diagnostics/Message">
            <th style="text-align:left" colspan="4">Message: <xsl:value-of select="@item"/></th>
        </xsl:for-each>
    </tr>
    <tr bgcolor="#B3ADED">
        <xsl:for-each select="Status/SystemUnit/Diagnostics/Message">
            <th style="text-align:left">Description</th>
            <th style="text-align:left">Level</th>
            <th style="text-align:left">References</th>
            <th style="text-align:left">Type</th>
        </xsl:for-each>
    </tr>
    <xsl:for-each select="Status/SystemUnit/Diagnostics">
        <tr>
          <td><xsl:value-of select="LastRun"/></td>  
            <xsl:for-each select="Message">
              <td><xsl:value-of select="Description"/></td>
            <xsl:choose>
                <xsl:when test="Level = 'Error'">
                    <td bgcolor = "#F82019"><xsl:value-of select="Level"/></td>
                </xsl:when>
                <xsl:when test="Level = 'Warning'">
                    <td bgcolor = "#FAFA10"><xsl:value-of select="Level"/></td>
                </xsl:when>
                <xsl:otherwise>
                    <td><xsl:value-of select="Level"/></td>
                </xsl:otherwise>
            </xsl:choose>
                
                <td><xsl:value-of select="References"/></td>
                <td><xsl:value-of select="Type"/></td>
            </xsl:for-each>
        </tr>
    </xsl:for-each>
  </table>
    
</div>

<!--Peripherals Connected-->
<div>
<h2>Peripherals Connected</h2>
     
    <table>
        <tr bgcolor="#B3ADED">
            <th style="text-align:left">ConnectedDevices</th>
            <th style="text-align:left">HardwareInfo</th>
            <th style="text-align:left">ID</th>
            <th style="text-align:left">Name</th>
            <th style="text-align:left">SoftwareInfo</th>
            <th style="text-align:left">Status</th>
            <th style="text-align:left">Type</th>
            <th style="text-align:left">UpgradeStatus</th>
        </tr>
        
    <xsl:for-each select="Status/Peripherals/ConnectedDevice">
        <tr>
            <td bgcolor="#EEECEB">Item:<xsl:value-of select="@item"/></td>
                <td><xsl:value-of select="HardwareInfo"/></td>
                <td><xsl:value-of select="ID"/></td>
                <td><xsl:value-of select="Name"/></td>
                <td><xsl:value-of select="SoftwareInfo"/></td>
                <td><xsl:value-of select="Status"/></td>
            <xsl:choose>
            <xsl:when test="Type = 'Camera'">
                
                <td><a href="#camera"><xsl:value-of select="Type"/></a></td>
                </xsl:when>
                <xsl:otherwise>
                    <td><xsl:value-of select="Type"/></td>
                </xsl:otherwise>
            </xsl:choose>
                
                <td><xsl:value-of select="UpgradeStatus"/></td>
        </tr>    
    </xsl:for-each>
        
  </table>
</div>
    
<!--Call Details-->
<div>
<h2>Call Details</h2>     
    <table>
    <tr bgcolor="#B3ADED">
        <th style="text-align:left" rowspan="2">Calls</th>
        <th style="text-align:left" rowspan="2">AnswerState</th>
        <th style="text-align:left" rowspan="2">CallType</th>
        <th style="text-align:left" rowspan="2">CallbackNumber</th>
        <th style="text-align:left" rowspan="2">DeviceType</th>
        <th style="text-align:left" rowspan="2">Direction</th>
        <th style="text-align:left" rowspan="2">DisplayName</th>
        <th style="text-align:left" rowspan="2">Duration</th>
        <th style="text-align:left">Encryption</th>
        <th style="text-align:left" rowspan="2">FacilityServiceId</th>
        <th style="text-align:left" rowspan="2">HoldReason</th>
        <th style="text-align:left" rowspan="2">PlacedOnHold</th>
        <th style="text-align:left" rowspan="2">Protocol</th>
        <th style="text-align:left" rowspan="2">ReceiveCallRate</th>
        <th style="text-align:left" rowspan="2">RemoteNumber</th>
        <th style="text-align:left" rowspan="2">Status</th>
        <th style="text-align:left" rowspan="2">TransmitCallRate</th>
    </tr>
    <tr bgcolor="#B3ADED">
            <th style="text-align:left">Type</th>
    </tr>
        
    <xsl:for-each select="Status/Call">
        <tr>
            <td bgcolor="#EEECEB">Item:<xsl:value-of select="@item"/></td>
            
            <td><xsl:value-of select="AnswerState"/></td>  
            <td><xsl:value-of select="CallType"/></td>
            <td><xsl:value-of select="CallbackNumber"/></td>
            <td><xsl:value-of select="DeviceType"/></td>
            <td><xsl:value-of select="Direction"/></td>
            <td><xsl:value-of select="DisplayName"/></td>
            <td><xsl:value-of select="Duration"/></td>
            <td><xsl:value-of select="Encryption/Type"/></td>
            <td><xsl:value-of select="FacilityServiceId"/></td>
            <td><xsl:value-of select="HoldReason"/></td>
            <td><xsl:value-of select="PlacedOnHold"/></td>
            <td><xsl:value-of select="Protocol"/></td>
            <td><xsl:value-of select="ReceiveCallRate"/></td>
            <td><xsl:value-of select="RemoteNumber"/></td>
            <td><xsl:value-of select="Status"/></td>
            <td><xsl:value-of select="TransmitCallRate"/></td>
        </tr>
    </xsl:for-each>
  </table>
</div>
  
<!--Network-->
<div>
<h2>Network</h2>
    
<!--CDP-->
    <table>
        <tr bgcolor="#B3ADED">
            <th style="text-align:left" colspan="12">CDP</th>
        </tr>
        <tr bgcolor="#B3ADED">
            <th style="text-align:left">Address</th>
            <th style="text-align:left">Capabilities</th>
            <th style="text-align:left">DeviceId</th>
            <th style="text-align:left">Duplex</th>
            <th style="text-align:left">Platform</th>
            <th style="text-align:left">PortID</th>
            <th style="text-align:left">PrimaryMgmtAddress</th>
            <th style="text-align:left">SysName</th>
            <th style="text-align:left">SysObjectID</th>
            <th style="text-align:left">VTPMgmtDomain</th>
            <th style="text-align:left">Version</th>
            <th style="text-align:left">VoIPApplianceVlanID</th>
        </tr>
        
        
    <xsl:for-each select="Status/Network">
        <tr>
                
                <td><xsl:value-of select="CDP/Address"/></td>
                <td><xsl:value-of select="CDP/Capabilities"/></td>
                <td><xsl:value-of select="CDP/DeviceId"/></td>
                <td><xsl:value-of select="CDP/Duplex"/></td>
                <td><xsl:value-of select="CDP/Platform"/></td>
                <td><xsl:value-of select="CDP/PortID"/></td>
                <td><xsl:value-of select="CDP/PrimaryMgmtAddress"/></td>
                <td><xsl:value-of select="CDP/SysName"/></td>
                <td><xsl:value-of select="CDP/SysObjectID"/></td>
                <td><xsl:value-of select="CDP/VTPMgmtDomain"/></td>
                <td><xsl:value-of select="CDP/Version"/></td>
                <td><xsl:value-of select="CDP/VoIPApplianceVlanID"/></td>
        </tr>    
    </xsl:for-each>
    </table>
<!--DNS-->
    <table>
        <tr bgcolor="#B3ADED">
            <th style="text-align:left" colspan="6">DNS</th> 
        </tr>
        <tr bgcolor="#B3ADED">
      
            <th style="text-align:left">Domain Name</th>
        <xsl:for-each select="Status/Network/DNS/Server">        
            <th style="text-align:left">Server Address</th>
        </xsl:for-each>
        </tr>
        
        
    <xsl:for-each select="Status/Network">
        <tr>
            <td><xsl:value-of select="DNS/Domain/Name"/></td>
            <xsl:for-each select="DNS/Server">        
                <td><xsl:value-of select="Address"/></td>
            </xsl:for-each>
        </tr>    
    </xsl:for-each>
        
  </table>
    
    <table>
        <tr bgcolor="#B3ADED">
           
            <th style="text-align:left" colspan="2">Ethernet</th>
            <th style="text-align:left" colspan="3">IPv4</th>
            <th style="text-align:left" colspan="2">IPv6</th>
            <th style="text-align:left" colspan="1">VLAN</th>
        </tr>
        <tr bgcolor="#B3ADED">
          
            <th style="text-align:left">MacAddress</th>
            <th style="text-align:left">Speed</th>
            <th style="text-align:left">Address</th>
            <th style="text-align:left">Gateway</th>
            <th style="text-align:left">SubnetMask</th>
            
            <th style="text-align:left">Address</th>
            <th style="text-align:left">Gateway</th>
            
            <th style="text-align:left">VlanId</th>
        </tr>
        
        
    <xsl:for-each select="Status/Network">
        <tr>
                 <td><xsl:value-of select="Ethernet/MacAddress"/></td>
                <td><xsl:value-of select="Ethernet/Speed"/></td>
              
                <td><xsl:value-of select="IPv4/Address"/></td>
                <td><xsl:value-of select="IPv4/Gateway"/></td>
                <td><xsl:value-of select="IPv4/SubnetMask"/></td>
            
                <td><xsl:value-of select="IPv6/Address"/></td>
                <td><xsl:value-of select="IPv6/Gateway"/></td>
            
                <td><xsl:value-of select="VLAN/Voice/VlanId"/></td>
            
        </tr>    
    </xsl:for-each>
        
  </table>
    
</div>
    
<!--SystemTime-->
<div>
<h2>SystemTime</h2>
     
    <table>
        <tr bgcolor="#B3ADED">
            <th style="text-align:left">SystemTime</th>
        </tr>
        
    <xsl:for-each select="Status/Time">
        <tr>
            <td><xsl:value-of select="SystemTime"/></td>
        </tr>    
    </xsl:for-each>
        
  </table>
</div>
   
<!--ContactInfo-->
<div>
<h2>ContactInfo</h2>
     
    <table>
        <tr bgcolor="#B3ADED">
            <th style="text-align:left" colspan="3">ContactInfo</th>
        </tr>
        <tr>
            <xsl:for-each select="Status/UserInterface/ContactInfo/ContactMethod">
                    <th style="text-align:left">ContactMethod</th>
            </xsl:for-each>    
            <th style="text-align:left">Name</th>
        </tr>
        <tr>
            <xsl:for-each select="Status/UserInterface/ContactInfo/ContactMethod">
                <td><xsl:value-of select="Number"/></td>
            </xsl:for-each>
            <td><xsl:value-of select="Status/UserInterface/ContactInfo/Name"/></td>
        </tr>
  </table>
</div>
    
<!--Camera-->
<div>
<h2 id="camera">Camera</h2>
     
    <table>
        <tr bgcolor="#7EC2EC">
            <th style="text-align:left">Camera</th>
            <th style="text-align:left">Capabilities</th>
            <th style="text-align:left">Connected</th>
            <th style="text-align:left">Flip</th>
            <th style="text-align:left">MacAddress</th>
            <th style="text-align:left">Manufacturer</th>
            <th style="text-align:left">Model</th>
            <th style="text-align:left">SerialNumber</th>
            <th style="text-align:left">SoftwareID</th>
        </tr>
        
    <xsl:for-each select="Status/Cameras/Camera">
        <tr>
            <td bgcolor="#EEECEB">Item:<xsl:value-of select="@item"/></td>
                <td><xsl:value-of select="Capabilities/Options"/></td>
                <td><xsl:value-of select="Connected"/></td>
                <td><xsl:value-of select="Flip"/></td>
                <td><xsl:value-of select="MacAddress"/></td>
                <td><xsl:value-of select="Manufacturer"/></td>
                <td><xsl:value-of select="Model"/></td>
                <td><xsl:value-of select="SerialNumber"/></td>
                <td><xsl:value-of select="SoftwareID"/></td>
        </tr>    
    </xsl:for-each>
        
  </table>
</div>
    
</body>
</html>
</xsl:template>
</xsl:stylesheet>

