Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11283368C43
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 06:41:03 +0200 (CEST)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZnck-00057G-3h
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 00:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZnba-0004g0-UT
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 00:39:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:35288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZnbY-0000uk-10
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 00:39:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZnbW-00020F-40
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 04:39:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 134622E815F
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 04:39:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Apr 2021 04:29:34 -0000
From: Thomas Huth <1580459@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=libvirt; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=archlinux; sourcepackage=None; component=None;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=debian; sourcepackage=None; component=None;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=fedora; sourcepackage=None; component=None;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: avenger337 bigdaddymccarron brl75 clifhouck
 jdnewman85 jimijames-bove jimrif murknfools omega52390 peter-maloney th-huth
 yanman
X-Launchpad-Bug-Reporter: Jimi (jimijames-bove)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160511061916.21125.98809.malonedeb@wampee.canonical.com>
Message-Id: <161915217441.7335.1635448664501923644.malone@chaenomeles.canonical.com>
Subject: [Bug 1580459] Re: Windows (10?) guest freezes entire host on shutdown
 if using PCI passthrough
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 1092fc5eb281962d4eea2327cf68236eb35c9f9e
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
Reply-To: Bug 1580459 <1580459@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, thanks for answering! So I'm closing this issue now. In case anybody
still has similar issues, please open a new bug ticket instead.

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1580459

Title:
  Windows (10?) guest freezes entire host on shutdown if using PCI
  passthrough

Status in libvirt:
  New
Status in QEMU:
  Fix Released
Status in Arch Linux:
  New
Status in Debian:
  New
Status in Fedora:
  New

Bug description:
  Problem: after leaving a Windows VM that uses PCI passthrough (as we
  do for gaming graphics cards, sound cards, and in my case, a USB card)
  running for some amount of time between 1 and 2 hours (it's not
  consistent with exactly how long), and for any amount of time longer
  than that, shutting down that guest will, right as it finishes
  shutting down, freeze the host computer, making it require a hard
  reboot. Unbinding (or in the other user's case, unbinding and THEN
  binding) any PCI device in sysfs, even one that has nothing to do with
  the VM, also has the same effect as shutting down the VM (if the VM
  has been running long enough). So, it's probably an issue related to
  unbinding and binding PCI devices.

  There's a lot of info on this problem over at https://bbs.archlinux.org/v=
iewtopic.php?id=3D206050
  Here's a better-organized list of main details:
  -at least 2 confirmed victims of this bug; 2 (including me) have provided=
 lots of info in the link
  -I'm on Arch Linux and the other one is on Gentoo (distro-nonspecific)
  -issue affects my Windows 10 guest and others' Windows guests, but not my=
 Arch Linux guest (the others don't have non-Windows guests to test)
  -I'm using libvirt but the other user is not, so it's not an issue with l=
ibvirt
  -It seems to be version non-specific, too. I first noticed it at, or when=
 testing versions still had the issue at (whichever version is lower), Linu=
x 4.1 and qemu 2.4.0. It still persists in all releases of both since, incl=
uding the newest ones.
  -I can't track down exactly what package downgrade can fix it, as downgra=
ding further than Linux 4.1 and qemu 2.4.0 requires Herculean and system-de=
stroying changes such as downgrading ncurses, meaning I don't know whether =
it's a bug in QEMU, the Linux kernel, or some weird seemingly unrelated thi=
ng.
  -According to the other user, "graphics intensive gameplay (GTA V) can ca=
use the crash to happen sooner," as soon as "15 minutes"
  -Also, "bringing up a second passthrough VM with separate hardware will c=
ause the same crash," and "bringing up another VM before the two-hour mark =
will not result in a crash," further cementing that it's triggered by the u=
n/binding of PCI devices.
  -This is NOT related to the very similar bug that can be worked around by=
 not passing through the HDMI device or sound card. Even when we removed al=
l traces of any sort of sound card from the VM, it still had the same behav=
ior.

To manage notifications about this bug go to:
https://bugs.launchpad.net/libvirt/+bug/1580459/+subscriptions

