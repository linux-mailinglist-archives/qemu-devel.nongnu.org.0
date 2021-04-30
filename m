Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C684836F75C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:49:16 +0200 (CEST)
Received: from localhost ([::1]:44598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOpn-00084t-Uc
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOjo-0004kH-Ga
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:43:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:55796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOjj-0003oZ-Rt
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:43:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOji-0006DG-Kn
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:42:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 970F72E8168
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:42:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:29:31 -0000
From: Thomas Huth <1906693@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20201203164642.wfm3zyud4l23mlq7@mozz.bu.edu>
Message-Id: <161977137120.10956.972553454340871274.malone@gac.canonical.com>
Subject: [Bug 1906693] Re: Assertion Failure in bdrv_co_write_req_prepare
 through megasas
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 73a6cf9c4c324b60fdc97102f80f291be7ac823f
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
Reply-To: Bug 1906693 <1906693@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://gitlab.com/qemu-project/qemu/-/commit/86b1cf322789b79c8a

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906693

Title:
  Assertion Failure in bdrv_co_write_req_prepare through megasas

Status in QEMU:
  Fix Released

Bug description:
   affects qemu
   subscribe hare@suse.com
   subscribe philmd@redhat.com
   subscribe stefanha@redhat.com
   subscribe kwolf@redhat.com

  =3D=3D=3D Stack Trace =3D=3D=3D
  qemu-fuzz-i386: block/io.c:1835: int bdrv_co_write_req_prepare(BdrvChild =
*, int64_t, uint64_t, BdrvTrackedRequest *, int): Assertion `child->perm & =
BLK_PERM_WRITE' failed.
  =3D=3D1505128=3D=3D ERROR: libFuzzer: deadly signal
      #0 0x55a083b92cee in __sanitizer_print_stack_trace (qemu-fuzz-i386+0x=
793cee)
      #1 0x55a083b6c1d1 in fuzzer::PrintStackTrace() (qemu-fuzz-i386+0x76d1=
d1)
      #2 0x55a083b4f0d6 in fuzzer::Fuzzer::CrashCallback() (.part.0) (qemu-=
fuzz-i386+0x7500d6)
      #3 0x55a083b4f19b in fuzzer::Fuzzer::StaticCrashSignalCallback() (qem=
u-fuzz-i386+0x75019b)
      #4 0x7f8d24ed6a8f  (/lib64/libpthread.so.0+0x14a8f)
      #5 0x7f8d24d079e4 in raise (/lib64/libc.so.6+0x3c9e4)
      #6 0x7f8d24cf0894 in abort (/lib64/libc.so.6+0x25894)
      #7 0x7f8d24cf0768 in __assert_fail_base.cold (/lib64/libc.so.6+0x2576=
8)
      #8 0x7f8d24cffe75 in __assert_fail (/lib64/libc.so.6+0x34e75)
      #9 0x55a08423763f in bdrv_co_write_req_prepare block/io.c:1835:13
      #10 0x55a0842343a8 in bdrv_aligned_pwritev block/io.c:1915:11
      #11 0x55a084233765 in bdrv_co_pwritev_part block/io.c:2104:11
      #12 0x55a084260d1a in blk_do_pwritev_part block/block-backend.c:1260:=
11
      #13 0x55a08426163e in blk_aio_write_entry block/block-backend.c:1476:=
17
      #14 0x55a0843b0d23 in coroutine_trampoline util/coroutine-ucontext.c:=
173:9
      #15 0x7f8d24d1d22f  (/lib64/libc.so.6+0x5222f)

  =3D=3D=3D Reproducer=3D=3D=3D
  cat << EOF | ./qemu-system-i386 -M q35 \
  -device megasas-gen2 -device scsi-cd,drive=3Dnull0 \
  -blockdev driver=3Dnull-co,read-zeroes=3Don,node-name=3Dnull0 \
  -monitor none -serial none -display none \
  -machine accel=3Dqtest -m 64 -qtest stdio
  outl 0xcf8 0x80001804
  outl 0xcfc 0xffffff
  outl 0xcf8 0x8000181b
  outl 0xcfc 0x7052005
  write 0x5cc0 0x1 0x03
  write 0x5cc7 0x1 0x40
  write 0x5ce0 0x1 0x0a
  write 0x5cf3 0x1 0x01
  write 0x5cf7 0x1 0x40
  write 0x5cf8 0x1 0x0a
  write 0x5cff 0x1 0x05
  write 0x5d03 0x1 0x5b
  write 0x5d06 0x1 0x4f
  write 0x5d0b 0x1 0x01
  write 0x5d0f 0x1 0x40
  write 0x5d10 0x1 0x0a
  write 0x5d17 0x1 0x05
  write 0x5d1b 0x1 0x5b
  write 0x5d1e 0x1 0x4f
  write 0x5d23 0x1 0x01
  write 0x5d27 0x1 0x40
  write 0x5d28 0x1 0x0a
  write 0x5d2f 0x1 0x05
  write 0x5d33 0x1 0x5b
  write 0x5d36 0x1 0x4f
  write 0x5d3b 0x1 0x01
  write 0x5d3f 0x1 0x40
  write 0x5d40 0x1 0x0a
  write 0x5d47 0x1 0x05
  write 0x5d4b 0x1 0x5b
  write 0x5d4e 0x1 0x4f
  write 0x5d53 0x1 0x01
  write 0x5d57 0x1 0x40
  write 0x5d58 0x1 0x0a
  write 0x5d5f 0x1 0x05
  write 0x5d63 0x1 0x5b
  write 0x5d66 0x1 0x4f
  write 0x5d6b 0x1 0x01
  write 0x5d6f 0x1 0x40
  write 0x5d70 0x1 0x0a
  write 0x5d77 0x1 0x05
  write 0x5d7b 0x1 0x5b
  write 0x5d7e 0x1 0x4f
  write 0x5d83 0x1 0x01
  write 0x5d87 0x1 0x40
  write 0x5d88 0x1 0x0a
  write 0x5d8f 0x1 0x05
  write 0x5d93 0x1 0x5b
  write 0x5d96 0x1 0x4f
  write 0x5d9b 0x1 0x01
  write 0x5d9f 0x1 0x40
  write 0x5da0 0x1 0x0a
  write 0x5da7 0x1 0x05
  write 0x5dab 0x1 0x5b
  write 0x5dae 0x1 0x4f
  write 0x5db3 0x1 0x01
  write 0x5db7 0x1 0x40
  write 0x5db8 0x1 0x0a
  write 0x5dbf 0x1 0x05
  write 0x5dc3 0x1 0x5b
  write 0x5dc6 0x1 0x4f
  write 0x5dcb 0x1 0x01
  write 0x5dcf 0x1 0x40
  write 0x5dd0 0x1 0x0a
  write 0x5dd7 0x1 0x05
  write 0x5ddb 0x1 0x5b
  write 0x5dde 0x1 0x4f
  write 0x5de3 0x1 0x01
  write 0x5de7 0x1 0x40
  write 0x5de8 0x1 0x0a
  write 0x5def 0x1 0x05
  write 0x5df3 0x1 0x5b
  write 0x5df6 0x1 0x4f
  write 0x5dfb 0x1 0x01
  write 0x5dff 0x1 0x40
  write 0x5e00 0x1 0x0a
  write 0x5e07 0x1 0x05
  write 0x5e0b 0x1 0x5b
  write 0x5e0e 0x1 0x4f
  write 0x5e13 0x1 0x01
  write 0x5e17 0x1 0x40
  write 0x5e18 0x1 0x0a
  write 0x5e1f 0x1 0x05
  write 0x5e23 0x1 0x5b
  write 0x5e26 0x1 0x4f
  write 0x5e2b 0x1 0x01
  write 0x5e2f 0x1 0x40
  write 0x5e30 0x1 0x0a
  write 0x5e37 0x1 0x05
  write 0x5e3b 0x1 0x5b
  write 0x5e3e 0x1 0x4f
  write 0x5e43 0x1 0x01
  write 0x5e47 0x1 0x40
  write 0x5e48 0x1 0x0a
  write 0x5e4f 0x1 0x05
  write 0x5e53 0x1 0x5b
  write 0x5e56 0x1 0x4f
  write 0x5e5b 0x1 0x01
  write 0x5e5f 0x1 0x40
  write 0x5e60 0x1 0x0a
  write 0x5e67 0x1 0x05
  write 0x5e6b 0x1 0x5b
  write 0x5e6e 0x1 0x4f
  write 0x5e73 0x1 0x01
  write 0x5e77 0x1 0x40
  write 0x5e78 0x1 0x0a
  write 0x5e7f 0x1 0x05
  write 0x5e83 0x1 0x5b
  write 0x5e86 0x1 0x4f
  write 0x5e8b 0x1 0x01
  write 0x5e8f 0x1 0x40
  write 0x5e90 0x1 0x0a
  write 0x5e97 0x1 0x05
  write 0x5e9b 0x1 0x5b
  write 0x5e9e 0x1 0x4f
  write 0x5ea3 0x1 0x01
  write 0x5ea7 0x1 0x40
  write 0x5ea8 0x1 0x0a
  write 0x5eaf 0x1 0x05
  write 0x5eb3 0x1 0x5b
  write 0x5eb6 0x1 0x4f
  write 0x5ebb 0x1 0x01
  write 0x5ebf 0x1 0x40
  write 0x5ec0 0x1 0x0a
  write 0x5ec7 0x1 0x05
  write 0x5ecb 0x1 0x5b
  write 0x5ece 0x1 0x4f
  write 0x5ed3 0x1 0x01
  write 0x5ed7 0x1 0x40
  write 0x5ed8 0x1 0x0a
  write 0x5edf 0x1 0x05
  write 0x5ee3 0x1 0x5b
  write 0x5ee6 0x1 0x4f
  write 0x5eeb 0x1 0x01
  write 0x5eef 0x1 0x40
  writeq 0x50000000000003b 0x15cd405b60101c8
  EOF

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906693/+subscriptions

