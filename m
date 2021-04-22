Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE81E3679A6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 08:04:57 +0200 (CEST)
Received: from localhost ([::1]:35642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZSSO-0001uo-VR
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 02:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZSOs-0007Wg-U7
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:01:19 -0400
Received: from indium.canonical.com ([91.189.90.7]:55104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZSOq-00015J-WD
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:01:18 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZSOp-00061w-Ul
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 06:01:15 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E57582E804C
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 06:01:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:51:32 -0000
From: Thomas Huth <1765970@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dflogeras2 pmaydell th-huth
X-Launchpad-Bug-Reporter: diddly (dflogeras2)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152432626539.12479.15065213360151643512.malonedeb@chaenomeles.canonical.com>
Message-Id: <161907069305.6293.3638484721934503271.malone@chaenomeles.canonical.com>
Subject: [Bug 1765970] Re: qemu-arm (user mode) segfaults in uclibc-ng chroot
 after upgrade to 2.11.x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: a3956638a878074928bb60bf18eb500c5c75792e
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
Reply-To: Bug 1765970 <1765970@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1765970

Title:
  qemu-arm (user mode) segfaults in uclibc-ng chroot after upgrade to
  2.11.x

Status in QEMU:
  Incomplete

Bug description:
  I use a qemu-user chroot + binfmt to build software targetting a
  raspberry pi.  After upgrading from qemu-2.10.1 to 2.11.1 (Gentoo
  host), I noticed that on my uclibc-ng chroot qemu-arm will segfault
  when running python and importing the portage module.

  I have bisected qemu down to this commit:

  https://github.com/qemu/qemu/commit/18e80c55bb6ec17c05ec0ba717ec83933c2bf=
c07

  If I recompile and change MAX_RESERVED_VA (from the above commit) back
  to 0x77000000 the problem goes away.  NB I have no idea what that
  does, I just thought I'd see.

  =

  Other arm chroots (glibc, musl) do not segfault with qemu-2.11, only the =
uclibc-ng one.  Not sure why.

  =

  The following backtrace was generated from running qemu-arm in gdb and re=
creating the segfault:

  (gdb) where
  #0  0x0000000060726046 in static_code_gen_buffer ()
  #1  0x0000000060048789 in cpu_tb_exec (cpu=3D0x6278e310, =

      itb=3D0x60725f80 <static_code_gen_buffer+314624>)
      at /usr/src/debug/app-emulation/qemu-2.11.1-r2/qemu-2.11.1/accel/tcg/=
cpu-exec.c:167
  #2  0x000000006004937f in cpu_loop_exec_tb (cpu=3D0x6278e310, =

      tb=3D0x60725f80 <static_code_gen_buffer+314624>, last_tb=3D0x7fffffff=
d138, =

      tb_exit=3D0x7fffffffd130)
      at /usr/src/debug/app-emulation/qemu-2.11.1-r2/qemu-2.11.1/accel/tcg/=
cpu-exec.c:627
  #3  0x0000000060049600 in cpu_exec (cpu=3D0x6278e310)
      at /usr/src/debug/app-emulation/qemu-2.11.1-r2/qemu-2.11.1/accel/tcg/=
cpu-exec.c:736
  #4  0x00000000600511c3 in cpu_loop (env=3D0x627965b0)
      at /usr/src/debug/app-emulation/qemu-2.11.1-r2/qemu-2.11.1/linux-user=
/main.c:585
  #5  0x00000000600534eb in main (argc=3D4, argv=3D0x7fffffffd9b8, =

      envp=3D0x7fffffffd9e0)
      at /usr/src/debug/app-emulation/qemu-2.11.1-r2/qemu-2.11.1/linux-user=
/main.c:4882


  (gdb) info reg
  rax            0x627965b0       1652123056
  rbx            0x62717870       1651603568
  rcx            0x606da000       1617797120
  rdx            0x60726000       1618108416
  rsi            0x60726000       1618108416
  rdi            0x627965b0       1652123056
  rbp            0x7fffffffd0c0   0x7fffffffd0c0
  rsp            0x7fffffffd080   0x7fffffffd080
  r8             0x0      0
  r9             0x2      2
  r10            0x0      0
  r11            0x629280a0       1653768352
  r12            0x60260e40       1613106752
  r13            0x0      0
  r14            0x606a5018       1617580056
  r15            0x0      0
  rip            0x60048789       0x60048789 <cpu_tb_exec+266>
  eflags         0x10282  [ SF IF RF ]
  cs             0x33     51
  ss             0x2b     43
  ds             0x0      0
  es             0x0      0
  fs             0x0      0
  gs             0x0      0
  (gdb)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1765970/+subscriptions

