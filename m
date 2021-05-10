Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BD3379767
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:08:21 +0200 (CEST)
Received: from localhost ([::1]:58072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBGP-00078N-17
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgBDu-0004Ot-Kj
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:05:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:42810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgBDs-0003DI-Ko
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:05:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgBDq-0001ZW-JY
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:05:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8CBF22E8030
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:05:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 18:56:56 -0000
From: Thomas Huth <1907776@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: vfat
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth user4592
X-Launchpad-Bug-Reporter: John Doe (user4592)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160767424861.11774.3900541063456386240.malonedeb@wampee.canonical.com>
Message-Id: <162067301670.17080.13777180234710104761.malone@soybean.canonical.com>
Subject: [Bug 1907776] Re: Mounting VFat drive yields error messages.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 6451627f9ab5ebd34a57e68097a2870abd43ff37
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907776

Title:
  Mounting VFat drive yields error messages.

Status in QEMU:
  Incomplete

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

