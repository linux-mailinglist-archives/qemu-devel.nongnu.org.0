Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDF7377762
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:42:11 +0200 (CEST)
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflZK-0001Ik-OJ
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflY5-0000b1-Mj
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:40:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:57148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflY4-00033k-6q
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:40:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lflY2-0002ga-IY
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:40:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 872412E8030
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:40:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:34:16 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1880539@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <159039895924.7312.8999076686824323072.malonedeb@gac.canonical.com>
Message-Id: <162057445696.6759.6757426056692893320.malone@gac.canonical.com>
Subject: [Bug 1880539] Re: I/O write make QXL abort in qxl_set_mode()
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 587d56926f315869b3dd791b737ad64e20bad828
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1880539 <1880539@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/232


** Changed in: qemu
       Status: New =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #232
   https://gitlab.com/qemu-project/qemu/-/issues/232

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880539

Title:
  I/O write make QXL abort in qxl_set_mode()

Status in QEMU:
  Invalid

Bug description:
  libFuzzer found:

  qxl-0: guest bug: qxl_add_memslot: guest_start > guest_end 0xffffffffffff=
ffff > 0x3ffffff
  qemu-fuzz-i386: hw/display/qxl.c:1611: void qxl_set_mode(PCIQXLDevice *, =
unsigned int, int): Assertion `qxl_add_memslot(d, 0, devmem, QXL_SYNC) =3D=
=3D 0' failed.
  =3D=3D8134=3D=3D ERROR: libFuzzer: deadly signal
      #0 0x55fddfcfb3f0 in __sanitizer_print_stack_trace (qemu-fuzz-i386+0x=
cb13f0)
      #1 0x55fddfc0a3e1 in fuzzer::PrintStackTrace() (qemu-fuzz-i386+0xbc03=
e1)
      #2 0x55fddfbeac6f in fuzzer::Fuzzer::CrashCallback() (qemu-fuzz-i386+=
0xba0c6f)
      #3 0x55fddfbeacc3 in fuzzer::Fuzzer::StaticCrashSignalCallback() (qem=
u-fuzz-i386+0xba0cc3)
      #4 0x7fd640644c6f  (/lib64/libpthread.so.0+0x12c6f)
      #5 0x7fd640483e34 in __GI_raise (/lib64/libc.so.6+0x37e34)
      #6 0x7fd64046e894 in __GI_abort (/lib64/libc.so.6+0x22894)
      #7 0x7fd64046e768 in __assert_fail_base.cold (/lib64/libc.so.6+0x2276=
8)
      #8 0x7fd64047c565 in __GI___assert_fail (/lib64/libc.so.6+0x30565)
      #9 0x55fde08afd8b in qxl_set_mode (qemu-fuzz-i386+0x1865d8b)
      #10 0x55fde08b9602 in ioport_write (qemu-fuzz-i386+0x186f602)
      #11 0x55fddff170a7 in memory_region_write_accessor (qemu-fuzz-i386+0x=
ecd0a7)
      #12 0x55fddff16c13 in access_with_adjusted_size (qemu-fuzz-i386+0xecc=
c13)
      #13 0x55fddff157b4 in memory_region_dispatch_write (qemu-fuzz-i386+0x=
ecb7b4)

  Can be reproduce doing "writeb 0x06 0x23" on QXL I/O (PCI BAR #3).

  Command line: 'qemu-system-i386 -display none -M pc -vga qxl'

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1880539/+subscriptions

