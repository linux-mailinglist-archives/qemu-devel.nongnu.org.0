Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEB92C2E12
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:10:56 +0100 (CET)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbqB-0000qz-8Y
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbXT-0002K3-DI
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:51:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:39810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbXJ-0005ke-MF
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:51:35 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khbXE-0001Kc-CM
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:51:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4FDBD2E8141
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:51:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2020 16:36:05 -0000
From: Thomas Huth <1774830@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: felix.von.s glaukommatos th-huth
X-Launchpad-Bug-Reporter: Haskell Pointer (glaukommatos)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
X-Launchpad-Bug-Duplicate: 1900779
References: <152798433644.32292.11286299257318650919.malonedeb@soybean.canonical.com>
Message-Id: <160623576528.9118.6206712310445337991.malone@gac.canonical.com>
Subject: [Bug 1774830] Re: qemu monitor disassembled memory dump produces
 incorrect output
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 30dcf6e4f45bdcaab2c8bb732d474efcf75be3aa
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
Reply-To: Bug 1774830 <1774830@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1900779 ***
    https://bugs.launchpad.net/bugs/1900779

Looking at your patch and the fix in commit 437588d81d99ac91cb1e, the
modifications are the same, so this issue should be fixed, indeed. Big
sorry that your bug report here fell through the cracks, but at least
it's fixed now. Closing this ticket as duplicate.

** This bug has been marked a duplicate of bug 1900779
   xp /16i on arm mixes DWords

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1774830

Title:
  qemu monitor disassembled memory dump produces incorrect output

Status in QEMU:
  New

Bug description:
  Greetings,

  I've been using qemu-system-aarch64 to do some low-level programming
  targeting the raspberry pi 3. While I was debugging a problem in my
  code I noticed a very confusing inconsistency that I think is very
  likely a bug somewhere in how qemu's monitor produces its disassembled
  output.

  Here's my version output (installed via homebrew on macOS 10.13.4)

  $ qemu-system-aarch64 --version
  QEMU emulator version 2.12.0
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  Some system information (macOS 10.13.4):

  $ uname -a
  Darwin Lillith.local 17.5.0 Darwin Kernel Version 17.5.0: Fri Apr 13 19:3=
2:32 PDT 2018; root:xnu-4570.51.2~1/RELEASE_X86_64 x86_64

  Here's an example of the problem I am seeing:

  qemu-system-aarch64 -S -M raspi3 -kernel kernel8.img -monitor stdio
  QEMU 2.12.0 monitor - type 'help' for more information
  (qemu) x /32x 0x80000
  0000000000080000: 0xd53800a1 0x92400421 0xb4000061 0xd503205f
  0000000000080010: 0x17ffffff 0x58000161 0x9100003f 0x58000161
  0000000000080020: 0x180000e2 0x34000082 0xf800843f 0x51000442
  0000000000080030: 0x35ffffa2 0xd2806763 0x17ffffff 0x00000000
  0000000000080040: 0x00080000 0x00000000 0x00080050 0x00000000
  0000000000080050: 0x00000000 0x00000000 0x00000000 0x00000000
  0000000000080060: 0x00000000 0x00000000 0x00000000 0x00000000
  0000000000080070: 0x00000000 0x00000000 0x00000000 0x00000000
  (qemu) x /32i 0x80000
  0x00080000:  d53800a1  mrs      x1, mpidr_el1
  0x00080004:  92400421  and      x1, x1, #3
  0x00080008:  b4000061  cbz      x1, #0x80014
  0x0008000c:  d503205f  wfe
  0x00080010:  17ffffff  b        #0x8000c
  0x00080014:  58000161  ldr      x1, #0x80040
  0x00080018:  9100003f  mov      sp, x1
  0x0008001c:  58000161  ldr      x1, #0x80048
  0x00080020:  92400421  and      x1, x1, #3
  0x00080024:  b4000061  cbz      x1, #0x80030
  0x00080028:  d503205f  wfe
  0x0008002c:  17ffffff  b        #0x80028
  0x00080030:  58000161  ldr      x1, #0x8005c
  0x00080034:  9100003f  mov      sp, x1
  0x00080038:  58000161  ldr      x1, #0x80064
  0x0008003c:  180000e2  ldr      w2, #0x80058
  0x00080040:  34000082  cbz      w2, #0x80050
  0x00080044:  f800843f  str      xzr, [x1], #8
  0x00080048:  51000442  sub      w2, w2, #1
  0x0008004c:  35ffffa2  cbnz     w2, #0x80040
  0x00080050:  d2806763  movz     x3, #0x33b
  0x00080054:  17ffffff  b        #0x80050
  0x00080058:  00000000  .byte    0x00, 0x00, 0x00, 0x00
  0x0008005c:  00080000  .byte    0x00, 0x00, 0x08, 0x00
  0x00080060:  00000000  .byte    0x00, 0x00, 0x00, 0x00
  0x00080064:  00080050  .byte    0x50, 0x00, 0x08, 0x00
  0x00080068:  00000000  .byte    0x00, 0x00, 0x00, 0x00
  0x0008006c:  00000000  .byte    0x00, 0x00, 0x00, 0x00
  0x00080070:  00000000  .byte    0x00, 0x00, 0x00, 0x00
  0x00080074:  00000000  .byte    0x00, 0x00, 0x00, 0x00
  0x00080078:  00000000  .byte    0x00, 0x00, 0x00, 0x00
  0x0008007c:  00000000  .byte    0x00, 0x00, 0x00, 0x00

  Please notice that between 0x80004 thru 0x8001c is repeated for some
  reason in the /32i formatted output which also causes the addresses
  for the following bytes to also be incorrect.

  Just in order to keep things as clear as possible, I'll also attach
  the binary shown above but disassembled by objdump instead of qemu.

  $ aarch64-elf-objdump -d kernel8.elf

  kernel8.elf:     file format elf64-littleaarch64

  Disassembly of section .text:

  0000000000080000 <_start>:
  =C2=A0=C2=A0=C2=A080000:	d53800a1 	mrs	x1, mpidr_el1
  =C2=A0=C2=A0=C2=A080004:	92400421 	and	x1, x1, #0x3
  =C2=A0=C2=A0=C2=A080008:	b4000061 	cbz	x1, 80014 <_start+0x14>
  =C2=A0=C2=A0=C2=A08000c:	d503205f 	wfe
  =C2=A0=C2=A0=C2=A080010:	17ffffff 	b	8000c <_start+0xc>
  =C2=A0=C2=A0=C2=A080014:	58000161 	ldr	x1, 80040 <_start+0x40>
  =C2=A0=C2=A0=C2=A080018:	9100003f 	mov	sp, x1
  =C2=A0=C2=A0=C2=A08001c:	58000161 	ldr	x1, 80048 <_start+0x48>
  =C2=A0=C2=A0=C2=A080020:	180000e2 	ldr	w2, 8003c <_start+0x3c>
  =C2=A0=C2=A0=C2=A080024:	34000082 	cbz	w2, 80034 <_start+0x34>
  =C2=A0=C2=A0=C2=A080028:	f800843f 	str	xzr, [x1], #8
  =C2=A0=C2=A0=C2=A08002c:	51000442 	sub	w2, w2, #0x1
  =C2=A0=C2=A0=C2=A080030:	35ffffa2 	cbnz	w2, 80024 <_start+0x24>
  =C2=A0=C2=A0=C2=A080034:	d2806763 	mov	x3, #0x33b                 	// #827
  =C2=A0=C2=A0=C2=A080038:	17ffffff 	b	80034 <_start+0x34>
  =C2=A0=C2=A0=C2=A08003c:	00000000 	.word	0x00000000
  =C2=A0=C2=A0=C2=A080040:	00080000 	.word	0x00080000
  =C2=A0=C2=A0=C2=A080044:	00000000 	.word	0x00000000
  =C2=A0=C2=A0=C2=A080048:	00080050 	.word	0x00080050
  =C2=A0=C2=A0=C2=A08004c:	00000000 	.word	0x00000000

  Hopefully this is helpful information, please let me know if I left
  out anything really important. Thank you!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1774830/+subscriptions

