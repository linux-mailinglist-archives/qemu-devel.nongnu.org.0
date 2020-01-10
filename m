Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4445E136B67
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 11:51:48 +0100 (CET)
Received: from localhost ([::1]:44012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iprtL-0004de-9L
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 05:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50637)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iprsM-0004DS-0P
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:50:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iprsK-0003uw-J3
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:50:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:51614)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iprsK-0003s9-DU
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:50:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iprsH-0001GE-F9
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 10:50:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 058C02E80CF
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 10:50:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jan 2020 10:42:04 -0000
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gkurz nathan-renniewaldock
X-Launchpad-Bug-Reporter: Nathan Rennie-Waldock (nathan-renniewaldock)
X-Launchpad-Bug-Modifier: Greg Kurz (gkurz)
References: <20170103031332.1493.46452.malonedeb@soybean.canonical.com>
Message-Id: <157865292413.3198.5350818144456318245.malone@soybean.canonical.com>
Subject: [Bug 1653577] Re: Ability to set umask for 9pfs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 27e22b86956d43c0ab5624188ebd4432fc87552d
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

Cannot this be addressed by adjusting the umask in the host before
starting QEMU ? And maybe also by adjusting the umask inside the guest
if using the "passthrough" or "none" security model of the "local" fsdev
backend ?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1653577

Title:
  Ability to set umask for 9pfs

Status in QEMU:
  New

Bug description:
  We should be able to specify the umask for 9pfs so that files created
  by the guest can be accessed by other users on the host. Currently
  they're only accessible by the user running qemu (and of course,
  root).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1653577/+subscriptions

