Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6330D3BF4B7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:27:10 +0200 (CEST)
Received: from localhost ([::1]:38782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Lcy-0007C4-Ro
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1Lbb-0004dn-Ru
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:25:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:57324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1LbZ-0003Ea-Cq
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:25:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1LbX-0000Tv-Bd
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 04:25:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 519C82E8085
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 04:25:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Jul 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1895122@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor luoyonggang th-huth
X-Launchpad-Bug-Reporter: Yonggang Luo (luoyonggang)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159973447247.11849.9583651644725576217.malonedeb@chaenomeles.canonical.com>
Message-Id: <162571784291.7916.3249812642908334096.malone@loganberry.canonical.com>
Subject: [Bug 1895122] Re: qemu on wsl tests failed, this configured with debug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 766cd8a385112ca8b2b9778cfae4c82dc1e37c54
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
Reply-To: Bug 1895122 <1895122@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895122

Title:
  qemu on wsl tests failed, this configured with debug

Status in QEMU:
  Expired

Bug description:
  =

  ../configure --enable-debug-info --enable-debug

  **
  ERROR:../tests/test-util-filemonitor.c:704:test_file_monitor_events: asse=
rtion failed: (err =3D=3D 0)
  Aborted (core dumped)

  =

    TEST    iotest-qcow2: 271 [fail]
  QEMU          -- "/home/lygstate/work/qemu/build/tests/qemu-iotests/../..=
/qemu-system-x86_64" -nodefaults -display none -accel qtest
  QEMU_IMG      -- "/home/lygstate/work/qemu/build/tests/qemu-iotests/../..=
/qemu-img" =

  QEMU_IO       -- "/home/lygstate/work/qemu/build/tests/qemu-iotests/../..=
/qemu-io"  --cache writeback --aio threads -f qcow2
  QEMU_NBD      -- "/home/lygstate/work/qemu/build/tests/qemu-iotests/../..=
/qemu-nbd" =

  IMGFMT        -- qcow2 (compat=3D1.1)
  IMGPROTO      -- file
  PLATFORM      -- Linux/x86_64 DESKTOP-BLLJ03T 4.4.0-19041-Microsoft
  TEST_DIR      -- /home/lygstate/work/qemu/build/tests/qemu-iotests/scratch
  SOCK_DIR      -- /tmp/tmp.eyVcw8nLNQ
  SOCKET_SCM_HELPER -- /home/lygstate/work/qemu/build/tests/qemu-iotests/so=
cket_scm_helper

  --- /home/lygstate/work/qemu/tests/qemu-iotests/271.out	2020-09-10 15:00:=
58.190763400 +0800
  +++ /home/lygstate/work/qemu/build/tests/qemu-iotests/271.out.bad	2020-09=
-10 18:38:25.625090800 +0800
  @@ -37,6 +37,7 @@
   write -q -P PATTERN 0 64k
   L2 entry #0: 0x8000000000050000 00000000ffffffff
   discard -q 0 64k
  +Content mismatch at offset 0!
   L2 entry #0: 0x0000000000000000 ffffffff00000000
   write -q -c -P PATTERN 0 64k
   L2 entry #0: 0x4000000000050000 0000000000000000
  @@ -79,6 +80,7 @@
   write -q -P PATTERN 0 64k
   L2 entry #0: 0x8000000000050000 00000000ffffffff
   discard -q 0 64k
  +Content mismatch at offset 0!
   L2 entry #0: 0x0000000000000000 ffffffff00000000
   write -q -c -P PATTERN 0 64k
   L2 entry #0: 0x4000000000050000 0000000000000000
    TEST    iotest-qcow2: 283
    TEST    iotest-qcow2: 287
    TEST    iotest-qcow2: 290
    TEST    iotest-qcow2: 292
    TEST    iotest-qcow2: 299
  Not run: 060 181 220 259
  Failures: 271
  Failed 1 of 118 iotests
  make: [/home/lygstate/work/qemu/tests/Makefile.include:144: check-block] =
Error 1 (ignored)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895122/+subscriptions

