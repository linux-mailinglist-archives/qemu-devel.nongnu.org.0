Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387BC2B9C86
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 22:08:35 +0100 (CET)
Received: from localhost ([::1]:38694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfrAO-0001R8-Po
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 16:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfr2D-0004dd-PA
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:00:05 -0500
Received: from indium.canonical.com ([91.189.90.7]:50028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfr2B-00016B-Nh
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:00:05 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfr29-00035U-9k
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 21:00:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 44C472E813A
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 21:00:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2020 20:47:23 -0000
From: Thomas Huth <1390520@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=libvirt; component=main;
 status=Invalid; importance=Wishlist; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=trusty;
 sourcepackage=libvirt; component=main; status=Won't Fix; importance=Medium;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arges fifo++ guitarrero janitor jnsnow paelzer
 serge-hallyn stefan-kuhn-da th-huth
X-Launchpad-Bug-Reporter: wolfgang (guitarrero)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20141107160655.5759.49372.malonedeb@chaenomeles.canonical.com>
Message-Id: <160581884418.32137.12223757638619193621.malone@soybean.canonical.com>
Subject: [Bug 1390520] Re: virtual machine fails to start with connected audio
 cd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 0e0dcd0b3413f166a79b5860ae044079c3dec3d1
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
Reply-To: Bug 1390520 <1390520@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, since nobody seems to have capacity to work on this, it's
unlikely that this will ever be implemented in QEMU. Thus I'm closing
this as WontFix for now.

** Changed in: qemu
       Status: New =3D> Won't Fix

** Changed in: libvirt (Ubuntu)
       Status: Confirmed =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1390520

Title:
  virtual machine fails to start with connected audio cd

Status in QEMU:
  Won't Fix
Status in libvirt package in Ubuntu:
  Invalid
Status in libvirt source package in Trusty:
  Won't Fix

Bug description:
  when connecting a data cd with a virtual machine (IDE CDROM 1), the virtu=
al machine starts up and the data cd is accessable (for example to install =
software package or drivers),
  but connecting an audio cd the following error appears:

  -------------------------------------------------------------------------=
------------------------------------------------------
  cannot read header '/dev/sr0': Input/output error

  Traceback (most recent call last):
    File "/usr/share/virt-manager/virtManager/details.py", line 2530, in _c=
hange_config_helper
      func(*args)
    File "/usr/share/virt-manager/virtManager/domain.py", line 850, in hotp=
lug_storage_media
      self.attach_device(devobj)
    File "/usr/share/virt-manager/virtManager/domain.py", line 798, in atta=
ch_device
      self._backend.attachDevice(devxml)
    File "/usr/lib/python2.7/dist-packages/libvirt.py", line 493, in attach=
Device
      if ret =3D=3D -1: raise libvirtError ('virDomainAttachDevice() failed=
', dom=3Dself)
  libvirtError: cannot read header '/dev/sr0': Input/output error
  -------------------------------------------------------------------------=
---------------------------------------------------

  Description:    Ubuntu 14.04.1 LTS
  Release:        14.04

  qemu:
    Installiert:           2.0.0+dfsg-2ubuntu1.6
    Installationskandidat: 2.0.0+dfsg-2ubuntu1.6

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1390520/+subscriptions

