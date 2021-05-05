Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE5637393F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:24:01 +0200 (CEST)
Received: from localhost ([::1]:45396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFdH-0006E6-2q
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFaO-0003HA-Jx
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:21:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:48224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFaM-0007hg-SL
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:21:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leFaL-00008X-MM
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:20:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A1F272E8188
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:20:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:10:34 -0000
From: Thomas Huth <1810343@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: m1sports20 th-huth
X-Launchpad-Bug-Reporter: Michael (m1sports20)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154646865471.19335.9147642402365656970.malonedeb@soybean.canonical.com>
Message-Id: <162021303433.4018.12390206336042222306.malone@gac.canonical.com>
Subject: [Bug 1810343] Re: qemu-nbd -l and -s options don't work together
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 73e9f4be261b2a6e9a4f29b4cded61f8e1ee6dd6
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
Reply-To: Bug 1810343 <1810343@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/159


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #159
   https://gitlab.com/qemu-project/qemu/-/issues/159

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1810343

Title:
  qemu-nbd -l and -s options don't work together

Status in QEMU:
  Expired

Bug description:
  When using qemu-nbd with -l to load a snapshot along with -s to create
  new active layer the tool fails to find the snapshot specified on the
  command line:

  For example the following does not work:
    sudo qemu-nbd -s --load-snapshot=3Dfiles  --connect /dev/nbd0 rootfs.qc=
ow2                                   =

    Failed to load snapshot: Can't find snapshot

  However, the following option works
    sudo qemu-nbd -s --connect /dev/nbd0 rootfs.qcow2
  and so does
    sudo qemu-nbd --load-snapshot=3Dfiles  --connect /dev/nbd0 rootfs.qcow2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1810343/+subscriptions

