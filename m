Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845BD381F4B
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 16:37:50 +0200 (CEST)
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liHtt-0000ni-Kg
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 10:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liHrh-00071a-2l
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:35:33 -0400
Received: from indium.canonical.com ([91.189.90.7]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liHre-0006I9-S6
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:35:32 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1liHrc-0002Nm-Hu
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 14:35:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 804502E8139
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 14:35:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 May 2021 14:27:23 -0000
From: Thomas Huth <1926996@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee paleozogt th-huth
X-Launchpad-Bug-Reporter: Aaron Simmons (paleozogt)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <162006855194.4732.10860890446320255541.malonedeb@chaenomeles.canonical.com>
Message-Id: <162117524388.1386.5524731862082875170.malone@wampee.canonical.com>
Subject: [Bug 1926996] Re: qemu-user clone syscall fails
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: c396e45ee5b978eaefa5efae9d3815bc4449d2fd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1926996 <1926996@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know how to transfer the bug to the new system if
(if still necessary). For this we're setting the status to "Incomplete"
now.

In the unlikely case that the bug has already been fixed in the latest
upstream version of QEMU, then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here should be
moved to the new system, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926996

Title:
  qemu-user clone syscall fails

Status in QEMU:
  Incomplete

Bug description:
  qemu-user fails to emulate clone()
  (https://linux.die.net/man/2/clone).  The architecture doesn't seem to
  matter, tho I've mostly been testing aarch64.

  Attached is clone_test.c that demonstrates the problem.  Running it nativ=
ely looks like this:
  $ bin/x86_64/clone_test
  The variable was 9
  clone returned 4177: 0 Success
  The variable is now 42

  However, running it via qemu looks like:
  $ qemu-aarch64-static --version
  qemu-aarch64 version 5.2.0 (v5.2.0)
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

  $ qemu-aarch64-static bin/aarch64/clone_test
  The variable was 9
  clone returned -1: 22 Invalid argument
  The variable is now 9

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926996/+subscriptions

