Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584CB3BC5AB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:42:51 +0200 (CEST)
Received: from localhost ([::1]:46002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cv4-0002fc-Cr
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfq-000130-PH
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:27:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:53370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfo-0003bC-Ti
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:27:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfa-0004xA-V6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3D7DD2E82C3
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1864984@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor kraxel-redhat th-huth valentin.david
X-Launchpad-Bug-Reporter: Valentin David (valentin.david)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158279885836.19592.16795975857735049927.malonedeb@chaenomeles.canonical.com>
Message-Id: <162554503853.7821.11424351455615469599.malone@loganberry.canonical.com>
Subject: [Bug 1864984] Re: "nr_entries is too big" when using virgl
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 3fd6208efc20f3a704cb0d783aba58372e1e4aa4
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1864984

Title:
  "nr_entries is too big" when using virgl

Status in QEMU:
  Expired

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

