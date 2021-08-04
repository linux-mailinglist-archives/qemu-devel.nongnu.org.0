Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86343DFB9A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 08:52:00 +0200 (CEST)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBAky-00080L-12
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 02:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mBAjo-0006vO-4U
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 02:50:48 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:56052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mBAjk-0006pj-V0
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 02:50:47 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id A4F2D405B4
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 06:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1628059841;
 bh=NhU21io3LzZQ1mSl1ddO+O69j1pLVv74SXaJvAc+1T0=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=LSv5VySWCjEJwkE6NbSpW+FgX0SF6PAWPK+gDysL88tOcO8l4ABCUXQ6eOlmZdfvc
 tVQUE+ZLYJHXE0NfSOVRJDffphYJghoImmnMyC9mjuH9GyhKGPIEuhxWzd+l0qOElb
 5A9bcrvyC/PG3Udgb5o5h7muKIhHSxwjfO1a7w+Bp8BLwUZ+ydP7uSzj9DlwLuzEwV
 PTunwv6c+HY/OOSQEnYIx2UQMu07a6jX1N8Zq3gVgTr0GHRWRB2QJYPFzSqJYTRGZR
 2ei3TpSXDROZOOecoPdEcNwimMo2vCR4qP6Q6eJ1AgrYQeRnHcsMcVoxdZzb+XHtwO
 FfwIVEkxZVExQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 923EB2E8167
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 06:50:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Aug 2021 06:41:31 -0000
From: taos <1908626@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: taos (ggbq)
References: <160825871448.3957.12246357766912503656.malonedeb@wampee.canonical.com>
Message-Id: <162805929140.26867.15349747935633482525.malone@gac.canonical.com>
Subject: [Bug 1908626] Re: Atomic test-and-set instruction does not work on
 qemu-user
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8bd362bf86c4b35e805f897f03c203e3576a7006"; Instance="production"
X-Launchpad-Hash: d65a74ae74ef46c339b560176a2d21cd17205e53
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Thanks. Tested, the problem is gone.

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


