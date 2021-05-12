Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA137BBB4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:22:50 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmwz-0008O2-CG
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgmvD-0006Fq-4e
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:21:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:34322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgmvA-0004g5-9D
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:20:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgmv6-0002tp-KD
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:20:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1818A2E813A
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:20:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 11:14:06 -0000
From: Thomas Huth <1911188@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: storage
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange phidica th-huth
X-Launchpad-Bug-Reporter: Violet (phidica)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161045460597.3279.18327990327654492890.malonedeb@chaenomeles.canonical.com>
Message-Id: <162081804636.7247.5432891598238471000.malone@wampee.canonical.com>
Subject: [Bug 1911188] Re: qemu-system-x86_64 prints obscure error message and
 exits when encountering an empty argument
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: e76d316a69ebfe8657e494c48254eb42a99a7c2e
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
Reply-To: Bug 1911188 <1911188@bugs.launchpad.net>
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


** Tags added: storage

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911188

Title:
  qemu-system-x86_64 prints obscure error message and exits when
  encountering an empty argument

Status in QEMU:
  Incomplete

Bug description:
  QEMU emulator version 4.2.1 (qemu-4.2.1-1.fc32) on Fedora 32.

  When writing a script to start qemu automatically, I ran into a very
  confusing error message due to a bug in my script and had trouble
  understanding it. I isolated the problem to the following:

  $ qemu-system-x86_64 ""
  qemu-system-x86_64: Initialization of device ide-hd failed: Device needs =
media, but drive is empty

  As you can see, running qemu with an empty argument prints a seemingly
  random and unrelated error message about an ide-hd device, and the
  program immediately exits with code 1. This happens when an empty
  argument appears anywhere in the arguments list, always causing the
  program to immediately die with this error.

  This is a simply baffling message to be encountering when the problem
  is really an empty argument.

  Expected behaviour: Either flatly ignore the empty argument, or at
  most trigger a warning (eg, "warning: saw empty argument"). It should
  not at all prevent the program from running.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1911188/+subscriptions

