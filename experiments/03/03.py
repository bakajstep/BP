"""
@Author: Stepan Bakaj
@Login: xbakaj00
@Date: 03.05.2023 
"""

import os, requests, threading

# Define a function to make the POST request
def make_request():
    while True:
        response = requests.get("http://192.168.1.8:8080/api/currency")
        print(response.text)

# Create a list of threads
threads = []
for i in range(100):
    # Create a new thread
    thread = threading.Thread(target=make_request)
    # Add the thread to the list
    threads.append(thread)

# Start the threads
for thread in threads:
    thread.start()

# Wait for the threads to finish
for thread in threads:
    thread.join()