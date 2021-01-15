Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4474D2F80D9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 17:32:57 +0100 (CET)
Received: from localhost ([::1]:50320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0S1w-0006Kk-99
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 11:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0RvC-00010A-QG
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:25:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:50272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0RvA-0002Eh-QS
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:25:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0Rv9-0004kA-Eb
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 16:25:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4A3E62E813C
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 16:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 Jan 2021 16:16:18 -0000
From: Peter Maydell <1905444@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20201124171810.akchle2mwg6xdlol@mozz.bu.edu>
Message-Id: <161072737933.5951.2902316183127929236.launchpad@wampee.canonical.com>
Subject: [Bug 1905444] Re: [OSS-Fuzz] Issue 27796 in oss-fuzz:
 qemu:qemu-fuzz-i386-target-generic-fuzz-xhci: Stack-overflow in
 address_space_stl_internal
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: ec1a3224c02bce4f6a0435d1eb0e66ed8b98825e
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
Reply-To: Bug 1905444 <1905444@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: fuzzer

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905444

Title:
  [OSS-Fuzz] Issue 27796 in oss-fuzz: qemu:qemu-fuzz-i386-target-
  generic-fuzz-xhci: Stack-overflow in address_space_stl_internal

Status in QEMU:
  New

Bug description:
   affects qemu

  OSS-Fuzz Report: https://bugs.chromium.org/p/oss-
  fuzz/issues/detail?id=3D27796

  =3D=3D=3D Reproducer (build with --enable-sanitizers) =3D=3D=3D
  cat << EOF | ./qemu-system-i386 -display none  -machine accel=3Dqtest, \
  -m 512M -machine q35 -nodefaults \
  -drive file=3Dnull-co://,if=3Dnone,format=3Draw,id=3Ddisk0 \
  -device qemu-xhci,id=3Dxhci -device usb-tablet,bus=3Dxhci.0 \
  -qtest-log none -qtest stdio
  outl 0xcf8 0x80000803
  outw 0xcfc 0x5e46
  outl 0xcf8 0x80000810
  outl 0xcfc 0xff5a5e46
  write 0xff5a5020 0x6 0xffffffff0b70
  outl 0xcf8 0x80000893
  outb 0xcfc 0x93
  writel 0xff5a7000 0xff5a5020
  write 0xff5a700c 0x4 0x0c0c2e58
  write 0xff5a4040 0x4 0x00d26001
  write 0xff5a4044 0x4 0x0000030
  EOF

  =3D=3D=3D Stack Trace =3D=3D=3D
  =3D=3D50473=3D=3DERROR: AddressSanitizer: stack-overflow on address 0x7ff=
e3ec97e28 (pc 0x55e292eac159 bp 0x7ffe3ec98670 sp 0x7ffe3ec97e30 T0)
  #0 0x55e292eac159 in __asan_memcpy (u-system-i386+0x2a0e159)
  #1 0x55e2944bc04e in flatview_do_translate softmmu/physmem.c:513:12
  #2 0x55e2944dbe90 in flatview_translate softmmu/physmem.c:563:15
  #3 0x55e2944dbe90 in address_space_translate include/exec/memory.h:2362:12
  #4 0x55e2944dbe90 in address_space_stl_internal memory_ldst.c.inc:316:10
  #5 0x55e29393d2a0 in xhci_intr_update hw/usb/hcd-xhci.c:554:13
  #6 0x55e29393efb9 in xhci_runtime_write hw/usb/hcd-xhci.c:3032:9
  #7 0x55e294230428 in memory_region_write_accessor softmmu/memory.c:484:5
  #8 0x55e29422fe63 in access_with_adjusted_size softmmu/memory.c:545:18
  #9 0x55e29422f6fc in memory_region_dispatch_write softmmu/memory.c
  #10 0x55e2944dc03c in address_space_stl_internal memory_ldst.c.inc:319:13
  #11 0x55e29393d2a0 in xhci_intr_update hw/usb/hcd-xhci.c:554:13
  #12 0x55e29393efb9 in xhci_runtime_write hw/usb/hcd-xhci.c:3032:9
  #13 0x55e294230428 in memory_region_write_accessor softmmu/memory.c:484:5
  #14 0x55e29422fe63 in access_with_adjusted_size softmmu/memory.c:545:18
  #15 0x55e29422f6fc in memory_region_dispatch_write softmmu/memory.c
  #16 0x55e2944dc03c in address_space_stl_internal memory_ldst.c.inc:319:13
  #17 0x55e29393d2a0 in xhci_intr_update hw/usb/hcd-xhci.c:554:13
  #18 0x55e29393efb9 in xhci_runtime_write hw/usb/hcd-xhci.c:3032:9

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905444/+subscriptions

