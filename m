Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629BF115AF3
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Dec 2019 05:31:22 +0100 (CET)
Received: from localhost ([::1]:47716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idRkW-0005ct-QY
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 23:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38037)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1idRjD-000503-L2
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 23:30:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1idRjC-0002iO-GS
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 23:29:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:49540)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1idRjC-0002cK-8d
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 23:29:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1idRjA-00081M-TQ
 for <qemu-devel@nongnu.org>; Sat, 07 Dec 2019 04:29:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C27942E80D2
 for <qemu-devel@nongnu.org>; Sat,  7 Dec 2019 04:29:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Dec 2019 04:17:34 -0000
From: Launchpad Bug Tracker <1623998@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor programmingkidx th-huth
X-Launchpad-Bug-Reporter: John Arbuckle (programmingkidx)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160915151441.12160.56338.malonedeb@gac.canonical.com>
Message-Id: <157569225510.3170.5597553573035147318.malone@loganberry.canonical.com>
Subject: [Bug 1623998] Re: pulseaudio Invalid argument error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8059dc07168ba5a064bcaf85c6e6748c5afbf12a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1623998 <1623998@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1623998

Title:
  pulseaudio Invalid argument error

Status in QEMU:
  Expired

Bug description:
  When using qemu-system-ppc on Ubuntu Mate 15 with the usb audio card,
  I see these error messages:

  pulseaudio: set_sink_input_volume() failed
  pulseaudio: Reason: Invalid argument
  pulseaudio: set_sink_input_mute() failed
  pulseaudio: Reason: Invalid argument

  No audio plays. When an attempt is made, QEMU seems to freeze for a
  moment.

  I use "-device usb-audio" to add the usb sound card. This issue is
  present in both emulation and KVM mode.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1623998/+subscriptions

