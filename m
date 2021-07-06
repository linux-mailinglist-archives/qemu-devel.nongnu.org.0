Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6B03BC596
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:35:34 +0200 (CEST)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0co1-0005Cx-Se
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfc-0000HW-2c
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:52166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfW-0003LP-Hc
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfI-0004xb-D9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0E53F2E83D0
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:37 -0000
From: Launchpad Bug Tracker <1876568@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor manuel-reimer th-huth
X-Launchpad-Bug-Reporter: Manuel Reimer (manuel-reimer)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158850298589.4878.18034033813424107508.malonedeb@chaenomeles.canonical.com>
Message-Id: <162554505765.7821.8640853520595661686.malone@loganberry.canonical.com>
Subject: [Bug 1876568] Re: "semtimedop" implementation missing in qemu?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 239572e3117ef3358985ac437c4b2bad259437db
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
Reply-To: Bug 1876568 <1876568@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1876568

Title:
  "semtimedop" implementation missing in qemu?

Status in QEMU:
  Expired

Bug description:
  I was trying to do an ARMv6 cross compile with qemu-user-static when I
  ran into this:

  https://travis-ci.com/github/VDR4Arch/vdr4arch/jobs/326884620#L1596

  I was close to giving up when I found the following:

  https://github.com/osrf/multiarch-docker-image-generation/issues/36

  Most important comment may be this one:

  https://github.com/osrf/multiarch-docker-image-
  generation/issues/36#issuecomment-610626796

  > The "correct" way to fix this does seem to be to implement
  semtimedop in qemu.

  I don't know how much involved the people, discussing there, are in
  the qemu development but I thought it may be a good idea to bring this
  to your attention. If this is already fixed (I haven't found any bug
  about "semtimedop"), then please just close this one and tell me in
  which version the fix will be included.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1876568/+subscriptions

