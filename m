Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB64EE00CE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 11:32:03 +0200 (CEST)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMqWI-00073B-Oz
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 05:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54448)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iMqVG-0006ba-JM
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 05:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iMqVF-00059A-Dj
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 05:30:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:58090)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iMqVF-00058X-8I
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 05:30:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iMqVD-0004yl-FK
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 09:30:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 620552E80C8
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 09:30:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Oct 2019 09:21:13 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: razersaiso
X-Launchpad-Bug-Reporter: razer (razersaiso)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
X-Launchpad-Bug-Duplicate: 1847906
References: <157171099447.21488.3288873580425717496.malonedeb@wampee.canonical.com>
Message-Id: <157173607378.18932.15507892352193073786.launchpad@gac.canonical.com>
Subject: [Bug 1849234] Re: Macos Catalina bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="186023fa645d8be19d403a76064f0643f510db2f";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 34aa727b220168a5c377254470cbfc9385b28130
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
Reply-To: Bug 1849234 <1849234@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1847906 ***
    https://bugs.launchpad.net/bugs/1847906

** This bug has been marked a duplicate of bug 1847906
   Cocoa display hangs on macOS 10.15 (Catalina)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1849234

Title:
  Macos Catalina bug

Status in QEMU:
  New

Bug description:
  When I want to boot anything with qemu it just stops responding.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1849234/+subscriptions

