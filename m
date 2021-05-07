Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E5B375F01
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:09:45 +0200 (CEST)
Received: from localhost ([::1]:36940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leqs4-0007Fs-4u
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqjc-00085j-RY
 for qemu-devel@nongnu.org; Thu, 06 May 2021 23:01:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:58734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqja-0004zt-5L
 for qemu-devel@nongnu.org; Thu, 06 May 2021 23:01:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leqjY-0002z9-PX
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 03:00:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C02492E8186
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 03:00:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 02:50:38 -0000
From: Thomas Huth <1884017@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: me-davidglover th-huth
X-Launchpad-Bug-Reporter: David Glover (me-davidglover)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159245607293.6124.18309162054825340522.malonedeb@soybean.canonical.com>
Message-Id: <162035583873.14776.11917902000369012374.malone@soybean.canonical.com>
Subject: [Bug 1884017] Re: Intermittently erratic mouse under Windows 95
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 744f73dc45fad3463e8dbfb7eb7149e58bd809d5
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
Reply-To: Bug 1884017 <1884017@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

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
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884017

Title:
  Intermittently erratic mouse under Windows 95

Status in QEMU:
  Incomplete

Bug description:
  The mouse works fine maybe 75-80% of the time, but intermittently
  (every 20-30 seconds or so), moving the mouse will cause the pointer
  to fly around the screen at high speed, usually colliding with the
  edges, and much more problematically, click all the mouse buttons at
  random, even if you are not clicking. This causes random objects on
  the screen to be clicked and dragged around, rendering the system
  generally unusable.

  I don't know if this is related to #1785485 - it happens even if you
  never use the scroll wheel.

  qemu version: 5.0.0 (openSUSE Tumbleweed)

  Launch command line: qemu-system-i386 -hda win95.qcow2 -cpu pentium2
  -m 16 -vga cirrus -soundhw sb16 -nic user,model=3Dpcnet -rtc
  base=3Dlocaltime

  OS version: Windows 95 4.00.950 C

  I have made the disk image available here:
  https://home.gloveraoki.me/share/win95.qcow2.lz

  Setup notes: In order to make Windows 95 detect the system devices
  correctly, after first install you must change the driver for "Plug
  and Play BIOS" to "PCI bus". I have already done this in the above
  image.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884017/+subscriptions

