Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3B83BA734
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 06:31:17 +0200 (CEST)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzXJE-0003Ka-35
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 00:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzXHW-0001Im-GZ
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 00:29:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:37124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzXHO-0008T6-JC
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 00:29:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzXHM-0006Po-HA
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 04:29:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6C00E2E8180
 for <qemu-devel@nongnu.org>; Sat,  3 Jul 2021 04:29:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1310714@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor liulk markf78 stefanha th-huth
X-Launchpad-Bug-Reporter: Likai Liu (liulk)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20140421171532.32087.66530.malonedeb@soybean.canonical.com>
Message-Id: <162528584205.29798.2805168735121010536.malone@loganberry.canonical.com>
Subject: [Bug 1310714] Re: User mode networking SLIRP rapid memory leak
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 3d25d9267cc1f7a3155478b358aa1401b9ae8e45
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
Reply-To: Bug 1310714 <1310714@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1310714

Title:
  User mode networking SLIRP rapid memory leak

Status in QEMU:
  Expired

Bug description:
  QEMU compiled from git HEAD at
  2d03b49c3f225994c4b0b46146437d8c887d6774 and reproducible at tag
  v2.0.0. I first noticed this bug using Ubuntu Trusty's QEMU 2.0.0~rc1.
  I used to run QEMU 1.7 without this problem.

  This is the command I ran:

  qemu-system-x86_64 -enable-kvm -smp 2 -m 1G -usbdevice tablet -net
  nic,model=3De1000 -net user -vnc localhost:99 -drive
  if=3Dide,file=3Dtest.img,cache=3Dnone -net nic -net user,tftp=3D/tmp/tftp=
data
  -no-reboot

  The guest is Windows 7 64-bit. The VM starts off normally, but after a
  couple of minutes, the memory usage starts to swell. If let running,
  it eventually consumes all host memory and grinds the host to a halt
  due to heavy swapping.

  When running under gdb, I set a breakpoint on mmap, and this is the
  stack trace I obtained.

  Breakpoint 1, mmap64 () at ../sysdeps/unix/syscall-template.S:81
  81	in ../sysdeps/unix/syscall-template.S
  (gdb) where
  #0  mmap64 () at ../sysdeps/unix/syscall-template.S:81
  #1  0x00007ffff0e65091 in new_heap (size=3D135168, size@entry=3D1728, =

      top_pad=3D<optimized out>) at arena.c:554
  #2  0x00007ffff0e687b2 in sysmalloc (av=3D0x7fffd0000020, nb=3D1664)
      at malloc.c:2386
  #3  _int_malloc (av=3D0x7fffd0000020, bytes=3D1650) at malloc.c:3740
  #4  0x00007ffff0e69f50 in __GI___libc_malloc (bytes=3D1650) at malloc.c:2=
855
  #5  0x00005555557a091a in m_get (slirp=3D0x5555561fe960)
      at /src/qemu/slirp/mbuf.c:73
  #6  0x00005555557a3151 in slirp_input (slirp=3D0x5555561fe960, =

      pkt=3D0x7ffff7e94b20 "RU\n", pkt_len=3D<optimized out>)
      at /src/qemu/slirp/slirp.c:747
  #7  0x0000555555758b24 in net_slirp_receive (nc=3D<optimized out>, =

      buf=3D<optimized out>, size=3D54) at /src/qemu/net/slirp.c:113
  #8  0x00005555557567d1 in qemu_deliver_packet (sender=3D<optimized out>, =

      flags=3D<optimized out>, data=3D<optimized out>, size=3D<optimized ou=
t>, =

      opaque=3D<optimized out>) at /src/qemu/net/net.c:471
  #9  0x00005555557588d3 in qemu_net_queue_deliver (size=3D54, =

      data=3D0x7ffff7e94b20 "RU\n", flags=3D0, sender=3D0x5555561fe5e0, =

      queue=3D0x5555561fe1d0) at /src/qemu/net/queue.c:157
  #10 qemu_net_queue_send (queue=3D0x5555561fe1d0, sender=3D0x5555561fe5e0,=
 flags=3D0, =

      data=3D0x7ffff7e94b20 "RU\n", size=3D54, sent_cb=3D<optimized out>)
      at /src/qemu/net/queue.c:192
  ---Type <return> to continue, or q <return> to quit---
  #11 0x000055555575536b in net_hub_receive (len=3D54, buf=3D0x7ffff7e94b20=
 "RU\n", =

      source_port=3D0x5555561fe310, hub=3D<optimized out>) at /src/qemu/net=
/hub.c:55
  #12 net_hub_port_receive (nc=3D0x5555561fe310, buf=3D0x7ffff7e94b20 "RU\n=
", len=3D54)
      at /src/qemu/net/hub.c:114
  #13 0x00005555557567d1 in qemu_deliver_packet (sender=3D<optimized out>, =

      flags=3D<optimized out>, data=3D<optimized out>, size=3D<optimized ou=
t>, =

      opaque=3D<optimized out>) at /src/qemu/net/net.c:471
  #14 0x00005555557588d3 in qemu_net_queue_deliver (size=3D54, =

      data=3D0x7ffff7e94b20 "RU\n", flags=3D0, sender=3D0x555556531920, =

      queue=3D0x5555561fe090) at /src/qemu/net/queue.c:157
  #15 qemu_net_queue_send (queue=3D0x5555561fe090, sender=3D0x555556531920,=
 flags=3D0, =

      data=3D0x7ffff7e94b20 "RU\n", size=3D54, sent_cb=3D<optimized out>)
      at /src/qemu/net/queue.c:192
  #16 0x00005555556db95d in xmit_seg (s=3D0x7ffff7e72010)
      at /src/qemu/hw/net/e1000.c:628
  #17 0x00005555556dbd38 in process_tx_desc (dp=3D0x7fffdf7fda30, s=3D0x7ff=
ff7e72010)
      at /src/qemu/hw/net/e1000.c:723
  #18 start_xmit (s=3D0x7ffff7e72010) at /src/qemu/hw/net/e1000.c:778
  #19 set_tctl (s=3D0x7ffff7e72010, index=3D<optimized out>, val=3D<optimiz=
ed out>)
      at /src/qemu/hw/net/e1000.c:1142
  #20 0x0000555555840fb0 in access_with_adjusted_size (addr=3D14360, =

      value=3D0x7fffdf7fdb10, size=3D4, access_size_min=3D<optimized out>, =

      access_size_max=3D<optimized out>, =

  ---Type <return> to continue, or q <return> to quit---
      access=3D0x555555841160 <memory_region_write_accessor>, mr=3D0x7ffff7=
e747c0)
      at /src/qemu/memory.c:478
  #21 0x00005555558462fe in memory_region_dispatch_write (size=3D4, data=3D=
454, =

      addr=3D14360, mr=3D0x7ffff7e747c0) at /src/qemu/memory.c:990
  #22 io_mem_write (mr=3D0x7ffff7e747c0, addr=3D14360, val=3D<optimized out=
>, size=3D4)
      at /src/qemu/memory.c:1744
  #23 0x00005555557e8717 in address_space_rw (
      as=3D0x555556159c80 <address_space_memory>, addr=3D4273485848, =

      buf=3D0x7ffff7fed028 "\306\001", len=3D4, is_write=3Dtrue)
      at /src/qemu/exec.c:2034
  #24 0x000055555583ff65 in kvm_cpu_exec (cpu=3D<optimized out>)
      at /src/qemu/kvm-all.c:1704
  #25 0x00005555557ddb6c in qemu_kvm_cpu_thread_fn (arg=3D0x55555651b730)
      at /src/qemu/cpus.c:873
  #26 0x00007ffff11b6182 in start_thread (arg=3D0x7fffdf7fe700)
      at pthread_create.c:312
  #27 0x00007ffff0ee1b2d in clone ()
      at ../sysdeps/unix/sysv/linux/x86_64/clone.S:111

  Let me know if you have any questions. Thanks.

  liulk

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1310714/+subscriptions

