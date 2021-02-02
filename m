Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BB130BE1A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:22:50 +0100 (CET)
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6uhm-0005uj-0h
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6ufv-0004xY-NE
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:20:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:39324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6ufs-0005b7-B5
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:20:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l6ufq-0002CL-C8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:20:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 26F112E813B
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 12:20:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Feb 2021 12:11:23 -0000
From: Peter Maydell <1913916@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd pmaydell
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
X-Launchpad-Bug-Duplicate: 1913917
References: <161205956490.4641.15990976871490483736.malonedeb@soybean.canonical.com>
Message-Id: <161226788317.13121.16272282181171694749.malone@soybean.canonical.com>
Subject: [Bug 1913916] Re: aarch64-virt: heap-buffer-overflow in
 address_space_lookup_region
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 20c581bb6974de07bd698e0d866c8e39fcee44fa
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
Reply-To: Bug 1913916 <1913916@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1913917 ***
    https://bugs.launchpad.net/bugs/1913917

This is a duplicate of the rather simpler bug 1913917. The overrun occurs o=
n the first =

writel 0x8000f00 0xff4affb0, which corrupts memory and eventually results i=
n the crash described in the backtrace. I'm not sure why the fuzzer isn't j=
ust reporting the original overrun.


** This bug has been marked a duplicate of bug 1913917
   aarch64-virt: heap-use-after-free in gic_dist_writeb

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913916

Title:
  aarch64-virt: heap-buffer-overflow in address_space_lookup_region

Status in QEMU:
  Confirmed

Bug description:
  Reproducer:
  cat << EOF | ./qemu-system-aarch64 \
  -machine virt,accel=3Dqtest -qtest stdio
  writel 0x8000f00 0xff4affb0
  writel 0x8000f00 0xf2f8017f
  writeq 0x801000e 0x5a5a5a6c8ff7004b
  writeq 0x8010010 0x5a5a5a5a73ba2f00
  writel 0x8000000 0x3bf5a03
  writel 0x8000000 0x3bf5a03
  writeq 0x8010000 0x10ffff03fbffffff
  writel 0x8000f1f 0x5a55fc00
  readl 0x8011f00
  readl 0x80000d3
  readl 0x80000d3
  clock_step
  writeq 0x4010008004 0x4604fffdffc54c01
  writeq 0x4010008002 0xf7478b3f5aff5a55
  writel 0x8000f00 0x2d6954
  writel 0x800005a 0x2706fcf
  readq 0x800002c
  readw 0x9000004
  readq 0x800002c
  writeq 0x801000e 0x5555017f00017f00
  writew 0x8010000 0x55
  writew 0x8010000 0x465a
  writew 0x8010000 0x55
  writew 0x8010000 0xaf00
  writeq 0x8010015 0x3b5a5a5555460000
  writeq 0x8010015 0xd546002b2b000000
  writeq 0x8010015 0xc44ea5aaaab9ffff
  readq 0x8000a5a
  EOF

  Stacktrace:
  =3D=3D638893=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addres=
s 0x629000022b84 at pc 0x55915c484d92 bp 0x7ffcde114a00 sp 0x7ffcde1149f8
  READ of size 2 at 0x629000022b84 thread T0
      #0 0x55915c484d91 in address_space_lookup_region /home/alxndr/Develop=
ment/qemu/build/../softmmu/physmem.c:345:36
      #1 0x55915c484d91 in address_space_translate_internal /home/alxndr/De=
velopment/qemu/build/../softmmu/physmem.c:359:15
      #2 0x55915c481d90 in flatview_do_translate /home/alxndr/Development/q=
emu/build/../softmmu/physmem.c:497:15
      #3 0x55915c48214e in flatview_translate /home/alxndr/Development/qemu=
/build/../softmmu/physmem.c:563:15
      #4 0x55915c107ff9 in address_space_read /home/alxndr/Development/qemu=
/include/exec/memory.h:2477:18
      #5 0x55915c107ff9 in qtest_process_command /home/alxndr/Development/q=
emu/build/../softmmu/qtest.c:572:13
      #6 0x55915c102b97 in qtest_process_inbuf /home/alxndr/Development/qem=
u/build/../softmmu/qtest.c:797:9
      #7 0x55915c953286 in fd_chr_read /home/alxndr/Development/qemu/build/=
../chardev/char-fd.c:68:9
      #8 0x7f02be25daae in g_main_context_dispatch (/usr/lib/x86_64-linux-g=
nu/libglib-2.0.so.0+0x51aae)
      #9 0x55915cfae363 in glib_pollfds_poll /home/alxndr/Development/qemu/=
build/../util/main-loop.c:232:9
      #10 0x55915cfae363 in os_host_main_loop_wait /home/alxndr/Development=
/qemu/build/../util/main-loop.c:255:5
      #11 0x55915cfae363 in main_loop_wait /home/alxndr/Development/qemu/bu=
ild/../util/main-loop.c:531:11
      #12 0x55915c069599 in qemu_main_loop /home/alxndr/Development/qemu/bu=
ild/../softmmu/runstate.c:721:9
      #13 0x55915a2f61fd in main /home/alxndr/Development/qemu/build/../sof=
tmmu/main.c:50:5
      #14 0x7f02bdd02cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
      #15 0x55915a249bc9 in _start (/home/alxndr/Development/qemu/build/qem=
u-system-aarch64+0x3350bc9)

  0x629000022b84 is located 660 bytes to the right of 18160-byte region [0x=
62900001e200,0x6290000228f0)
  allocated by thread T0 here:
      #0 0x55915a2c3c3d in malloc (/home/alxndr/Development/qemu/build/qemu=
-system-aarch64+0x33cac3d)
      #1 0x7f02be263a88 in g_malloc (/usr/lib/x86_64-linux-gnu/libglib-2.0.=
so.0+0x57a88)
      #2 0x55915c932cbd in qdev_new /home/alxndr/Development/qemu/build/../=
hw/core/qdev.c:153:19
      #3 0x55915b559360 in create_gic /home/alxndr/Development/qemu/build/.=
./hw/arm/virt.c:631:16
      #4 0x55915b5449d2 in machvirt_init /home/alxndr/Development/qemu/buil=
d/../hw/arm/virt.c:1966:5
      #5 0x55915a62bac0 in machine_run_board_init /home/alxndr/Development/=
qemu/build/../hw/core/machine.c:1169:5
      #6 0x55915c02b8d8 in qemu_init_board /home/alxndr/Development/qemu/bu=
ild/../softmmu/vl.c:2455:5
      #7 0x55915c02b8d8 in qmp_x_exit_preconfig /home/alxndr/Development/qe=
mu/build/../softmmu/vl.c:2526:5
      #8 0x55915c035d91 in qemu_init /home/alxndr/Development/qemu/build/..=
/softmmu/vl.c:3533:9
      #9 0x55915a2f61f8 in main /home/alxndr/Development/qemu/build/../soft=
mmu/main.c:49:5
      #10 0x7f02bdd02cc9 in __libc_start_main csu/../csu/libc-start.c:308:16

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913916/+subscriptions

