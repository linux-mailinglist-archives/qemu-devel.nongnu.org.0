Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3777D2F0518
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:31:49 +0100 (CET)
Received: from localhost ([::1]:59810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySOK-0007LK-9U
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIl-0007lt-4D
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:03 -0500
Received: from indium.canonical.com ([91.189.90.7]:40182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIg-0000es-Oq
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySId-0000Cm-2v
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1515E2E8145
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:35 -0000
From: Launchpad Bug Tracker <1863486@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor philmd pmaydell
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158187215227.14879.6112716414047440782.malonedeb@soybean.canonical.com>
Message-Id: <161025225515.18863.729845715515973383.malone@loganberry.canonical.com>
Subject: [Bug 1863486] Re: aarch64/tcg crash with malloc(): unsorted double
 linked list corrupted
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: f4404eb4cf32743cdfd7d625546dcfad3445ac90
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1863486 <1863486@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863486

Title:
  aarch64/tcg crash with malloc(): unsorted double linked list corrupted

Status in QEMU:
  Expired

Bug description:
  Based on commit b29c3e23f64938784c42ef9fca896829e3c19120,
  QEMU configured with --enable-debug --extra-cflags=3D-ggdb.

  Download Raspberry Pi 3 UEFI Firmware v1.15 from:
  https://github.com/pbatard/RPi3/releases/tag/v1.15
  (unzip RPi3_UEFI_Firmware_v1.15.zip)

  Run QEMU with:

  $ qemu-system-aarch64 -M raspi3 \
    -serial null -serial stdio \
    -device loader,file=3DRPI_EFI.fd,force-raw=3Dtrue =


  Normal behavior:

  NOTICE:  Booting Trusted Firmware
  NOTICE:  BL1: v2.1(release):v2.1
  NOTICE:  BL1: Built : 15:26:06, May 13 2019
  NOTICE:  rpi3: Detected: Raspberry Pi 3 Model B (1GB, Sony, UK) [0x00a020=
82]
  NOTICE:  BL1: Booting BL2
  ERROR:   rpi3_sdhost: timeout status 0x40
  NOTICE:  BL2: v2.1(release):v2.1
  NOTICE:  BL2: Built : 15:26:01, May 13 2019
  NOTICE:  BL1: Booting BL31
  NOTICE:  BL31: v2.1(release):v2.1
  NOTICE:  BL31: Built : 15:26:04, May 13 2019
  =3DUEFI firmware (version UEFI Firmware v1.15 built at 11:58:44 on Feb 14=
 2020)
  =3D=3D=3D=3D=3D=3D=3D=3D

  Synchronous Exception at 0x0000000037A1A4E8

  But I sometimes get:

  NOTICE:  Booting Trusted Firmware
  NOTICE:  BL1: v2.1(release):v2.1
  NOTICE:  BL1: Built : 15:26:06, May 13 2019
  NOTICE:  rpi3: Detected: Raspberry Pi 3 Model B (1GB, Sony, UK) [0x00a020=
82]
  NOTICE:  BL1: Booting BL2
  ERROR:   rpi3_sdhost: timeout status 0x40
  NOTICE:  BL2: v2.1(release):v2.1
  NOTICE:  BL2: Built : 15:26:01, May 13 2019
  NOTICE:  BL1: Booting BL31
  NOTICE:  BL31: v2.1(release):v2.1
  NOTICE:  BL31: Built : 15:26:04, May 13 2019
  =3DUEFI firmware (version UEFI Firmware v1.15 built at 11:58:44 on Feb 14=
 2020)
  =3D=3D=3D=3D=3D=3D=3D=3Dmalloc(): unsorted double linked list corrupted

  Thread 3 "qemu-system-aar" received signal SIGABRT, Aborted.
  [Switching to Thread 0x7fffe9c22700 (LWP 22746)]
  0x00007ffff515ce35 in raise () from /lib64/libc.so.6
  (gdb) bt
  #0  0x00007ffff515ce35 in raise () at /lib64/libc.so.6
  #1  0x00007ffff5147895 in abort () at /lib64/libc.so.6
  #2  0x00007ffff51a008f in __libc_message () at /lib64/libc.so.6
  #3  0x00007ffff51a740c in  () at /lib64/libc.so.6
  #4  0x00007ffff51aa48c in _int_malloc () at /lib64/libc.so.6
  #5  0x00007ffff51aad4e in _int_memalign () at /lib64/libc.so.6
  #6  0x00007ffff51abdda in _mid_memalign () at /lib64/libc.so.6
  #7  0x00007ffff51ad3c6 in posix_memalign () at /lib64/libc.so.6
  #8  0x00007ffff7be2407 in slab_allocator_alloc_chunk () at /lib64/libglib=
-2.0.so.0
  #9  0x00007ffff7be3573 in g_slice_alloc () at /lib64/libglib-2.0.so.0
  #10 0x00007ffff7bf410a in g_tree_insert_internal () at /lib64/libglib-2.0=
.so.0
  #11 0x0000555555853f10 in tcg_tb_insert (tb=3D0x7fffd44b4d80 <code_gen_bu=
ffer+4934995>) at tcg/tcg.c:425
  #12 0x00005555558dbe3d in tb_gen_code (cpu=3D0x555556afa640, pc=3D9333329=
60, cs_base=3D0, flags=3D2216689664, cflags=3D-16252928) at accel/tcg/trans=
late-all.c:1875
  #13 0x00005555558d7c73 in tb_find (cpu=3D0x555556afa640, last_tb=3D0x7fff=
d44b4c40 <code_gen_buffer+4934675>, tb_exit=3D0, cf_mask=3D524288) at accel=
/tcg/cpu-exec.c:406
  #14 0x00005555558d8543 in cpu_exec (cpu=3D0x555556afa640) at accel/tcg/cp=
u-exec.c:730
  #15 0x00005555558981e1 in tcg_cpu_exec (cpu=3D0x555556afa640) at cpus.c:1=
405
  #16 0x0000555555898a37 in qemu_tcg_cpu_thread_fn (arg=3D0x555556afa640) a=
t cpus.c:1713
  #17 0x0000555556057af8 in qemu_thread_start (args=3D0x555557511570) at ut=
il/qemu-thread-posix.c:519
  #18 0x00007ffff52f34c0 in start_thread () at /lib64/libpthread.so.0
  #19 0x00007ffff5221163 in clone () at /lib64/libc.so.6

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863486/+subscriptions

