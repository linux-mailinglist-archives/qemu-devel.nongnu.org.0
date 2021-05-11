Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE3D37A6F6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:42:21 +0200 (CEST)
Received: from localhost ([::1]:58390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgRiM-0008LB-WE
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgRhM-0007SH-Ry
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:41:16 -0400
Received: from indium.canonical.com ([91.189.90.7]:49096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgRhI-0004ih-TR
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:41:16 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgRhE-0007O8-C9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 12:41:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C816C2E81D1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 12:41:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 12:33:46 -0000
From: Thomas Huth <1902306@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kiler129 th-huth
X-Launchpad-Bug-Reporter: Greg Zdanowski (kiler129)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160408741769.30267.7403254595393961918.malonedeb@gac.canonical.com>
Message-Id: <162073642702.31132.2438370708418875510.malone@gac.canonical.com>
Subject: [Bug 1902306] Re: Allow setting usb storage device ID parameters
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: 728c7ca9dec409e3ed795eeb06904e7f20e48201
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1902306 <1902306@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1902306

Title:
  Allow setting usb storage device ID parameters

Status in QEMU:
  Incomplete

Bug description:
  Some stubborn software requires certain VID/PID/Serial to authenticate
  and refuses to start in emulation. This poses a problem with
  unsupported programs which often require keeping an ancient hardware
  praying that the USB stick will not die before the (often defunct)
  company making it.

  Virtualizing such environment is desired. However, QEMU doesn't allow
  setting VID/PID/Serial/Name of emulated USB devices, but instead uses
  hardcoded values:
  https://github.com/qemu/qemu/blob/c99fa56b95a72f6debd50a280561895d078ae02=
0/hw/usb
  /dev-storage.c#L95

  This request (including a patch) was already made in 2015 on the list
  but never got any response: https://lists.nongnu.org/archive/html
  /qemu-discuss/2015-07/msg00072.html

  =

  WDYT of adding such functionality?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1902306/+subscriptions

