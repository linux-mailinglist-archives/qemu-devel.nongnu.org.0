Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E276370E7B
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:32:01 +0200 (CEST)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldGsq-0003yG-8J
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGi3-0004sT-7R
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:20:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:44696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGhz-00068s-LZ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:20:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldGhw-0000Ph-Fv
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:20:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5EB3C2E815F
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 18:20:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 18:15:20 -0000
From: Thomas Huth <1856834@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: powerpc ppc softmmu virtio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andree182 ecsdn laurent-vivier th-huth
X-Launchpad-Bug-Reporter: ecsdn (ecsdn)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157666458990.14847.6716769636962803095.malonedeb@wampee.canonical.com>
Message-Id: <161997932014.3774.10217529302815943383.malone@chaenomeles.canonical.com>
Subject: [Bug 1856834] Re: PCI broken in qemu ppc e500 in v2.12.0 and other
 versions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: e81e0ddf4847687ead1e3e2dfc387dfda6aebb54
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1856834 <1856834@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1856834

Title:
  PCI broken in qemu ppc e500 in v2.12.0 and other versions

Status in QEMU:
  Incomplete

Bug description:
  The same qemu -M mpc... command that works on qemu-system-ppc version
  2.8.0 freezes guest on bootup and shows error for qemu-system-ppc
  version 4.2.0release and 4.19dirtygit:

  qemu-system-ppc: virtio-blk failed to set guest notifier (-24), ensure -a=
ccel kvm is set.
  qemu-system-ppc: virtio_bus_start_ioeventfd: failed. Fallback to userspac=
e (slower).

  ends/freezes at:
  nbd: registered device at major 43
  =C2=A0vda:

  I'm using -drive file=3D/home/me/rawimage.dd,if=3Dvirtio and works fine in
  version 2.8.0 installed with apt-get install (Ubuntu 17.04) and also
  with 2.8.0 official release from git/github that I compiled/built
  myself. But both of the newer releases fail on the same exact machine
  same config.

  I also noticed that qemu-2.8.0 was fine with mtd but the newer ones I tri=
ed weren't, ie gave
  qemu-system-ppc: -drive if=3Dmtd: machine type does not support if=3Dmtd,=
bus=3D0,unit=3D0
  (but I removed -drive if=3Dmtd since wasn't using it anyway)

  I also tried on windows but I think virtio doesn't work on windows
  hosts at all? On windows host it fails the same way, even version 2.12
  as well as 4.1.10...

  used:
  ./configure --prefix=3D/opt/... --enable-fdt --enable-kvm --enable-debug

  (basically all steps the same on same exact system same config, yet
  2.8.0 works fine whether apt-get installed or built from source while
  the others I built, 4.19/4.2.0 or 2.12/4.1.10(win) don't.)

  In case newer qemu versions act weird on various kernels, I did try with =
both vmlinuz-4.10.0-19-generic and vmlinuz-4.13.12-041312-generic (I didn't=
 compile them but I can provide config-..files. This is on Ubuntu 17.04 x86=
_64 host emulating e500v2 cpm guest, ie -M mpc... GUEST kernel 2.6.32.44 wh=
ich is why I can't use -M ppce500 instead..)
  tx
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ecs

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856834/+subscriptions

