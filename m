Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8D01C97D4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 19:33:14 +0200 (CEST)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWkOX-0007ZB-C3
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 13:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWkMF-0005PD-AL
 for qemu-devel@nongnu.org; Thu, 07 May 2020 13:30:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:40490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWkMC-000873-Um
 for qemu-devel@nongnu.org; Thu, 07 May 2020 13:30:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jWkMA-0008Sk-34
 for <qemu-devel@nongnu.org>; Thu, 07 May 2020 17:30:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 15DA32E8111
 for <qemu-devel@nongnu.org>; Thu,  7 May 2020 17:30:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 07 May 2020 17:18:30 -0000
From: Bump <1877418@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=btrfs-progs; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bump55
X-Launchpad-Bug-Reporter: Bump (bump55)
X-Launchpad-Bug-Modifier: Bump (bump55)
References: <158887096525.4808.16857448132122344597.malonedeb@soybean.canonical.com>
Message-Id: <158887191032.13979.5500835867064425269.malone@gac.canonical.com>
Subject: [Bug 1877418] Re: qemu-nbd freezes access to VDI file
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6f70e07b901ff06dbcbec9177ffea11b2cdc121f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 13:10:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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

** Attachment added: "dmesg-bug-qemu-nbd-btrfs-vdi.txt"
   https://bugs.launchpad.net/qemu/+bug/1877418/+attachment/5367895/+files/=
dmesg-bug-qemu-nbd-btrfs-vdi.txt

** Also affects: btrfs-progs (Ubuntu)
   Importance: Undecided
       Status: New

** Description changed:

  Mounted Oracle Virtualbox .vdi drive (dynamically allocated), which has G=
TP+BTRFS:
  sudo modprobe nbd max_part=3D16
  sudo qemu-nbd -c /dev/nbd0 /storage/btrfs.vdi
+ mount /dev/nbd0p1 /mydata/
  =

  Then I am operating on the btrfs filesystem and suddenly it freezes.

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

