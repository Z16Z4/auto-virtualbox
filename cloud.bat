set /p "path=YOUR PATH"
PowerShell -NoProfile -ExecutionPolicy Unrestricted -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Unrestricted -File "".\cloud.ps1""' -Verb RunAs}";
