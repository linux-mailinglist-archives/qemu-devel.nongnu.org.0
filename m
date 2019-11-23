Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6366107CCA
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Nov 2019 05:26:45 +0100 (CET)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYN0O-0005mZ-Af
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 23:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iYMzO-0005Mj-HV
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 23:25:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iYMzN-0001cb-Dk
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 23:25:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:36392)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iYMzN-0001cJ-7g
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 23:25:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iYMzL-0006XC-Mm
 for <qemu-devel@nongnu.org>; Sat, 23 Nov 2019 04:25:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A1FE32E80C0
 for <qemu-devel@nongnu.org>; Sat, 23 Nov 2019 04:25:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 Nov 2019 04:17:24 -0000
From: Launchpad Bug Tracker <1746943@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fykcee1 janitor pmaydell
X-Launchpad-Bug-Reporter: cee1 (fykcee1)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151756277928.2993.6454939775938128745.malonedeb@gac.canonical.com>
Message-Id: <157448264439.18520.14089860435788840707.malone@loganberry.canonical.com>
Subject: [Bug 1746943] Re: qemu-aarch64-static: qemu: uncaught target signal
 11 for ps/top cmd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5a17c0dcfbb31e334d4a67e76657c12aa745f1a2
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
Reply-To: Bug 1746943 <1746943@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1746943

Title:
  qemu-aarch64-static: qemu: uncaught target signal 11 for ps/top cmd

Status in QEMU:
  Expired

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

