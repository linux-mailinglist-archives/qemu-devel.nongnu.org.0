Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03319388331
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 01:36:28 +0200 (CEST)
Received: from localhost ([::1]:34480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj9GF-00051P-2j
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 19:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lj9FQ-0004Ey-Ld
 for qemu-devel@nongnu.org; Tue, 18 May 2021 19:35:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:56594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lj9FK-00080g-Ml
 for qemu-devel@nongnu.org; Tue, 18 May 2021 19:35:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lj9FI-00023e-8S
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 23:35:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0B73F2E8195
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 23:35:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 May 2021 23:29:16 -0000
From: Thomas Huth <1915539@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr jnsnow th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161315020574.21876.12537756905714073964.malonedeb@wampee.canonical.com>
Message-Id: <162138055695.1187.14372703284533379974.malone@wampee.canonical.com>
Subject: [Bug 1915539] Re: Null-ptr dereference on AHCICmdHdr in
 ahci_pio_transfer
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: f369b332deee4aa16dab948e58e30c76bcc28a40
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
Reply-To: Bug 1915539 <1915539@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/341


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Changed in: qemu
     Assignee: John Snow (jnsnow) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #341
   https://gitlab.com/qemu-project/qemu/-/issues/341

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915539

Title:
  Null-ptr dereference on AHCICmdHdr in ahci_pio_transfer

Status in QEMU:
  Expired

Bug description:
  =3D=3D Reproducer =3D=3D

  cat << EOF | ./qemu-system-i386 -display none \
  -m 512M -machine q35 -nodefaults \
  -drive file=3Dnull-co://,if=3Dnone,format=3Draw,id=3Ddisk0 \
  -device ide-hd,drive=3Ddisk0 -machine accel=3Dqtest -qtest stdio
  outl 0xcf8 0x8000fa24
  outl 0xcfc 0xe0000000
  outl 0xcf8 0x8000fa04
  outw 0xcfc 0x06
  write 0x10a 0x1 0x02
  write 0xe0000398 0x1 0x01
  write 0x20000 0x1 0x27
  write 0x20001 0x1 0x80
  write 0x20002 0x1 0x20
  write 0x20005 0x1 0x02
  write 0xe00003b8 0x2 0x0101
  write 0xe0000004 0x1 0x01
  write 0x2bb 0x1 0x00
  write 0x2bf 0x1 0x00
  write 0x2cf 0x1 0x00
  write 0x2db 0x1 0x00
  write 0x2df 0x1 0x00
  write 0x2ed 0x1 0x00
  write 0x2ef 0x1 0x00
  write 0x2fb 0x1 0x00
  write 0x2ff 0x1 0x00
  write 0x31f 0x1 0x00
  write 0x32b 0x1 0x00
  write 0x32f 0x1 0x00
  write 0x337 0x1 0x00
  write 0x33f 0x1 0x00
  write 0x347 0x1 0x00
  write 0x357 0x1 0x00
  write 0x35f 0x1 0x00
  write 0x36b 0x1 0x00
  write 0x36f 0x1 0x00
  write 0x377 0x1 0x00
  write 0x37f 0x1 0x00
  write 0x397 0x1 0x00
  write 0x39f 0x1 0x00
  write 0x3ab 0x1 0x00
  write 0x3af 0x1 0x00
  write 0x3b7 0x1 0x00
  write 0x3bf 0x1 0x00
  write 0x3c7 0x1 0x00
  write 0x3d7 0x1 0x00
  write 0x3df 0x1 0x00
  write 0x3eb 0x1 0x00
  write 0x3ef 0x1 0x00
  write 0x3f7 0x1 0x00
  write 0x3ff 0x1 0x00
  write 0xe0000394 0x1 0x00
  write 0xe0000398 0x1 0x01
  EOF

  =3D=3D Stack Trace =3D=3D
  ../hw/ide/ahci.c:1349:46: runtime error: member access within null pointe=
r of
  type 'AHCICmdHdr' (aka 'struct AHCICmdHdr') SUMMARY:
  UndefinedBehaviorSanitizer: undefined-behavior ../hw/ide/ahci.c:1349:46 in
  ../hw/ide/ahci.c:1349:46: runtime error: load of null pointer of type
  'uint16_t' (aka 'unsigned short')
  SUMMARY: UndefinedBehaviorSanitizer:
  undefined-behavior ../hw/ide/ahci.c:1349:46 in AddressSanitizer:DEADLYSIG=
NAL
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D238806=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x0000=
00000000 (pc
  0x555787d414c9 bp 0x7fffe1bb41a0 sp 0x7fffe1bb3fe0 T0)
  =3D=3D238806=3D=3DThe signal is caused by a READ memory access.
  =3D=3D238806=3D=3DHint: address points to the zero page.
  #0 0x555787d414c9 in ahci_pio_transfer build/../hw/ide/ahci.c:1349:46
  #1 0x5557886089d6 in ide_transfer_start_norecurse build/../hw/ide/core.c:=
553:5
  #2 0x555788638945 in ide_transfer_start build/../hw/ide/core.c:560:9
  #3 0x555788638945 in ide_sector_read_cb build/../hw/ide/core.c:761:5
  #4 0x55578860c989 in ide_buffered_readv_cb build/../hw/ide/core.c:656:9
  #5 0x5557898999d6 in blk_aio_complete build/../block/block-backend.c:1412=
:9
  #6 0x555789db8d26 in aio_bh_poll build/../util/async.c:164:13
  #7 0x555789d80704 in aio_dispatch build/../util/aio-posix.c:381:5
  #8 0x555789dbd94c in aio_ctx_dispatch build/../util/async.c:306:5
  #9 0x7f6dcedcfbaa in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/l=
ibglib-2.0.so.0+0x51baa)
  #10 0x555789dc3763 in glib_pollfds_poll build/../util/main-loop.c:232:9
  #11 0x555789dc3763 in os_host_main_loop_wait build/../util/main-loop.c:25=
5:5
  #12 0x555789dc3763 in main_loop_wait build/../util/main-loop.c:531:11
  #13 0x555789206a49 in qemu_main_loop build/../softmmu/runstate.c:722:9
  #14 0x555787d052ed in main build/../softmmu/main.c:50:5
  #15 0x7f6dcd84ecc9 in __libc_start_main csu/../csu/libc-start.c:308:16
  #16 0x555787c5b619 in _start (system-i386+0x2a13619)

  AddressSanitizer can not provide additional info.
  SUMMARY: AddressSanitizer: SEGV build/../hw/ide/ahci.c:1349:46 in ahci_pi=
o_transfer
  =3D=3D238806=3D=3DABORTING

  OSS-Fuzz link: https://bugs.chromium.org/p/oss-
  fuzz/issues/detail?id=3D30861

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915539/+subscriptions

