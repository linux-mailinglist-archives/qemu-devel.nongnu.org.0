Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D932F8B27
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 05:29:25 +0100 (CET)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0dDI-00019R-6q
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 23:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dAU-0007vo-3r
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:26:30 -0500
Received: from indium.canonical.com ([91.189.90.7]:47638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dAQ-0006D7-JO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:26:29 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0dAN-0002EC-IL
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:26:23 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1EFE22E816F
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:26:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 Jan 2021 04:17:49 -0000
From: Launchpad Bug Tracker <1696746@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor nathan-renniewaldock th-huth
X-Launchpad-Bug-Reporter: Nathan Rennie-Waldock (nathan-renniewaldock)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <149692831501.10366.4878345375882367011.malonedeb@wampee.canonical.com>
Message-Id: <161077066952.27726.10430610550699446915.malone@loganberry.canonical.com>
Subject: [Bug 1696746] Re: netdev user,
 restrict=on prevents forwarded ports from being accessed from other
 systems
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: e4deefcb26f5890d220165731eb5a90e108fb547
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
Reply-To: Bug 1696746 <1696746@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1696746

Title:
  netdev user,restrict=3Don prevents forwarded ports from being accessed
  from other systems

Status in QEMU:
  Expired

Bug description:
  I've got a guest only network and I'm wanting to access SSH on one of the=
 guests externally.
  I'm using -netdev user,id=3Dusernet0,hostfwd=3Dtcp::2222-:22,restrict=3Dy=
es -device virtio-net-pci,netdev=3Dusernet0
  to forward 2222 to 22 in the guest.

  The docs state:
  restrict=3Don|off

      If this option is enabled, the guest will be isolated, i.e. it
  will not be able to contact the host and no guest IP packets will be
  routed over the host to the outside. This option does not affect any
  explicitly set forwarding rules.

  =

  However, with restrict=3Don, the forwarded port is only accessible from t=
he host. Other systems receive no data.

  This was tested with qemu 2.8. Changelog for 2.9 doesn't mention any
  (relevant) user networking changes, so that should also fail.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1696746/+subscriptions

