Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8393AFC28
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:44:48 +0200 (CEST)
Received: from localhost ([::1]:46428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYHH-0001Oh-0C
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzf-0007Dc-UQ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:56678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXze-00055f-3E
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzQ-000149-4R
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DB8452E81A1
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:27 -0000
From: Launchpad Bug Tracker <1838465@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee janitor s4s th-huth
X-Launchpad-Bug-Reporter: _ (s4s)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156451696673.6584.7291488800307870571.malonedeb@soybean.canonical.com>
Message-Id: <162433550812.20423.210542122161015111.malone@loganberry.canonical.com>
Subject: [Bug 1838465] Re: qemu-system-x86_64 kernel panic 30% of the time
 starting up VM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 5639c14ae5414948e7a8639575fe9dd774f7f579
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Bug 1838465 <1838465@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838465

Title:
  qemu-system-x86_64 kernel panic 30% of the time starting up VM

Status in QEMU:
  Expired

Bug description:
  I have created a Fedora Core 5 x86_64 VM image. When I run the image
  using QEMU on Windows the VM hangs while loading the kernel about 30%
  of the time. I am trying to use this VM with a CI software, looking at
  the history the build failed 27 out of 79 attempts. QEMU 3.0.0 is
  installed on the CI machine. I have tried using the exact same image
  using QEMU on Linux (Ubuntu) and found the image boot successful every
  time (40+ attempts). The VM image is fairly old it was created using
  QEMU 0.11.1.

  I have tried multiple versions on QEMU on windows; 0.11.1, 2.12.1, and
  3.0.0 all of them fail randomly. I can reproduce the issue on several
  different Windows 10 computers.

  The command I am using to start the VM is =E2=80=9Cqemu-system-x86_64.exe=
 -cpu
  qemu64 -smp cores=3D2 -device e1000,netdev=3Dnet0 -boot menu=3Doff -m 1G
  -drive `"file=3DC:\qimages\Fedora-Core-5-x64.qcow2,index=3D0,media=3Ddisk=
`"
  -snapshot -netdev user,id=3Dnet0,hostfwd=3Dtcp::10022-:22=E2=80=9D

  I can provide the qcow image but it is somewhat large coming it at
  4.15GB so I=E2=80=99m not sure what would be the best way to transfer it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838465/+subscriptions

