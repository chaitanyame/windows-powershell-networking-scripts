
function Send-UdpDatagram
{
      Param ([string] $EndPoint, 
      [int] $Port, 
      [string] $Message)

      $IP = [System.Net.Dns]::GetHostAddresses($EndPoint) 
      $Address = [System.Net.IPAddress]::Parse($IP) 
      $EndPoints = New-Object System.Net.IPEndPoint($Address, $Port) 
      $Socket = New-Object System.Net.Sockets.UDPClient 
      $EncodedText = [Text.Encoding]::ASCII.GetBytes($Message) 
      $SendMessage = $Socket.Send($EncodedText, $EncodedText.Length, $EndPoints) 
      $Socket.Close() 
} 


$ipaddress='10.71.7.180'
$portnumber=1813

for ($count=1 ; $count -le 1000000 ; $count++)
{

Send-UdpDatagram -EndPoint ipaddress -Port $portnumber -Message " Test Message= {$($count)}" 


}
