Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFD13C7D92
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 06:31:34 +0200 (CEST)
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3WYX-00025L-3l
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 00:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUd-00049j-RY
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:31 -0400
Received: from indium.canonical.com ([91.189.90.7]:52020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUc-0003mZ-10
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:31 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3WUZ-0006uc-2H
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:27:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 984CB2E853D
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:26:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Jul 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1920211@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: colaflash janitor th-huth
X-Launchpad-Bug-Reporter: kolAflash (colaflash)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161616435594.712.2426714645893097472.malonedeb@soybean.canonical.com>
Message-Id: <162623624243.32682.15592464145494581263.malone@loganberry.canonical.com>
Subject: [Bug 1920211] Re: shrink option for discard (for bad host-filesystems
 and -backup solutions)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="48411ad9fd448ca55fc57f9555fc375624a85324"; Instance="production"
X-Launchpad-Hash: 3a0022f30dd40a7fa054026b06dad55e24e00fee
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1920211 <1920211@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920211

Title:
  shrink option for discard (for bad host-filesystems and -backup
  solutions)

Status in QEMU:
  Expired

Bug description:
  When using discard=3Dunmap for virtio or scsi devices with QCOW2 images,
  space discarded by the guest will be unmaped on the host, which is
  basically great!

  This will turn the QCOW2 image into a sparse file which is efficient
  for most scenarios. But it may be that you need to avoid big sparse
  files on your host. For example because you need to use a backup
  solution which doesn't support sparse files well. Or maybe the QCOW2
  image is on a filesystem mount which doesn't support sparse files at
  all.

  For those scenarios an alternative option for the discard setting (discar=
d=3Dshrink) would be great, so that the QCOW2 file itself gets shrunken aga=
in.
  I'm not sure about how the initial growing* of QCOW2 images is implemente=
d and if there are maybe limitations. But I hope it may be possible do the =
inverse and actually shrink (not sparse) an QCOW2 image with internally dis=
carded blocks.

 =20
  I'm using Qemu-5.2.0 and Linux >=3D 5.3 (host and guest).

  *If you use "qemu-img create -f qcow2 ..." withOUT the "preallocation"
  option.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920211/+subscriptions


