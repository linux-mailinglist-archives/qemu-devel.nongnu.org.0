Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C1375026
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:27:09 +0200 (CEST)
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYPc-0001AU-M8
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYOV-0008I3-4E
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:25:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:54808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYOS-0006Ot-5I
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:25:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leYOQ-0000VB-Sn
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D18ED2E8187
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 07:25:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 07:12:12 -0000
From: Thomas Huth <1866792@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: backhus th-huth
X-Launchpad-Bug-Reporter: Eilert (backhus)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158383423277.12441.11625227963369015627.malonedeb@soybean.canonical.com>
Message-Id: <162028513272.14828.4730297112779203120.malone@soybean.canonical.com>
Subject: [Bug 1866792] Re: formating vdi-disk over nbd fails
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 84261ca07f469ddbce1a5c004f73d2ab6334fa61
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
Reply-To: Bug 1866792 <1866792@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

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
https://bugs.launchpad.net/bugs/1866792

Title:
  formating vdi-disk over nbd fails

Status in QEMU:
  Incomplete

Bug description:
  Hi,
  after creating a vdi-image with qemu-vdi and attaching it with qemu-nbd p=
artitioning works fine, but the system hangs up during formating with mkfs.=
ext4.

  Same procedure with qcow2-image works fine
  Tested on Fedora 31 kernel  5.5.7-200.fc31.x86_64

  -----------------
  #! /bin/sh

  qemu-img create -f qcow2 ~/test.qcow2 32G
  #qemu-img version 4.1.1 (qemu-4.1.1-1.fc31)

  modprobe nbd max_part=3D8
  qemu-nbd --connect=3D/dev/nbd2 ~/test.qcow2
  #qemu-nbd 4.1.1 (qemu-4.1.1-1.fc31)

  parted -s /dev/nbd2 "mklabel gpt"
  parted -s -a optimal /dev/nbd2 "mkpart test ext4 2048 32G "
  parted  -s -a optimal /dev/nbd2 "p"

  mkfs.ext4 /dev/nbd2p1

  mkdir /mnt/test_qcow2

  mount /dev/nbd2p1 /mnt/test_qcow2
  df -H

  -------------------
  #! /bin/sh

  qemu-img create -f vdi ~/test.vdi 32G

  modprobe nbd max_part=3D8
  qemu-nbd --connect=3D/dev/nbd4 ~/test.vdi

  parted -s /dev/nbd4 "mklabel gpt"
  parted -s -a optimal /dev/nbd4 "mkpart test ext4 2048 32G "
  parted  -s -a optimal /dev/nbd4 "p"

  mkfs.ext4 /dev/nbd4p1
  #Format hangs up due to IO errors
  #Tested on Fedora 31 kernel  5.5.7-200.fc31.x86_64

  mkdir /mnt/test_vdi

  mount /dev/nbd4p1 /mnt/test_vdi
  df -H
  ----------------------

  Kind regards
  =C2=A0=C2=A0Eilert

  PS.: There may be a connection to this bug:
  =E2=80=8B
  #1661758 qemu-nbd causes data corruption in VDI-format disk images

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1866792/+subscriptions

