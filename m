Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0A3375C9C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 23:08:18 +0200 (CEST)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lelEH-0006aH-AN
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 17:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lelBk-0005b8-N7
 for qemu-devel@nongnu.org; Thu, 06 May 2021 17:05:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:34490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lelBi-00023Q-Qv
 for qemu-devel@nongnu.org; Thu, 06 May 2021 17:05:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lelBh-0003tn-IW
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 21:05:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8AEEC2E8139
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 21:05:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 20:59:10 -0000
From: Christophe Lyon <1927530@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: christophe-lyon rth
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Duplicate: 1921948
References: <162032255539.3176.12225423479727839886.malonedeb@gac.canonical.com>
Message-Id: <162033475101.14246.619965166174742640.malone@soybean.canonical.com>
Subject: [Bug 1927530] Re: qemu-aarch64 MTE fails to report tag mismatch
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: a16538d920a4b2149c21a171bd38be975e2bb19a
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
Reply-To: Bug 1927530 <1927530@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1921948 ***
    https://bugs.launchpad.net/bugs/1921948


** Attachment added: "libgcc_s.so.1"
   https://bugs.launchpad.net/qemu/+bug/1927530/+attachment/5495299/+files/=
libgcc_s.so.1

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1927530

Title:
  qemu-aarch64 MTE fails to report tag mismatch

Status in QEMU:
  New

Bug description:
  Hi,

  While running the GCC testsuite with qemu-6.0 as simulator, I noticed
  several errors in the hwasan testsuite (output pattern tests).

  I am attaching:
  bitfield-2.exe
  ld-linux-aarch64.so.1
  libc.so.6
  libdl.so.2
  libhwasan.so.0
  libm.so.6
  libpthread.so.0
  librt.so.1

  The testcase can be executed via:
  qemu-aarch64 -L . bitfield-2.exe

  it currently generates:
  HWAddressSanitizer:DEADLYSIGNAL
  =3D=3D21137=3D=3DERROR: HWAddressSanitizer: SEGV on unknown address 0x000=
0000000f0 (pc 0x00550084e318 bp 0x005f01650d00 sp 0x005f01650d00 T21137)
  =3D=3D21137=3D=3DThe signal is caused by a UNKNOWN memory access.
  =3D=3D21137=3D=3DHint: address points to the zero page.
      #0 0x550084e318 in GetAccessInfo /home/christophe.lyon/src/GCC/source=
s/gcc-fsf-git/trunk/libsanitizer/hwasan/hwasan_linux.cpp:339
      #1 0x550084e318 in HwasanOnSIGTRAP /home/christophe.lyon/src/GCC/sour=
ces/gcc-fsf-git/trunk/libsanitizer/hwasan/hwasan_linux.cpp:401
      #2 0x550084e318 in __hwasan::HwasanOnDeadlySignal(int, void*, void*) =
/home/christophe.lyon/src/GCC/sources/gcc-fsf-git/trunk/libsanitizer/hwasan=
/hwasan_linux.cpp:426
      #3 0x5f01651fec  (<unknown module>)
      #4 0x550084b508 in __hwasan_load2 /home/christophe.lyon/src/GCC/sourc=
es/gcc-fsf-git/trunk/libsanitizer/hwasan/hwasan.cpp:379
      #5 0x400768 in f /home/christophe.lyon/src/GCC/sources/gcc-fsf-git/tr=
unk/gcc/testsuite/c-c++-common/hwasan/bitfield-2.c:17
      #6 0x4007d0 in main /home/christophe.lyon/src/GCC/sources/gcc-fsf-git=
/trunk/gcc/testsuite/c-c++-common/hwasan/bitfield-2.c:24
      #7 0x550124cee0 in __libc_start_main ../csu/libc-start.c:308
      #8 0x400688  (/home/christophe.lyon/qemu-bug-hwasan-aarch64/bitfield-=
2.exe+0x400688)

  HWAddressSanitizer can not provide additional info.
  SUMMARY: HWAddressSanitizer: SEGV /home/christophe.lyon/src/GCC/sources/g=
cc-fsf-git/trunk/libsanitizer/hwasan/hwasan_linux.cpp:339 in GetAccessInfo
  =3D=3D21146=3D=3DABORTING

  while the testcase expects HWAddressSanitizer: tag-mismatch on address
  0x.....

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1927530/+subscriptions

