Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129461461FF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 07:35:51 +0100 (CET)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuW5l-00056c-RX
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 01:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iuW4w-0004hD-FX
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:34:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iuW4v-0005sW-Ec
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:34:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:55828)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iuW4v-0005qH-8t
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 01:34:57 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iuW4t-0003Lm-Ue
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 06:34:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E32862E806B
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 06:34:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jan 2020 06:23:29 -0000
From: Thomas Huth <1592351@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 1j9rwias dgilbert-h jirislaby th-huth tinywrkb
X-Launchpad-Bug-Reporter: Jirislaby (jirislaby)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160614104554.31869.91941.malonedeb@soybean.canonical.com>
Message-Id: <157976060948.5598.13856768647406518454.malone@chaenomeles.canonical.com>
Subject: [Bug 1592351] Re: mouse pointer offset with gtk,gl=on
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 923e8648b433ba6d924a6ee32408a5bf1ea4f205
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
Reply-To: Bug 1592351 <1592351@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FWIW: Commit f1aba960cc40 has been released with v3.1.0.

** Changed in: qemu
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1592351

Title:
  mouse pointer offset with gtk,gl=3Don

Status in QEMU:
  Fix Released

Bug description:
  When I turn gl=3Don for -display gtk, some Y offset is added to the
  mouse pointer coordinates. That is, when I click on an icon, an icon
  _above_ the one I clicked triggers.

  Using xev, it seems to be offset of 10-12 pixels.

  It happens with all ps/2 mouse, -usbdevice mouse and -usbdevice
  tablet.

  Without gl=3Don, the pointer is precise.

  I have these qemu versions:
  qemu-2.6.0-470.2.x86_64
  qemu-ipxe-1.0.0-470.2.noarch
  qemu-ksm-2.6.0-470.2.x86_64
  qemu-kvm-2.6.0-470.2.x86_64
  qemu-ovmf-x86_64-2015+git1462940744.321151f-2.1.noarch
  qemu-ppc-2.6.0-470.2.x86_64
  qemu-seabios-1.9.1-470.2.noarch
  qemu-sgabios-8-470.2.noarch
  qemu-tools-2.6.0-470.2.x86_64
  qemu-vgabios-1.9.1-470.2.noarch
  qemu-x86-2.6.0-470.2.x86_64

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1592351/+subscriptions

