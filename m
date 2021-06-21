Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8070D3AE26D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:32:32 +0200 (CEST)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBbr-00045x-HK
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBZL-0008CQ-4L
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:29:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:38106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBZJ-0001cA-39
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:29:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvBZG-0003YL-I1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:29:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7C99F2E8088
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:29:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Jun 2021 04:17:36 -0000
From: Launchpad Bug Tracker <1184089@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mncoppola stefanha th-huth
X-Launchpad-Bug-Reporter: Michael Coppola (mncoppola)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20130525082911.27253.67454.malonedeb@gac.canonical.com>
Message-Id: <162424905685.11837.7303570061857383641.malone@loganberry.canonical.com>
Subject: [Bug 1184089] Re: [Feature request] loadvm snapshot as read-only
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: a887687a2d1deda31a15d48b6464de015c39bb59
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1184089 <1184089@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1184089

Title:
  [Feature request] loadvm snapshot as read-only

Status in QEMU:
  Expired

Bug description:
  There are many ways to take and manage snapshots in QEMU, but one main
  feature that's missing is the ability to 'loadvm' a LIVE snapshot and
  have all future changes redirected to a temporary file.  This would
  effectively be combining the -loadvm and -snapshot switches and make
  the snapshot read-only.  With this feature, users would be provided a
  "sandbox" and be able to start and restart the same live snapshot
  without corrupting the image in doing so.

  I found a lot of discussion about this topic on the mailing list years
  ago, including some patch submissions, but none of the conversations
  panned out.

  http://lists.gnu.org/archive/html/qemu-discuss/2011-10/msg00011.html
  http://copilotco.com/mail-archives/qemu.2008/msg00072.html
  http://web.archiveorange.com/archive/v/1XS1vcusGInZKG2e0ImX
  http://marc.info/?l=3Dqemu-devel&m=3D117191084713590

  What would it take for this feature to be added, and can we use the
  patches submitted by Eddie Kohler to enable this feature?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1184089/+subscriptions

