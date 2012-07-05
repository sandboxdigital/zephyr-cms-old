# Zephyr CMS #

- Version: 1.0.1
- Date: November 8th, 2011
- Release Notes:
- Licenced under MIT: http://www.opensource.org/licenses/mit-license.php
- Github Repository: https://github.com/sandboxdigital/zephyr-cms

## Overview

Zephyr is a PHP based CMS built on top of Zend Framework.
This repository contains the cms files and links (using submodules) to the core framework. 
As of version "1.0.0" it is considered stable.

### Server Requirements

- PHP 5.2 or above
- MySQL 5.0 or above
- Zend Framework
- An Apache or Litespeed webserver
- Apache's mod_rewrite module or equivalent


## Installation

1. Clone:
git clone git://github.com/sandboxdigital/zephyr-cms.git

2. Pull down zephyr-core submodule:

git submodule init

git submodule update

3. Create your MySQL database

4. Download Zend and copy Zend folder to /public_html/library

4. Point Apache to /public_html

5. Grant the following folders (and subfolders) read/write access:
/public_html/file
/public_html/application/storage

6. Run http://localhost/installer.php
