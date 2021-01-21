Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31E62FE0CE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 05:36:19 +0100 (CET)
Received: from localhost ([::1]:59800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Rhh-0001Tu-R6
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 23:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l2RcV-0004aB-W7
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 23:30:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:54716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l2RcT-0006z0-Bj
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 23:30:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l2RcR-0002iF-Cn
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 04:30:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5FC5C2E8138
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 04:30:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Jan 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1756728@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aarno janitor th-huth
X-Launchpad-Bug-Reporter: Alexandre ARNOUD (aarno)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152140081522.14638.12473231561144635050.malonedeb@chaenomeles.canonical.com>
Message-Id: <161120263724.14063.6061926478507838828.malone@loganberry.canonical.com>
Subject: [Bug 1756728] Re: virtio-scsi virtio-scsi-single and virtio-blk on
 raw image, games are not starting
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: 9b9e8906ad427e81cb94055e2c2bbf84b7ab05d0
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1756728 <1756728@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1756728

Title:
  virtio-scsi virtio-scsi-single and virtio-blk on raw image, games are
  not starting

Status in QEMU:
  Expired

Bug description:
  Using virtio-scsi / vitro-scsi-single or vitro-blk on a ZFS/raw image,
  most Assassin's Creed (Origin especially) games are not starting
  (uPlay), it seems related to some check or commands applications are
  doing on the disk drive that fails to respond.

  Workaround has been found by creating a VHD volume, mounting it and
  installing games on it.

  On a side note, application like HDDScan, CrystalDiskInfo returns
  nothing regarding disk drives.

  Guest:
  Windows 10 (build 1709)

  Host:
  $ kvm --version
  QEMU emulator version 2.9.1 pve-qemu-kvm_2.9.1-9
  $ uname -a
  Linux xxxx 4.13.13-5-pve #1 SMP PVE 4.13.13-36 (Mon, 15 Jan 2018 12:36:49=
 +0100) x86_64 GNU/Linux

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1756728/+subscriptions

