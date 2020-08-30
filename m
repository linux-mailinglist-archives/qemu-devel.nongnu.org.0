Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F0F256D1A
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 11:31:53 +0200 (CEST)
Received: from localhost ([::1]:41018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCJgm-0005G3-36
	for lists+qemu-devel@lfdr.de; Sun, 30 Aug 2020 05:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kCJfh-0004ju-Fd
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 05:30:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:44886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kCJff-0001ET-D9
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 05:30:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kCJfd-0006GJ-H9
 for <qemu-devel@nongnu.org>; Sun, 30 Aug 2020 09:30:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7EF0E2E80DB
 for <qemu-devel@nongnu.org>; Sun, 30 Aug 2020 09:30:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2020 09:24:26 -0000
From: Mike Gelfand <1893010@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier mike.dld
X-Launchpad-Bug-Reporter: Mike Gelfand (mike.dld)
X-Launchpad-Bug-Modifier: Mike Gelfand (mike.dld)
References: <159843096085.1469.8304847352897420087.malonedeb@wampee.canonical.com>
Message-Id: <159877946704.22385.13825359602214513995.malone@wampee.canonical.com>
Subject: [Bug 1893010] Re: qemu linux-user doesn't support OFD fcntl locks
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="195cbfa84cb75815472f69dd83d46f006869050b"; Instance="production"
X-Launchpad-Hash: db9b80e40757e4efdb0c7fc72bd83a602eb2bccb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/30 02:25:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1893010 <1893010@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks, the changes in 5.1.0 seem to work indeed.

> perhaps you can send a patch to the qemu-devel ML to add the strace
part

Done.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1893010

Title:
  qemu linux-user doesn't support OFD fcntl locks

Status in QEMU:
  New

Bug description:
  "Open file description locks (non-POSIX)", as they are described in
  fcntl(2) man page, aren't supported by qemu-user  and attempting to
  use those results in EINVAL. I'm on Gentoo with latest QEMU version
  currently available (5.0.0-r2), and trying to emulate ppc64 and s390x
  on x86_64.

  Looking at linux-user/syscall.c, I'm guessing the issue is in (at
  least) `target_to_host_fcntl_cmd` where switch reaches the default
  clause as there're no cases for F_OFD_SETLK / F_OFD_SETLKW /
  F_OFD_GETLK.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1893010/+subscriptions

