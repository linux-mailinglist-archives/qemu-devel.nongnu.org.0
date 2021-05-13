Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28AD37F747
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:59:37 +0200 (CEST)
Received: from localhost ([::1]:56356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhA08-00012v-ST
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lh9x6-0003AZ-Be
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:56:28 -0400
Received: from indium.canonical.com ([91.189.90.7]:38966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lh9wz-0004Dm-RN
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:56:28 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lh9ww-0000zy-OS
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 11:56:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0AD462E8223
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 11:56:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 11:49:55 -0000
From: Thomas Huth <1917542@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: macos qemu-img
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: och.ubuntu th-huth
X-Launchpad-Bug-Reporter: Changhee Oh (och.ubuntu)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161473421480.8403.16223338106260004167.malonedeb@gac.canonical.com>
Message-Id: <162090659523.2044.4423854379554896350.malone@wampee.canonical.com>
Subject: [Bug 1917542] Re: qemu-img crash on M1 Mac
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: d086870488b668ed4844de1e801a79ba5f28d1d6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1917542 <1917542@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Tags added: macos qemu-img

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917542

Title:
  qemu-img crash on M1 Mac

Status in QEMU:
  Incomplete

Bug description:
  1. Symptom
  $ qemu-img create -f qcow2 disk.qcow2 10G
  [1] 72373 killed qemu-img create -f qcow2 disk.qcow2 10G

  2. System environment
  CPU: Apple M1
  OS: Big Sur 11.2.2
  qemu:  stable 5.2.0 (Binary installed by homebrew)

  3. Kernel logs
  $ sudo log show --predicate =E2=80=98eventMessage LIKE =E2=80=9Cqemu=E2=
=80=9D=E2=80=99 --debug
  ntID Dirty: 1 Event: com.apple.stability.crash {=E2=80=9CappVersion=E2=80=
=9D:"???",=E2=80=9CexceptionType=E2=80=9D:1,=E2=80=9Clogwritten=E2=80=9D:1,=
=E2=80=9Cprocess=E2=80=9D:=E2=80=9Cqemu-img=E2=80=9D,=E2=80=9CresponsibleAp=
p=E2=80=9D:=E2=80=9CiTerm2=E2=80=9D,=E2=80=9Ctimestamp=E2=80=9D:16146668759=
93238}
  2021-03-02 15:36:52.728210+0900 0xfb308 Default 0x0 0 0 kernel: CODE SIGN=
ING: cs_invalid_page(0x102930000): p=3D72373[qemu-img] final status 0x23000=
200, denying page sending SIGKILL
  2021-03-02 15:36:52.728222+0900 0xfb308 Default 0x0 0 0 kernel: CODE SIGN=
ING: process 72373[qemu-img]: rejecting invalid page at address 0x102930000=
 from offset 0x0 in file =E2=80=9C/opt/homebrew/Cellar/libssh/0.9.5_1/lib/l=
ibssh.4.8.6.dylib=E2=80=9D (cs_mtime:1614297740.413435328 =3D=3D mtime:1614=
297740.413435328) (signed:1 validated:1 tainted:1 nx:0 wpmapped:0 dirty:0 d=
epth:0)
  2021-03-02 15:36:52.728477+0900 0xfab09 Default 0x0 919 0 ReportCrash: Pa=
rsing corpse data for process qemu-img [pid 72373]
  2021-03-02 15:36:52.884736+0900 0xfab09 Default 0x0 919 0 ReportCrash: (C=
rashReporterSupport) Saved crash report for qemu-img[72373] version 0 to qe=
mu-img_2021-03-02-153652_.crash

  4. Crash logs
  $ sudo cat /Users//Library/Logs/DiagnosticReports/qemu-img_2021-03-02-153=
652_.crash
  Process: qemu-img [72373]
  Path: /opt/homebrew/*/qemu-img
  Identifier: qemu-img
  Version: 0
  Code Type: ARM-64 (Native)
  Parent Process: zsh [67484]
  Responsible: iTerm2 [556]
  User ID: 501

  Date/Time: 2021-03-02 15:36:52.710 +0900
  OS Version: macOS 11.2.2 (20D80)
  Report Version: 12
  Anonymous UUID: AF87D5F0-2BED-EB72-1DC8-26F63A24DA7C

  Sleep/Wake UUID: 3862EA39-132E-42BD-A4BB-5A36F36607F1

  Time Awake Since Boot: 89000 seconds
  Time Since Wake: 520 seconds

  System Integrity Protection: enabled

  Crashed Thread: 0

  Exception Type: EXC_BAD_ACCESS (Code Signature Invalid)
  Exception Codes: 0x0000000000000032, 0x0000000102930000
  Exception Note: EXC_CORPSE_NOTIFY

  Termination Reason: Namespace CODESIGNING, Code 0x2

  kernel messages:

  VM Regions Near 0x102930000:
  __LINKEDIT 102908000-102930000 [ 160K] r=E2=80=93/r-- SM=3DCOW /opt/homeb=
rew/*
  =E2=86=92 mapped file 102930000-102934000 [ 16K] r=E2=80=93/r-x SM=3DPRV =
Object_id=3Dfc8cc3db
  __TEXT 1029bc000-102a38000 [ 496K] r-x/r-x SM=3DCOW /usr/lib/dyld

  Application Specific Information:
  dyld: launch, loading dependent libraries
  /opt/homebrew/opt/libssh/lib/libssh.4.dylib

  Thread 0 Crashed:
  0 dyld 0x0000000102a18780 bcmp + 16
  1 dyld 0x00000001029d9408 ImageLoaderMachO::validateFirstPages(linkedit_d=
ata_command const*, int, unsigned char const*, unsigned long, long long, Im=
ageLoader::LinkContext const&) + 136
  2 dyld 0x00000001029e03b8 ImageLoaderMachOCompressed::instantiateFromFile=
(char const*, int, unsigned char const*, unsigned long, unsigned long long,=
 unsigned long long, stat const&, unsigned int, unsigned int, linkedit_data=
_command const*, encryption_info_command const*, ImageLoader::LinkContext c=
onst&) + 268
  3 dyld 0x00000001029d7ffc ImageLoaderMachO::instantiateFromFile(char cons=
t*, int, unsigned char const*, unsigned long, unsigned long long, unsigned =
long long, stat const&, ImageLoader::LinkContext const&) + 172
  4 dyld 0x00000001029c0290 dyld::loadPhase6(int, stat const&, char const*,=
 dyld::LoadContext const&) + 668
  5 dyld 0x00000001029c8dd8 dyld::loadPhase5(char const*, char const*, dyld=
::LoadContext const&, unsigned int&, std::__1::vector<char const*, std::__1=
::allocator<char const*> >) + 1328
  6 dyld 0x00000001029c8824 dyld::loadPhase4(char const, char const*, dyld:=
:LoadContext const&, unsigned int&, std::__1::vector<char const*, std::__1:=
:allocator<char const*> >) + 208
  7 dyld 0x00000001029c8530 dyld::loadPhase3(char const, char const*, dyld:=
:LoadContext const&, unsigned int&, std::__1::vector<char const*, std::__1:=
:allocator<char const*> >) + 1100
  8 dyld 0x00000001029c7cf0 dyld::loadPhase1(char const, char const*, dyld:=
:LoadContext const&, unsigned int&, std::__1::vector<char const*, std::__1:=
:allocator<char const*> >) + 212
  9 dyld 0x00000001029bfe0c dyld::loadPhase0(char const, char const*, dyld:=
:LoadContext const&, unsigned int&, std::__1::vector<char const*, std::__1:=
:allocator<char const*> >) + 468
  10 dyld 0x00000001029bf9b0 dyld::load(char const, dyld::LoadContext const=
&, unsigned int&) + 196
  11 dyld 0x00000001029c977c dyld::libraryLocator(char const*, bool, char c=
onst*, ImageLoader::RPathChain const*, unsigned int&) + 56
  12 dyld 0x00000001029d39d4 ImageLoader::recursiveLoadLibraries(ImageLoade=
r::LinkContext const&, bool, ImageLoader::RPathChain const&, char const*) +=
 344
  13 dyld 0x00000001029d21ac ImageLoader::link(ImageLoader::LinkContext con=
st&, bool, bool, bool, ImageLoader::RPathChain const&, char const*) + 160
  14 dyld 0x00000001029c25f4 dyld::link(ImageLoader*, bool, bool, ImageLoad=
er::RPathChain const&, unsigned int) + 328
  15 dyld 0x00000001029c4928 dyld::_main(macho_header const*, unsigned long=
, int, char const**, char const**, char const**, unsigned long*) + 6764
  16 dyld 0x00000001029bd258 dyldbootstrap::start(dyld3::MachOLoaded const*=
, int, char const**, dyld3::MachOLoaded const*, unsigned long*) + 476
  17 dyld 0x00000001029bd038 _dyld_start + 56

  Thread 0 crashed with ARM Thread State (64-bit):
  x0: 0x0000000102930000 x1: 0x000000016d6297c0 x2: 0x0000000000000850 x3: =
0x0000000000040001
  x4: 0x0000000000000003 x5: 0x0000000000000000 x6: 0x0000000102a40280 x7: =
0x0000000000000000
  x8: 0x0000000000000000 x9: 0x000000016d629ea8 x10: 0x0000000000000001 x11=
: 0x0001803000000000
  x12: 0x0000000000000032 x13: 0x0004000000000000 x14: 0x0000000000062530 x=
15: 0x000000016d629e28
  x16: 0x00000000000000c5 x17: 0x0000000000000000 x18: 0x0000000000000000 x=
19: 0x0000000102a45cc0
  x20: 0x0000000000000860 x21: 0x000000016d6297c0 x22: 0x0000000102930000 x=
23: 0x0000000000000003
  x24: 0x000000016d62a010 x25: 0x000000016d6318d8 x26: 0x00000001027cc970 x=
27: 0x000000016d6297c0
  x28: 0x0000000000000004 fp: 0x000000016d6291c0 lr: 0x00000001029d9408
  sp: 0x000000016d629180 pc: 0x0000000102a18780 cpsr: 0x20000000
  far: 0x0000000102930000 esr: 0x92000007

  Binary Images:
  0x1027cc000 - 0x1028ebfff +qemu-img (0) /opt/homebrew//qemu-img
  0x1029bc000 - 0x102a37fff dyld (832.7.3) <4AB185B3-DC20-3C03-A193-67C0E6C=
589D7> /usr/lib/dyld
  0x102ac0000 - 0x102bbffff +libglib-2.0.0.dylib (0) /opt/homebrew//libglib=
-2.0.0.dylib
  0x102bf4000 - 0x102d1bfff +libgnutls.30.dylib (0) <74A67886-3907-3E35-B0A=
3-8A5798F97283> /opt/homebrew/*/libgnutls.30.dylib
  0x191db9000 - 0x192262fff com.apple.CoreFoundation (6.9 - 1774.101) /Syst=
em/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
  0x1944af000 - 0x194579fff com.apple.framework.IOKit (2.0.2 - 1845.81.1) <=
516911DA-18D7-3D17-8646-BBF7C75CD070> /System/Library/Frameworks/IOKit.fram=
ework/Versions/A/IOKit
  0x19b3b6000 - 0x19b3b7fff libSystem.B.dylib (1292.60.1) /usr/lib/libSyste=
m.B.dylib
  0x19b635000 - 0x19b639fff libpam.2.dylib (28.40.1) /usr/lib/libpam.2.dylib

  External Modification Summary:
  Calls made by other processes targeting this process:
  task_for_pid: 0
  thread_create: 0
  thread_set_state: 0
  Calls made by this process:
  task_for_pid: 0
  thread_create: 0
  thread_set_state: 0
  Calls made by all processes on this machine:
  task_for_pid: 81731
  thread_create: 0
  thread_set_state: 8

  VM Region Summary:
  ReadOnly portion of Libraries: Total=3D489.5M resident=3D0K(0%) swapped_o=
ut_or_unallocated=3D489.5M(100%)
  Writable regions: Total=3D8400K written=3D0K(0%) resident=3D0K(0%) swappe=
d_out=3D0K(0%) unallocated=3D8400K(100%)

                              VIRTUAL   REGION
  REGION TYPE SIZE COUNT (non-coalesced)
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D
  STACK GUARD 56.0M 1
  Stack 8176K 1
  __AUTH 7K 2
  __AUTH_CONST 926K 4
  __DATA 371K 10
  __DATA_CONST 2209K 7
  __DATA_DIRTY 32K 2
  __LINKEDIT 480.3M 6
  __OBJC_CONST 28K 2
  __TEXT 9472K 8
  __UNICODE 588K 1
  mapped file 16K 1
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D
  TOTAL 557.6M 45

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917542/+subscriptions

