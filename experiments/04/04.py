"""
@Author: Stepan Bakaj
@Login: xbakaj00
@Date: 03.05.2023 
"""

import socket

# Create a TCP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the remote syslog server
sock.connect(('192.168.1.14', 54527))

# Send a syslog message
sock.send('<13>Apr 19 12:34:56 myhost myprocess: Hello, syslog!\n'.encode())

# Close the socket
sock.close()