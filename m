Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B9377710
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:47:36 +0200 (CEST)
Received: from localhost ([::1]:40760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfkiV-000309-EQ
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkgc-0002Dn-32
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:45:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:53544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkga-0005Ms-DJ
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:45:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfkgZ-0005pO-71
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:45:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1E3F22E8187
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:45:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 14:37:08 -0000
From: Thomas Huth <1901359@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cinaplenrek th-huth
X-Launchpad-Bug-Reporter: cinap_lenrek (cinaplenrek)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160358192028.26978.16757353407676731946.malonedeb@wampee.canonical.com>
Message-Id: <162057102864.9948.3396644056903566295.malone@chaenomeles.canonical.com>
Subject: [Bug 1901359] Re: ignore bit 0 in pci CONFIG_ADDRESS register write
 for Type 1 access
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 244bc909a2975ec6ee53f8633ef79402d027c24b
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
Reply-To: Bug 1901359 <1901359@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yeah, the bug tracker here on Launchpad is somewhat neglected ... Therefore:
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
https://bugs.launchpad.net/bugs/1901359

Title:
  ignore bit 0 in pci CONFIG_ADDRESS register write for Type 1 access

Status in QEMU:
  Incomplete

Bug description:
  I'v recently stumbled upon a bug in the Plan9 PCI config space access
  routines for config mode #1.

  The code used to set bit 0 in the CONFIG_ADDRESS register for a Type 1
  access.

  This was most likely a misreading of the PCI local bus specification
  on our side.

  However, in the PCI local bus specification 3.0, it states the
  following:

  > 3.2.2.3.2 Software Generation of Configuration Transactions
  > ...
  > For Type 1 translations, the host bridge directly copies the contents o=
f the
  > CONFIG_ADDRESS register (excluding bits 31 and 0) onto the PCI AD lines=
 during the
  > address phase of a configuration transaction making sure that AD[1::0] =
is "01".

  note the: "excluding bits 31 and 0"

  What happens in qemu instead is that it uses bit 0 of the CONFIG_ADDRESS
  register as part of the register offset (when it probably should ignore i=
t)
  when translating from Type 1 to Type 0 address. So once it reaches the de=
vice
  behind the bridge the register address is off by one.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1901359/+subscriptions

