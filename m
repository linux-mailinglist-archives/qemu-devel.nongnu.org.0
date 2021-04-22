Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B23D367ACE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:18:18 +0200 (CEST)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTbN-0001GM-81
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTZS-0007sh-Uu
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:16:19 -0400
Received: from indium.canonical.com ([91.189.90.7]:36236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTZD-0003gq-S6
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:16:17 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTZ9-0004IE-Qt
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:15:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CA8F12E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:15:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:07:56 -0000
From: Thomas Huth <1837347@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm raspi2 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aditya-govardhan th-huth
X-Launchpad-Bug-Reporter: Aditya Govardhan (aditya-govardhan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156377129036.14702.8663571503299830535.malonedeb@wampee.canonical.com>
Message-Id: <161907527626.6939.5169221180131331421.malone@chaenomeles.canonical.com>
Subject: [Bug 1837347] Re: guest userspace process core dump after raspi2
 kernel boot
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: c71ff3aa15a2d8fc40dbf1a71bfadfa26d1e88a7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1837347 <1837347@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1837347

Title:
  guest userspace process core dump after raspi2 kernel boot

Status in QEMU:
  Incomplete

Bug description:
  Host info:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  x86-64, Ubuntu 18.04, QEMU 4.0.0 (downloaded tarball from main site)

  Guest info:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  ARM7l, Raspbian OS off the main raspberry pi site

  QEMU command:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  qemu-system-arm -M raspi2 -kernel bootpart/kernel7.img -dtb bootpart/bcm2=
709-rpi-2-b.dtb -drive file=3D2019-07-10-raspbian-buster.img,format=3Draw,i=
f=3Dsd -append "rw earlyprintk console=3DttyAMA0,115200 fsck.repair=3Dyes r=
ootwait memtest=3D1 loglevel=3D8 dwc_otg.lpm_enable=3D0 root=3D/dev/mmcblk0=
p2" -serial stdio

  kernel7.img and bcm2709-rpi-2-b.dtb were obtained by the following
  commands:

  guestfish --ro -a 2019-07-10-raspbian-buster.img -m /dev/sda1
  ><fs> copy-out / bootpart/
  ><fs> quit

  Output:
  =3D=3D=3D=3D=3D=3D=3D

  https://pastebin.com/fL1eXhV0

  References:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemu=
s-32-bit-arm-virt-board/
  https://translatedcode.wordpress.com/2018/04/25/debian-on-qemus-raspberry=
-pi-3-model/

  =

  The core dump error can occur at both times, before logging in and after =
logging in, in this case I have given the output after logging in to show t=
he initial processes running.

  Also please let me know if I using any kernel flags incorrectly

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1837347/+subscriptions

