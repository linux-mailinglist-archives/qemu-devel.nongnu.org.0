Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62E236F731
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:35:14 +0200 (CEST)
Received: from localhost ([::1]:49714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOcD-0006Wz-TM
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOYk-0003CI-6x
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:31:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:49152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOYd-0005Rh-Tn
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:31:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOYb-0002PR-AV
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:31:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4E3492E8144
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:31:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:19:16 -0000
From: Thomas Huth <1910826@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr qiuhao th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161014511656.1595.5916687449177710884.malonedeb@gac.canonical.com>
Message-Id: <161977075707.13919.2377722822290115796.malone@wampee.canonical.com>
Subject: [Bug 1910826] Re: [OSS-Fuzz] Issue 29224 rtl8139: Stack-overflow in
 rtlNUMBER_transmit_one
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: a834f7cde841714b84335ea72c3e969eb28fdfea
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
Reply-To: Bug 1910826 <1910826@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://gitlab.com/qemu-project/qemu/-/commit/5311fb805a4403bba

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910826

Title:
  [OSS-Fuzz] Issue 29224 rtl8139: Stack-overflow in
  rtlNUMBER_transmit_one

Status in QEMU:
  Fix Released

Bug description:
  =3D=3D=3D Reproducer =3D=3D=3D
  cat << EOF | ../build/qemu-system-i386 -machine q35 \
  -nodefaults  -device rtl8139,netdev=3Dnet0 \
  -netdev user,id=3Dnet0 -display none -qtest stdio
  outl 0xcf8 0x80000804
  outb 0xcfc 0x26
  outl 0xcf8 0x80000817
  outb 0xcfc 0xff
  write 0x1 0x1 0x42
  write 0x5 0x1 0x42
  write 0x9 0x1 0x42
  write 0xd 0x1 0x42
  write 0xff000044 0x4 0x11
  write 0xff000037 0x1 0x1c
  writel 0xff000030 0xff000000
  write 0xff000040 0x4 0x100006
  write 0xff000010 0x4 0x01020
  EOF

  =3D=3D=3D Stack Trace =3D=3D=3D
  =3D=3D2819215=3D=3DERROR: AddressSanitizer: stack-overflow on address 0x7=
ffd2c714040 (pc 0x5639b3a933d9 bp 0x7ffd2c716210 sp 0x7ffd2c714040 T0)
  #0 rtl8139_transmit_one /src/qemu/hw/net/rtl8139.c:1815
  #1 rtl8139_transmit /src/qemu/hw/net/rtl8139.c:2388:9
  #2 rtl8139_TxStatus_write /src/qemu/hw/net/rtl8139.c:2442:5
  #3 rtl8139_io_writel /src/qemu/hw/net/rtl8139.c:2865:13
  #4 rtl8139_ioport_write /src/qemu/hw/net/rtl8139.c:3290:9
  #5 memory_region_write_accessor /src/qemu/softmmu/memory.c:491:5
  #6 access_with_adjusted_size /src/qemu/softmmu/memory.c:552:18
  #7 memory_region_dispatch_write /src/qemu/softmmu/memory.c:0:13
  #8 flatview_write_continue /src/qemu/softmmu/physmem.c:2759:23
  #9 flatview_write /src/qemu/softmmu/physmem.c:2799:14
  #10 address_space_write /src/qemu/softmmu/physmem.c:2891:18
  #11 address_space_rw /src/qemu/softmmu/physmem.c:2901:16
  #12 dma_memory_rw_relaxed /src/qemu/include/sysemu/dma.h:88:12
  #13 dma_memory_rw /src/qemu/include/sysemu/dma.h:127:12
  #14 pci_dma_rw /src/qemu/include/hw/pci/pci.h:801:12
  #15 pci_dma_write /src/qemu/include/hw/pci/pci.h:837:12
  #16 rtl8139_write_buffer /src/qemu/hw/net/rtl8139.c:778:5
  #17 rtl8139_do_receive /src/qemu/hw/net/rtl8139.c:1172:9
  #18 rtl8139_transfer_frame /src/qemu/hw/net/rtl8139.c:1798:9
  #19 rtl8139_transmit_one /src/qemu/hw/net/rtl8139.c:1845:5
  #20 rtl8139_transmit /src/qemu/hw/net/rtl8139.c:2388:9
  #21 rtl8139_TxStatus_write /src/qemu/hw/net/rtl8139.c:2442:5
  #22 rtl8139_io_writel /src/qemu/hw/net/rtl8139.c:2865:13
  #23 rtl8139_ioport_write /src/qemu/hw/net/rtl8139.c:3290:9
  #24 memory_region_write_accessor /src/qemu/softmmu/memory.c:491:5
  #25 access_with_adjusted_size /src/qemu/softmmu/memory.c:552:18
  #26 memory_region_dispatch_write /src/qemu/softmmu/memory.c:0:13
  #27 flatview_write_continue /src/qemu/softmmu/physmem.c:2759:23
  #28 flatview_write /src/qemu/softmmu/physmem.c:2799:14
  #29 address_space_write /src/qemu/softmmu/physmem.c:2891:18
  #30 address_space_rw /src/qemu/softmmu/physmem.c:2901:16
  #31 dma_memory_rw_relaxed /src/qemu/include/sysemu/dma.h:88:12
  #32 dma_memory_rw /src/qemu/include/sysemu/dma.h:127:12
  #33 pci_dma_rw /src/qemu/include/hw/pci/pci.h:801:12
  #34 pci_dma_write /src/qemu/include/hw/pci/pci.h:837:12
  #35 rtl8139_write_buffer /src/qemu/hw/net/rtl8139.c:778:5
  #36 rtl8139_do_receive /src/qemu/hw/net/rtl8139.c:1172:9
  #37 rtl8139_transfer_frame /src/qemu/hw/net/rtl8139.c:1798:9
  Repeat until we run out of stack

  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D29224

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910826/+subscriptions

