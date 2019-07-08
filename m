Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CF61DBD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 13:20:16 +0200 (CEST)
Received: from localhost ([::1]:40502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkRgt-0005Q6-G0
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 07:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hkRcg-0003iA-Sa
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 07:15:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hkRcf-0001E4-LZ
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 07:15:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:56320)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hkRcf-0001DQ-G6
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 07:15:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hkRcd-0000z6-2b
 for <qemu-devel@nongnu.org>; Mon, 08 Jul 2019 11:15:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DC0D22E80E2
 for <qemu-devel@nongnu.org>; Mon,  8 Jul 2019 11:15:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jul 2019 11:07:44 -0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: gtk ui
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h tristan-vanberkom
X-Launchpad-Bug-Reporter: Tristan Van Berkom (tristan-vanberkom)
X-Launchpad-Bug-Modifier: Dr. David Alan Gilbert (dgilbert-h)
References: <156258349508.21433.10621774615794067692.malonedeb@gac.canonical.com>
Message-Id: <156258406504.21151.10032177714764488815.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: e12da4b5763d0bf12999902bdfb9e782667cd29d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1835732] Re: GTK display zoom in, zooms infinitely
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
Reply-To: Bug 1835732 <1835732@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This seems to work for me

Can you confirm:
  a) Guest OS and version
  b) Guest desktop environment
  c) Host OS version
  d) Host desktop env
  e) The full command line you used for qemu.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835732

Title:
  GTK display zoom in, zooms infinitely

Status in QEMU:
  New

Bug description:
  The zoom in feature in the "View" menu of the gtk frontend (launch
  qemu with -display gtk), seems to be very broken.

  If I hit the zoom in feature, it first zooms in.

  Then, it zooms in again.

  Every subsequent second that passes, it zooms in again, until it
  eventually eats up too much host resources and freezes the host
  desktop.

  I have seen this with 3.1.0 (Debian 1:3.1+dfsg-8~deb10u1), and also
  with a locally built 4.0, My colleague also confirms having seen the
  issue with 3.1.0 (Debian 1:3.1+dfsg-8).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1835732/+subscriptions

