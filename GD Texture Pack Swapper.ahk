#SingleInstance Force






IfExist, texturepackfolder.save ;if setup is complete
	{
	IfExist, gdfolder.save
		{
		guiMode()
		}
	
		Else
		{
			FileRead, tpfolderFromFile, texturepackfolder.save
			IfExist, gdfolder.save
			{
			FileRead, gdfolderFromFile, gdfolder.save
			}
	
			Else
			{
			MsgBox, 4,, Would you like to use the default GD directory?
			
			IfMsgBox, No
			{
			FileSelectFolder, gdFolder,, 3, Select your Geometry Dash folder
			}
		
		Else
		{
		gdFolder := "C:\Program Files (x86)\Steam\steamapps\common\Geometry Dash" ;set gdFolder to the default steam one
		}
		
		IfNotExist, %gdFolder%\Resources ;if the resources folder doesn't exit
			{
			MsgBox, It seems you chose a wrong folder. Make sure to use the Geometry Dash folder and not the Resources folder.
			MsgBox, Here have some troubleshooting info! FolderSel: %gdFolder%
			}
			
		Else ;if the resources folder does exist
			{
			FileAppend, %gdFolder%, gdfolder.save
			MsgBox, You have completed setup! Please restart the program.
			}
	}
}
}
else ;if setup isn't complete, start setup
	{
	FileSelectFolder, Folder,, 3, Select your main texturepack storage folder (e.g. use c:\texturepack\, not c:\texturepack\pack1)
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


guiMode() {
Gui, New, +Resize
Gui, Add, Button,, Restore Normal Textures
Gui, Add, Button, w100 h100, Swap Pack
Gui, Show
}

buttonRestoreNormalTextures() {	
MsgBox, 4,, Do you have a backup of the default textures?
	IfMsgBox, Yes
	{
	FileRead, tpfolderFromFile, texturepackfolder.save
	FileRead, gdfolderFromFile, gdfolder.save
	FileSelectFolder, DFTSelect, %tpfolderFromFile%
	FileCopyDir, %DFTSelect%, %gdfolderFromFile%\Resources, 1
		if(ErrorLevel == 1)
		{
		MsgBox, Application Failed, check program perms. (error code: cpy%ErrorLevel%)
		}
		
		else
		{
		MsgBox, DEFAULTPACK has applied with the code %ErrorLevel%
		}
	}
	
	else
	{
	msgbox, Downloading is not yet supported. Should've made a backup while you could. (=
	exitapp
	}

}

buttonSwapPack() {
	FileRead, tpfolderFromFile, texturepackfolder.save
	FileRead, gdfolderFromFile, gdfolder.save
	FileSelectFolder, PackSelect, %tpfolderFromFile%
	FileCopyDir, %PackSelect%, %gdfolderFromFile%\Resources, 1
		if(ErrorLevel == 1)
		{
		MsgBox, Application Failed, check program perms. (error code: cpy%ErrorLevel%)
		}
		
		else
		{
		MsgBox, %PackSelect% has applied with the code %ErrorLevel%
		}
}