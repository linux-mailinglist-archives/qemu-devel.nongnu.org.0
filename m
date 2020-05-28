Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F881E7069
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 01:27:02 +0200 (CEST)
Received: from localhost ([::1]:35304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeRvR-0006oT-2b
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 19:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jeRuN-0006Ny-DU
 for qemu-devel@nongnu.org; Thu, 28 May 2020 19:25:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:48446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jeRuM-0004VJ-9A
 for qemu-devel@nongnu.org; Thu, 28 May 2020 19:25:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jeRuJ-0003XR-3H
 for <qemu-devel@nongnu.org>; Thu, 28 May 2020 23:25:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0DF842E812B
 for <qemu-devel@nongnu.org>; Thu, 28 May 2020 23:25:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2020 23:15:35 -0000
From: Bump <1877418@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=btrfs-progs; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bump55 jnsnow
X-Launchpad-Bug-Reporter: Bump (bump55)
X-Launchpad-Bug-Modifier: Bump (bump55)
References: <158887096525.4808.16857448132122344597.malonedeb@soybean.canonical.com>
Message-Id: <159070773586.30151.237885615119639070.malone@chaenomeles.canonical.com>
Subject: [Bug 1877418] Re: qemu-nbd freezes access to VDI file
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="275d46a24253e557e4403d52832837e4bfa425b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: af657c262bcab17bbfdf648916c311c959d3847b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 18:25:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1877418 <1877418@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I thought there were qemu-img for that. Since qemu-nbd allows mounting
images a rw block devices, it's logical to think that you can use it for
that purpose. Will try to reproduce again the issue in case it was a
kernel problem instead of qemu-nbd.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877418

Title:
  qemu-nbd freezes access to VDI file

Status in QEMU:
  New
Status in btrfs-progs package in Ubuntu:
  New

Bug description:
  Mounted Oracle Virtualbox .vdi drive (dynamically allocated), which has G=
TP+BTRFS:
  sudo modprobe nbd max_part=3D16
  sudo qemu-nbd -c /dev/nbd0 /storage/btrfs.vdi
  mount /dev/nbd0p1 /mydata/

  Then I am operating on the btrfs filesystem and suddenly it freezes.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877418/+subscriptions

