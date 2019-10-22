Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A119DFBAF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 04:36:24 +0200 (CEST)
Received: from localhost ([::1]:49530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMk23-0005eL-5w
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 22:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iMk1E-0005Dv-O9
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 22:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iMk1D-0002R1-Fh
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 22:35:32 -0400
Received: from indium.canonical.com ([91.189.90.7]:54386)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iMk1D-0002Qv-AW
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 22:35:31 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iMk1B-00084E-UE
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 02:35:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C5B9F2E80C0
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 02:35:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Oct 2019 02:23:14 -0000
From: razer <1849234@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: razersaiso
X-Launchpad-Bug-Reporter: razer (razersaiso)
X-Launchpad-Bug-Modifier: razer (razersaiso)
Message-Id: <157171099447.21488.3288873580425717496.malonedeb@wampee.canonical.com>
Subject: [Bug 1849234] [NEW] Macos Catalina bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="186023fa645d8be19d403a76064f0643f510db2f";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4c7dc79bcc57815fcc081320fb87e540898ee411
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

Public bug reported:

When I want to boot anything with qemu it just stops responding.

** Affects: qemu
     Importance: Undecided
         Status: New

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

