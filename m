Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7953C32C6
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 06:28:13 +0200 (CEST)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m24b5-0001nu-Pr
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 00:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Z7-0007nb-K8
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:44890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Z5-0000RV-0F
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m24Yx-0003vn-4j
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:25:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2F1582E81A5
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:25:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 04:17:36 -0000
From: Launchpad Bug Tracker <1907776@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: vfat
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth user4592
X-Launchpad-Bug-Reporter: John Doe (user4592)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160767424861.11774.3900541063456386240.malonedeb@wampee.canonical.com>
Message-Id: <162589065705.5654.18212181729476645751.malone@loganberry.canonical.com>
Subject: [Bug 1907776] Re: Mounting VFat drive yields error messages.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 8e766735f60cda3bbae03be228cc2343a6178323
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907776

Title:
  Mounting VFat drive yields error messages.

Status in QEMU:
  Expired

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

