Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E10230DC6A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:16:13 +0100 (CET)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ix2-0004iP-DW
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:16:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7IuS-0003BS-MD
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:13:32 -0500
Received: from indium.canonical.com ([91.189.90.7]:41050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7IuP-00036P-SH
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:13:32 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l7IuO-0007qm-7T
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 14:13:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 35B8E2E813C
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 14:13:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Feb 2021 14:01:06 -0000
From: Thomas Huth <1810603@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake kwolf-redhat lennyhers th-huth
X-Launchpad-Bug-Reporter: Lenny Helpline (lennyhers)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154670237006.5111.1505843603378488710.malonedeb@wampee.canonical.com>
Message-Id: <161236086695.4102.16381846828352578631.malone@chaenomeles.canonical.com>
Subject: [Bug 1810603] Re: QEMU QCow Images grow dramatically
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 902ba0a8008953f143945e5169a54ace04a84ea7
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
Reply-To: Bug 1810603 <1810603@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1810603

Title:
  QEMU QCow Images grow dramatically

Status in QEMU:
  Incomplete

Bug description:
  I've recently migrated our VM infrastructure (~200 guest on 15 hosts)
  from vbox to Qemu (using KVM / libvirt). We have a master image (QEMU
  QCow v3) from which we spawn multiple instances (linked clones). All
  guests are being revert once per hour for security reasons.

  About 2 weeks after we successfully migrated to Qemu, we noticed that
  almost all disks went full across all 15 hosts. Our investigation
  showed that the initial qcow disk images blow up from a few gigabytes
  to 100GB and more. This should not happen, as we revert all VMs back
  to the initial snapshot once per hour and hence all changes that have
  been made to disks must be reverted too.

  We did an addition test with 24 hour time frame with which we could
  reproduce this bug as documented below.

  Initial disk image size (created on Jan 04):
  -rw-r--r-- 1 root root 7.1G Jan  4 15:59 W10-TS01-0.img
  -rw-r--r-- 1 root root 7.3G Jan  4 15:59 W10-TS02-0.img
  -rw-r--r-- 1 root root 7.4G Jan  4 15:59 W10-TS03-0.img
  -rw-r--r-- 1 root root 8.3G Jan  4 16:02 W10-CLIENT01-0.img
  -rw-r--r-- 1 root root 8.6G Jan  4 16:05 W10-CLIENT02-0.img
  -rw-r--r-- 1 root root 8.0G Jan  4 16:05 W10-CLIENT03-0.img
  -rw-r--r-- 1 root root 8.3G Jan  4 16:08 W10-CLIENT04-0.img
  -rw-r--r-- 1 root root 8.1G Jan  4 16:12 W10-CLIENT05-0.img
  -rw-r--r-- 1 root root 8.0G Jan  4 16:12 W10-CLIENT06-0.img
  -rw-r--r-- 1 root root 8.1G Jan  4 16:16 W10-CLIENT07-0.img
  -rw-r--r-- 1 root root 7.6G Jan  4 16:16 W10-CLIENT08-0.img
  -rw-r--r-- 1 root root 7.6G Jan  4 16:19 W10-CLIENT09-0.img
  -rw-r--r-- 1 root root 7.5G Jan  4 16:21 W10-ROUTER-0.img
  -rw-r--r-- 1 root root  18G Jan  4 16:25 W10-MASTER-IMG.qcow2

  Disk image size after 24 hours (printed on Jan 05):
  -rw-r--r-- 1 root root  13G Jan  5 15:07 W10-TS01-0.img
  -rw-r--r-- 1 root root 8.9G Jan  5 14:20 W10-TS02-0.img
  -rw-r--r-- 1 root root 9.0G Jan  5 15:07 W10-TS03-0.img
  -rw-r--r-- 1 root root  10G Jan  5 15:08 W10-CLIENT01-0.img
  -rw-r--r-- 1 root root  11G Jan  5 15:08 W10-CLIENT02-0.img
  -rw-r--r-- 1 root root  11G Jan  5 15:08 W10-CLIENT03-0.img
  -rw-r--r-- 1 root root  11G Jan  5 15:08 W10-CLIENT04-0.img
  -rw-r--r-- 1 root root  19G Jan  5 15:07 W10-CLIENT05-0.img
  -rw-r--r-- 1 root root  14G Jan  5 15:08 W10-CLIENT06-0.img
  -rw-r--r-- 1 root root 9.7G Jan  5 15:07 W10-CLIENT07-0.img
  -rw-r--r-- 1 root root  35G Jan  5 15:08 W10-CLIENT08-0.img
  -rw-r--r-- 1 root root 9.2G Jan  5 15:07 W10-CLIENT09-0.img
  -rw-r--r-- 1 root root  41G Jan  5 15:08 W10-ROUTER-0.img
  -rw-r--r-- 1 root root  18G Jan  4 16:25 W10-MASTER-IMG.qcow2

  You can reproduce this bug as follow:
  1) create an initial disk image
  2) create a linked clone
  3) create a snapshot of the linked clone
  4) revert the snapshot every X minutes / hours

  Due the described behavior / bug, our VM farm is completely down at
  the moment (as we run out of disk space on all host systems). A quick
  fix for this bug would be much appreciated.

  Host OS: Ubuntu 18.04.01 LTS
  Kernel: 4.15.0-43-generic
  Qemu: 3.1.0
  libvirt: 4.10.0
  Guest OS: Windows 10 64bit

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1810603/+subscriptions

