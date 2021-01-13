Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710482F4335
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 05:35:49 +0100 (CET)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzXsq-0005Ne-HC
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 23:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXoB-0001S6-UY
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:33880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXo9-0001Yd-Fk
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzXo8-0006c3-3s
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1C6BA2E8137
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Jan 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1759337@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awilliamson janitor th-huth
X-Launchpad-Bug-Reporter: Adam Williamson (awilliamson)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152217185720.30131.11816005457402548159.malonedeb@gac.canonical.com>
Message-Id: <161051144151.21184.5348384244405440733.malone@loganberry.canonical.com>
Subject: [Bug 1759337] Re: 'Failed to get "write" lock' error when trying to
 run a VM with disk image file on an SMB share
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 621be1b3640daf80282f436f67ca8c92031e91ab
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
Reply-To: Bug 1759337 <1759337@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1759337

Title:
  'Failed to get "write" lock' error when trying to run a VM with disk
  image file on an SMB share

Status in QEMU:
  Expired

Bug description:
  This has been reported and discussed downstream:

  https://bugzilla.redhat.com/show_bug.cgi?id=3D1484130

  but doesn't seem to be getting a lot of traction there.

  Basically, with qemu since at least 2.10, you cannot use a disk image
  on an SMB share that's mounted with protocol version 3 (I think
  possibly 2 or higher). This is made much more serious because kernel
  4.13 upstream made version 3 the *default* for SMB mounts, because
  version 1 is insecure and should not be used.

  So basically, anyone with a recent qemu and kernel cannot use disk
  images stored on an SMB share. This is a major inconvenience for me
  because, well, an SMB share is exactly where I store my VM disk
  images, usually: I have a big NAS drive where I keep them all, only
  now I can't because of this bug, and I'm manually swapping them in and
  out of the very limited space I have on my system drive (SSD).

  The error you get is:

  qemu-system-x86_64: -drive file=3D/share/data/isos/vms/desktop_test_1.qco=
w2,format=3Dqcow2,if=3Dnone,id=3Ddrive-virtio-disk0: Failed to get "write" =
lock
  Is another process using the image?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1759337/+subscriptions

