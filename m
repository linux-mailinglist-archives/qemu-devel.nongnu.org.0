Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B19373EC2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:43:13 +0200 (CEST)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJg8-0005GH-38
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJZ7-0005wG-0x
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:35:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:47942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJZ3-0007uA-SL
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:35:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leJYw-0006dT-Og
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 15:35:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5E37D2E8197
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 15:35:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 15:26:46 -0000
From: Thomas Huth <1860553@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cyborgyn glaubitz laurent-vivier rth th-huth
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157970117843.5560.13252417721225198010.malonedeb@chaenomeles.canonical.com>
Message-Id: <162022840627.3082.12378483516509129856.malone@gac.canonical.com>
Subject: [Bug 1860553] Re: cmake crashes on qemu-alpha-user with Illegal
 Instruction
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: aa324c62a94e28642d934674a9f7f11dcebab3b6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1860553 <1860553@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860553

Title:
  cmake crashes on qemu-alpha-user with Illegal Instruction

Status in QEMU:
  Incomplete

Bug description:
  I tried building cmake on Debian unstable for Alpha today using qemu-
  user and the compiled cmake binary crashed with "Illegal Instruction":

  g++ -Wl,-z,relro -Wl,--as-needed -g -O2 -fdebug-prefix-map=3D/<<PKGBUILDD=
IR>>=3D. -Wformat -Werror=3Dformat-security -Wdate-time -D_FORTIFY_SOURCE=
=3D2             -I/<<PKGBUILDDIR>>/Build/Bootstrap.cmk   -I/<<PKGBUILDDIR>=
>/Source   -I/<<PKGBUILDDIR>>/Source/LexerParser   -I/<<PKGBUILDDIR>>/Utili=
ties  cmAddCustomCommandCommand.o cmAddCustomTargetCommand.o cmAddDefinitio=
nsCommand.o cmAddDependenciesCommand.o cmAddExecutableCommand.o cmAddLibrar=
yCommand.o cmAddSubDirectoryCommand.o cmAddTestCommand.o cmArgumentParser.o=
 cmBreakCommand.o cmBuildCommand.o cmCMakeMinimumRequired.o cmCMakePolicyCo=
mmand.o cmCPackPropertiesGenerator.o cmCacheManager.o cmCommand.o cmCommand=
ArgumentParserHelper.o cmCommands.o cmCommonTargetGenerator.o cmComputeComp=
onentGraph.o cmComputeLinkDepends.o cmComputeLinkInformation.o cmComputeTar=
getDepends.o cmConditionEvaluator.o cmConfigureFileCommand.o cmContinueComm=
and.o cmCoreTryCompile.o cmCreateTestSourceList.o cmCustomCommand.o cmCusto=
mCommandGenerator.o cmDefinePropertyCommand.o cmDefinitions.o cmDepends.o c=
mDependsC.o cmDisallowedCommand.o cmDocumentationFormatter.o cmEnableLangua=
geCommand.o cmEnableTestingCommand.o cmExecProgramCommand.o cmExecuteProces=
sCommand.o cmExpandedCommandArgument.o cmExportBuildFileGenerator.o cmExpor=
tFileGenerator.o cmExportInstallFileGenerator.o cmExportSet.o cmExportSetMa=
p.o cmExportTryCompileFileGenerator.o cmExprParserHelper.o cmExternalMakefi=
leProjectGenerator.o cmFileCommand.o cmFileCopier.o cmFileInstaller.o cmFil=
eTime.o cmFileTimeCache.o cmFileTimes.o cmFindBase.o cmFindCommon.o cmFindF=
ileCommand.o cmFindLibraryCommand.o cmFindPackageCommand.o cmFindPathComman=
d.o cmFindProgramCommand.o cmForEachCommand.o cmFunctionCommand.o cmFSPermi=
ssions.o cmGeneratedFileStream.o cmGeneratorExpression.o cmGeneratorExpress=
ionContext.o cmGeneratorExpressionDAGChecker.o cmGeneratorExpressionEvaluat=
ionFile.o cmGeneratorExpressionEvaluator.o cmGeneratorExpressionLexer.o cmG=
eneratorExpressionNode.o cmGeneratorExpressionParser.o cmGeneratorTarget.o =
cmGetCMakePropertyCommand.o cmGetDirectoryPropertyCommand.o cmGetFilenameCo=
mponentCommand.o cmGetPipes.o cmGetPropertyCommand.o cmGetSourceFilePropert=
yCommand.o cmGetTargetPropertyCommand.o cmGetTestPropertyCommand.o cmGlobal=
CommonGenerator.o cmGlobalGenerator.o cmGlobalUnixMakefileGenerator3.o cmGl=
obVerificationManager.o cmHexFileConverter.o cmIfCommand.o cmIncludeCommand=
.o cmIncludeGuardCommand.o cmIncludeDirectoryCommand.o cmIncludeRegularExpr=
essionCommand.o cmInstallCommand.o cmInstallCommandArguments.o cmInstallDir=
ectoryGenerator.o cmInstallExportGenerator.o cmInstallFilesCommand.o cmInst=
allFilesGenerator.o cmInstallGenerator.o cmInstallScriptGenerator.o cmInsta=
llSubdirectoryGenerator.o cmInstallTargetGenerator.o cmInstallTargetsComman=
d.o cmInstalledFile.o cmLinkDirectoriesCommand.o cmLinkItem.o cmLinkLineCom=
puter.o cmLinkLineDeviceComputer.o cmListCommand.o cmListFileCache.o cmLoca=
lCommonGenerator.o cmLocalGenerator.o cmLocalUnixMakefileGenerator3.o cmMSV=
C60LinkLineComputer.o cmMacroCommand.o cmMakeDirectoryCommand.o cmMakefile.=
o cmMakefileExecutableTargetGenerator.o cmMakefileLibraryTargetGenerator.o =
cmMakefileTargetGenerator.o cmMakefileUtilityTargetGenerator.o cmMarkAsAdva=
ncedCommand.o cmMathCommand.o cmMessageCommand.o cmMessenger.o cmNewLineSty=
le.o cmOSXBundleGenerator.o cmOptionCommand.o cmOrderDirectories.o cmOutput=
Converter.o cmParseArgumentsCommand.o cmPathLabel.o cmPolicies.o cmProcessO=
utput.o cmProjectCommand.o cmProperty.o cmPropertyDefinition.o cmPropertyDe=
finitionMap.o cmPropertyMap.o cmReturnCommand.o cmRulePlaceholderExpander.o=
 cmScriptGenerator.o cmSearchPath.o cmSeparateArgumentsCommand.o cmSetComma=
nd.o cmSetDirectoryPropertiesCommand.o cmSetPropertyCommand.o cmSetSourceFi=
lesPropertiesCommand.o cmSetTargetPropertiesCommand.o cmSetTestsPropertiesC=
ommand.o cmSiteNameCommand.o cmSourceFile.o cmSourceFileLocation.o cmState.=
o cmStateDirectory.o cmStateSnapshot.o cmStringReplaceHelper.o cmStringComm=
and.o cmSubdirCommand.o cmSystemTools.o cmTarget.o cmTargetCompileDefinitio=
nsCommand.o cmTargetCompileFeaturesCommand.o cmTargetCompileOptionsCommand.=
o cmTargetIncludeDirectoriesCommand.o cmTargetLinkLibrariesCommand.o cmTarg=
etPropCommandBase.o cmTargetPropertyComputer.o cmTargetSourcesCommand.o cmT=
est.o cmTestGenerator.o cmTimestamp.o cmTryCompileCommand.o cmTryRunCommand=
.o cmUnexpectedCommand.o cmUnsetCommand.o cmUVHandlePtr.o cmUVProcessChain.=
o cmVersion.o cmWhileCommand.o cmWorkingDirectory.o cmake.o cmakemain.o cmc=
md.o cm_string_view.o cmCommandArgumentLexer.o cmCommandArgumentParser.o cm=
ExprLexer.o cmExprParser.o cmListFileLexer.o Directory.o EncodingCXX.o FStr=
eam.o Glob.o RegularExpression.o SystemTools.o EncodingC.o ProcessUNIX.o St=
ring.o System.o Terminal.o uv-src-strscpy.c.o uv-src-timer.c.o uv-src-uv-co=
mmon.c.o uv-src-unix-cmake-bootstrap.c.o uv-src-unix-core.c.o uv-src-unix-f=
s.c.o uv-src-unix-loop.c.o uv-src-unix-loop-watcher.c.o uv-src-unix-no-fsev=
ents.c.o uv-src-unix-pipe.c.o uv-src-unix-poll.c.o uv-src-unix-posix-hrtime=
.c.o uv-src-unix-posix-poll.c.o uv-src-unix-process.c.o uv-src-unix-signal.=
c.o uv-src-unix-stream.c.o  -ldl -lrt -o cmake
  make[2]: Leaving directory '/<<PKGBUILDDIR>>/Build/Bootstrap.cmk'
  loading initial cache file /<<PKGBUILDDIR>>/Build/Bootstrap.cmk/InitialCa=
cheFlags.cmake
  Illegal instruction
  ---------------------------------------------
  Error when bootstrapping CMake:
  Problem while running initial CMake
  ---------------------------------------------

  I'm working on creating a chroot for download to reproduce the issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860553/+subscriptions

