Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF7CDCB6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 09:58:55 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHNuw-0006qs-Th
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 03:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iHNsC-0005yP-Pd
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 03:56:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iHNsB-00056c-NV
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 03:56:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:50754)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iHNsB-00056I-IP
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 03:56:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iHNsA-0008E2-D3
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2019 07:56:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 39DBB2E8073
 for <qemu-devel@nongnu.org>; Mon,  7 Oct 2019 07:56:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Oct 2019 07:44:34 -0000
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
Message-Id: <157043427479.9599.2536129012233487125.malone@wampee.canonical.com>
Subject: [Bug 1623998] Re: pulseaudio Invalid argument error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="af2eefe214bd95389a09b7c956720881bab16807";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9a578709c30e9e0090512e5e9acaf6c91c6f0b0e
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

What output do you get when you run "qemu-system-x86_64 -audio-help" ?
Could you provide your full command line, please?

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

