Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909391A87FB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 19:51:37 +0200 (CEST)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOPii-0000qE-2b
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 13:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jOPhq-00005X-Vh
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jOPho-0001BQ-SN
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:50:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:56808)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jOPho-0001B3-NJ
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:50:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jOPhm-0006Fa-Tp
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 17:50:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DBB192E80BA
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 17:50:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Apr 2020 17:43:32 -0000
From: a <1872790@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: sxtf
X-Launchpad-Bug-Reporter: a (sxtf)
X-Launchpad-Bug-Modifier: a (sxtf)
Message-Id: <158688621326.6027.1278663333852888209.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1872790] [NEW] empty qcow2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8cdad03199f1b1c49466e3bdd698fc0541621759
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
Reply-To: Bug 1872790 <1872790@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I plugged multiple qcow2 to a Windows guest. On the Windows disk manager
all disks are listed perfectly, with their data, their real space, I
even can explore all files on the Explorer, all cool

On third party disk manager (all of them), I only have the C:\ HDD who
act normally, all the other plugged qcow2 are seen as fully unallocated,
so I can't manipulate them

I want to move some partitions, create others, but on Windows disk
manager I can't extend or create partition and on third party I didn't
see the partitions at all

Even guestfs doesn't recognize any partition table `libguestfs: error:
inspect_os: /dev/sda: not a partitioned device`

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1872790

Title:
  empty qcow2

Status in QEMU:
  New

Bug description:
  I plugged multiple qcow2 to a Windows guest. On the Windows disk
  manager all disks are listed perfectly, with their data, their real
  space, I even can explore all files on the Explorer, all cool

  On third party disk manager (all of them), I only have the C:\ HDD who
  act normally, all the other plugged qcow2 are seen as fully
  unallocated, so I can't manipulate them

  I want to move some partitions, create others, but on Windows disk
  manager I can't extend or create partition and on third party I didn't
  see the partitions at all

  Even guestfs doesn't recognize any partition table `libguestfs: error:
  inspect_os: /dev/sda: not a partitioned device`

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1872790/+subscriptions

