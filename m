Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C575965389
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 11:11:41 +0200 (CEST)
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlV76-0002YE-G2
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 05:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38959)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hlV6V-00029W-UK
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:11:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hlV6U-0004EM-Vs
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:11:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:54512)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hlV6U-0004Cd-Ou
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:11:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hlV6S-0002CB-TO
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 09:11:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 989EB2E8075
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 09:11:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jul 2019 09:01:31 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell rebeccas
X-Launchpad-Bug-Reporter: Rebecca Chang Swee Fun (rebeccas)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156281902369.23368.14562778655096490350.malonedeb@chaenomeles.canonical.com>
Message-Id: <156283569148.21189.9384457180911711972.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 6c2ea9fbf4069721df1dfe3bb3b3e869d07ca08a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1836136] Re: u-boot: any plans to update u-boot
 to v2019.07
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
Reply-To: Bug 1836136 <1836136@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Are there any notable bugfixes or new features that this would get us
for the two platforms where we ship a u-boot binary ?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1836136

Title:
  u-boot: any plans to update u-boot to v2019.07

Status in QEMU:
  New

Bug description:
  Just want to pulse about the plan to update u-boot binary to latest
  v2019.07.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1836136/+subscriptions

