Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790692D579C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:55:24 +0100 (CET)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIfT-0002jj-Gj
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knIIO-0006aX-E0
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:31:32 -0500
Received: from indium.canonical.com ([91.189.90.7]:38362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knIIM-00027h-Jh
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:31:32 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knIIB-0000Wm-6T
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:31:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2F7CE2E813D
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:31:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:16:59 -0000
From: Thomas Huth <1762179@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arnab35 cirosantilli th-huth
X-Launchpad-Bug-Reporter: =?utf-8?b?Q2lybyBTYW50aWxsaSDlha3lm5vkuovku7Yg?=
 =?utf-8?b?5rOV6L2u5YqfIChjaXJvc2FudGlsbGkp?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152319497960.30219.9338727401860906105.malonedeb@gac.canonical.com>
Message-Id: <160759182003.10239.13363746230139302535.malone@wampee.canonical.com>
Subject: [Bug 1762179] Re: Record and replay replay fails with:
 "ERROR:replay/replay-time.c:49:replay_read_clock: assertion failed"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: b562d5f7873bc3c6ef97e025e22702de002540c2
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
Reply-To: Bug 1762179 <1762179@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Released with QEMU v5.2.0.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1762179

Title:
  Record and replay replay fails with: "ERROR:replay/replay-
  time.c:49:replay_read_clock: assertion failed"

Status in QEMU:
  Fix Released

Bug description:
  QEMU master at 915d34c5f99b0ab91517c69f54272bfdb6ca2b32 Ubuntu 17.10
  host.

  QEMU commands:

  ```
  #!/usr/bin/env bash
  cmd=3D"\
  time \
  ./x86_64-softmmu/qemu-system-x86_64 \
  -append 'root=3D/dev/sda console=3DttyS0 nokaslr printk.time=3Dy - lkmc_e=
val=3D\"/rand_check.out;/sbin/ifup -a;wget -S google.com;/poweroff.out;\"' \
  -kernel 'out/x86_64/buildroot/images/bzImage' \
  -nographic \
  \
  -drive file=3Dout/x86_64/buildroot/images/rootfs.ext2.qcow2,if=3Dnone,id=
=3Dimg-direct,format=3Dqcow2 \
  -drive driver=3Dblkreplay,if=3Dnone,image=3Dimg-direct,id=3Dimg-blkreplay=
 \
  -device ide-hd,drive=3Dimg-blkreplay \
  \
  -netdev user,id=3Dnet1 \
  -device rtl8139,netdev=3Dnet1 \
  -object filter-replay,id=3Dreplay,netdev=3Dnet1 \
  "
  echo "$cmd"
  eval "$cmd -icount 'shift=3D7,rr=3Drecord,rrfile=3Dreplay.bin'"
  eval "$cmd -icount 'shift=3D7,rr=3Dreplay,rrfile=3Dreplay.bin'"
  ```

  This tries to stay as close as possible to the documented commands:
  https://github.com/qemu/qemu/blob/08e173f29461396575c85510eb41474b993cb1f=
b/docs/replay.txt#L28

  Images uploaded to: https://github.com/cirosantilli/linux-kernel-
  module-cheat/releases/download/test-replay-arm/images4.zip

  Images generated with: https://github.com/cirosantilli/linux-kernel-
  module-cheat/tree/9513c162ef57e6cb70006dfe870856f94ee9a133

  The replay failed straight out with:

  ```
  ERROR:replay/replay-time.c:49:replay_read_clock: assertion failed: (repla=
y_file && replay_mutex_locked())
  ```

  QEMU configure:

  ```
  ./configure --enable-debug --enable-trace-backends=3Dsimple --target-list=
=3Dx86_64-softmmu
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1762179/+subscriptions

