Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD11E3AFC76
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 07:10:10 +0200 (CEST)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYfp-0008N4-N9
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 01:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4B-0002pk-KG
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:58628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY49-0000R4-EE
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:15 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY47-0003ri-HD
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 586D52E808C
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:43 -0000
From: Launchpad Bug Tracker <1600563@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-alex-a janitor ruben-gnu th-huth
X-Launchpad-Bug-Reporter: Alex (7-alex-a)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160710075125.17855.72473.malonedeb@wampee.canonical.com>
Message-Id: <162433546320.20423.5363995106257856514.malone@loganberry.canonical.com>
Subject: [Bug 1600563] Re: min_io_size is currently limited to size uint16_t
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: ebaf29a0f4776191bb5715f9e8df7c2f1ed96c82
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
Reply-To: Bug 1600563 <1600563@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1600563

Title:
  min_io_size is currently limited to size uint16_t

Status in QEMU:
  Expired

Bug description:
  I am using LVM VGs on MD-raid1 for hosting my KVM volumes. On the
  host, a VG looks like this:

  Disk /dev/vm/vol202a: 60 GiB, 64424509440 bytes, 125829120 sectors
  Units: sectors of 1 * 512 =3D 512 bytes
  Sector size (logical/physical): 512 bytes / 4096 bytes
  I/O size (minimum/optimal): 131072 bytes / 131072 bytes

  In order to replicate the block device characteristics in the guest, I
  am using the following extra parameters:

  -set device.scsi0-0-0-0.logical_block_size=3D512
  -set device.scsi0-0-0-0.physical_block_size=3D4096
  -set device.scsi0-0-0-0.min_io_size=3D131072

  This doesn't work as qemu complains that min_io_size needs to be of
  type uint16_t.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1600563/+subscriptions

