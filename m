Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290EA1D619B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 16:47:01 +0200 (CEST)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZy5b-0006rT-OA
	for lists+qemu-devel@lfdr.de; Sat, 16 May 2020 10:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jZy4Q-0006Qc-Hr
 for qemu-devel@nongnu.org; Sat, 16 May 2020 10:45:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:37402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jZy4P-0000Wo-HE
 for qemu-devel@nongnu.org; Sat, 16 May 2020 10:45:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jZy4N-00068Q-83
 for <qemu-devel@nongnu.org>; Sat, 16 May 2020 14:45:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2C2982E8105
 for <qemu-devel@nongnu.org>; Sat, 16 May 2020 14:45:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2020 14:40:12 -0000
From: Alexander Bulekov <1878136@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Duplicate: 1878134
References: <158925948674.4440.10313531925488089499.malonedeb@soybean.canonical.com>
Message-Id: <158964001299.31033.7037119739193885938.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1878136] Re: Assertion failures in
 ati_reg_read_offs/ati_reg_write_offs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0385b538081bc4718df6fb844a3afc89729c94ce";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 64b317c1ae2782e4c4f9b1bab5a6dbef315d1a59
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/16 07:30:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1878136 <1878136@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1878134 ***
    https://bugs.launchpad.net/bugs/1878134

** This bug has been marked a duplicate of bug 1878134
   Assertion failures in ati_reg_read_offs/ati_reg_write_offs

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878136

Title:
   Assertion failures in ati_reg_read_offs/ati_reg_write_offs

Status in QEMU:
  New

Bug description:
  Hello,
  While fuzzing, I found inputs that trigger assertion failures in
  ati_reg_read_offs/ati_reg_write_offs

  uint32_t extract32(uint32_t, int, int): Assertion `start >=3D 0 &&
  length > 0 && length <=3D 32 - start' failed

  #3 0x00007ffff6866092 in __GI___assert_fail (assertion=3D0x555556e760c0 <=
str> "start >=3D 0 && length > 0 && length <=3D 32 - start", file=3D0x55555=
6e76120 <str> "/home/alxndr/Development/qemu/include/qemu/bitops.h", line=
=3D0x12c, function=3D0x555556e76180 <__PRETTY_FUNCTION__.extract32> "uint32=
_t extract32(uint32_t, int, int)") at assert.c:101
  #4 0x000055555653d8a7 in ati_mm_read (opaque=3D<optimized out>, addr=3D0x=
1a, size=3D<optimized out>) at /home/alxndr/Development/qemu/include/qemu/l=
og-for-trace.h:29
  #5 0x000055555653c825 in ati_mm_read (opaque=3D<optimized out>, addr=3D0x=
4, size=3D<optimized out>) at /home/alxndr/Development/qemu/hw/display/ati.=
c:289
  #6 0x000055555601446e in memory_region_read_accessor (mr=3D0x63100004dc20=
, addr=3D<optimized out>, value=3D<optimized out>, size=3D<optimized out>, =
shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...) at /home/alxn=
dr/Development/qemu/memory.c:434
  #7 0x0000555556001a70 in access_with_adjusted_size (addr=3D<optimized out=
>, value=3D<optimized out>, size=3D<optimized out>, access_size_min=3D<opti=
mized out>, access_size_max=3D<optimized out>, access_fn=3D<optimized out>,=
 mr=3D0x63100004dc20, attrs=3D...) at /home/alxndr/Development/qemu/memory.=
c:544
  #8 0x0000555556001a70 in memory_region_dispatch_read1 (mr=3D0x63100004dc2=
0, addr=3D0x4, pval=3D<optimized out>, size=3D0x4, attrs=3D...) at /home/al=
xndr/Development/qemu/memory.c:1396

  I can reproduce it in qemu 5.0 built with using:
  cat << EOF | ~/Development/qemu/build/i386-softmmu/qemu-system-i386 -M pc=
-q35-5.0 -device ati-vga -nographic -qtest stdio -monitor none -serial none
  outl 0xcf8 0x80001018
  outl 0xcfc 0xe2000000
  outl 0xcf8 0x8000101c
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  outl 0xcf8 0x8000fa20
  write 0xe2000004 0x1 0x1a
  readq 0xe2000000
  EOF

  Similarly for ati_reg_write_offs:
  cat << EOF | ~/Development/qemu/build/i386-softmmu/qemu-system-i386 -M pc=
-q35-5.0 -device ati-vga -nographic -qtest stdio -monitor none -serial none
  outl 0xcf8 0x80001018
  outl 0xcfc 0xe2000000
  outl 0xcf8 0x8000101c
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  outl 0xcf8 0x8000fa20
  write 0xe2000000 0x8 0x6a00000000006a00
  EOF

  I also attached the traces to this launchpad report, in case the
  formatting is broken:

  qemu-system-i386 -M pc-q35-5.0 -device ati-vga -nographic -qtest stdio
  -monitor none -serial none < attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878136/+subscriptions

