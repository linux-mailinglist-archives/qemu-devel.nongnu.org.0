Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7E167D17
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 13:06:41 +0100 (CET)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j574q-0001mV-HP
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 07:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j573y-0001MM-0g
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 07:05:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j573x-0005b7-1w
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 07:05:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:49558)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j573w-0005VD-SK
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 07:05:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j573v-0006FM-5S
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 12:05:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 285852E80C3
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 12:05:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Feb 2020 11:56:10 -0000
From: Daniel Berrange <1863601@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adioracle berrange
X-Launchpad-Bug-Reporter: Aditya prakash (adioracle)
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <158193843490.28688.11268116902795457320.malonedeb@chaenomeles.canonical.com>
Message-Id: <158228617082.24950.11799304118582767050.malone@gac.canonical.com>
Subject: [Bug 1863601] Re: unable to type "|" character in french keyboard.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 16a515b34d5dee4a5de8703296e295139ea42f0e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1863601 <1863601@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Can you provide more information here. What command line have you
launched QEMU with ?  How are you interacting with QEMU (serial console,
GTK UI, VNC, SPICE ?)  If VNC/SPICE, what client app are you using ?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863601

Title:
  unable to type "|" character in french keyboard.

Status in QEMU:
  New

Bug description:
  Unable to type "|" character when using french keyboard. It is
  displaying "<" instead of "|" while pressing AltGr+6 from my keyboard.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863601/+subscriptions

