@ECHO OFF

:: Set environment variables for interesting paths that scripts might need access to.
PUSHD %~dp0
SET PROJFS_SCRIPTSDIR=%CD%
POPD

CALL :RESOLVEPATH "%PROJFS_SCRIPTSDIR%\.."
SET PROJFS_SRCDIR=%_PARSED_PATH_%

CALL :RESOLVEPATH "%PROJFS_SRCDIR%\.."
SET PROJFS_ENLISTMENTDIR=%_PARSED_PATH_%

SET PROJFS_OUTPUTDIR=%PROJFS_ENLISTMENTDIR%\BuildOutput
SET PROJFS_PACKAGESDIR=%PROJFS_ENLISTMENTDIR%\packages
SET PROJFS_PUBLISHDIR=%PROJFS_ENLISTMENTDIR%\Publish
SET PROJFS_TOOLSDIR=%PROJFS_ENLISTMENTDIR%\.tools

:: Make the path variables available in the DevOps environment.
@echo ##vso[task.setvariable variable=PROJFS_SRCDIR]%PROJFS_SRCDIR%
@echo ##vso[task.setvariable variable=PROJFS_OUTPUTDIR]%PROJFS_OUTPUTDIR%
@echo ##vso[task.setvariable variable=PROJFS_PACKAGESDIR]%PROJFS_PACKAGESDIR%
@echo ##vso[task.setvariable variable=PROJFS_PUBLISHDIR]%PROJFS_PUBLISHDIR%
@echo ##vso[task.setvariable variable=PROJFS_TOOLSDIR]%PROJFS_TOOLSDIR%

:: Clean up
SET _PARSED_PATH_=

GOTO :EOF

:RESOLVEPATH
SET "_PARSED_PATH_=%~f1"
GOTO :EOF
