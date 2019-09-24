Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68340BC3BB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 10:04:25 +0200 (CEST)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCfo6-0008Hd-Ut
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 04:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iCflP-00075B-Aa
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 04:01:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iCflN-0004p3-3c
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 04:01:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:37572)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iCflM-0004oK-6C
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 04:01:32 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iCflK-0007Y3-Pk
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 08:01:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C0CBE2E8025
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 08:01:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Sep 2019 07:50:45 -0000
From: Thomas Huth <1824704@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: drjs5x th-huth
X-Launchpad-Bug-Reporter: mustafa (drjs5x)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155524844990.21262.8108456842078597088.malonedeb@chaenomeles.canonical.com>
Message-Id: <156931144539.27379.15557350803171086406.malone@soybean.canonical.com>
Subject: [Bug 1824704] Re: -k tr not working after v20171217! turkish keyboard
 dont working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: fc8f9102fd00d364c967b88e2173a580fdc660b3
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
Reply-To: Bug 1824704 <1824704@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I meant which version of QEMU is still working for you? Which version
fails?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1824704

Title:
  -k tr not working after v20171217! turkish keyboard dont working

Status in QEMU:
  Incomplete

Bug description:
  hi qemu

  -k tr not working after v20171217! turkish keyboard dont working

  last working without proplem at v20171217!

  after this version  tr keyboard proplem.
  freedos  , winpe  ,  linux images   all dont working tr  turkish keyboard.

  example   press key " =C3=A7 "  show " , "
  example 2 press key " . "  show " =C3=A7 "

  tr keyboard work  always "en-us" kbd.
  :((((((((

  please fix this critical bug.

  Sincerely

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1824704/+subscriptions

