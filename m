Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453422F0BD0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 05:29:53 +0100 (CET)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyoq0-0001XG-CG
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 23:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kyomK-00058I-4s
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:26:04 -0500
Received: from indium.canonical.com ([91.189.90.7]:40578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kyomG-0003Q0-Af
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:26:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kyomE-00078U-EA
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:25:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A2B422E814A
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 Jan 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1776096@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: classichasclass janitor mopsfelder th-huth
X-Launchpad-Bug-Reporter: Cameron Kaiser (classichasclass)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152865417474.22286.1843162139663853612.malonedeb@chaenomeles.canonical.com>
Message-Id: <161033863735.29318.10956242787356804306.malone@loganberry.canonical.com>
Subject: [Bug 1776096] Re: qemu 2.12.0 qemu-system-ppc illegal instruction on
 ppc64le, crashes emulator
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: ed6ad72ba6a2682feda86ca4c29b650d20c56c70
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
Reply-To: Bug 1776096 <1776096@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1776096

Title:
  qemu 2.12.0 qemu-system-ppc illegal instruction on ppc64le, crashes
  emulator

Status in QEMU:
  Expired

Bug description:
  % uname -a
  Linux tim.floodgap.com 4.16.14-300.fc28.ppc64le #1 SMP Tue Jun 5 15:59:48=
 UTC 2018 ppc64le ppc64le ppc64le GNU/Linux

  STR:
  Start QEMU and boot Mac OS X 10.4.11.
  Download the current version of TenFourFox (I used G3 so that AltiVec was=
 not a confounder).
  Try to start TenFourFox in safe mode (hold down Option as you double-clic=
k while the icon bounces in the Dock).

  Expected:
  TenFourFox starts.

  Actual:
  The entire emulator exits with an illegal instruction error.

  Trace of session (including some disassembly so you can see where TCG
  went wrong):

  tim:/home/spectre/src/qemu-2.12.0/ppc-softmmu/% gdb --args ./qemu-
  system-ppc -M mac99,accel=3Dtcg -m 2048 -prom-env boot-args=3D-v -boot c
  -drive file=3Dtigerhd.img,format=3Draw,cache=3Dnone -netdev user,id=3Dmyn=
et0
  -device usb-net,netdev=3Dmynet0 -usb -device usb-tablet

  GNU gdb (GDB) Fedora 8.1-15.fc28
  [...]
  Reading symbols from ./qemu-system-ppc...done.
  (gdb) run
  [...]

  Thread 6 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
  [Switching to Thread 0x7ffff242ea30 (LWP 7017)]
  0xfffffffffffffffc in ?? ()
  #0  0xfffffffffffffffc in  ()
  #1  0x00007fffd4edec00 in code_gen_buffer ()
  #2  0x00000000100c9e20 in cpu_tb_exec (itb=3D<optimized out>, cpu=3D<opti=
mized out>) at /home/spectre/src/qemu-2.12.0/accel/tcg/cpu-exec.c:169
  #3  0x00000000100c9e20 in cpu_loop_exec_tb (tb_exit=3D<synthetic pointer>=
, last_tb=3D<synthetic pointer>, tb=3D<optimized out>, cpu=3D<optimized out=
>)
      at /home/spectre/src/qemu-2.12.0/accel/tcg/cpu-exec.c:626
  #4  0x00000000100c9e20 in cpu_exec (cpu=3D<optimized out>)
      at /home/spectre/src/qemu-2.12.0/accel/tcg/cpu-exec.c:734
  #5  0x000000001007decc in tcg_cpu_exec (cpu=3D0x11774e10)
      at /home/spectre/src/qemu-2.12.0/cpus.c:1362
  (gdb) disas 0x00007fffd4edebf0, 0x00007fffd4edec10
  Dump of assembler code from 0x7fffd4edebf0 to 0x7fffd4edec10:
     0x00007fffd4edebf0 <code_gen_buffer+284027700>:	addi    r0,r4,3
     0x00007fffd4edebf4 <code_gen_buffer+284027704>:	rlwinm  r0,r0,0,0,19
     0x00007fffd4edebf8 <code_gen_buffer+284027708>:	cmplw   cr7,r0,r12
     0x00007fffd4edebfc <code_gen_buffer+284027712>:	bnel    cr7,0x7fffd4ed=
8b64 <code_gen_buffer+284002984>
     0x00007fffd4edec00 <code_gen_buffer+284027716>:	lwbrx   r14,r3,r4
     0x00007fffd4edec04 <code_gen_buffer+284027720>:	stw     r14,40(r27)
     0x00007fffd4edec08 <code_gen_buffer+284027724>:	clrldi  r4,r14,32
     0x00007fffd4edec0c <code_gen_buffer+284027728>:	rlwinm  r3,r4,25,19,26
  End of assembler dump.
  (gdb) disas 0x7fffd4ed8b60, 0x7fffd4ed8b70
  Dump of assembler code from 0x7fffd4ed8b60 to 0x7fffd4ed8b70:
     0x00007fffd4ed8b60 <code_gen_buffer+284002980>:	bctrl
     0x00007fffd4ed8b64 <code_gen_buffer+284002984>:	mtctr   r3
     0x00007fffd4ed8b68 <code_gen_buffer+284002988>:	mr      r31,r3
     0x00007fffd4ed8b6c <code_gen_buffer+284002992>:	li      r3,0
  End of assembler dump.
  (gdb) i reg ctr
  ctr            0xffffffffffffffff	18446744073709551615

  It appears that the branch at 0x00007fffd4edebfc caused a jump back (a
  return?) through CTR, but CTR has -1 in it, hence setting PC to
  0xfffffffffffffffc. I am not sure how to debug this further.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1776096/+subscriptions

