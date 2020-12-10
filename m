Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB22D5795
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:54:25 +0100 (CET)
Received: from localhost ([::1]:41564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIeW-0001f5-JF
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knII8-000652-74
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:31:16 -0500
Received: from indium.canonical.com ([91.189.90.7]:37992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knII6-00024j-6n
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:31:15 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knII4-0000Od-TK
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:31:12 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DBA862E8137
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:31:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:18:13 -0000
From: Thomas Huth <1893667@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=fedora; sourcepackage=qemu; component=None;
 status=Unknown; importance=Unknown; assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jnsnow ngompa13 th-huth
X-Launchpad-Bug-Reporter: Neal Gompa (ngompa13)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159888546236.27779.1997908478541755158.malonedeb@soybean.canonical.com>
Message-Id: <160759189405.16614.14420676906613068852.malone@chaenomeles.canonical.com>
Subject: [Bug 1893667] Re: Btrfs commands don't work when using user-space
 emulation of other architectures
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 3c87b3f174f29a10d42bfb658d0cef0adad06a5d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1893667 <1893667@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Released with QEMU v5.2.0.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1893667

Title:
  Btrfs commands don't work when using user-space emulation of other
  architectures

Status in QEMU:
  Fix Released
Status in qemu package in Fedora:
  Unknown

Bug description:
  Description of problem:
  When doing cross-arch builds with mock, it uses qemu-user-static under th=
e hood, and qemu-user-static lacks support for Btrfs ioctls to emulate so t=
hat btrfs(8) commands work correctly.

  This is especially important for being able to do cross-arch image
  builds.

  How reproducible:
  Always (on Fedora 33 with qemu-5.1.0-2.fc33)

  Steps to Reproduce:

  $ sudo dnf install mock qemu-user-static wget
  $ sudo usermod -a -G mock $USER
  $ newgrp mock
  $ mock --root fedora-rawhide-armhfp --install btrfs-progs util-linux
  $ mock --root fedora-rawhide-armhfp --chroot 'rm -f foo.img && dd if=3D/d=
ev/zero of=3Dfoo.img bs=3D1G count=3D1 && losetup /dev/loop9 foo.img &&  mk=
fs.btrfs /dev/loop9 && mkdir /foo && mount /dev/loop9 /foo && btrfs subvol =
create /foo/subvol && umount /foo && losetup -d /dev/loop9'

  =

  Actual results:
  Fails with errors like "ERROR: cannot create subvolume: Function not impl=
emented"

  Expected results:
  Succeeds and creates subvolumes properly.

  Additional info:
  There is a patch series from a few days ago to add support for many btrfs=
 ioctls which could fix this...

  https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg05594.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1893667/+subscriptions

