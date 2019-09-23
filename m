Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2151BB73B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 16:53:50 +0200 (CEST)
Received: from localhost ([::1]:57610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCPim-0004KG-V3
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 10:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iCPgF-0002g6-LM
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:51:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iCPgE-0002Pw-8z
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:51:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:59232)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iCPgE-0002OB-36
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:51:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iCPg7-00046b-Qe
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 14:51:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 13E8D2E80D4
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 14:51:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Sep 2019 14:37:57 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fykcee1 pmaydell
X-Launchpad-Bug-Reporter: cee1 (fykcee1)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <151756277928.2993.6454939775938128745.malonedeb@gac.canonical.com>
Message-Id: <156924947755.4877.6333934540704349856.malone@chaenomeles.canonical.com>
Subject: [Bug 1746943] Re: qemu-aarch64-static: qemu: uncaught target signal
 11 for ps/top cmd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: e35ffea52b7e4d70eacdb2c39ed564d0f6119807
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
Reply-To: Bug 1746943 <1746943@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still waiting for repro instructions (eg attaching a binary that doesn't
run under QEMU).


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1746943

Title:
  qemu-aarch64-static: qemu: uncaught target signal 11 for ps/top cmd

Status in QEMU:
  Incomplete

Bug description:
  In a docker container created from an aarch64 image, injects qemu-aarch64=
-static (in /usr/bin)
    run ps/top cmd  inside this container

    reports "qemu: uncaught target signal 11 (Segmentation fault)"

  Tried qemu-aarch64-static from fedora 27 / ubuntu artful / debian
  unstable (i.e. qemu version 2.10 - 2.11)

  The aarch64 dock image is fedora 27(and with qemu-aarch64-static
  Fedora 27), hence I opened a related bug here
  https://bugzilla.redhat.com/show_bug.cgi?id=3D1541252

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1746943/+subscriptions

