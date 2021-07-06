Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C343BC59A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:37:16 +0200 (CEST)
Received: from localhost ([::1]:48422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cpf-0002We-Rn
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfi-0000YG-NP
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:52734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfe-0003Rt-Iy
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfR-0004xi-2p
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 274E42E8432
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:29 -0000
From: Launchpad Bug Tracker <1869782@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor manuel-reimer pmaydell th-huth
X-Launchpad-Bug-Reporter: Manuel Reimer (manuel-reimer)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158559478745.21027.13296208481863226077.malonedeb@gac.canonical.com>
Message-Id: <162554504925.7821.14001016886832628450.malone@loganberry.canonical.com>
Subject: [Bug 1869782] Re: qemu-arm-static crashes "segmentation fault" when
 running "svn checkout"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 716e235467544d3fb37a7fbe02fcd4637388021b
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
Reply-To: Bug 1869782 <1869782@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1869782

Title:
  qemu-arm-static crashes "segmentation fault" when running "svn
  checkout"

Status in QEMU:
  Expired

Bug description:
  I'm not actually sure how far I can help as I so far failed to
  reproduce the issue on my local VM but I get it on Travis CI every
  time. I even went through the hassle of hacking a Debian repository
  into their Ubuntu Bionic VM to get qemu 4.2 as I hoped a new version
  could fix this.

  This build runs in an armv6h chroot. I don't get the segfault if I do
  the same on an armv7h chroot for some reason.

  Here is where the error occured: https://travis-
  ci.com/github/VDR4Arch/vdr4arch/jobs/309106220#L5420

  Maybe now I'll just try to remove all uses of svn in my build
  scripts...

  Is it actually a viable solution to cross-build with qemu? I'm
  starting to doubt it...

  Would it help if I manage to get this core dump out of Travis somehow
  (maybe make Travis push it to some GIT or upload it to my webserver)?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1869782/+subscriptions

