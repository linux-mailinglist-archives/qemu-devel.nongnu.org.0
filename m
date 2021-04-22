Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ED7367B0D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:27:22 +0200 (CEST)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTk9-0001vM-5A
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTil-0000IS-EW
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:25:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:37830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTij-00012c-2K
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:25:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTih-0005Ja-Tw
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:25:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E12782E806D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:17:17 -0000
From: Thomas Huth <1838465@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee s4s th-huth
X-Launchpad-Bug-Reporter: _ (s4s)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156451696673.6584.7291488800307870571.malonedeb@soybean.canonical.com>
Message-Id: <161907583742.22765.2477130097255801596.malone@gac.canonical.com>
Subject: [Bug 1838465] Re: qemu-system-x86_64 kernel panic 30% of the time
 starting up VM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 4f714ecf54d05a15d5f2f4d577354e954c335808
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838465

Title:
  qemu-system-x86_64 kernel panic 30% of the time starting up VM

Status in QEMU:
  Incomplete

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

