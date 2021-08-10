Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BA3D924E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 17:47:29 +0200 (CEST)
Received: from localhost ([::1]:32956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8lmJ-0007QI-S4
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 11:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1m8lks-0006d5-FH
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:45:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:54608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1m8lkp-0002z4-Vm
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:45:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m8lkk-0002py-FZ
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 15:45:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0E2972E8189
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 15:45:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Jul 2021 15:38:49 -0000
From: Thomas Huth <1908626@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ggbq janitor th-huth
X-Launchpad-Bug-Reporter: taos (ggbq)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160825871448.3957.12246357766912503656.malonedeb@wampee.canonical.com>
Message-Id: <162748673002.16029.8636069374361903532.malone@gac.canonical.com>
Subject: [Bug 1908626] Re: Atomic test-and-set instruction does not work on
 qemu-user
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="228e757cb3b375380f0eca5a56429016b9e11790"; Instance="production"
X-Launchpad-Hash: 4c37e7ff4ceb4a79811c0ad7f06b41c37d561303
Received-SPF: none client-ip=91.189.90.7; envelope-from=noreply@launchpad.net;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1908626 <1908626@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/509


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #509
   https://gitlab.com/qemu-project/qemu/-/issues/509

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908626

Title:
  Atomic test-and-set instruction does not work on qemu-user

Status in QEMU:
  Expired

Bug description:
  I try to compile and run PostgreSQL/Greenplum database inside docker cont=
ainer/qemu-aarch64-static:
  ```
   host: CentOS7 x86_64
   container: centos:centos7.9.2009 --platform linux/arm64/v8
   qemu-user-static: https://github.com/multiarch/qemu-user-static/releases/
  ```

  However, GP/PG's spinlock always gets stuck and reports PANIC errors. It =
seems its spinlock
  has something wrong.
  ```
  https://github.com/greenplum-db/gpdb/blob/master/src/include/storage/s_lo=
ck.h
  https://github.com/greenplum-db/gpdb/blob/master/src/backend/storage/lmgr=
/s_lock.c
  ```

  So I extract its spinlock implementation into one test C source file (see=
 attachment file),
  and get reprodcued:

  ```
  $ gcc spinlock_qemu.c
  $ ./a.out=20
  C -- slock inited, lock value is: 0
  parent 139642, child 139645
  P -- slock lock before, lock value is: 0
  P -- slock locked, lock value is: 1
  P -- slock unlock after, lock value is: 0
  C -- slock lock before, lock value is: 1
  P -- slock lock before, lock value is: 1
  C -- slock locked, lock value is: 1
  C -- slock unlock after, lock value is: 0
  C -- slock lock before, lock value is: 1
  P -- slock locked, lock value is: 1
  P -- slock unlock after, lock value is: 0
  P -- slock lock before, lock value is: 1
  C -- slock locked, lock value is: 1
  C -- slock unlock after, lock value is: 0
  P -- slock locked, lock value is: 1
  C -- slock lock before, lock value is: 1
  P -- slock unlock after, lock value is: 0
  C -- slock locked, lock value is: 1
  P -- slock lock before, lock value is: 1
  C -- slock unlock after, lock value is: 0
  P -- slock locked, lock value is: 1
  C -- slock lock before, lock value is: 1
  P -- slock unlock after, lock value is: 0
  C -- slock locked, lock value is: 1
  P -- slock lock before, lock value is: 1
  C -- slock unlock after, lock value is: 0
  P -- slock locked, lock value is: 1
  C -- slock lock before, lock value is: 1
  P -- slock unlock after, lock value is: 0
  P -- slock lock before, lock value is: 1
  spin timeout, lock value is 1 (pid 139642)
  spin timeout, lock value is 1 (pid 139645)
  spin timeout, lock value is 1 (pid 139645)
  spin timeout, lock value is 1 (pid 139642)
  spin timeout, lock value is 1 (pid 139645)
  spin timeout, lock value is 1 (pid 139642)
  ...
  ...
  ...
  ```

  NOTE: this code always works on PHYSICAL ARM64 server.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908626/+subscriptions


