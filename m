Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3119C3755DF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:46:50 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefH7-0002MH-7V
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lefEM-0000am-1X
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:43:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:36324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lefEJ-0005df-99
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:43:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lefEF-0001Aj-8X
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 14:43:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 40F9B2E82EB
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 14:43:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 14:33:51 -0000
From: Thomas Huth <1876568@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: manuel-reimer th-huth
X-Launchpad-Bug-Reporter: Manuel Reimer (manuel-reimer)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158850298589.4878.18034033813424107508.malonedeb@chaenomeles.canonical.com>
Message-Id: <162031163155.4018.4459792298560213257.malone@gac.canonical.com>
Subject: [Bug 1876568] Re: "semtimedop" implementation missing in qemu?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: f2e019fbb9b66c7e97b0e2c9ae2a878942fa3a43
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
Reply-To: Bug 1876568 <1876568@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1876568

Title:
  "semtimedop" implementation missing in qemu?

Status in QEMU:
  Incomplete

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

