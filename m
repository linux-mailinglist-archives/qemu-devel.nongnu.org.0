Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCF6367867
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:14:04 +0200 (CEST)
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQj5-0007Vk-S4
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQfA-0004so-KR
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:10:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:42366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQf7-0001LS-Lu
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:10:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZQf3-0005ap-Mz
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:09:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A9B782E8160
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:09:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 03:56:27 -0000
From: Thomas Huth <1184089@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mncoppola stefanha th-huth
X-Launchpad-Bug-Reporter: Michael Coppola (mncoppola)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20130525082911.27253.67454.malonedeb@gac.canonical.com>
Message-Id: <161906378728.6989.2254846965445716860.malone@chaenomeles.canonical.com>
Subject: [Bug 1184089] Re: [Feature request] loadvm snapshot as read-only
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: b1b1d23526f263a5aee40fcfe9cb4a21c00b442b
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
Reply-To: Bug 1184089 <1184089@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1184089

Title:
  [Feature request] loadvm snapshot as read-only

Status in QEMU:
  Incomplete

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

