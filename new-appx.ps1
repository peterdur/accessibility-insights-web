# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

if (Test-Path ./drop/productionEdge) { Remove-Item ./drop/productionEdge -Recurse }
if (Test-Path ./drop/productionEdge.appx) { Remove-Item ./drop/productionEdge.appx }
New-Item -Path ./drop/productionEdge/ -ItemType Directory
Copy-Item ./drop/extension/production/product ./drop/productionEdge/Extension -Recurse
Copy-Item ./AppXManifest.xml ./drop/productionEdge/AppXManifest.xml
&"c:\Program Files (x86)\Windows Kits\10\bin\10.0.17134.0\x64\makeappx.exe" pack /h SHA256 /d .\drop\productionEdge /p .\drop\productionEdge.appx
