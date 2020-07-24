Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F57522C8E5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 17:21:39 +0200 (CEST)
Received: from localhost ([::1]:51788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyzVy-0005a3-71
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 11:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jyzV7-0004tX-Ja
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 11:20:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:35272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jyzV5-00055K-B6
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 11:20:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jyzV3-0003s9-8p
 for <qemu-devel@nongnu.org>; Fri, 24 Jul 2020 15:20:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 233352E80EE
 for <qemu-devel@nongnu.org>; Fri, 24 Jul 2020 15:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2020 15:12:06 -0000
From: John Paul Adrian Glaubitz <1888728@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee glaubitz
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: John Paul Adrian Glaubitz (glaubitz)
References: <159553702814.22838.6923926594516590974.malonedeb@soybean.canonical.com>
Message-Id: <159560352671.31936.16489240918933409979.malone@chaenomeles.canonical.com>
Subject: [Bug 1888728] Re: Bare chroot in linux-user fails with
 pgb_reserved_va: Assertion `guest_base != 0' failed.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e85d0ab92e2924d39b8285aeae075a01d25eff06";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 818cdc07431132b6ce60f20ccd549e44b6be01c1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 10:50:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1888728 <1888728@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here you go: https://people.debian.org/~glaubitz/sid-m68k-sbuild.tgz

Thanks for looking into it!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888728

Title:
  Bare chroot in linux-user fails with pgb_reserved_va: Assertion
  `guest_base !=3D 0' failed.

Status in QEMU:
  New

Bug description:
  Trying to run a bare chroot with no additional bind mounts fails on
  git master (8ffa52c20d5693d454f65f2024a1494edfea65d4) with:

  root@nofan:~/qemu> chroot /local_scratch/sid-m68k-sbuild/
  qemu-m68k-static: /root/qemu/linux-user/elfload.c:2315: pgb_reserved_va: =
Assertion `guest_base !=3D 0' failed.
  Aborted
  root@nofan:~/qemu>

  The problem can be worked around by bind-mounting /proc from the host
  system into the target chroot:

  root@nofan:~/qemu> mount -o bind /proc/ /local_scratch/sid-m68k-sbuild/pr=
oc/
  root@nofan:~/qemu> chroot /local_scratch/sid-m68k-sbuild/
  bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
  (sid-m68k-sbuild)root@nofan:/#

  Host system is an up-to-date Debian unstable (2020-07-23).

  I have not been able to bisect the issue yet since there is another
  annoying linux-user bug (virtual memory exhaustion) that was somewhere
  introduced and fixed between v5.0.0 and HEAD and overshadows the
  original Assertion failure bug.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888728/+subscriptions

