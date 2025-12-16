@echo off
echo ========================================
echo North Gate University - Server Startup
echo ========================================
echo.

echo Checking if Node.js is installed...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed!
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo Node.js found!
echo.

echo Checking if MySQL is running...
netstat -an | findstr :3306 >nul 2>&1
if %errorlevel% neq 0 (
    echo WARNING: MySQL might not be running on port 3306
    echo Please ensure MySQL is started
    echo.
)

echo Installing/updating dependencies...
cd backend
npm install

echo.
echo Starting the server...
echo.
echo The website will be available at: http://localhost:5000
echo API will be available at: http://localhost:5000/api
echo.
echo Press Ctrl+C to stop the server
echo.

npm start

pause
