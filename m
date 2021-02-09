Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474A231478E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 05:33:48 +0100 (CET)
Received: from localhost ([::1]:42926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Kih-0002DO-D3
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 23:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9Kex-00081g-A4
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 23:29:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:59536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9Kev-0003v0-3K
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 23:29:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l9Ket-0002yX-JN
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 04:29:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 88DDF2E8143
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 04:29:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Feb 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1597138@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor sgbarber th-huth
X-Launchpad-Bug-Reporter: Shannon Barber (sgbarber)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160628234609.30466.21966.malonedeb@chaenomeles.canonical.com>
Message-Id: <161284423843.15411.4744584237572319292.malone@loganberry.canonical.com>
Subject: [Bug 1597138] Re: Deadlock on Windows 10 pop-up
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: e5448ad81b417bcad1675b89844d40fab427cd5f
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
Reply-To: Bug 1597138 <1597138@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1597138

Title:
  Deadlock on Windows 10 pop-up

Status in QEMU:
  Expired

Bug description:
  I was able to install and can log in but whenever a pop-up is attempted t=
he VM appears to deadlock.
  I can still kill -9 the process and recover but the VM and the QEmu conso=
le both hang with no error output.

  At first I thought it was UAC but renaming a file causes a pop-up and tha=
t also deadlocks.
  I rebuilt QEmu 2.6.0 with debug info and did a thread back-trace once the=
 deadlock occurs.
  See the attachment for the trace.

  I am attempting to setup GPU pass-thru with a GTX 970 but this
  deadlock occurs with -vga std (and no GPU pass-thru) as well.

  (I cannot install or start Windows 7 but I am told this is a known
  bug.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1597138/+subscriptions

