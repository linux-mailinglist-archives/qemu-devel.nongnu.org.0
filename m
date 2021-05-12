Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9607737BBE1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:34:58 +0200 (CEST)
Received: from localhost ([::1]:37802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgn8j-0008BF-MB
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgn4l-0002aE-AB
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:30:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:36950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgn4h-0002gm-Je
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:30:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgn4g-0004yt-7S
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:30:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2780A2E8187
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:30:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 11:23:31 -0000
From: Thomas Huth <1908781@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bmerry th-huth
X-Launchpad-Bug-Reporter: Bruce Merry (bmerry)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160838096979.13338.4117053689039136240.malonedeb@chaenomeles.canonical.com>
Message-Id: <162081861177.23763.6236896098584647635.malone@soybean.canonical.com>
Subject: [Bug 1908781] Re: x86-64 not faulting when CS.L = 1 and CS.D = 1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: 7391b96ee1a6ade71c31d0029e2051e43aaf83e0
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
Reply-To: Bug 1908781 <1908781@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

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


** Tags added: tcg

** Tags added: i386

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908781

Title:
  x86-64 not faulting when CS.L =3D 1 and CS.D =3D 1

Status in QEMU:
  Incomplete

Bug description:
  In a UEFI application I accidentally created a code segment descriptor
  where both the L and D bits were 1. This is supposed to generate a GP
  fault (e.g. see page 2942 of
  https://software.intel.com/sites/default/files/managed/39/c5/325462
  -sdm-vol-1-2abcd-3abcd.pdf). When running with KVM a fault did indeed
  occur, but when not specifying any acceleration, no fault occurred.

  Let me know if you need me to develop a minimum example to debug from.
  At the moment it's all part of a slightly more complicated bit of
  code.

  Version: 5.2.0 (compiled from source)
  Command line options: -smp cores=3D4 -m 8192 (plus whatever uefi-run adds=
 to plug in OVMF and my UEFI application).
  Environment: Ubuntu 20.04 on Ryzen 3700X

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908781/+subscriptions

