#!/bin/bash

# Start a web server to host the HTML pages
python -m http.server 8080 &
server_pid=$!

# Open page1.html and page2.html in the default web browser
if command -v xdg-open >/dev/null 2>&1; then
  xdg-open "http://localhost:8080/page1.html"
  xdg-open "http://localhost:8080/page2.html"
elif command -v open >/dev/null 2>&1; then
  open "http://localhost:8080/page1.html"
  open "http://localhost:8080/page2.html"
elif command -v start >/dev/null 2>&1; then
  start "http://localhost:8080/page1.html"
  start "http://localhost:8080/page2.html"
else
  echo "Unsupported command to open web browser"
  exit 1
fi

# Wait for user input to stop the script
echo "Press Enter to stop..."
read

# Clean up and stop the web server
kill $server_pid
