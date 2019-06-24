Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4626A50C1F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 15:37:35 +0200 (CEST)
Received: from localhost ([::1]:51266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfPA6-0002xE-03
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 09:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39465)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hfP8e-0002JD-7N
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:36:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hfP8Z-0006R4-Tj
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:36:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:59778)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hfP8W-0006He-Lw
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:35:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hfP8S-000082-F3
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 13:35:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 70FB62E80CD
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 13:35:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Jun 2019 13:28:02 -0000
From: "Laszlo Ersek \(Red Hat\)" <lersek@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=lersek@redhat.com; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lersek
X-Launchpad-Bug-Reporter: Laszlo Ersek (Red Hat) (lersek)
X-Launchpad-Bug-Modifier: Laszlo Ersek (Red Hat) (lersek)
References: <155958011528.16346.9132826883162987130.malonedeb@chaenomeles.canonical.com>
Message-Id: <156138288360.31249.5119702192513499737.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18991";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 9fc026434846dc9d5dd7d79143fd92cabe7f6c30
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1831477] Re: update edk2 submodule & binaries to
 edk2-stable201905
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
Reply-To: Bug 1831477 <1831477@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merged in commit 53defa05701b ("Merge remote-tracking branch
'remotes/lersek/tags/edk2-pull-2019-06-14' into staging", 2019-06-17).


** Changed in: qemu
       Status: In Progress =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1831477

Title:
  update edk2 submodule & binaries to edk2-stable201905

Status in QEMU:
  Fix Committed

Bug description:
  The edk2 project will soon release edk2-stable201905. Update the edk2
  submodule in QEMU, and the bundled edk2 binaries, accordingly.

  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II-Release-Plan=
ning#edk2-stable201905-tag-planning
  https://github.com/tianocore/edk2/releases/tag/edk2-stable201905 [upcomin=
g link]

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1831477/+subscriptions

