Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9ED374F21
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:03:06 +0200 (CEST)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leX6H-0000Jg-VK
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leX4V-0007FX-UL
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:01:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:44074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leX4Q-0003I2-EI
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:01:15 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leX4O-0006w0-S5
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:01:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D343B2E8136
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 06:01:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 05:53:53 -0000
From: Thomas Huth <1864984@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kraxel-redhat th-huth valentin.david
X-Launchpad-Bug-Reporter: Valentin David (valentin.david)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158279885836.19592.16795975857735049927.malonedeb@chaenomeles.canonical.com>
Message-Id: <162028043391.6519.15140265804789335422.malone@wampee.canonical.com>
Subject: [Bug 1864984] Re: "nr_entries is too big" when using virgl
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 3e3e99a6517af4557470628dc235b0f7290293e1
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
Reply-To: Bug 1864984 <1864984@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1864984

Title:
  "nr_entries is too big" when using virgl

Status in QEMU:
  Incomplete

Bug description:
  I have a bootable image where GNOME Shell fails because it hits a
  limit in virtio-gpu.

  In `hw/display/virtio-gpu.c`, there is a limit for `nr_entries` at
  16384. There is no explanation for that limit. But there does not seem
  to be any limit on the kernel side.

  Raising this limit with a patch to 262144 solves the issue.

  Could there be an explanation why this limit is needed? And why this
  value? Or could this limit be just removed?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1864984/+subscriptions

