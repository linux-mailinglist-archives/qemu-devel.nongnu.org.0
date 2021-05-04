Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4589C37269A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:36:52 +0200 (CEST)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldpbu-0003NZ-Vo
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldpZr-000270-7i
 for qemu-devel@nongnu.org; Tue, 04 May 2021 03:34:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldpZp-0002Uy-Cx
 for qemu-devel@nongnu.org; Tue, 04 May 2021 03:34:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldpZn-0004MP-L3
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 07:34:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 906E92E8190
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 07:34:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 07:23:50 -0000
From: Thomas Huth <1585840@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jepler pmaydell th-huth
X-Launchpad-Bug-Reporter: jepler (jepler)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160526014921.26209.46866.malonedeb@chaenomeles.canonical.com>
Message-Id: <162011303022.10248.15780141301257043277.malone@gac.canonical.com>
Subject: [Bug 1585840] Re: multiprocess program gets incorrect results with
 qemu arm-linux-user
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 5d9e64bb5891ccece4830d9d810802329aee31e8
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
Reply-To: Bug 1585840 <1585840@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/121


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #121
   https://gitlab.com/qemu-project/qemu/-/issues/121

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1585840

Title:
  multiprocess program gets incorrect results with qemu arm-linux-user

Status in QEMU:
  Expired

Bug description:
  The attached program can run either in a threaded mode or a
  multiprocess mode.  It defaults to threaded mode, and switches to
  multiprocess mode if the first positional argument is "process".
  "success" of the test is defined as the final count being seen as
  2000000 by both tasks.

  In standard linux x86_64 userspace (i7, 4 cores) and in standard armhf
  userspace (4 cores), the test program consistently completes
  successfully in both modes.  But with qemu arm-linux-user, the test
  consistently succeeds in threaded mode and generally fails in
  multiprocess mode.

  The test reflects an essential aspect of how the Free and Open Source
  project linuxcnc's IPC system works: shared memory regions (created by
  shmat, but mmap would probably behave the same) contain data and
  mutexes.  I observed that our testsuite encounters numerous deadlocks
  and failures when running in an schroot with qemu-user (x86_64 host),
  and I believe the underlying cause is improper support for atomic
  operations in a multiprocess model. (the testsuite consistently passes
  on real hardware)

  I observed the same failure at v1.6.0 and master
  (v2.6.0-424-g287db79), as well as in the outdated Debian version
  1:2.1+dfsg-12+deb8u5a.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1585840/+subscriptions

