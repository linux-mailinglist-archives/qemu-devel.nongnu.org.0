Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43AA2ACBAD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 04:27:51 +0100 (CET)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcKJy-00032o-O1
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 22:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcKI4-00013P-B5
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 22:25:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:52472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcKI1-00059W-TW
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 22:25:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcKI0-0005NM-8y
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:25:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 119C82E813D
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:25:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 03:19:15 -0000
From: Thomas Huth <1671677@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: queuecumber th-huth
X-Launchpad-Bug-Reporter: Max Ehrlich (queuecumber)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170310022816.24904.27346.malonedeb@wampee.canonical.com>
Message-Id: <160497835509.27956.13805613332839125194.malone@chaenomeles.canonical.com>
Subject: [Bug 1671677] Re: vfio-pci passthrough issue after resume from suspend
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: a0b4ccea262d2e88af1486ef003027e61778e677
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 20:35:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1671677 <1671677@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for your answer, and sorry that nobody replied to your original
report - sometimes there is just no expert around, or nobody has a clue
about the right answer... anyway, let's close this ticket now.

** Changed in: qemu
       Status: Incomplete =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1671677

Title:
  vfio-pci passthrough issue after resume from suspend

Status in QEMU:
  Won't Fix

Bug description:
  =

  I'm running into a weird issue with the vfio-pci driver through qemu

  I use it on a laptop and I passthrough an external GPU connected via
  PCI express. In general this works well, however if the laptop has
  *ever* suspended since its last boot, then the windows guest reports
  an error 43 on the card and I get no output on the monitor that it is
  connected to. This is really weird to me since it works fine if I boot
  the latop from power-off, and hotplug the card. It's only if the
  laptop has ever suspended since it's last boot that I see this issue.
  Even if it was suspended before the card was ever hotplugged.

  In other words:
  laptop off -> boot -> hotplug GPU : works great
  laptop off -> boot -> do stuff (GPU *NOT* connected) -> sleep -> resume -=
> hotplug GPU: problem
  laptop off -> boot -> hotplug GPU -> unplug GPU -> hotplug GPU : works gr=
eat
  laptop off -> boot -> hotplug GPU -> unplug GPU -> sleep -> resume -> hot=
plug GPU: problem

  Weird stuff...

  I'm honestly not sure that vfio-pci/qemu is to blame here since there
  are so many moving parts, but im not really sure where else to report
  this to

  What I have tried is using the sysfs interface to
  remove/rescan/poweroff/etc the PCI devices in questions (graphics card
  and it's HDMI audio) and this also does help.

  QEMU version: 2.6.1

  Please let me know what other information I can provide

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1671677/+subscriptions

