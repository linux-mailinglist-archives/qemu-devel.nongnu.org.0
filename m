Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B4F376FE8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 07:58:58 +0200 (CEST)
Received: from localhost ([::1]:50704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfFzN-0000gd-C8
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 01:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfFwE-0004zr-Ke
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:55:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:52766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfFwB-0006Yo-Az
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:55:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfFw9-0005Vy-Sl
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 05:55:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D62E52E80F3
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 05:55:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 05:49:37 -0000
From: Thomas Huth <1890775@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jacoka th-huth
X-Launchpad-Bug-Reporter: Laci (jacoka)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159677829829.10348.2497937987968118298.malonedeb@chaenomeles.canonical.com>
Message-Id: <162045297797.7395.4984090166629759132.malone@gac.canonical.com>
Subject: [Bug 1890775] Re: Aten USB to Serial bridge does not work with qemu
 under Windows 10
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: dddb1fdcd780120ccd94743a97d8c054a5286952
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1890775 <1890775@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1890775

Title:
  Aten USB to Serial bridge does not work with qemu under Windows 10

Status in QEMU:
  Incomplete

Bug description:
  I would like to use MSDOS 6.22 with qemu (unfortunatelly lot of our test =
programs has been written in dos).
  I tried to connect two laptop by RS232 port, one of the machine have a bu=
ilt-in serial port and run with native MSDOS 6.22 with 4.0 norton commander=
. Another machine have only USB ports and i try to use a new Aten USB to Se=
rial device. Ok. Has been started qemu with -serial and -chardev parameters=
, at startup appear a window with serial port setting such as baud rate, st=
art bit, etc...

  Quemu has been satrted succeeded but serial port cannot be used
  becouse was nothing activited on usb serial adapter :(

  I tried same configuration with VirtualBox and everything was worked
  fine (serial connection was estabiled and copied several files from
  one machine into another machine), seems to be the emulated serial
  port has been worked fine.

  I would like to use qemu, i just thougt qemu is better, simple and
  faster...

  Exists solution or is this a qemu bug?

  Thank you!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890775/+subscriptions

