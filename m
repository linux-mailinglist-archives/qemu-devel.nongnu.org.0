Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A64738185C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:35:09 +0200 (CEST)
Received: from localhost ([::1]:42982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsZY-0007hP-L1
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsQX-0008RF-EY
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:25:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:56986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsQM-00071u-Hv
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:25:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhsQK-0002HZ-Hh
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:25:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7E1D02E8135
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:25:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 11:18:17 -0000
From: Thomas Huth <1925966@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ivanvx th-huth
X-Launchpad-Bug-Reporter: Ivan Vulovic (ivanvx)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161920704602.4113.8465349284150396504.malonedeb@gac.canonical.com>
Message-Id: <162107749797.995.17546533685210571283.malone@wampee.canonical.com>
Subject: [Bug 1925966] Re: Win10 guest freezes randomly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 342a1155572b93531d69b4a7873f06a05e67d3d4
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
Reply-To: Bug 1925966 <1925966@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1925966

Title:
  Win10 guest freezes randomly

Status in QEMU:
  Incomplete

Bug description:
  In addition to bug #1916775, my Win10 Home guest freezes randomly and
  infrequently. Unlike bug =E2=80=8B#1916775, this is unrecoverable and I s=
ee on
  the host (Debian 4.19.171-2) via iotop that all disk IO has stopped.
  My only recourse is a hard reset of the guest.

  My setup uses PCI-pass-through graphics (GTX 1650), host cpu (Ryzen 7
  3800XT). It seems to occur more frequently (every few hours) after
  switching from "kvm=3Doff,vendor=3DGenuineIntel" to "kvm=3Don" and maybe
  using 3 monitors rather than 2 on the pass-through graphics card
  further increases frequency. The switch to "kvm=3Don" was necessary to
  enable nested virtualization, which now works. It occurs whether or
  not I use the qcow disk drive.

  qemu-system-x86_64
  =C2=A0=C2=A0-cpu host,kvm=3Don,l3-cache=3Don,hv_relaxed,hv_vapic,hv_time,=
hv_spinlocks=3D0x1fff,hv_vendor_id=3Dhv_dummy
  =C2=A0=C2=A0-smp 8
  =C2=A0=C2=A0-rtc clock=3Dhost,base=3Dlocaltime
  =C2=A0=C2=A0-machine type=3Dq35,accel=3Dkvm,kernel_irqchip=3Don
  =C2=A0=C2=A0-enable-kvm
  =C2=A0=C2=A0-drive if=3Dpflash,format=3Draw,readonly,file=3D/usr/share/OV=
MF/OVMF_CODE.fd
  =C2=A0=C2=A0-drive if=3Dpflash,format=3Draw,file=3D/tmp/OVMF_VARS.fd
  =C2=A0=C2=A0-m 32G
  =C2=A0=C2=A0-usb
  =C2=A0=C2=A0-device usb-tablet
  =C2=A0=C2=A0-vga none
  =C2=A0=C2=A0-serial none
  =C2=A0=C2=A0-parallel none
  =C2=A0=C2=A0-boot cd
  =C2=A0=C2=A0-nographic
  =C2=A0=C2=A0-device usb-host,vendorid=3D0x045e,productid=3D0x00db
  =C2=A0=C2=A0-device usb-host,vendorid=3D0x1bcf,productid=3D0x0005
  =C2=A0=C2=A0-drive id=3Ddisk0,index=3D0,format=3Dqcow2,if=3Dvirtio,cache=
=3Doff,file=3D./win10_boot_priv.qcow2
  =C2=A0=C2=A0-drive id=3Ddisk2,index=3D2,aio=3Dnative,cache.direct=3Don,if=
=3Dvirtio,cache=3Doff,format=3Draw,discard=3Dunmap,detect-zeroes=3Dunmap,fi=
le=3D/dev/vg0/win10_hdpriv
  =C2=A0=C2=A0-device vfio-pci,host=3D09:00.0,addr=3D0x02.0x0,multifunction=
=3Don
  =C2=A0=C2=A0-device vfio-pci,host=3D09:00.1,addr=3D0x02.0x1
  =C2=A0=C2=A0-device vfio-pci,host=3D09:00.2,addr=3D0x02.0x2
  =C2=A0=C2=A0-device vfio-pci,host=3D09:00.3,addr=3D0x02.0x3
  =C2=A0=C2=A0-netdev tap,id=3Dnetid,ifname=3Dtaplan,script=3Dno,downscript=
=3Dno
  =C2=A0=C2=A0-device e1000,netdev=3Dnetid,mac=3D52:54:00:01:02:03

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1925966/+subscriptions

