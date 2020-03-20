Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35BD18CD4D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 12:56:41 +0100 (CET)
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFGGW-0006S3-NJ
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 07:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52285)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jFGFW-0005b9-Sq
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:55:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jFGFV-0007FS-O5
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:55:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:37872)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jFGFV-0007C3-IO
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:55:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jFGFU-0006CQ-4Q
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 11:55:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1FEC92E80C3
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 11:55:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Mar 2020 11:46:41 -0000
From: Daniel Berrange <1868221@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: gui usability
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange lockywolf
X-Launchpad-Bug-Reporter: Lockywolf (lockywolf)
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <158469084688.19486.16271224237247905413.malonedeb@chaenomeles.canonical.com>
Message-Id: <158470480184.11071.219527546993725305.malone@soybean.canonical.com>
Subject: [Bug 1868221] Re: /usr/share/applications/qemu.desktop should have an
 "Exec=" key.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 3a8056e37cd4e69aee4a7d04bebe99920868f25a
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
Reply-To: Bug 1868221 <1868221@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that  QEMU sets the NoDisplay=3Dtrue property to tell desktops not to
display this entry. I don't think KDE should be warning about missing
Exec entry in this case.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1868221

Title:
  /usr/share/applications/qemu.desktop should have an "Exec=3D" key.

Status in QEMU:
  New

Bug description:
  According to the www.freedesktop.org .desktop-file specification, all
  "Application" desktop files should have an "Exec=3D" key. The one in
  qemu doesn't.

  This can be easily verified by running kbuildsycoca4 if KDE4 is
  present, but the issue is not DE-dependent.

  Which binary exactly should be assigned as the default one, I don't
  know.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1868221/+subscriptions

