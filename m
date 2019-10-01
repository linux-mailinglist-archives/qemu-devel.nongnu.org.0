Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4E3C2C6C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 06:07:52 +0200 (CEST)
Received: from localhost ([::1]:58916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iF9S3-00064v-Lb
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 00:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iF9R1-0005HZ-Bp
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 00:06:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iF9R0-0007uP-9B
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 00:06:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:36880)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iF9R0-0007tt-3y
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 00:06:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iF9Qz-000597-4J
 for <qemu-devel@nongnu.org>; Tue, 01 Oct 2019 04:06:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 104E32E8025
 for <qemu-devel@nongnu.org>; Tue,  1 Oct 2019 04:06:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Oct 2019 03:50:28 -0000
From: Thomas Huth <1623998@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: programmingkidx th-huth
X-Launchpad-Bug-Reporter: John Arbuckle (programmingkidx)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160915151441.12160.56338.malonedeb@gac.canonical.com>
Message-Id: <156990182871.21256.13331111233039136696.malone@chaenomeles.canonical.com>
Subject: [Bug 1623998] Re: pulseaudio Invalid argument error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19066";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6f825d8ff6cffcf30931fd277d9c36068d80c1d9
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

Triaging old bug tickets ... Can you still reproduce this issue with the
latest version of QEMU (currently 4.1)? Or could we close this ticket
nowadays?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1623998

Title:
  pulseaudio Invalid argument error

Status in QEMU:
  Incomplete

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

