Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A374B2E28
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 06:27:05 +0200 (CEST)
Received: from localhost ([::1]:53100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9M7s-0002pD-5l
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 00:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i9M6a-0002Nl-I2
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 00:25:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i9M6Z-0002Xy-GD
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 00:25:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:36016)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i9M6Z-0002XX-BI
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 00:25:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i9M6X-0006MJ-Qh
 for <qemu-devel@nongnu.org>; Sun, 15 Sep 2019 04:25:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C69EF2E80C9
 for <qemu-devel@nongnu.org>; Sun, 15 Sep 2019 04:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Sep 2019 04:17:25 -0000
From: Launchpad Bug Tracker <1836430@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: installer windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee janitor karrq
X-Launchpad-Bug-Reporter: Francesco Dainese (karrq)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156297657458.27697.12325008509748748159.malonedeb@wampee.canonical.com>
Message-Id: <156852104516.30554.8528560370632037212.malone@loganberry.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4202a70bbb7d4b467c342e95599f450df940386c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1836430] Re: Can't install on Windows 10
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
Reply-To: Bug 1836430 <1836430@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1836430

Title:
  Can't install on Windows 10

Status in QEMU:
  Expired

Bug description:
  Latest release (20190712) 64-bit doesn't install:

  The setup seems to work fine at first and actually extract all the files =
needed for qemu in the correct location, but after it has done that, it pro=
ceeds to delete every file and leaves no trace of qemu except the installat=
ion folder.
  The setup then finishes and notifies the user that it has been installed =
succesfully.

  I downloaded the previous release and it installs correctly.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1836430/+subscriptions

