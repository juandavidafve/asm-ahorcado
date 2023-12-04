@echo off
cd /d Z:\

echo masm ahorcado,,,;
masm ahorcado.asm;

echo link ahorcado 
link ahorcado;

cls

echo ahorcado.exe
ahorcado.exe