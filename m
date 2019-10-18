Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C476DC475
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 14:12:44 +0200 (CEST)
Received: from localhost ([::1]:39048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLR7b-0000aN-9g
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 08:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iLR6J-0008Uw-13
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 08:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iLR6I-0003Kt-0X
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 08:11:22 -0400
Received: from indium.canonical.com ([91.189.90.7]:60662)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iLR6H-0003KV-R5
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 08:11:21 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iLR6G-0006Yo-Gt
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 12:11:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7E0512E80C0
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 12:11:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Oct 2019 11:56:21 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: corwin-amber pmaydell zenojevski
X-Launchpad-Bug-Reporter: Shachar Itzhaky (corwin-amber)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <157097450557.5820.4200729468686724078.malonedeb@gac.canonical.com>
Message-Id: <157139978127.21792.3628993867516740151.malone@wampee.canonical.com>
Subject: [Bug 1847906] Re: Cocoa display hangs on macOS 10.15 (Catalina)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="186023fa645d8be19d403a76064f0643f510db2f";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9594dc77cbea78ee1c905ee9b0ecea83a5e3093e
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
Reply-To: Bug 1847906 <1847906@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hikaru's patch is now in master as commit dff742ad27efa4, and will be in
the next QEMU release.


** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1847906

Title:
  Cocoa display hangs on macOS 10.15 (Catalina)

Status in QEMU:
  Fix Committed

Bug description:
  I have downloaded the latest stable source tarball 4.1.0 and compiled
  it (i386-softmmu target).

  After opening a black window, QEMU hangs (spinning beach ball).
  When building with `--disable-cocoa --enable-sdl`, display seems to work =
fine.

  The same happened when I tried to build QEMU through HomeBrew and
  MacPorts.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1847906/+subscriptions

