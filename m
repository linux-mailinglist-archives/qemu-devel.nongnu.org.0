Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC009918F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 13:02:27 +0200 (CEST)
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0krK-0002Um-Kl
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 07:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i0kpt-0000zS-1h
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i0kpr-00032g-PS
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:00:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:58438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i0kpr-00031H-Ii
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:00:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i0kpq-00072i-5q
 for <qemu-devel@nongnu.org>; Thu, 22 Aug 2019 11:00:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2834C2E804E
 for <qemu-devel@nongnu.org>; Thu, 22 Aug 2019 11:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Aug 2019 10:48:44 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell pyro4hell
X-Launchpad-Bug-Reporter: Nero Burner (pyro4hell)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156639464669.26985.11787636330988388983.malonedeb@gac.canonical.com>
Message-Id: <156647092434.31571.4180696757803570351.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: b18bd85108bd8064cbade6923a20a0dd40f25e21
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1840920] Re: changelog 4.1 krenel typo
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
Reply-To: Bug 1840920 <1840920@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for this report -- I've just updated the changelog page to fix
the typo.


** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840920

Title:
  changelog 4.1 krenel typo

Status in QEMU:
  Fix Released

Bug description:
  The changelog for 4.1 subsection Arm has a typo (krenel --> kernel)
  https://wiki.qemu.org/ChangeLog/4.1#Arm

  At the following line:
  The i.mx7 PCI controller emulation has been improved so it can boot curre=
nt Linux krenels =


  it should be:
  The i.mx7 PCI controller emulation has been improved so it can boot curre=
nt Linux kernels

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840920/+subscriptions

