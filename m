Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C8370A55
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 07:32:29 +0200 (CEST)
Received: from localhost ([::1]:50352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld4iS-0007oE-KX
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 01:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld4fm-0006De-5U
 for qemu-devel@nongnu.org; Sun, 02 May 2021 01:29:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:33256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld4fj-00046b-FS
 for qemu-devel@nongnu.org; Sun, 02 May 2021 01:29:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ld4fh-0002RD-CY
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 05:29:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 590C52E815A
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 05:29:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 05:16:17 -0000
From: Thomas Huth <603878@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: socketpair th-huth
X-Launchpad-Bug-Reporter: =?utf-8?b?0JrQvtGA0LXQvdCx0LXRgNCzINCc0LDRgNC6?=
 =?utf-8?q?_=28socketpair=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20100710070634.22855.99257.malonedeb@soybean.canonical.com>
Message-Id: <161993257733.11353.4444546712187920853.malone@soybean.canonical.com>
Subject: [Bug 603878] Re: [Feature request] qemu-img option about recompressing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 846054c0103f9149f42a357bb4deb29e4fce402f
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
Reply-To: Bug 603878 <603878@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/81


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #81
   https://gitlab.com/qemu-project/qemu/-/issues/81

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/603878

Title:
  [Feature request] qemu-img option about recompressing

Status in QEMU:
  Expired

Bug description:
  Suppose I have a fresh compressed qcow2 image. After some time the
  data were recorded without compression. I decide to make "QEMU-IMG
  convert" for that image to reduce its size.

  I want a new option, which selects between the two algorithms overdriven =
images:
  1. extract all / compress again when converting images (in the current im=
plementation)
  2. compress only uncompressed blocks and just copy the compressed blocks =
without re-compression.

  This option is only needed when converting compressed image to
  compressed and the compression algorithm is the same.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/603878/+subscriptions

