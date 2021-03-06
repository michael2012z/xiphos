# Xiphos build script
#
# Copyright (C) 2018 Xiphos Development Team
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Library General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
#

# Generate installer for Windows©

# Disable the component-based installation mechanism.
set(CPACK_MONOLITHIC_INSTALL ON)

# The default installation directory presented to the end user by the
# NSIS installer.
# set(CPACK_NSIS_INSTALL_ROOT "${CMAKE_BINARY_DIR}")

# The name of a *.ico file used as the main icon for the generated
# install program
set (CPACK_NSIS_MUI_ICON "${PROJECT_SOURCE_DIR}/win32/nsis/pixmaps/icon-install.ico")

# The name of a *.ico file used as the main icon for the generated
# uninstall program
set (CPACK_NSIS_MUI_UNIICON "${PROJECT_SOURCE_DIR}/win32/nsis/pixmaps/icon-uninstall.ico")

# CPACK_NSIS_INSTALLER_MUI_ICON_CODE is undocumented, but adds code for setting
# up MUI_ICON and MUI_UNICON, we use it for adding the font installer macro.
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/windows/nsis_installer_mui_icon_code.nsh
  CPACK_NSIS_INSTALLER_MUI_ICON_CODE)

# The filename of a bitmap to use as the NSIS MUI_WELCOMEFINISHPAGE_BITMAP
set (CPACK_NSIS_MUI_WELCOMEFINISHPAGE_BITMAP
  "${PROJECT_SOURCE_DIR}/win32/nsis/pixmaps/wizard.bmp")

# The filename of a bitmap to use as the NSIS MUI_UNWELCOMEFINISHPAGE_BITMAP
set (CPACK_NSIS_MUI_UNWELCOMEFINISHPAGE_BITMAP
  "${PROJECT_SOURCE_DIR}/win32/nsis/pixmaps/wizard-uninstall.bmp")

# Extra NSIS commands that will be added to the beginning of the
# install Section
# set (CPACK_NSIS_EXTRA_PREINSTALL_COMMANDS "")
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/windows/nsis_extra_preinstall_commands.nsh
  CPACK_NSIS_EXTRA_PREINSTALL_COMMANDS)

# Extra NSIS commands that will be added to the end of the install Section
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/windows/nsis_extra_install_commands.nsh
  CPACK_NSIS_EXTRA_INSTALL_COMMANDS)

# Extra NSIS commands that will be added to the uninstall Section
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/windows/nsis_extra_uninstall_commands.nsh
  CPACK_NSIS_EXTRA_UNINSTALL_COMMANDS)

# The arguments that will be passed to the NSIS SetCompressor command
#set (CPACK_NSIS_COMPRESSOR " /SOLID lzma")

# Modify PATH toggle. If this is set to “ON”, then an extra page will
# appear in the installer that will allow the user to choose whether
# the program directory should be added to the system PATH variable
 set (CPACK_NSIS_MODIFY_PATH "OFF")

# The display name string that appears in the Windows Add/Remove
# Program control pane
set (CPACK_NSIS_DISPLAY_NAME "Xiphos")

# The title displayed at the top of the installer
set (CPACK_NSIS_PACKAGE_NAME "Xiphos")

# A path to the executable that contains the installer icon
set (CPACK_NSIS_INSTALLED_ICON_NAME "bin\\${PROJECT_NAME}.exe")

# URL to a web site providing assistance in installing your application
set (CPACK_NSIS_HELP_LINK "${XIPHOS_WEBSITE}/Help")

# URL to a web site providing more information about your application
set (CPACK_NSIS_URL_INFO_ABOUT "${XIPHOS_WEBSITE}")

# Contact information for questions and comments about the installation
# process
set (CPACK_NSIS_CONTACT "${XIPHOS_BUG_REPORT}")

# Additional NSIS commands for creating start menu shortcuts.
#set(CPACK_NSIS_CREATE_ICONS_EXTRA "")
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/windows/nsis_create_icons_extra.nsh
  CPACK_NSIS_CREATE_ICONS_EXTRA)

# Additional NSIS commands to uninstall start menu shortcuts.
#set(CPACK_NSIS_DELETE_ICONS_EXTRA "")
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/windows/nsis_delete_icons_extra.nsh
  CPACK_NSIS_DELETE_ICONS_EXTRA)

# Creating NSIS start menu links assumes that they are in ‘bin’ unless
# this variable is set. For example, you would set this to ‘exec’ if
# your executables are in an exec directory
# set (CPACK_NSIS_EXECUTABLES_DIRECTORY "")

# Specify an executable to add an option to run on the finish page
# of the NSIS installer
# set (CPACK_NSIS_MUI_FINISHPAGE_RUN "")

# Specify links in [application] menu. This should contain a list of pair “link”
# “link name”. The link may be an URL or a path relative to installation prefix.
set (CPACK_NSIS_MENU_LINKS
  "bin\\utils.bat" "Sword")

# Lists each of the executables and associated text label to be used to
# create Start Menu shortcuts
set (CPACK_PACKAGE_EXECUTABLES
  "xiphos" "Xiphos")

# Installation directory on the target system. Added to
# the default installation directory ${CPACK_NSIS_INSTALL_ROOT}
set (CPACK_PACKAGE_INSTALL_DIRECTORY "Crosswire\\${PROJECT_NAME}")

# Ask about uninstalling previous versions first.
set (CPACK_NSIS_ENABLE_UNINSTALL_BEFORE_INSTALL ON)

# License to be embedded in the installer. It will typically be displayed
# to the user by the produced installer (often with an explicit “Accept”
# button, for graphical installers) prior to installation.
set (CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/COPYING")

# ReadMe file to be embedded in the installer. It typically describes in some
# detail the purpose of the project during the installation.
set (CPACK_RESOURCE_FILE_README "${CMAKE_SOURCE_DIR}/RELEASE-NOTES")

# Registry key used when installing this project. This is only used by installer
# for Windows. The default value is based on the installation directory.
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "HKLM")

# CPack generator to use. NSIS will produce graphical installers built
# on Windows using the Nullsoft Installation System.
set (CPACK_GENERATOR "NSIS")
