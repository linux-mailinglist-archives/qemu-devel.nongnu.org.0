Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85911377707
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:37:45 +0200 (CEST)
Received: from localhost ([::1]:44938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfkYy-0003JJ-Iq
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkWt-0001FU-2g
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:35:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:53174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkWq-0007TK-3D
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:35:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfkWo-0005Pb-Ql
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:35:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C956F2E800F
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:35:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 14:28:37 -0000
From: Thomas Huth <1898954@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 0qivronovrpmqmcl th-huth
X-Launchpad-Bug-Reporter: pat leese (0qivronovrpmqmcl)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160211647401.12043.14789296539766807523.malonedeb@gac.canonical.com>
Message-Id: <162057051712.16081.7876019943158371696.malone@soybean.canonical.com>
Subject: [Bug 1898954] Re: x86 f1 opcode hangs qemu
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: b3442e0aa428b14361f8f8946c8ebcd18c8b2879
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
Reply-To: Bug 1898954 <1898954@bugs.launchpad.net>
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


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1898954

Title:
  x86 f1 opcode hangs qemu

Status in QEMU:
  Incomplete

Bug description:
  I have qemu installed and running in linux and windows
  in linux i execute the following simple code in real mode of cpu in my vm
  90 nop
  90 nop
  90 nop
  f1         ;this should conjure up my interrupt handler from ivt int 1
  --------- end of code ----
  it works properly in vbox,qemu linux,and even in my boot loder
  on a real platform
     it doeas not work fine in windows 10 (32 bit efi) based qemu
  ---
  all of the below was retyped there may be typo
  so onwards to the flawed software =

  ********** for qemu-system-x86_64.exe **********
  info version =

  4.2.0v4.2.0.11797-g2890edc853-dirty
  ********** for qemu-system-i386.exe **********
  info version =

  4.2.0v4.2.0.11797-g2890edc853-dirty
  ***********************************************
  my startup code is
  "d:\programs\qemu\qemu-system-x86_64.exe" -m 16M -boot a -fda "d:\floppy.=
img" -cpu Nehalem -machine pc
  ---
  also same flaw if i change above section to
  "d:\programs\qemu\qemu-system-i386.exe"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1898954/+subscriptions

