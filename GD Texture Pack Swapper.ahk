#SingleInstance Force

IfExist, texturepackfolder.save
	{
	FileRead, folderFromFile ,texturepackfolder.save
	MsgBox, 4,, Would you like to use the default GD directory?
	IfMsgBox, No
		{
		FileSelectFolder, gdFolder,, 3, Select your Geometry Dash folder
		}
		
		Else
		{
		gdFolder := "C:\Program Files (x86)\Steam\steamapps\common\Geometry Dash\"
		}
		
		IfNotExist, %gdFolder%Resources
			{
			
			if(gdFolder == "C:\Program Files (x86)\Steam\steamapps\common\Geometry Dash\")
				{
				MsgBox, It seems you chose a wrong folder. Make sure that Geometry Dash is installed in C:\Program Files (x86)\Steam\steamapps\common\Geometry Dash\ or use a different folder.
				}
				
			Else
				{
				MsgBox, It seems you chose a wrong folder. Make sure to use the Geometry Dash folder and not the Resources folder.
				}
			}
			
		Else
			{
			FileAppend, %gdFolder%, gdfolder.save
			}

	}


else
	{
	FileSelectFolder, Folder,, 3, Select your texturepack folder
	FileAppend, %Folder%, texturepackfolder.save
	IfExist, texturepackfolder.save
		{
		MsgBox, You have initialized! Please restart GDTPS (code: makefile-1)
		}
		
		Else
		{
		msgbox, OH NO SHOOT WE CAN'T MAKE FILES AAAAAAAAAAAAA (errorcode: makefile%ErrorLevel%)
		}
	}
