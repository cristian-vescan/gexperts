library GExpertsRSXE1;

{$E dll}

uses
  GX_About in '..\..\source\Framework\GX_About.pas' {fmAbout},
  GX_ActionBroker in '..\..\source\Framework\GX_ActionBroker.pas',
  GX_Actions in '..\..\source\Framework\GX_Actions.pas',
  GX_AsciiChart in '..\..\source\Experts\GX_AsciiChart.pas' {fmAsciiChart},
  GX_Backup in '..\..\source\BackupProject\GX_Backup.pas' {fmBackup},
  GX_BackupConfig in '..\..\source\BackupProject\GX_BackupConfig.pas' {fmBackupConfig},
  GX_BackupOptions in '..\..\source\BackupProject\GX_BackupOptions.pas' {fmBackupOptions},
  GX_BaseForm in '..\..\source\Framework\GX_BaseForm.pas' {fmBaseForm},
  GX_Bookmarks in '..\..\source\Bookmarks\GX_Bookmarks.pas' {fmGxBookmarksForm},
  GX_ClassBrowser in '..\..\source\ClassBrowser\GX_ClassBrowser.pas' {fmClassBrowser},
  GX_ClassHacks in '..\..\source\Framework\GX_ClassHacks.pas',
  GX_ClassIdentify in '..\..\source\ClassBrowser\GX_ClassIdentify.pas' {fmClassIdentify},
  GX_ClassMgr in '..\..\source\Framework\GX_ClassMgr.pas',
  GX_ClassOptions in '..\..\source\ClassBrowser\GX_ClassOptions.pas' {fmClassOptions},
  GX_ClassParsing in '..\..\source\ClassBrowser\GX_ClassParsing.pas' {fmClassParsing},
  GX_ClassProp in '..\..\source\ClassBrowser\GX_ClassProp.pas' {fmClassProp},
  GX_ClassReport in '..\..\source\ClassBrowser\GX_ClassReport.pas' {fmClassReport},
  GX_CleanDirectories in '..\..\source\Experts\GX_CleanDirectories.pas' {fmCleanDirectories},
  GX_ClipboardHistory in '..\..\source\ClipboardHistory\GX_ClipboardHistory.pas' {fmClipboardHistory},
  GX_ClipboardOptions in '..\..\source\ClipboardHistory\GX_ClipboardOptions.pas' {fmClipboardOptions},
  GX_CodeLib in '..\..\source\CodeLibrarian\GX_CodeLib.pas' {fmCodeLib},
  GX_CodeOpt in '..\..\source\CodeLibrarian\GX_CodeOpt.pas' {fmCodeOptions},
  GX_CodeSrch in '..\..\source\CodeLibrarian\GX_CodeSrch.pas' {fmCodeSearch},
  GX_ComponentGrid in '..\..\source\Experts\GX_ComponentGrid.pas' {fmComponentGrid},
  GX_CompRename in '..\..\source\RenameComponents\GX_CompRename.pas' {fmCompRename},
  GX_CompRenameAdvanced in '..\..\source\RenameComponents\GX_CompRenameAdvanced.pas' {fmCompRenameAdvanced},
  GX_CompRenameConfig in '..\..\source\RenameComponents\GX_CompRenameConfig.pas' {fmCompRenameConfig},
  GX_CompsToCode in '..\..\source\Experts\GX_CompsToCode.pas' {fmCompsToCode},
  GX_ConfigurationInfo in '..\..\source\Framework\GX_ConfigurationInfo.pas',
  GX_Configure in '..\..\source\Framework\GX_Configure.pas' {fmConfiguration},
  GX_ConfigureExperts in '..\..\Source\Framework\GX_ConfigureExperts.pas' {frConfigureExperts: TFrame},
  GX_Consts in '..\..\source\Framework\GX_Consts.pas',
  GX_CopyComponentNames in '..\..\source\Experts\GX_CopyComponentNames.pas',
  GX_DbugIntf in '..\..\source\Framework\GX_DbugIntf.pas',
  GX_DesignerMenu in '..\..\source\Framework\GX_DesignerMenu.pas',
  GX_eAlign in '..\..\source\Editor\GX_eAlign.pas' {fmAlign},
  GX_eAlignOptions in '..\..\source\Editor\GX_eAlignOptions.pas' {fmAlignOptions},
  GX_eChangeCase in '..\..\source\Editor\GX_eChangeCase.pas',
  GX_eCodeFormatter in '..\..\source\Formatter\GX_eCodeFormatter.pas',
  GX_eComment in '..\..\source\Editor\GX_eComment.pas' {fmCommentConfig},
  GX_eDate in '..\..\source\Editor\GX_eDate.pas' {fmDateFormat},
  GX_eFindDelimiter in '..\..\source\Editor\GX_eFindDelimiter.pas',
  GX_ePasteAs in '..\..\source\Editor\GX_ePasteAs.pas' {fmPasteAsConfig},
  GX_ePrevNextIdentifier in '..\..\source\Editor\GX_ePrevNextIdentifier.pas',
  GX_eReverseStatement in '..\..\source\Editor\GX_eReverseStatement.pas',
  GX_eSelectIdentifier in '..\..\source\Editor\GX_eSelectIdentifier.pas',
  GX_eSelectionEditorExpert in '..\..\source\Editor\GX_eSelectionEditorExpert.pas',
  GX_eSort in '..\..\Source\Editor\GX_eSort.pas' {fmeSortConfig},
  GX_UsesExpert in '..\..\Source\UsesExpert\GX_UsesExpert.pas' {fmUsesManager},
  GX_UsesExpertOptions in '..\..\Source\UsesExpert\GX_UsesExpertOptions.pas' {fmUsesExpertOptions},
  GX_ePopupMenu in '..\..\Source\Editor\GX_ePopupMenu.pas' {fmEditorPopupMenuExpertConfig},
  GX_EditorChangeServices in '..\..\source\Framework\GX_EditorChangeServices.pas',
  GX_EditorEnhancements in '..\..\source\Framework\GX_EditorEnhancements.pas',
  GX_EditorExpert in '..\..\source\Editor\GX_EditorExpert.pas',
  GX_EditorExpertManager in '..\..\source\Editor\GX_EditorExpertManager.pas',
  GX_EditorFormServices in '..\..\source\Framework\GX_EditorFormServices.pas',
  GX_EditorShortcut in '..\..\source\Framework\GX_EditorShortcut.pas' {fmEditorShortcut},
  GX_EditReader in '..\..\source\Framework\GX_EditReader.pas',
  GX_ExpertManager in '..\..\source\Experts\GX_ExpertManager.pas' {fmExpertManager},
  GX_Experts in '..\..\source\Framework\GX_Experts.pas',
  GX_FavFileProp in '..\..\source\FavoriteFiles\GX_FavFileProp.pas' {fmFavFileProp},
  GX_FavFiles in '..\..\source\FavoriteFiles\GX_FavFiles.pas' {fmFavFiles},
  GX_FavFolderProp in '..\..\source\FavoriteFiles\GX_FavFolderProp.pas',
  GX_FavNewFolder in '..\..\source\FavoriteFiles\GX_FavNewFolder.pas' {fmFavNewFolder},
  GX_FavOptions in '..\..\source\FavoriteFiles\GX_FavOptions.pas' {fmFavOptions},
  GX_FavUtil in '..\..\source\FavoriteFiles\GX_FavUtil.pas',
  GX_FeedbackWizard in '..\..\source\Framework\GX_FeedbackWizard.pas' {fmFeedbackWizard},
  GX_FileScanner in '..\..\source\Framework\GX_FileScanner.pas',
  GX_FindComponentRef in '..\..\source\Experts\GX_FindComponentRef.pas',
  GX_GenericClasses in '..\..\source\Utils\GX_GenericClasses.pas',
  GX_GenericUtils in '..\..\source\Utils\GX_GenericUtils.pas',
  GX_GetIdeVersion in '..\..\source\Framework\GX_GetIdeVersion.pas',
  GX_GExperts in '..\..\source\Framework\GX_GExperts.pas',
  GX_GrepBackend in '..\..\source\Grep\GX_GrepBackend.pas',
  GX_GrepExpert in '..\..\source\Grep\GX_GrepExpert.pas',
  GX_GrepOptions in '..\..\source\Grep\GX_GrepOptions.pas' {fmGrepOptions},
  GX_GrepPrinting in '..\..\source\Grep\GX_GrepPrinting.pas',
  GX_GrepRegExSearch in '..\..\source\Grep\GX_GrepRegExSearch.pas',
  GX_GrepReplace in '..\..\source\Grep\GX_GrepReplace.pas' {fmGrepReplace},
  GX_GrepResults in '..\..\source\Grep\GX_GrepResults.pas' {fmGrepResults},
  GX_GrepResultsOptions in '..\..\source\Grep\GX_GrepResultsOptions.pas' {fmGrepResultsOptions},
  GX_GrepSearch in '..\..\source\Grep\GX_GrepSearch.pas' {fmGrepSearch},
  GX_GrepProgress in '..\..\Source\Grep\GX_GrepProgress.pas' {fmGrepProgress},
  GX_GrepSelect in '..\..\Source\Grep\GX_GrepSelect.pas' {fmGrepSelect},
  GX_GxUtils in '..\..\source\Utils\GX_GxUtils.pas',
  GX_HideNonVisualComps in '..\..\source\Experts\GX_HideNonVisualComps.pas',
  GX_IconMessageBox in '..\..\source\Framework\GX_IconMessageBox.pas',
  GX_IdeDock in '..\..\source\IDEDocking\GX_IdeDock.pas' {fmIdeDockForm},
  GX_IdeEnhance in '..\..\source\IDE\GX_IdeEnhance.pas',
  GX_IdeFormEnhancer in '..\..\source\IDE\GX_IdeFormEnhancer.pas',
  GX_IdeShortCuts in '..\..\source\Experts\GX_IdeShortCuts.pas' {fmIdeShortCuts},
  GX_IdeUtils in '..\..\source\Utils\GX_IdeUtils.pas',
  GX_InsertAutoTodo in '..\..\Source\AutoTodo\GX_InsertAutoTodo.pas' {fmInsertAutoTodoForm},
  GX_KbdShortCutBroker in '..\..\source\Framework\GX_KbdShortCutBroker.pas',
  GX_KibitzComp in '..\..\source\Framework\GX_KibitzComp.pas',
  GX_LibrarySource in '..\..\source\Framework\GX_LibrarySource.pas',
  GX_MacroExpandNotifier in '..\..\source\MacroTemplates\GX_MacroExpandNotifier.pas',
  GX_MacroFile in '..\..\source\MacroTemplates\GX_MacroFile.pas',
  GX_MacroLibrary in '..\..\source\MacroLibrary\GX_MacroLibrary.pas' {fmMacroLibrary},
  GX_MacroLibraryEditEntry in '..\..\Source\MacroLibrary\GX_MacroLibraryEditEntry.pas' {fmEditMacroItem},
  GX_MacroLibraryNamePrompt in '..\..\source\MacroLibrary\GX_MacroLibraryNamePrompt.pas' {fmMacroLibraryNamePrompt},
  GX_MacroLibraryConfig in '..\..\source\MacroLibrary\GX_MacroLibraryConfig.pas' {fmGxMacroLibraryConfig},
  GX_MacroParser in '..\..\source\Framework\GX_MacroParser.pas',
  GX_MacroSelect in '..\..\source\MacroTemplates\GX_MacroSelect.pas' {fmMacroSelect},
  GX_MacroTemplateEdit in '..\..\source\MacroTemplates\GX_MacroTemplateEdit.pas' {fmMacroTemplateEdit},
  GX_MacroTemplates in '..\..\source\MacroTemplates\GX_MacroTemplates.pas' {fmMacroTemplates},
  GX_MacroTemplatesExpert in '..\..\source\MacroTemplates\GX_MacroTemplatesExpert.pas',
  GX_MenuActions in '..\..\source\Framework\GX_MenuActions.pas',
  GX_MenusForEditorExpert in '..\..\source\Editor\GX_MenusForEditorExpert.pas',
  GX_MessageBox in '..\..\source\Framework\GX_MessageBox.pas' {fmGxMessageBox},
  GX_MessageDialog in '..\..\source\MessageDialog\GX_MessageDialog.pas' {fmMessageDialog},
  GX_MessageOptions in '..\..\source\MessageDialog\GX_MessageOptions.pas' {fmMessageOptions},
  GX_MultilineHost in '..\..\source\IDE\GX_MultilineHost.pas',
  GX_MultiLinePalette in '..\..\source\IDE\GX_MultiLinePalette.pas',
  GX_OpenFile in '..\..\source\OpenFile\GX_OpenFile.pas' {fmOpenFile},
  GX_OpenFileConfig in '..\..\source\OpenFile\GX_OpenFileConfig.pas' {fmOpenFileConfig},
  GX_OtaUtils in '..\..\source\Utils\GX_OtaUtils.pas',
  GX_PeInfo in '..\..\source\PeInfo\GX_PeInfo.pas',
  GX_PeInformation in '..\..\source\PeInfo\GX_PeInformation.pas' {fmPeInformation},
  GX_ProcedureList in '..\..\source\ProcedureList\GX_ProcedureList.pas' {fmProcedureList},
  GX_ProcedureListOptions in '..\..\source\ProcedureList\GX_ProcedureListOptions.pas' {fmProcedureListOptions},
  GX_Progress in '..\..\source\Framework\GX_Progress.pas' {fmProgress},
  GX_ProjDepend in '..\..\source\ProjectDependencies\GX_ProjDepend.pas' {fmProjDepend},
  GX_ProjDependFilter in '..\..\source\ProjectDependencies\GX_ProjDependFilter.pas' {fmProjDependFilter},
  GX_ProjDependProp in '..\..\source\ProjectDependencies\GX_ProjDependProp.pas' {fmProjDependProp},
  GX_ProjOptionSets in '..\..\source\ProjectOptionSets\GX_ProjOptionSets.pas' {fmProjOptionSets},
  GX_ProjOptMap in '..\..\source\ProjectOptionSets\GX_ProjOptMap.pas',
  GX_ProofreaderAutoCorrectEntry in '..\..\source\CodeProofreader\GX_ProofreaderAutoCorrectEntry.pas' {fmProofreaderAutoCorrectEntry},
  GX_ProofreaderConfig in '..\..\source\CodeProofreader\GX_ProofreaderConfig.pas' {fmProofreaderConfig},
  GX_ProofreaderCorrection in '..\..\source\CodeProofreader\GX_ProofreaderCorrection.pas',
  GX_ProofreaderData in '..\..\source\CodeProofreader\GX_ProofreaderData.pas',
  GX_ProofreaderDefaults in '..\..\source\CodeProofreader\GX_ProofreaderDefaults.pas',
  GX_ProofreaderExpert in '..\..\source\CodeProofreader\GX_ProofreaderExpert.pas',
  GX_ProofreaderKeyboard in '..\..\source\CodeProofreader\GX_ProofreaderKeyboard.pas',
  GX_ProofreaderUtils in '..\..\source\CodeProofreader\GX_ProofreaderUtils.pas',
  GX_Replace in '..\..\source\Grep\GX_Replace.pas',
  GX_ReplaceComp in '..\..\source\ReplaceComponents\GX_ReplaceComp.pas' {fmReplaceComp},
  GX_ReplaceCompData in '..\..\source\ReplaceComponents\GX_ReplaceCompData.pas',
  GX_ReplaceCompLog in '..\..\source\ReplaceComponents\GX_ReplaceCompLog.pas' {fmReplaceCompLog},
  GX_ReplaceCompMapDets in '..\..\source\ReplaceComponents\GX_ReplaceCompMapDets.pas' {fmReplaceCompMapDets},
  GX_ReplaceCompMapGrpList in '..\..\source\ReplaceComponents\GX_ReplaceCompMapGrpList.pas' {fmReplaceCompMapGrpList},
  GX_ReplaceCompMapList in '..\..\source\ReplaceComponents\GX_ReplaceCompMapList.pas' {fmReplaceCompMapList},
  GX_ReplaceCompUtils in '..\..\source\ReplaceComponents\GX_ReplaceCompUtils.pas',
  GX_SetComponentProps in '..\..\source\SetComponentProperties\GX_SetComponentProps.pas',
  GX_SetComponentPropsConfig in '..\..\source\SetComponentProperties\GX_SetComponentPropsConfig.pas' {fmSetComponentPropsConfig},
  GX_SetComponentPropsStatus in '..\..\source\SetComponentProperties\GX_SetComponentPropsStatus.pas' {fmSetComponentPropsStatus},
  GX_SetFocusControl in '..\..\source\Experts\GX_SetFocusControl.pas',
  GX_SharedImages in '..\..\source\Framework\GX_SharedImages.pas' {dmSharedImages: TDataModule},
  GX_SourceExport in '..\..\source\SourceExport\GX_SourceExport.pas' {fmSourceExport},
  GX_SourceExportOptions in '..\..\source\SourceExport\GX_SourceExportOptions.pas' {fmSourceExportOptions},
  GX_SynMemoUtils in '..\..\source\Framework\GX_SynMemoUtils.pas',
  GX_TabOrder in '..\..\source\Experts\GX_TabOrder.pas' {fmTabOrder},
  GX_ToDo in '..\..\source\ToDoList\GX_ToDo.pas' {fmToDo},
  GX_ToDoOptions in '..\..\source\ToDoList\GX_ToDoOptions.pas' {fmToDoOptions},
  GX_Toolbar in '..\..\source\EditorToolbar\GX_Toolbar.pas',
  GX_ToolbarConfig in '..\..\source\EditorToolbar\GX_ToolbarConfig.pas' {fmToolbarConfig},
  GX_ToolBarDropDown in '..\..\source\EditorToolbar\GX_ToolBarDropDown.pas',
  GX_UnitPositions in '..\..\source\Framework\GX_UnitPositions.pas',
  GX_UsesManager in '..\..\source\Framework\GX_UsesManager.pas',
  GX_VerDepConst in '..\..\source\Framework\GX_VerDepConst.pas',
  GX_XmlUtils in '..\..\source\Utils\GX_XmlUtils.pas',
  GX_Zipper in '..\..\source\BackupProject\GX_Zipper.pas',
  GX_Formatter in '..\..\source\Formatter\GX_Formatter.pas',
  GX_CodeFormatterBreakpoints in '..\..\source\Formatter\GX_CodeFormatterBreakpoints.pas',
  GX_CodeFormatterConfig in '..\..\source\Formatter\GX_CodeFormatterConfig.pas' {fmCodeFormatterConfig},
  GX_CodeFormatterConfigHandler in '..\..\source\Formatter\GX_CodeFormatterConfigHandler.pas',
  GX_CodeFormatterDefaultSettings in '..\..\source\Formatter\GX_CodeFormatterDefaultSettings.pas',
  GX_CodeFormatterEditCapitalization in '..\..\source\Formatter\GX_CodeFormatterEditCapitalization.pas' {fmCodeFormatterEditCapitalization},
  GX_CodeFormatterExpert in '..\..\source\Formatter\GX_CodeFormatterExpert.pas',
  GX_CodeFormatterGXConfigWrapper in '..\..\source\Formatter\GX_CodeFormatterGXConfigWrapper.pas',
  GX_CodeFormatterBookmarks in '..\..\source\Formatter\GX_CodeFormatterBookmarks.pas',
  GX_CodeFormatterTokenList in '..\..\source\Formatter\engine\GX_CodeFormatterTokenList.pas',
  GX_CodeFormatterTypes in '..\..\source\Formatter\engine\GX_CodeFormatterTypes.pas',
  GX_CodeFormatterTokens in '..\..\source\Formatter\engine\GX_CodeFormatterTokens.pas',
  GX_CodeFormatterFormatter in '..\..\source\Formatter\engine\GX_CodeFormatterFormatter.pas',
  GX_CodeFormatterParser in '..\..\source\Formatter\engine\GX_CodeFormatterParser.pas',
  GX_CodeFormatterSettings in '..\..\source\Formatter\engine\GX_CodeFormatterSettings.pas',
  GX_CodeFormatterStack in '..\..\source\Formatter\engine\GX_CodeFormatterStack.pas',
  GX_CodeFormatterEngine in '..\..\source\Formatter\engine\GX_CodeFormatterEngine.pas',
  GX_AboutExperimental in '..\..\source\Formatter\GX_AboutExperimental.pas' {fmAboutExperimental},
  GX_CodeFormatterUnicode in '..\..\source\Formatter\engine\GX_CodeFormatterUnicode.pas',
  GX_IdeSearchPathEnhancer in '..\..\source\IDE\GX_IdeSearchPathEnhancer.pas',
  GX_HideNavbar in '..\..\source\Experts\GX_HideNavbar.pas',
  GX_dzVclUtils in '..\..\source\Utils\GX_dzVclUtils.pas',
  GX_IdeProjectOptionsEnhancer in '..\..\source\IDE\GX_IdeProjectOptionsEnhancer.pas',
  GX_PasteAs in '..\..\source\Framework\GX_PasteAs.pas',
  GX_IdeToolPropertiesEnhancer in '..\..\source\IDE\GX_IdeToolPropertiesEnhancer.pas',
  GX_NTAEditServiceNotifier in '..\..\source\Utils\GX_NTAEditServiceNotifier.pas',
  GX_EditBookmark in '..\..\source\Bookmarks\GX_EditBookmark.pas' {fmEditBookmarks},
  GX_BookmarkList in '..\..\source\Utils\GX_BookmarkList.pas',
  GX_dzQuicksort in '..\..\source\Utils\GX_dzQuicksort.pas',
  GX_IdeInstallPackagesEnhancer in '..\..\source\IDE\GX_IdeInstallPackagesEnhancer.pas',
  GX_IdePackageRenameDlg in '..\..\source\IDE\GX_IdePackageRenameDlg.pas' {fmIdxPackageRenameDlg},
  GX_dzClassUtils in '..\..\Source\Utils\GX_dzClassUtils.pas',
  GX_EventHook in '..\..\source\framework\GX_EventHook.pas',
  GX_BaseExpert in '..\..\Source\Framework\GX_BaseExpert.pas',
  GX_uAutoTodoHandler in '..\..\Source\AutoTodo\GX_uAutoTodoHandler.pas',
  GX_AutoTodoDone in '..\..\Source\AutoTodo\GX_AutoTodoDone.pas' {fmAutoTodoDone},
  GX_dzFileUtils in '..\..\Source\Utils\GX_dzFileUtils.pas',
  GX_dzSelectDirectoryFix in '..\..\Source\Utils\GX_dzSelectDirectoryFix.pas',
  GX_eAddToCaptitalization in '..\..\Source\Formatter\GX_eAddToCaptitalization.pas',
  GX_VCLFixPack in '..\..\Source\Utils\GX_VCLFixPack.pas',
  GX_dzVersionInfo in '..\..\Source\Utils\GX_dzVersionInfo.pas',
  GX_dzOsUtils in '..\..\Source\Utils\GX_dzOsUtils.pas',
  GX_dzPackageInfo in '..\..\Source\Utils\GX_dzPackageInfo.pas',
  GX_PeInfoPrint in '..\..\Source\PeInfo\GX_PeInfoPrint.pas' {f_PeInfoPrint},
  GX_IdeFavoritesList in '..\..\Source\IDE\GX_IdeFavoritesList.pas' {f_GxIdeFavoritesList},
  GX_IdeSearchPathFavoriteEdit in '..\..\Source\IDE\GX_IdeSearchPathFavoriteEdit.pas' {f_IdeSearchPathFavoriteEdit},
  GX_ReselectDesktop in '..\..\Source\Experts\GX_ReselectDesktop.pas',
  GX_eWarn in '..\..\Source\Editor\GX_eWarn.pas' {fmConfigureWarning},
  GX_eIfDef in '..\..\Source\Editor\GX_eIfDef.pas' {fmConfigureIfDef},
  GX_eConvertStrings in '..\..\Source\Editor\GX_eConvertStrings.pas' {fmEConvertStrings},
  GX_IdeGotoEnhancer in '..\..\Source\IDE\GX_IdeGotoEnhancer.pas',
  GX_dzMapFileReader in '..\..\Source\Utils\GX_dzMapFileReader.pas',
  GX_IdeObjectInspectorEnhancer in '..\..\Source\IDE\GX_IdeObjectInspectorEnhancer.pas',
  GX_IdeBuildEventFavoriteEdit in '..\..\Source\IDE\GX_IdeBuildEventFavoriteEdit.pas' {f_IdeBuildEventFavoriteEdit},
  GX_IdeBuildEventsEnhancer in '..\..\Source\IDE\GX_IdeBuildEventsEnhancer.pas',
  GX_ReadMapFileThread in '..\..\Source\Utils\GX_ReadMapFileThread.pas',
  GX_IdeApplicationSettingsEnhancer in '..\..\Source\IDE\GX_IdeApplicationSettingsEnhancer.pas',
  GX_IdeDialogEnhancer in '..\..\Source\IDE\GX_IdeDialogEnhancer.pas',
  GX_IdeManagedForm in '..\..\Source\IDE\GX_IdeManagedForm.pas',
  GX_IdeFormChangeManager in '..\..\Source\IDE\GX_IdeFormChangeManager.pas';

{$R '..\..\images\GXIcons.res' '..\..\images\GXIcons.rc'}
{$R *_version.res}

begin
end.

