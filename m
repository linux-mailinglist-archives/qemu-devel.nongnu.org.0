Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC473678B2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:29:16 +0200 (CEST)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQxn-00033q-9B
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQuT-0005uD-CW
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:25:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:44132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQuQ-0002Oa-8r
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:25:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZQuP-0006a0-3M
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:25:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 180A42E8060
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:25:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 04:18:54 -0000
From: Thomas Huth <1836762@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: spice
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156328883859.28108.13283790893247050323.malonedeb@chaenomeles.canonical.com>
Message-Id: <161906513452.9169.13168801469474547485.malone@wampee.canonical.com>
Subject: [Bug 1836762] Re: Many leaks from qemu_spice_create_update
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 61bb14f00b5111f52635ab77ba295f663f75b565
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
Reply-To: Bug 1836762 <1836762@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1836762

Title:
  Many leaks from qemu_spice_create_update

Status in QEMU:
  Incomplete

Bug description:
  tag: v4.1.0-rc0

  Compiled with --enable-sanitizers

  $ qemu-system-x86_64 -device qxl-vga ...
  [guest exits calling 'hlt']
  =3D=3D20452=3D=3DERROR: LeakSanitizer: detected memory leaks

  Direct leak of 167616 byte(s) in 582 object(s) allocated from:
      #0 0x561146f2c8ef in calloc (x86_64-softmmu/qemu-system-x86_64+0x1824=
8ef)
      #1 0x7f73af3dde1d in g_malloc0 (/lib64/libglib-2.0.so.0+0x54e1d)
      #2 0x561148c6d547 in qemu_spice_create_update qemu/ui/spice-display.c=
:222:21
      #3 0x561148c6ba2b in qemu_spice_display_refresh qemu/ui/spice-display=
.c:488:9
      #4 0x561148172eff in display_refresh qemu/hw/display/qxl.c:2030:9
      #5 0x561148c2748f in dpy_refresh qemu/ui/console.c:1629:13
      #6 0x561148c263f1 in gui_update qemu/ui/console.c:206:5
      #7 0x561149558e6b in timerlist_run_timers qemu/util/qemu-timer.c:574:9
      #8 0x5611495591de in qemu_clock_run_timers qemu/util/qemu-timer.c:588=
:12
      #9 0x56114955a489 in qemu_clock_run_all_timers qemu/util/qemu-timer.c=
:708:25
      #10 0x56114955b235 in main_loop_wait qemu/util/main-loop.c:519:5
      #11 0x561147c587b3 in main_loop qemu/vl.c:1791:9
      #12 0x561147c4976d in main qemu/vl.c:4473:5
      #13 0x7f73ac5c4412 in __libc_start_main (/lib64/libc.so.6+0x24412)

  Direct leak of 5184 byte(s) in 18 object(s) allocated from:
      #0 0x561146f2c8ef in calloc (x86_64-softmmu/qemu-system-x86_64+0x1824=
8ef)
      #1 0x7f73af3dde1d in g_malloc0 (/lib64/libglib-2.0.so.0+0x54e1d)
      #2 0x561148c6e3e7 in qemu_spice_create_update qemu/ui/spice-display.c=
:243:13
      #3 0x561148c6ba2b in qemu_spice_display_refresh qemu/ui/spice-display=
.c:488:9
      #4 0x561148172eff in display_refresh qemu/hw/display/qxl.c:2030:9
      #5 0x561148c2748f in dpy_refresh qemu/ui/console.c:1629:13
      #6 0x561148c263f1 in gui_update qemu/ui/console.c:206:5
      #7 0x561149558e6b in timerlist_run_timers qemu/util/qemu-timer.c:574:9
      #8 0x5611495591de in qemu_clock_run_timers qemu/util/qemu-timer.c:588=
:12
      #9 0x56114955a489 in qemu_clock_run_all_timers qemu/util/qemu-timer.c=
:708:25
      #10 0x56114955b235 in main_loop_wait qemu/util/main-loop.c:519:5
      #11 0x561147c587b3 in main_loop qemu/vl.c:1791:9
      #12 0x561147c4976d in main qemu/vl.c:4473:5
      #13 0x7f73ac5c4412 in __libc_start_main (/lib64/libc.so.6+0x24412)

  Direct leak of 2560 byte(s) in 4 object(s) allocated from:
      #0 0x561146f2cb46 in realloc (x86_64-softmmu/qemu-system-x86_64+0x182=
4b46)
      #1 0x7f73ac04c420  (/lib64/libfontconfig.so.1+0x21420)

  Direct leak of 22 byte(s) in 1 object(s) allocated from:
      #0 0x561146f2c6af in __interceptor_malloc (x86_64-softmmu/qemu-system=
-x86_64+0x18246af)
      #1 0x7f73ae781953 in XGetAtomName (/lib64/libX11.so.6+0x2a953)

  Indirect leak of 54936 byte(s) in 510 object(s) allocated from:
      #0 0x561146f2c6af in __interceptor_malloc (x86_64-softmmu/qemu-system=
-x86_64+0x18246af)
      #1 0x7f73af3dddc5 in g_malloc (/lib64/libglib-2.0.so.0+0x54dc5)
      #2 0x561148c6d547 in qemu_spice_create_update qemu/ui/spice-display.c=
:222:21
      #3 0x561148c6ba2b in qemu_spice_display_refresh qemu/ui/spice-display=
.c:488:9
      #4 0x561148172eff in display_refresh qemu/hw/display/qxl.c:2030:9
      #5 0x561148c2748f in dpy_refresh qemu/ui/console.c:1629:13
      #6 0x561148c263f1 in gui_update qemu/ui/console.c:206:5
      #7 0x561149558e6b in timerlist_run_timers qemu/util/qemu-timer.c:574:9
      #8 0x5611495591de in qemu_clock_run_timers qemu/util/qemu-timer.c:588=
:12
      #9 0x56114955a489 in qemu_clock_run_all_timers qemu/util/qemu-timer.c=
:708:25
      #10 0x56114955b235 in main_loop_wait qemu/util/main-loop.c:519:5
      #11 0x561147c587b3 in main_loop qemu/vl.c:1791:9
      #12 0x561147c4976d in main qemu/vl.c:4473:5
      #13 0x7f73ac5c4412 in __libc_start_main (/lib64/libc.so.6+0x24412)

  Indirect leak of 30720 byte(s) in 23 object(s) allocated from:
      #0 0x561146f2c6af in __interceptor_malloc (x86_64-softmmu/qemu-system=
-x86_64+0x18246af)
      #1 0x7f73af3dddc5 in g_malloc (/lib64/libglib-2.0.so.0+0x54dc5)
      #2 0x561148c6e3e7 in qemu_spice_create_update qemu/ui/spice-display.c=
:243:13
      #3 0x561148c6ba2b in qemu_spice_display_refresh qemu/ui/spice-display=
.c:488:9
      #4 0x561148172eff in display_refresh qemu/hw/display/qxl.c:2030:9
      #5 0x561148c2748f in dpy_refresh qemu/ui/console.c:1629:13
      #6 0x561148c263f1 in gui_update qemu/ui/console.c:206:5
      #7 0x561149558e6b in timerlist_run_timers qemu/util/qemu-timer.c:574:9
      #8 0x5611495591de in qemu_clock_run_timers qemu/util/qemu-timer.c:588=
:12
      #9 0x56114955a489 in qemu_clock_run_all_timers qemu/util/qemu-timer.c=
:708:25
      #10 0x56114955b235 in main_loop_wait qemu/util/main-loop.c:519:5
      #11 0x561147c587b3 in main_loop qemu/vl.c:1791:9
      #12 0x561147c4976d in main qemu/vl.c:4473:5
      #13 0x7f73ac5c4412 in __libc_start_main (/lib64/libc.so.6+0x24412)

  Indirect leak of 8288 byte(s) in 259 object(s) allocated from:
      #0 0x561146f2c6af in __interceptor_malloc (x86_64-softmmu/qemu-system=
-x86_64+0x18246af)
      #1 0x7f73ac0385af  (/lib64/libfontconfig.so.1+0xd5af)

  Indirect leak of 4068 byte(s) in 303 object(s) allocated from:
      #0 0x561146e78f40 in __interceptor_strdup (x86_64-softmmu/qemu-system=
-x86_64+0x1770f40)
      #1 0x7f73ac04bc44 in FcValueSave (/lib64/libfontconfig.so.1+0x20c44)

  Indirect leak of 2336 byte(s) in 73 object(s) allocated from:
      #0 0x561146f2c8ef in calloc (x86_64-softmmu/qemu-system-x86_64+0x1824=
8ef)
      #1 0x7f73ac04c9cc  (/lib64/libfontconfig.so.1+0x219cc)

  Indirect leak of 1536 byte(s) in 48 object(s) allocated from:
      #0 0x561146f2c8ef in calloc (x86_64-softmmu/qemu-system-x86_64+0x1824=
8ef)
      #1 0x7f73ac04bf0c  (/lib64/libfontconfig.so.1+0x20f0c)

  Indirect leak of 1440 byte(s) in 5 object(s) allocated from:
      #0 0x561146f2c8ef in calloc (x86_64-softmmu/qemu-system-x86_64+0x1824=
8ef)
      #1 0x7f73af3dde1d in g_malloc0 (/lib64/libglib-2.0.so.0+0x54e1d)
      #2 0x561148c6e3e7 in qemu_spice_create_update qemu/ui/spice-display.c=
:243:13
      #3 0x561148c6ba2b in qemu_spice_display_refresh qemu/ui/spice-display=
.c:488:9
      #4 0x561148172eff in display_refresh qemu/hw/display/qxl.c:2030:9
      #5 0x561148c2748f in dpy_refresh qemu/ui/console.c:1629:13
      #6 0x561148c263f1 in gui_update qemu/ui/console.c:206:5
      #7 0x561149558e6b in timerlist_run_timers qemu/util/qemu-timer.c:574:9
      #8 0x5611495591de in qemu_clock_run_timers qemu/util/qemu-timer.c:588=
:12
      #9 0x56114955a489 in qemu_clock_run_all_timers qemu/util/qemu-timer.c=
:708:25
      #10 0x56114955b235 in main_loop_wait qemu/util/main-loop.c:519:5
      #11 0x561147c587b3 in main_loop qemu/vl.c:1791:9
      #12 0x561147c4976d in main qemu/vl.c:4473:5
      #13 0x7f73ac5c4412 in __libc_start_main (/lib64/libc.so.6+0x24412)

  Indirect leak of 1440 byte(s) in 5 object(s) allocated from:
      #0 0x561146f2c8ef in calloc (x86_64-softmmu/qemu-system-x86_64+0x1824=
8ef)
      #1 0x7f73af3dde1d in g_malloc0 (/lib64/libglib-2.0.so.0+0x54e1d)
      #2 0x561148c6d547 in qemu_spice_create_update qemu/ui/spice-display.c=
:222:21
      #3 0x561148c6ba2b in qemu_spice_display_refresh qemu/ui/spice-display=
.c:488:9
      #4 0x561148172eff in display_refresh qemu/hw/display/qxl.c:2030:9
      #5 0x561148c2748f in dpy_refresh qemu/ui/console.c:1629:13
      #6 0x561148c263f1 in gui_update qemu/ui/console.c:206:5
      #7 0x561149558e6b in timerlist_run_timers qemu/util/qemu-timer.c:574:9
      #8 0x5611495591de in qemu_clock_run_timers qemu/util/qemu-timer.c:588=
:12
      #9 0x56114955a489 in qemu_clock_run_all_timers qemu/util/qemu-timer.c=
:708:25
      #10 0x56114955b235 in main_loop_wait qemu/util/main-loop.c:519:5
      #11 0x561147c587b3 in main_loop qemu/vl.c:1791:9
      #12 0x561147c4976d in main qemu/vl.c:4473:5
      #13 0x7f73ac5c4412 in __libc_start_main (/lib64/libc.so.6+0x24412)

  Indirect leak of 384 byte(s) in 12 object(s) allocated from:
      #0 0x561146f2c8ef in calloc (x86_64-softmmu/qemu-system-x86_64+0x1824=
8ef)
      #1 0x7f73ac04bd9e  (/lib64/libfontconfig.so.1+0x20d9e)

  Indirect leak of 96 byte(s) in 2 object(s) allocated from:
      #0 0x561146f2c6af in __interceptor_malloc (x86_64-softmmu/qemu-system=
-x86_64+0x18246af)
      #1 0x7f73ac045e51 in FcLangSetCreate (/lib64/libfontconfig.so.1+0x1ae=
51)

  SUMMARY: AddressSanitizer: 280628 byte(s) leaked in 1847
  allocation(s).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1836762/+subscriptions

