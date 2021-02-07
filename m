Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9B731214F
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 05:27:14 +0100 (CET)
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8bfE-0002u4-Nb
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 23:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l8bdu-0002M1-0Y
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 23:25:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:59248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l8bdq-0008Vm-NG
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 23:25:49 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l8bdn-0002Ar-KO
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 04:25:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 80DC52E80E1
 for <qemu-devel@nongnu.org>; Sun,  7 Feb 2021 04:25:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Feb 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1905979@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange janitor oseibert-sys11
X-Launchpad-Bug-Reporter: Olaf Seibert (oseibert-sys11)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160648885405.8173.13759191424779303608.malonedeb@soybean.canonical.com>
Message-Id: <161267144121.32486.6884059180343617140.malone@loganberry.canonical.com>
Subject: [Bug 1905979] Re: Check if F_OFD_SETLK is supported may give wrong
 result
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 0296dfcf07fdaebad7e0d22dd96dab204a12b570
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
Reply-To: Bug 1905979 <1905979@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905979

Title:
  Check if F_OFD_SETLK is supported may give wrong result

Status in QEMU:
  Expired

Bug description:
  In util/osdep.c there is a function qemu_probe_lock_ops() to check if
  file locks F_OFD_SETLK and F_OFD_GETLK (of the style "Open file
  description locks (non-POSIX)") are supported.

  This test is done by trying a lock operation on the file /dev/null.

  This test can get a wrong result.

  The result is (probably) if the operating system *in general* supports
  these locks. However, it does not guarantee that the file system where
  the lock is really wanted (for instance, in caller
  raw_check_lock_bytes() in block/file-posix.c) does support these
  locks.

  (In theory it could even be that /dev/null, being a device special
  file, does not support the lock type while a plain file would.)

  This is in particular relevant for disk images which are stored on a
  shared file system (my particular use case is the Quobyte file system,
  which appears not to support these locks).

  The code as mentioned above is present in the master branch (I checked
  commit ea8208249d1082eae0444934efb3b59cd3183f05) but also for example
  on stable-2.11 commit 0982a56a551556c704dc15752dabf57b4be1c640)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905979/+subscriptions

