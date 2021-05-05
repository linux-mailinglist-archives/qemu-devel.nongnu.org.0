Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8D3373644
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:28:37 +0200 (CEST)
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCtY-0001H9-99
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leCrA-000839-FI
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:26:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:40238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leCr8-0006Cp-E4
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:26:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leCr6-0003vr-SF
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 08:26:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D22732E8010
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 08:26:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 08:19:43 -0000
From: Thomas Huth <1770859@bugs.launchpad.net>
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
References: <152613876246.1025.17904458639014473926.malonedeb@gac.canonical.com>
Message-Id: <162020278355.15318.2155175498648714792.malone@soybean.canonical.com>
Subject: [Bug 1770859] Re: qemu-img compare -m option is missing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 4c404fd8b8e805b041662d11494aa904fe92ff28
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
Reply-To: Bug 1770859 <1770859@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/152


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #152
   https://gitlab.com/qemu-project/qemu/-/issues/152

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1770859

Title:
  qemu-img compare -m option is missing

Status in QEMU:
  Expired

Bug description:
  Comparing images using multiple streams (like qemu-img convert) maybe
  effectively sped up when one of the images (or both) is RBD. qemu-img
  convert does it's job perfectly while converting. Please implement the
  same for image comparison. Since operations are read-only, -W is
  useless, but may be introduced as well for debugging/performance
  purposes.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1770859/+subscriptions

