Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9973797B0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:27:04 +0200 (CEST)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBYV-0007yP-C4
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgBJ0-00025U-Kq
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:11:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:43342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgBIs-000655-92
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:11:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgBIp-00028O-SX
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:10:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D61BE2E8136
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:10:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 19:02:01 -0000
From: Thomas Huth <1907061@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: keyboard lag laggy minimize slow window
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: evren320 th-huth
X-Launchpad-Bug-Reporter: Evren (evren320)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160733469549.5156.11028511366608269661.malonedeb@gac.canonical.com>
Message-Id: <162067332203.3111.3769042620373670846.malone@wampee.canonical.com>
Subject: [Bug 1907061] Re: qemu-system-x86_64 minimizing window causes
 keyboard input lag globally
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 52ec2d2f965d3cd2f6bdaf401af5144aaaf4167c
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
Reply-To: Bug 1907061 <1907061@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1907061

Title:
  qemu-system-x86_64 minimizing window causes keyboard input lag
  globally

Status in QEMU:
  Incomplete

Bug description:
  After qemu window is minimized, it causes keyboard lag on the host for al=
l applications, pressed keys will be delayed and very laggy, typing to note=
pad or any other text extremely slowly appear on the screen, queue is slowl=
y processed.
  If qemu window is open back to normal size, keyboard is back to normal, e=
verything is back to normal and stable, this behavior i have been testing s=
ince several months of qemu releases, i am reporting a bit late here, not b=
reaking but it seems important and everytime i accidently minimize qemu, i =
remember it later and take qemu window to normal size back always, i try ne=
ver minimize it anymore.
  This problem does not occur if using -display none
  Guest OS doesn't matter for this behavior, result is always same
  I am using:
  qemu 5.1.0.0
  qemu-system-x86_64w.exe
  Windows 10 build 2004
  4K screen dpi scaling set to 150%

  If requested, i can record a video to see the problem clearly, but i
  think all information i give already clear now.

  Thanks for making quality software, hope all bugs fixed

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907061/+subscriptions

