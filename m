Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E061E8703
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 20:56:48 +0200 (CEST)
Received: from localhost ([::1]:57424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jekBQ-0002nt-St
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 14:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jekAO-0002Mo-Vg
 for qemu-devel@nongnu.org; Fri, 29 May 2020 14:55:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jekAN-0003kn-R2
 for qemu-devel@nongnu.org; Fri, 29 May 2020 14:55:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jekAL-0003dh-NV
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 18:55:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A69A92E8109
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 18:55:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2020 18:49:35 -0000
From: John Snow <1877418@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <158887096525.4808.16857448132122344597.malonedeb@soybean.canonical.com>
Message-Id: <159077817604.5613.14037171067291891424.malone@wampee.canonical.com>
Subject: [Bug 1877418] Re: qemu-nbd freezes access to VDI file
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="275d46a24253e557e4403d52832837e4bfa425b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4f47f4c82c0d3e539745350a48f00bb1db41dceb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 14:55:38
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

I agree, the program doesn't stop you from doing such things. It should
work without error, but it might be slow. Just offering some advice you
may not want to use it like this.

Try to reproduce with qcow2 and qemu-nbd to see if the problem is with
our support of the disk image format or if it's a problem with e.g. the
access patterns and qemu-nbd itself, for instance.

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

