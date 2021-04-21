Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E386936658A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 08:39:10 +0200 (CEST)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ6Vx-0004hC-VS
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 02:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZ6Sk-0002g7-DR
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 02:35:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:46886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZ6SZ-0005MH-Ud
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 02:35:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZ6SY-0001W2-K7
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 06:35:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9561A2E8024
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 06:35:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Apr 2021 06:26:20 -0000
From: Thomas Huth <1749223@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: roland-micite th-huth zlice0
X-Launchpad-Bug-Reporter: zlice (zlice0)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151853690975.29423.7587323391423810191.malonedeb@chaenomeles.canonical.com>
Message-Id: <161898638014.6193.17933337672492053584.malone@chaenomeles.canonical.com>
Subject: [Bug 1749223] Re: mouse offset or invisible wall 2.11.0-3 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 1b7c377ea5d944c0c2d7a02567e2f315ebef06d9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1749223 <1749223@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1749223

Title:
  mouse offset or invisible wall 2.11.0-3

Status in QEMU:
  Incomplete

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

