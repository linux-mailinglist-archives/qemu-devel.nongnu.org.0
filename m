Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C276381947
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 16:14:27 +0200 (CEST)
Received: from localhost ([::1]:51406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhv3i-0006iq-KS
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 10:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhv0P-0001Sn-Aq
 for qemu-devel@nongnu.org; Sat, 15 May 2021 10:11:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:42752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhv0I-0001RC-FW
 for qemu-devel@nongnu.org; Sat, 15 May 2021 10:11:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhv0F-0002aL-VQ
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 14:10:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DDF2E2E813A
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 14:10:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 14:05:42 -0000
From: Thomas Huth <1922625@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth z-launchpad-d
X-Launchpad-Bug-Reporter: Ryan Schmidt (z-launchpad-d)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161767663708.22881.10337193368132621406.malonedeb@chaenomeles.canonical.com>
Message-Id: <162108754294.21398.2561492563688291950.malone@soybean.canonical.com>
Subject: [Bug 1922625] Re: qemu 5.2.0 configure script explodes when in read
 only directory
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: c0f2989191ab68166f0ce578339e7cbd6b7681cf
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
Reply-To: Bug 1922625 <1922625@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/321


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #321
   https://gitlab.com/qemu-project/qemu/-/issues/321

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922625

Title:
  qemu 5.2.0 configure script explodes when in read only directory

Status in QEMU:
  Expired

Bug description:
  I extracted the qemu 5.2.0 source as one user, and then tried to run
  `./configure --help` in that directory as a different user. Normal
  autoconf configure scripts have no problem with this but yours goes
  into an infinite loop printing nonsense:

  Using './build' as the directory for build output
  mkdir: build: Permission denied
  touch: build/auto-created-by-configure: No such file or directory
  ./configure: line 37: GNUmakefile: Permission denied
  ./configure: line 59: cd: build: No such file or directory
  Using './build' as the directory for build output
  mkdir: build: Permission denied
  touch: build/auto-created-by-configure: No such file or directory
  /path/to/qemu-5.2.0/configure: line 37: GNUmakefile: Permission denied
  /path/to/qemu-5.2.0/configure: line 59: cd: build: No such file or direct=
ory
  Using './build' as the directory for build output
  mkdir: build: Permission denied
  touch: build/auto-created-by-configure: No such file or directory
  /path/to/qemu-5.2.0/configure: line 37: GNUmakefile: Permission denied
  /path/to/qemu-5.2.0/configure: line 59: cd: build: No such file or direct=
ory
  Using './build' as the directory for build output
  mkdir: build: Permission denied
  touch: build/auto-created-by-configure: No such file or directory
  /path/to/qemu-5.2.0/configure: line 37: GNUmakefile: Permission denied
  /path/to/qemu-5.2.0/configure: line 59: cd: build: No such file or direct=
ory
  Using './build' as the directory for build output
  mkdir: build: Permission denied
  touch: build/auto-created-by-configure: No such file or directory
  /path/to/qemu-5.2.0/configure: line 37: GNUmakefile: Permission denied
  /path/to/qemu-5.2.0/configure: line 59: cd: build: No such file or direct=
ory
  Using './build' as the directory for build output
  mkdir: build: Permission denied

  etc.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922625/+subscriptions

