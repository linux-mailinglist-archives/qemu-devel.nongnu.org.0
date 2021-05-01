Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0775F37066B
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 10:22:28 +0200 (CEST)
Received: from localhost ([::1]:39400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcktP-0004o5-3N
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 04:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lckro-0003Wg-Vz
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:20:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:43908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lckrl-0004ps-L4
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:20:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lckrk-0003uJ-BO
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 08:20:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3EA952E815B
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 08:20:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 08:13:46 -0000
From: Thomas Huth <1749223@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: roland-micite th-huth zlice0
X-Launchpad-Bug-Reporter: zlice (zlice0)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151853690975.29423.7587323391423810191.malonedeb@chaenomeles.canonical.com>
Message-Id: <161985682638.14281.10074644799501404787.malone@wampee.canonical.com>
Subject: [Bug 1749223] Re: mouse offset or invisible wall 2.11.0-3 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: ff1c1e9657f1d8239197778318769b969c2bfd08
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
Reply-To: Bug 1749223 <1749223@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/72


** Changed in: qemu
       Status: Incomplete =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #72
   https://gitlab.com/qemu-project/qemu/-/issues/72

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1749223

Title:
  mouse offset or invisible wall 2.11.0-3

Status in QEMU:
  Expired

Bug description:
  (There was another post, I'm not sure if it is related though. Also
  not sure if it's Arch related, I wouldn't be surprised as I normally
  use Gentoo and have less problems with Gentoo.)

  =

  qemu-system-x86_64 -enable-kvm -M q35 -cpu host -m 8192 -vga vmware -smp =
4,sockets=3D1,cores=3D4,threads=3D1 -drive file=3D/path/to/my.img,if=3Dvirt=
io -soundhw ac97 -usb -monitor unix:/tmp/qemu-mon,server,nowait -usb --usbd=
evice host:0000:ffff -device vfio-pci,host=3D00:00.0 -alt-grab &


  When I grab the mouse in/out of the VM I tend to get an "invisible wall" =
half of the time.
  I can push past if I fling the mouse through it but not if I slowly keep =
moving down.

  The direction always seems to be down when I hit a wall (so a Y offset? m=
aybe?)
  This has been happening since at least version 2.10.

  Not sure if "-alt-grab" has anything to do with it, that'd be my first
  guess.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1749223/+subscriptions

