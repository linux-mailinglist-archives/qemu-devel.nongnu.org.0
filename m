Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4EA135A8E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 14:51:14 +0100 (CET)
Received: from localhost ([::1]:60726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipYDR-0005oy-AS
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 08:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ipYCB-0004hS-B7
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ipYCA-0003sH-4y
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:49:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:34766)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ipYC9-0003oK-TP
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:49:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ipYC9-0001om-0b
 for <qemu-devel@nongnu.org>; Thu, 09 Jan 2020 13:49:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D95B52E80C3
 for <qemu-devel@nongnu.org>; Thu,  9 Jan 2020 13:49:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jan 2020 13:37:35 -0000
From: Thomas Huth <1010484@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jan-kiszka janitor marcandre-lureau th-huth zoup
X-Launchpad-Bug-Reporter: Armin ranjbar (zoup)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20120608135400.14469.39467.malonedeb@gac.canonical.com>
Message-Id: <157857705570.27180.5259669274286300135.malone@chaenomeles.canonical.com>
Subject: [Bug 1010484] Re: slirp to accept non-local dns server
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 663bf50e1785beaf1f3c00f68b0cece30ff73c8c
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
Reply-To: Bug 1010484 <1010484@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed here: https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D120b721f5=
b590393971673
... and released with QEMU v4.2

** Changed in: qemu
       Status: In Progress =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1010484

Title:
  slirp to accept non-local dns server

Status in QEMU:
  Fix Released

Bug description:
  current version of slirp doesn't allow feeded dns address to be outside o=
f given network.
  in many scenarios you need to provide dns server that isn't local.

  this simple patch removes checking for if dns server isn't in local
  subnet.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1010484/+subscriptions

