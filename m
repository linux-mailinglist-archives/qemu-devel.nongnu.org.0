Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6E7377726
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:12:24 +0200 (CEST)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfl6V-00061G-3Y
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfl5G-0004aA-Nk
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:11:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:55422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfl4x-0002nB-Cl
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:11:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfl4w-0000Ci-67
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:10:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2219A2E805D
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:10:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:04:25 -0000
From: Thomas Huth <1751674@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm dump memory pmemsave segfault
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gmoreira pmaydell th-huth
X-Launchpad-Bug-Reporter: Gustavo Moreira (gmoreira)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151960470707.11772.10064243852456470443.malonedeb@gac.canonical.com>
Message-Id: <162057266545.2821.10303428125463218730.malone@wampee.canonical.com>
Subject: [Bug 1751674] Re: qemu-system-arm segmentation fault using pmemsave
 on the interrupt controller registers
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 6a9736e9e5a676baabad0ec983dcb12425445c55
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1751674 <1751674@bugs.launchpad.net>
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
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1751674

Title:
  qemu-system-arm segmentation fault using pmemsave on the interrupt
  controller registers

Status in QEMU:
  Incomplete

Bug description:
  Qemu segfaults trying to generate a VM memory dump:

  $ QEMU_AUDIO_DRV=3Dnone qemu-git-src/arm-softmmu/qemu-system-arm -M vexpr=
ess-a9 -smp 4 -m 1024 -machine secure=3Doff,dump-guest-core=3Don -kernel li=
nux-4.9.75/arch/arm/boot/zImage -append "root=3D/dev/mmcblk0 rw rootfstype=
=3Dext4 mem=3D1024M net.ifnames=3D0 console=3DttyAMA0" -dtb vexpress-v2p-ca=
9.dtb -sd armv7-hd.qcow2 -netdev tap,ifname=3Dtap_armv7,script=3Dno,downscr=
ipt=3Dno,id=3Dnet0 -device virtio-net-device,mac=3D00:AA:AD:BB:FF:02,netdev=
=3Dnet0  -monitor stdio -serial vc  -loadvm SS0
  QEMU 2.11.50 monitor - type 'help' for more information
  (qemu) pmemsave 0 0x3FFFFFFF memory.dmp
  Segmentation fault (core dumped)

  $ git rev-parse HEAD
  b384cd95eb9c6f73ad84ed1bb0717a26e29cc78f

  It's the second time I try to submit this bug, I think last time it
  failed because the attached core dump size (400M compressed). Have a
  look if you can get that file, otherwise I will try to update this
  ticket once it's created:

  (Error ID: OOPS-65553b72bc14be693eb1e37814ff9267)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1751674/+subscriptions

