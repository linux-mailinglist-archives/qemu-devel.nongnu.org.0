Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF572B5093
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:12:25 +0100 (CET)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejvM-0004Fd-Fk
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kejVj-000765-Go
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:45:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:47580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kejVf-0002PC-Ll
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:45:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kejVe-0004MK-2j
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:45:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 08D1A2E812F
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:45:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2020 18:37:10 -0000
From: Thomas Huth <1784919@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Tags: wishlist
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: zem-g
X-Launchpad-Bug-Reporter: Hans (zem-g)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153314732349.28680.8240678335924309425.malonedeb@chaenomeles.canonical.com>
Message-Id: <160555183189.18318.16281629286594966688.launchpad@wampee.canonical.com>
Subject: [Bug 1784919] Re: native libgfapi glusterfs support for virtio 9p
 filesystem passthrough
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 4b2ae943367fb99f221a10dc031498876134c92f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:11:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1784919 <1784919@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
   Importance: Undecided =3D> Wishlist

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1784919

Title:
  native libgfapi  glusterfs support for virtio 9p filesystem
  passthrough

Status in QEMU:
  New

Bug description:
  I can add block devices on glusterfs natively to my virtual machines sinc=
e qemu 1.3 =

  I would like to see the same feature for virtio 9p filesystems added on m=
y VM. =


  Accessing a filesystem mounted on the Metal is my favorite solution
  for storage that is to be shared between more than one VM. But because
  my VMs are not running as root, they are not able to passthrough
  userids and gids to gluster-fuse. uid mapping is also not possible
  because no xattr support.

  So all I can do is either setting up seperate NFS Servers to bring the
  Filesystem in via Network, or to start qemu as root or to add
  fuse_xattr on top of glusterfs_fuse. I do expect however that the
  fastest and most relieable solution is to make something like this
  possible:

  -fsdev
  local,id=3Dtest_dev,path=3Dgluster://this.node/test_mount,security_model=
=3Dpassthrough
  -device virtio-9p-pci,fsdev=3Dtest_dev,mount_tag=3Dtest_mount

  regards

      Hans

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1784919/+subscriptions

