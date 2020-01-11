Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7AD137C98
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jan 2020 10:21:34 +0100 (CET)
Received: from localhost ([::1]:55560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqCxZ-0000lb-7y
	for lists+qemu-devel@lfdr.de; Sat, 11 Jan 2020 04:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iqCwj-0000M5-UV
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 04:20:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iqCwi-0008GK-Mw
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 04:20:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:51158)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iqCwi-0008Bp-Et
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 04:20:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iqCwh-0006Um-2j
 for <qemu-devel@nongnu.org>; Sat, 11 Jan 2020 09:20:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F2F352E807C
 for <qemu-devel@nongnu.org>; Sat, 11 Jan 2020 09:20:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jan 2020 09:12:52 -0000
From: Thomas Huth <1653577@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gkurz nathan-renniewaldock
X-Launchpad-Bug-Reporter: Nathan Rennie-Waldock (nathan-renniewaldock)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170103031332.1493.46452.malonedeb@soybean.canonical.com>
Message-Id: <157873397315.5281.3816510941973918137.launchpad@gac.canonical.com>
Subject: [Bug 1653577] Re: Ability to set umask for 9pfs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6fcfc07ad60e922085360eb9cbddb648fdaa8281
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
Reply-To: Bug 1653577 <1653577@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1653577

Title:
  Ability to set umask for 9pfs

Status in QEMU:
  Incomplete

Bug description:
  We should be able to specify the umask for 9pfs so that files created
  by the guest can be accessed by other users on the host. Currently
  they're only accessible by the user running qemu (and of course,
  root).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1653577/+subscriptions

