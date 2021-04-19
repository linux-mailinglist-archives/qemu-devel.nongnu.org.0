Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649DE363A6D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 06:27:42 +0200 (CEST)
Received: from localhost ([::1]:52304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYLVd-0006F5-G9
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 00:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYLTy-0004zL-43
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 00:25:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:41614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYLTv-0002G8-6Y
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 00:25:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYLTr-0006eK-VQ
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 04:25:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B4E642E816C
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Apr 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1815263@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hvf
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor nathanwaffles th-huth
X-Launchpad-Bug-Reporter: Nathan Wallace (nathanwaffles)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154968525163.25022.16965396624156433331.malonedeb@gac.canonical.com>
Message-Id: <161880583636.19855.9612016244392945292.malone@loganberry.canonical.com>
Subject: [Bug 1815263] Re: hvf accelerator crashes on quest boot
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: 4f771da1f36bcada03ffa167861491afb129c730
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1815263 <1815263@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1815263

Title:
  hvf accelerator crashes on quest boot

Status in QEMU:
  Expired

Bug description:
  Host OS: macOS High Sierra (10.13.6)
  MacBook Pro (Retina, Mid 2015)
  Processor: 2.8GHz Intel Core i7
  Guest OS: OpenBSD 6.4 install media (install64.iso)
  Qemu 3.1.0 release, built with:
  ./configure --prefix=3D/usr/local/Cellar/qemu/3.1.0_1 --cc=3Dclang
        --host-cc=3Dclang
        --disable-bsd-user
        --disable-guest-agent
        --enable-curses
        --enable-libssh2
        --enable-vde
        --extra-cflags=3D-DNCURSES_WIDECHAR=3D1
        --enable-cocoa
        --disable-sdl
        --disable-gtk
        --enable-hvf
        --target-list=3Dx86_64-softmmu
        --enable-debug

  I invoke qemu like this:
  Last command had exit code: 0 at 22:58
  nwallace@nwallace-ltm3:~
  $ sudo qemu-system-x86_64 -M accel=3Dhvf -boot d -cdrom ~/Downloads/insta=
ll64.iso
  Password:
  qemu-system-x86_64: warning: host doesn't support requested feature: CPUI=
D.80000001H:ECX.svm [bit 2]
  bad size

  Abort trap: 6
  Last command had exit code: 134 at 22:58
  nwallace@nwallace-ltm3:~
  $

  I ran qemu in lldb to get a stack trace and I get:
  Last command had exit code: 0 at 22:54
  nwallace@nwallace-ltm3:~/Downloads
  $ sudo lldb -- qemu-system-x86_64 -M accel=3Dhvf -boot d -cdrom /Users/nw=
allace/Downloads/install64.iso
  Password:
  (lldb) target create "qemu-system-x86_64"
  Current executable set to 'qemu-system-x86_64' (x86_64).
  (lldb) settings set -- target.run-args  "-M" "accel=3Dhvf" "-boot" "d" "-=
cdrom" "/Users/nwallace/Downloads/install64.i
  so"
  (lldb) run
  Process 96474 launched: '/usr/local/bin/qemu-system-x86_64' (x86_64)
  Process 96474 stopped
  * thread #1, queue =3D 'com.apple.main-thread', stop reason =3D signal SI=
GUSR2
      frame #0: 0x00007fff5ef0c00a libsystem_kernel.dylib`__sigsuspend + 10
  libsystem_kernel.dylib`__sigsuspend:
  ->  0x7fff5ef0c00a <+10>: jae    0x7fff5ef0c014            ; <+20>
      0x7fff5ef0c00c <+12>: movq   %rax, %rdi
      0x7fff5ef0c00f <+15>: jmp    0x7fff5ef02b0e            ; cerror
      0x7fff5ef0c014 <+20>: retq
  Target 0: (qemu-system-x86_64) stopped.
  (lldb) process handle SIGUSR1 -n true -p true -s false
  NAME         PASS   STOP   NOTIFY
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=
=3D=3D=3D=3D=3D
  SIGUSR1      true   false  true
  (lldb) process handle SIGUSR2 -n true -p true -s false
  NAME         PASS   STOP   NOTIFY
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=
=3D=3D=3D=3D=3D
  SIGUSR2      true   false  true
  (lldb) c
  Process 96474 resuming
  qemu-system-x86_64: warning: host doesn't support requested feature: CPUI=
D.80000001H:ECX.svm [bit 2]
  Process 96474 stopped and restarted: thread 9 received signal: SIGUSR2
  <line above repeats about 64 times or so>
  Process 96474 stopped and restarted: thread 9 received signal: SIGUSR2
  bad size

  Process 96474 stopped
  * thread #9, stop reason =3D signal SIGABRT
      frame #0: 0x00007fff5ef0bb66 libsystem_kernel.dylib`__pthread_kill + =
10
  libsystem_kernel.dylib`__pthread_kill:
  ->  0x7fff5ef0bb66 <+10>: jae    0x7fff5ef0bb70            ; <+20>
      0x7fff5ef0bb68 <+12>: movq   %rax, %rdi
      0x7fff5ef0bb6b <+15>: jmp    0x7fff5ef02ae9            ; cerror_nocan=
cel
      0x7fff5ef0bb70 <+20>: retq
  Target 0: (qemu-system-x86_64) stopped.
  (lldb) bt
  * thread #9, stop reason =3D signal SIGABRT
    * frame #0: 0x00007fff5ef0bb66 libsystem_kernel.dylib`__pthread_kill + =
10
      frame #1: 0x00007fff5f0d6080 libsystem_pthread.dylib`pthread_kill + 3=
33
      frame #2: 0x00007fff5ee671ae libsystem_c.dylib`abort + 127
      frame #3: 0x000000010016b6ec qemu-system-x86_64`exec_cmps_single + 400
      frame #4: 0x000000010016ada4 qemu-system-x86_64`exec_cmps + 65
      frame #5: 0x0000000100169aaa qemu-system-x86_64`exec_instruction + 48
      frame #6: 0x0000000100164eb2 qemu-system-x86_64`hvf_vcpu_exec + 2658
      frame #7: 0x000000010005bed6 qemu-system-x86_64`qemu_hvf_cpu_thread_f=
n + 200
      frame #8: 0x00000001003ee531 qemu-system-x86_64`qemu_thread_start + 1=
07
      frame #9: 0x00007fff5f0d3661 libsystem_pthread.dylib`_pthread_body + =
340
      frame #10: 0x00007fff5f0d350d libsystem_pthread.dylib`_pthread_start =
+ 377
      frame #11: 0x00007fff5f0d2bf9 libsystem_pthread.dylib`thread_start + =
13
  (lldb) quit
  Quitting LLDB will kill one or more processes. Do you really want to proc=
eed: [Y/n] Y
  Last command had exit code: 0 at 23:01
  nwallace@nwallace-ltm3:~/Downloads
  $

  =

  I'm happy to work with someone more knowledgeable to reproduce this issue=
 and provide debugging assistance as I'm able.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1815263/+subscriptions

