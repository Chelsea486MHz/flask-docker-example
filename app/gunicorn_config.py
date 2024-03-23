#
# This is the configuration file for Gunicorn.
#
import os

# Restart Gunicorn every 950-1050 requests
# May mitigate memory leak attacks
max_requests = 1000
max_requests_jitter = 50

# Set the listening address and port
listening_address = os.environ.get("APP_IP")
listening_port = os.environ.get("APP_PORT")
bind = "{}:{}".format(listening_address, listening_port)

# May thread starve if too many ports are used/!\
workers = 1
timeout = 120
