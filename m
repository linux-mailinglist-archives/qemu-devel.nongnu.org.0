Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C305D3D02A6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:27:27 +0200 (CEST)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5wKs-0001yk-8Y
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1m5wJF-000145-Hl
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:25:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:46694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1m5wJ9-0002TP-FU
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:25:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m5wJ2-0006Tq-C8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 20:25:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 59B882E8058
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 20:25:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Jul 2021 20:19:28 -0000
From: Peter Maydell <1936977@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell zciendor
X-Launchpad-Bug-Reporter: Zcien Dor (zciendor)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <162681142813.6143.7922843178682490590.malonedeb@wampee.canonical.com>
Message-Id: <162681236846.6607.6921445541840314086.malone@chaenomeles.canonical.com>
Subject: [Bug 1936977] Re: qemu-arm-static crashes "segmentation fault" when
 running "git clone" 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9c0cb2d219338e530974f0e5d7d00aa1bf8a7de3"; Instance="production"
X-Launchpad-Hash: 8bbc1156240ca3583e61db32fd9568db195761a8
Received-SPF: none client-ip=91.189.90.7; envelope-from=noreply@launchpad.net;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1936977 <1936977@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the upstream QEMU bug tracker, not an Ubuntu specific tracker;
if you'd like Ubuntu to consider a backport of something, please file a
bug with them.


** Changed in: qemu
       Status: New =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1936977

Title:
   qemu-arm-static crashes "segmentation fault" when running "git clone"

Status in QEMU:
  Invalid

Bug description:
  This is a reopen of #1869073 for `qemu-user-static/focal-
  updates,focal-security,now 1:4.2-3ubuntu6.17 amd64`.

  `git clone` reproducably segfaults in `qemu-arm-static` chroot.

  #1869073 mentions this should have been fixed for newer versions of
  QEMU, but for `focal` there's no newer version available, even in
  `focal-backports`.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1936977/+subscriptions


