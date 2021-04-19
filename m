Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545BB364644
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:37:20 +0200 (CEST)
Received: from localhost ([::1]:55542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYV1b-0001TM-FS
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYV02-0000te-Ip
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:35:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:36250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYV00-0003lx-DK
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:35:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYUzy-0002Qn-Cq
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 14:35:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5CCCE2E8024
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 14:35:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Apr 2021 14:30:23 -0000
From: Laurent Vivier <1924912@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kleinesfilmroellchen laurent-vivier ubuntu-weilnetz
X-Launchpad-Bug-Reporter: =?utf-8?q?kleines_Filmr=C3=B6llchen_=28kleinesfil?=
 =?utf-8?q?mroellchen=29?=
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <161875180735.23175.14682430598239905387.malonedeb@wampee.canonical.com>
Message-Id: <b48d2719-d334-2c16-be32-f3df52d415c7@vivier.eu>
Subject: Re: [Bug 1924912] VirtIO drivers don't work on Windows: "GLib: Too
 many handles to wait for!" crash
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: 5000f3cede0e68f297e00a541ac19541fe2b2c4c
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
Reply-To: Bug 1924912 <1924912@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/04/2021 =C3=A0 12:39, Stefan Weil a =C3=A9crit=C2=A0:
> I can confirm the issue also with latest official QEMU sources.
> =

> Related issue URLs:
> =

> https://github.com/tesseract-ocr/tesseract/issues/2838
> =

> https://bugs.launchpad.net/qemu/+bug/1924912
> =

> Instructions and files required to reproduce the issue:
> =

> https://qemu.weilnetz.de/test/bugs/1924912/
> =

> Michael, Laurent, maybe you have an idea how to narrow down this issue?

Could it be related to the number of file descriptors that can differ
between linux an windows?

We have a series of patches that sets the number of queues to the number
of vCPU:

a4eef0711b2c vhost-user-blk-pci: default num_queues to -smp N
9445e1e15e66 virtio-blk-pci: default num_queues to -smp N
6a558822849f virtio-scsi-pci: default num_queues to -smp N
4e5163bd8444 virtio-scsi: introduce a constant for fixed virtqueues
1436f32a84c3 virtio-pci: add virtio_pci_optimal_num_queues() helper

And I think it can have inpact on the number of open file descriptors.

You can try by specifiying "num_queues=3D1" with the virtio interfaces on t=
he QEMU command line.
(ot choose a machine type earlier than 5.2)

Thanks,
Laurent

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1924912

Title:
  VirtIO drivers don't work on Windows: "GLib: Too many handles to wait
  for!" crash

Status in QEMU:
  New

Bug description:
  I ran SerenityOS <https://github.com/SerenityOS/serenity> out of WSL2
  with native Windows QEMU. The system runs fine on the Linux QEMU (with
  Windows X-Server). However, with Windows QEMU I get a hard crash after
  the following output:

  ```
  [#0 colonel(0:0)]: Scheduler[0]: idle loop running
  [init_stage2(2:2)]: PCI [0000:00:00:00] PCI::ID [8086:1237]
  [init_stage2(2:2)]: PCI [0000:00:01:00] PCI::ID [8086:7000]
  [init_stage2(2:2)]: PCI [0000:00:01:01] PCI::ID [8086:7010]
  [init_stage2(2:2)]: PCI [0000:00:01:02] PCI::ID [8086:7020]
  [init_stage2(2:2)]: PCI [0000:00:01:03] PCI::ID [8086:7113]
  [init_stage2(2:2)]: PCI [0000:00:02:00] PCI::ID [1234:1111]
  [init_stage2(2:2)]: PCI [0000:00:03:00] PCI::ID [8086:2922]
  [init_stage2(2:2)]: PCI [0000:00:04:00] PCI::ID [1af4:1003]
  [init_stage2(2:2)]: PCI [0000:00:05:00] PCI::ID [1af4:1005]
  [init_stage2(2:2)]: PCI [0000:00:06:00] PCI::ID [8086:100e]
  [#0 init_stage2(2:2)]: BXVGA: framebuffer @ P0xf8000000
  [#0 init_stage2(2:2)]: BXVGADevice resolution set to 1024x768 (pitch=3D40=
96)
  [init_stage2(2:2)]: UHCI: Controller found PCI::ID [8086:7020] @ PCI [000=
0:00:01:02]
  [init_stage2(2:2)]: UHCI: I/O base IO c080
  [init_stage2(2:2)]: UHCI: Interrupt line: 11
  [#0 init_stage2(2:2)]: UHCI: Allocated framelist at physical address P0x0=
0e40000
  [#0 init_stage2(2:2)]: UHCI: Framelist is at virtual address V0xc115d000
  [#0 init_stage2(2:2)]: UHCI: QH(0xc115f000) @ 14946304: link_ptr=3D149463=
38, element_link_ptr=3D1
  [#0 init_stage2(2:2)]: UHCI: QH(0xc115f020) @ 14946336: link_ptr=3D149463=
70, element_link_ptr=3D1
  [#0 init_stage2(2:2)]: UHCI: QH(0xc115f040) @ 14946368: link_ptr=3D149464=
02, element_link_ptr=3D1
  [#0 init_stage2(2:2)]: UHCI: QH(0xc115f060) @ 14946400: link_ptr=3D149464=
34, element_link_ptr=3D1
  [#0 init_stage2(2:2)]: UHCI: QH(0xc115f080) @ 14946432: link_ptr=3D149585=
93, element_link_ptr=3D1
  [#0 init_stage2(2:2)]: UHCI: Reset completed
  [#0 init_stage2(2:2)]: UHCI: Started
  [#0 init_stage2(2:2)]: DMIExpose: SMBIOS 32bit Entry point @ P0x000f5870
  [#0 init_stage2(2:2)]: DMIExpose: Data table @ P0x000f5890
  [#0 init_stage2(2:2)]: VirtIOConsole: Found @ PCI [0000:00:04:00]
  [#0 init_stage2(2:2)]: Trying to unregister unused handler (?)
  [#0 init_stage2(2:2)]: VirtIOConsole: Multi port is not yet supported!
  [#0 init_stage2(2:2)]: VirtIOConsole: cols: 0, rows: 0, max nr ports 0
  qemu-system-i386.exe: warning: GLib: Too many handles to wait for!
  ```

  The lines starting with [ are SerenityOS output; QEMU warns "GLib: Too
  many handles to wait for!" and crashes right after (can't even Ctrl-C
  in the WSL command line, force-close in Windows necessary). A window
  is still spawned but as the OS already switched out of text mode, just
  a black screen is visible as QEMU crashes.

  I first thought this to be an issue with SerenityOS and reported it
  over there: <https://github.com/SerenityOS/serenity/issues/6422>. The
  kernel devs pointed out that this seems to be a VirtIO driver/device
  issue on the Windows build of QEMU, because the Serenity kernel tries
  to initialize VirtIO devices which apparently crashes QEMU. There will
  be mitigations from the SerenityOS side (by allowing to disable VirtIO
  on boot) but it would of course be great if QEMU handled this
  properly.

  Version info: Both QEMU 6.0.0-rc3 and 5.2.0 exhibit this issue.
  Windows release is 20H2, WSL2 is running Debian 10.9. SerenityOS has
  no proper version but it was reproduced on the most current commits as
  of 18/04/2021.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1924912/+subscriptions

