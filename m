Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB93880EC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:07:36 +0200 (CEST)
Received: from localhost ([::1]:47736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj606-0003yN-Vw
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lj5yR-0002sT-DL
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:05:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:58982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lj5yH-0001iS-0F
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:05:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lj5yC-0005Vw-A2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 20:05:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 276572E8187
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 20:05:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 May 2021 19:58:24 -0000
From: John Snow <1915535@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided;
 assignee=jsnow@redhat.com; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr jnsnow
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <161314927522.23883.18383669904436932925.malonedeb@chaenomeles.canonical.com>
Message-Id: <162136790469.20528.16664052789385284959.malone@soybean.canonical.com>
Subject: [Bug 1915535] Re: Assertion `child->perm & BLK_PERM_WRITE' failed in
 bdrv_co_write_req_prepare through atapi
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 685fb0adaddb3709b0cc786d0d63b648b1b57979
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
Reply-To: Bug 1915535 <1915535@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not a duplicate of the other bug. Confirmed on development head beyond
6.0.

Please migrate this bug to gitlab and assign me.

--js

** Changed in: qemu
     Assignee: (unassigned) =3D> John Snow (jnsnow)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915535

Title:
  Assertion `child->perm & BLK_PERM_WRITE' failed in
  bdrv_co_write_req_prepare through atapi

Status in QEMU:
  New

Bug description:
  Maybe this is a duplicate of https://bugs.launchpad.net/qemu/+bug/1906693=
 ... =

  In any case, ATAPI is probably a lot more common than megasas, so this mi=
ght be a more useful  reproducer

  =3D=3DReproducer=3D=3D

  cat << EOF | ./qemu-system-i386 -display none \
  -m 512M -machine q35 -nodefaults \
  -drive file=3Dnull-co://,if=3Dnone,format=3Draw,id=3Ddisk0 \
  -device ide-cd,drive=3Ddisk0 -machine accel=3Dqtest -qtest stdio
  outl 0xcf8 0x8000fa24
  outl 0xcfc 0xe0000000
  outl 0xcf8 0x8000fa04
  outw 0xcfc 0x06
  write 0xe0000398 0x1 0x01
  write 0x63 0x1 0x06
  write 0x68 0x1 0x06
  write 0x69 0x1 0xf8
  write 0x6a 0x1 0xff
  write 0xfff806 0x1 0x27
  write 0xfff807 0x1 0x80
  write 0xfff808 0x1 0x61
  write 0x1005734 0x1 0x3f
  write 0x1005774 0x1 0x20
  write 0x1005784 0x1 0x34
  write 0x10057a4 0x1 0x27
  write 0x10057b4 0x1 0x3f
  write 0x10057c3 0x1 0xce
  write 0x10057d4 0x1 0x1a
  write 0x10057e3 0x1 0xff
  write 0x10057e4 0x1 0x3f
  write 0x10057f4 0x1 0x38
  write 0x1005814 0x1 0x3e
  write 0x1005823 0x1 0x60
  write 0x1005824 0x1 0x2d
  write 0x1005833 0x1 0x74
  write 0x1005834 0x1 0x01
  write 0x1005863 0x1 0xff
  write 0x1005883 0x1 0x5a
  write 0x1005884 0x1 0x06
  write 0xe00003b8 0x1 0x08
  EOF

  =

  =3D=3DStack Trace=3D=3D
  i386: ahci: PRDT length for NCQ command (0x0) is smaller than the request=
ed size (0x5a00)
  qemu-fuzz-i386-target-generic-fuzz-ahci-atapi: ../block/io.c:1982: int
  bdrv_co_write_req_prepare(BdrvChild *, int64_t, int64_t, BdrvTrackedReque=
st
  *, int): Assertion `child->perm & BLK_PERM_WRITE' failed.
  =3D=3D279048=3D=3D ERROR: libFuzzer: deadly signal
  #0 0x560c92718f50 in __sanitizer_print_stack_trace /src/llvm-project/comp=
iler-rt/lib/ubsan/ubsan_diag_standalone.cpp:33:3
  #1 0x560c926c2f98 in fuzzer::PrintStackTrace() /src/llvm-project/compiler=
-rt/lib/fuzzer/FuzzerUtil.cpp:210:5
  #2 0x560c926a7fd3 in fuzzer::Fuzzer::CrashCallback() /src/llvm-project/co=
mpiler-rt/lib/fuzzer/FuzzerLoop.cpp:233:3
  #3 0x7ff7d707038f in libpthread.so.0
  #4 0x7ff7d66a8437 in raise
  #5 0x7ff7d66aa039 in abort
  #6 0x7ff7d66a0be6 in libc.so.6
  #7 0x7ff7d66a0c91 in __assert_fail
  #8 0x560c92f4fc79 in bdrv_co_write_req_prepare /src/qemu/block/io.c:1982:=
13
  #9 0x560c92f4c974 in bdrv_aligned_pwritev /src/qemu/block/io.c:2065:11
  #10 0x560c92f4b937 in bdrv_co_pwritev_part /src/qemu/block/io.c:2270:11
  #11 0x560c92f392e7 in blk_do_pwritev_part /src/qemu/block/block-backend.c=
:1260:11
  #12 0x560c92f39a55 in blk_aio_write_entry /src/qemu/block/block-backend.c=
:1476:17
  #13 0x560c930d19d5 in coroutine_trampoline /src/qemu/util/coroutine-ucont=
ext.c:173:9
  #14 0x7ff7d66bd5df in libc.so.6

  OSS-Fuzz link: https://bugs.chromium.org/p/oss-
  fuzz/issues/detail?id=3D30857

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915535/+subscriptions

