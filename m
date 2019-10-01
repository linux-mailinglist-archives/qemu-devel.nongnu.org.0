Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BEDC2BC8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 04:02:21 +0200 (CEST)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iF7Ua-0001oZ-Hv
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 22:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52242)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iF7TH-0001Et-Mh
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 22:01:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iF7TG-0000Tv-IL
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 22:00:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:36074)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iF7TG-0000TP-9y
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 22:00:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iF7TD-0005M1-V4
 for <qemu-devel@nongnu.org>; Tue, 01 Oct 2019 02:00:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DEDBE2E80CB
 for <qemu-devel@nongnu.org>; Tue,  1 Oct 2019 02:00:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Oct 2019 01:48:44 -0000
From: Chris Schneider <1845580@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell shift838 th-huth
X-Launchpad-Bug-Reporter: Chris Schneider (shift838)
X-Launchpad-Bug-Modifier: Chris Schneider (shift838)
References: <156954986411.15692.14551657231977154875.malonedeb@gac.canonical.com>
Message-Id: <156989452492.16327.17286657619167890217.malone@gac.canonical.com>
Subject: [Bug 1845580] Re: issue with QEMU on Raspberry Pi failing to access
 CDROM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19066";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9f9f87af8909d8f1bef0b2e9452d7d3273f1acbf
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
Reply-To: Bug 1845580 <1845580@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for the info.

I installed the gtk2 and sdl2 development libraries recompiled and 4.1.0
now runs successfully and that also fixed the original issue I was
seeing.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1845580

Title:
  issue with QEMU on Raspberry Pi failing to access CDROM

Status in QEMU:
  New

Bug description:
  I am trying to access the CDROM (iso) from QEMU using FreeDOS and I
  get an error when doing a directory for:

  i can boot from the iso but if i exit to access the files from the
  CDROM ISO i get the attached error.

  I believe there is an issue with the QEMU for the Raspberry Pi.

  I am using a Raspberry Pi3 with the latest full Raspbian Buster load

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1845580/+subscriptions

