# RobotDemo - Login Test Automation

A Robot Framework test automation project for testing login functionality using Selenium WebDriver.

## Overview

This project contains automated tests for login functionality on [The Internet](https://the-internet.herokuapp.com) demo application. The tests are written using Robot Framework with SeleniumLibrary for browser automation.

## Features

- Automated login test scenarios
- Reusable keywords and resource files
- Cross-browser testing support (configurable)
- HTML test reports and logs

## Prerequisites

- Python 3.6 or higher
- pip (Python package manager)
- Firefox browser (default) or Chrome browser installed

## Installation

1. Clone or download this repository

2. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

   This will install:
   - Robot Framework (>= 3.1.1)
   - Robot Framework SeleniumLibrary (>= 3.3.1)
   - Additional dependencies for documentation and releases

## Project Structure

```
RobotDemo/
├── .github/
│   └── workflows/
│       └── test.yml       # GitHub Actions CI/CD pipeline
├── login_tests/
│   ├── resource.robot      # Reusable keywords and variables
│   └── valid_login.robot   # Test case for valid login
├── requirements.txt        # Python dependencies
├── report.html            # Test execution report (generated)
├── log.html               # Detailed test log (generated)
├── output.xml             # Test results in XML format (generated)
└── README.md              # This file
```

## Running Tests

### Run all tests:
```bash
robot login_tests/
```

### Run a specific test file:
```bash
robot login_tests/valid_login.robot
```

### Run with specific browser:
You can modify the `${BROWSER}` variable in `login_tests/resource.robot` to use different browsers:
- `Firefox` (default)
- `Chrome`
- `Edge`
- `Safari`

### View Results

After test execution, open the generated HTML reports:
- `report.html` - Test execution summary
- `log.html` - Detailed test log with screenshots

## CI/CD Pipeline

This project includes a GitHub Actions workflow for continuous integration. The pipeline automatically runs tests on:

- Push to `main`, `master`, or `develop` branches
- Pull requests to `main`, `master`, or `develop` branches
- Manual workflow dispatch

### Pipeline Steps

1. **Checkout code** - Retrieves the repository code
2. **Set up Python** - Configures Python 3.11 environment
3. **Install system dependencies** - Installs Firefox and required system packages
4. **Install GeckoDriver** - Sets up Firefox WebDriver for Selenium
5. **Install Python dependencies** - Installs packages from `requirements.txt`
6. **Run tests** - Executes Robot Framework tests
7. **Upload artifacts** - Saves test reports, logs, and screenshots

### Viewing Test Results

After a workflow run completes:
- Navigate to the **Actions** tab in your GitHub repository
- Click on the workflow run to view details
- Download the `test-results` artifact to access:
  - `report.html` - Test execution summary
  - `log.html` - Detailed test log
  - `output.xml` - XML test results
  - Screenshots (if any failures occurred)

## Configuration

The test configuration can be modified in `login_tests/resource.robot`:

- **${SERVER}**: Base URL of the application (default: `https://the-internet.herokuapp.com`)
- **${BROWSER}**: Browser to use for tests (default: `Firefox`)
- **${DELAY}**: Delay between Selenium commands in seconds (default: `0`)
- **${VALID USER}**: Valid username for testing
- **${VALID PASSWORD}**: Valid password for testing

## Test Cases

### Valid Login
Tests the successful login flow:
1. Opens the login page
2. Enters valid credentials
3. Submits the form
4. Verifies successful login and redirect to welcome page

## Dependencies

- **robotframework**: Test automation framework
- **robotframework-seleniumlibrary**: Selenium WebDriver library for Robot Framework
- **invoke**: Task execution library
- **rellu**: Release management tool
- **docutils**: Documentation utilities

## Notes

- Screenshots are automatically captured on test failures
- Test reports are generated in HTML format after each run
- The project uses the demo application at `the-internet.herokuapp.com` for testing

## License

This project is for demonstration purposes.

