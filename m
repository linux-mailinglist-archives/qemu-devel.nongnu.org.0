Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D192F6632
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:47:27 +0100 (CET)
Received: from localhost ([::1]:40772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05mQ-0001Ks-Dz
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l05WQ-0004SW-I6
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:30:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:39456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l05WM-0003dG-L9
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:30:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l05WJ-0001sv-Pg
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 16:30:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C01272E813B
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 16:30:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 Jan 2021 16:24:13 -0000
From: Greg Kurz <1911666@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=groug@kaod.org; 
X-Launchpad-Bug-Tags: security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: pjps
X-Launchpad-Bug-Reporter: P J P (pjps)
X-Launchpad-Bug-Modifier: Greg Kurz (gkurz)
References: <161062144281.6686.4298628422758083377.malonedeb@wampee.canonical.com>
Message-Id: <161064145383.14216.670783465454772345.launchpad@gac.canonical.com>
Subject: [Bug 1911666] Re: ZDI-CAN-10904: QEMU Plan 9 File System TOCTOU
 Privilege Escalation Vulnerability
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: ad43d6bb6a2d391b23d288cee54440981456e50f
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
Reply-To: Bug 1911666 <1911666@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Confirmed =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911666

Title:
  ZDI-CAN-10904: QEMU Plan 9 File System TOCTOU Privilege Escalation
  Vulnerability

Status in QEMU:
  In Progress

Bug description:
  -- CVSS -----------------------------------------

  7.5: AV:L/AC:H/PR:H/UI:N/S:C/C:H/I:H/A:H

  -- ABSTRACT -------------------------------------

  Trend Micro's Zero Day Initiative has identified a vulnerability affectin=
g the following products:
  QEMU - QEMU

  -- VULNERABILITY DETAILS ------------------------

  Version tested:5.0.0-rc3
  Installer file:qemu-5.0.0-rc3.tar.xz
  Platform tested:ubuntu 18.04 x64 desktop
  Analysis Basically v9fs* functions called from guest kernel are executed =
under specific thread(I call it main thread later). But when it calls some =
file related system calls, qemu uses its own coroutine thread(worker thread=
). Then it returns(yield return) without waiting result of system call and =
start to execute next v9fs* function.

  In v9fsmarkfidsunreclaim() function, it stores fidlist member (head of
  singly linked list) to its stack.

   ->
  https://github.com/qemu/qemu/blob/f3bac27cc1e303e1860cc55b9b6889ba39dee58=
7/hw/9pfs/9p.c#L506

  And if it uses coroutine, it restore fid_list from stack and restart
  whole loop.

   ->
  https://github.com/qemu/qemu/blob/f3bac27cc1e303e1860cc55b9b6889ba39dee58=
7/hw/9pfs/9p.c#L526

  v9fsclunk() function calls clunkfid() which unlink fid from list, and
  free it.

   ->
  https://github.com/qemu/qemu/blob/f3bac27cc1e303e1860cc55b9b6889ba39dee58=
7/hw/9pfs/9p.c#L2060-L2091

  So if v9fsclunk() is called while v9fsmarkfidsunreclaim()'s coroutine
  is being executed, it restores "FREED" fidp from stack and use it.

  it can be reproduced with the qemu binary, which is given
  it can also be reproduced with own ASAN build (5.0.0-rc3 and 4.2.0 are te=
sted)

  ../qemu-5.0.0-rc3/x86_64-softmmu/qemu-system-x86_64 -M pc -kernel
  ./bzImage -initrd ./rootfs.cpio -append "root=3D/dev/ram console=3Dtty1
  console=3DttyS0 rdinit=3D/bin/sh" -nographic -enable-kvm -fsdev
  local,id=3Dtest_dev,path=3D/home/xxx/sandbox,security_model=3Dnone -device
  virtio-9p-pci,fsdev=3Dtest_dev,mount_tag=3Dvictim_tag

  $ ./do.sh
  expected ASAN report is printed
  the race is in coroutine, so the threads are the same one

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =3D=3D46645=3D=3DERROR: AddressSanitizer: heap-use-after-free on address=
 0x610000047948 at pc 0x5563d8c28f0f bp0
  READ of size 2 at 0x610000047948 thread T0

     #0 0x5563d8c28f0e in v9fs_mark_fids_unreclaim hw/9pfs/9p.c:508
     #1 0x5563d8c3e9e3 in v9fs_remove hw/9pfs/9p.c:2988
     #2 0x5563d98d310d in coroutine_trampoline util/coroutine-ucontext.c:115
     #3 0x7fadac6396af  (/lib/x86_64-linux-gnu/libc.so.6+0x586af)

     0x610000047948 is located 8 bytes inside of 192-byte region
  [0x610000047940,0x610000047a00) freed by thread T0 here:

    #0 0x7fadafa5f7a8 in __interceptor_free (/usr/lib/x86_64-linux-gnu/liba=
san.so.4+0xde7a8)
    #1 0x5563d8c27a60 in free_fid hw/9pfs/9p.c:371
    #2 0x5563d8c27fcc in put_fid hw/9pfs/9p.c:396
    #3 0x5563d8c37267 in v9fs_clunk hw/9pfs/9p.c:2085
    #4 0x5563d98d310d in coroutine_trampoline util/coroutine-ucontext.c:115
    #5 0x7fadac6396af  (/lib/x86_64-linux-gnu/libc.so.6+0x586af)

  previously allocated by thread T0 here:
     #0 0x7fadafa5fd28 in __interceptor_calloc (/usr/lib/x86_64-linux-gnu/l=
ibasan.so.4+0xded28)
     #1 0x7fadaf0c8b10 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0.=
so.0+0x51b10)
     #2 0x5563d8c30ecc in v9fs_attach hw/9pfs/9p.c:1412
     #3 0x5563d98d310d in coroutine_trampoline util/coroutine-ucontext.c:115
     #4 0x7fadac6396af  (/lib/x86_64-linux-gnu/libc.so.6+0x586af)

  =

  This vulnerability was discovered by:

  Ryota Shiga(@Garyo) of Flatt Security working with Trend Micro Zero
  Day Initiative

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1911666/+subscriptions

