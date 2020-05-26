Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8551419EC19
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Apr 2020 16:46:47 +0200 (CEST)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jL6Xu-0000Ck-D1
	for lists+qemu-devel@lfdr.de; Sun, 05 Apr 2020 10:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jL6Wu-00088p-F6
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 10:45:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jL6Wt-00022j-7Q
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 10:45:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:44168)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jL6Wt-000228-2L
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 10:45:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jL6Wr-0007Y9-U7
 for <qemu-devel@nongnu.org>; Sun, 05 Apr 2020 14:45:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DF8D02E8104
 for <qemu-devel@nongnu.org>; Sun,  5 Apr 2020 14:45:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Apr 2020 14:38:36 -0000
From: Howard Spoelstra <1870911@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-u3untu-h cat-7
X-Launchpad-Bug-Reporter: Russell Morris (6-u3untu-h)
X-Launchpad-Bug-Modifier: Howard Spoelstra (cat-7)
References: <158608933730.23414.9673600050118912834.malonedeb@wampee.canonical.com>
Message-Id: <CABLmASFNTz937CcuYgN_6OrioVw2Lmj72WSpi7x_ZdNVksNt7A@mail.gmail.com>
Subject: Re: [Bug 1870911] [NEW] QEMU Crashes on Launch, Windows
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a296f04231dee355be5db73cc878b9e21689a253";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 108586d5b1146203194fd9211ca55fa74b444964
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
Reply-To: Bug 1870911 <1870911@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 5, 2020 at 3:38 PM Russell Morris <ubuntu@rkmorris.us>
wrote:

> Public bug reported:
>
> Hi,
>
> I an having no issues up to (and including) v5.0.0-rc0, but when I move
> to rc1 ... it won't even execute in Windows. If I just try to, for
> example, run
>
> qemu-system-x86_64.exe --version
>
> No output, it just exits. This seems to be new with this version.
>
> Thanks!
>
> ** Affects: qemu
>      Importance: Undecided
>          Status: New
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1870911
>
> Title:
>   QEMU Crashes on Launch, Windows
>
> Status in QEMU:
>   New
>
> Bug description:
>   Hi,
>
>   I an having no issues up to (and including) v5.0.0-rc0, but when I
>   move to rc1 ... it won't even execute in Windows. If I just try to,
>   for example, run
>
>   qemu-system-x86_64.exe --version
>
>   No output, it just exits. This seems to be new with this version.
>
>   Thanks!
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1870911/+subscriptions
>
>

Happens to me too with qemu-system-ppc. Earlier thread is here:
https://lists.nongnu.org/archive/html/qemu-ppc/2020-04/msg00027.html

For now compiling with --disable-pie will produce a running executable.

Best,
Howard

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1870911

Title:
  QEMU Crashes on Launch, Windows

Status in QEMU:
  New

Bug description:
  Hi,

  I an having no issues up to (and including) v5.0.0-rc0, but when I
  move to rc1 ... it won't even execute in Windows. If I just try to,
  for example, run

  qemu-system-x86_64.exe --version

  No output, it just exits. This seems to be new with this version.

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1870911/+subscriptions

