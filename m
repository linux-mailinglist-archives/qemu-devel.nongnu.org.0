Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC652DCD02
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 08:37:24 +0100 (CET)
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpnql-0001Zj-Nv
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 02:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpnpB-00018p-PK
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:35:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:59540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpnp9-0006JH-B8
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:35:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kpnp7-0006Zt-4y
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 07:35:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D97FF2E813B
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 07:35:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Dec 2020 07:29:01 -0000
From: John Doe <1907776@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: vfat
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: user4592
X-Launchpad-Bug-Reporter: John Doe (user4592)
X-Launchpad-Bug-Modifier: John Doe (user4592)
References: <160767424861.11774.3900541063456386240.malonedeb@wampee.canonical.com>
Message-Id: <160819014106.15965.17521721574393880948.malone@soybean.canonical.com>
Subject: [Bug 1907776] Re: Mounting VFat drive yields error messages.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a68a6d599c812dd1dd335307d9c5c017c50ba81b"; Instance="production"
X-Launchpad-Hash: 01d9f5d4ef959c32bf4d2642f039ecb4c788c2f5
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
Reply-To: Bug 1907776 <1907776@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have just noticed that the error does not appear when mounting the
VFat drive in the installed instance of Arch Linux. The reported error
messages occurred when using the "LiveUSB".

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907776

Title:
  Mounting VFat drive yields error messages.

Status in QEMU:
  New

Bug description:
  Mounting a virtual Fat drive results in error messages (see attached
  image).

  * https://www.qemu.org/docs/master/system/images.html#virtual-fat-
  disk-images

  The "drive" is however mounted, and as a test, saving a text file to
  the drive is successfully stored in the directory `/tmp`, which can be
  read after shutdown of Qemu.

      Archlinux 5.9.11-arch2-1 (64-bit)
      qemu-headless 5.1.0-3
    =

      qemu-system-x86_64 -boot order=3Dd -name test \
        -enable-kvm -m 2G -cpu host -k sv \
        -daemonize \
        -drive if=3Dpflash,format=3Draw,readonly,file=3D/usr/share/edk2-ovm=
f/x64/OVMF_CODE.fd \
        -drive if=3Dpflash,format=3Draw,file=3D~/vm/OVMF_VARS.local.fd \
        -drive if=3Dide,format=3Draw,media=3Ddisk,index=3D1,file=3Dfat:rw:/=
tmp \
        -vnc :1 \
        -cdrom /obj/archlinux/release/2020.10.01-x86_64.iso \
        -drive format=3Draw,index=3D0,media=3Ddisk,file=3D~/vm/qemu.raw

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907776/+subscriptions

