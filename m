Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F1367D2F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:06:37 +0200 (CEST)
Received: from localhost ([::1]:45440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVIC-0003u6-TL
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVE6-0000sQ-VU
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:02:22 -0400
Received: from indium.canonical.com ([91.189.90.7]:58698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVE4-00025w-C2
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:02:22 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZVE3-0004IB-8z
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:02:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3E9422E8026
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:02:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 08:50:48 -0000
From: Thomas Huth <1851547@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h marietto2008 th-huth
X-Launchpad-Bug-Reporter: Marietto (marietto2008)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157306426546.28368.6683622999323132409.malonedeb@chaenomeles.canonical.com>
Message-Id: <161908144839.6689.3166452466958692132.malone@chaenomeles.canonical.com>
Subject: [Bug 1851547] Re: qemu 4 crashes with this parameter attached -usb
 -device usb-host, hostbus=1, hostaddr=7 \
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 5c17c39845272096566042f08d21291b31be8595
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
Reply-To: Bug 1851547 <1851547@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1851547

Title:
  qemu 4 crashes with this parameter attached -usb -device usb-
  host,hostbus=3D1,hostaddr=3D7 \

Status in QEMU:
  Incomplete

Bug description:
  Hello.

  qemu / kvm does not start anymore after upgrading ubuntu from 19.04 to
  19.10 and qemu from 3 to 4,as you can see below. what can I do ?

  root@ziomario-Z390-AORUS-PRO:/home/ziomario/Scrivania/OS-KVM# ./boot-
  OS-HSP2.sh

  ----> qemu-system-x86_64: /build/qemu-
  UryNDZ/qemu-4.0+dfsg/hw/usb/core.c:720: usb_ep_get: asserzione "dev !=3D
  NULL" non riuscita.

  ./boot-OS-HSP2.sh: riga 40: 26312 Annullato (core dump creato) qemu-
  system-x86_64 -enable-kvm -m 16000 -cpu
  Penryn,kvm=3Don,vendor=3DGenuineIntel,+invtsc,vmware-cpuid-
  freq=3Don,$MY_OPTIONS -machine pc-q35-2.9 -smp 4,cores=3D2 -vga none
  -device vfio-pci,host=3D01:00.0,bus=3Dpcie.0,multifunction=3Don -device
  vfio-pci,host=3D01:00.1,bus=3Dpcie.0 -device vfio-
  pci,host=3D01:00.2,bus=3Dpcie.0 -device vfio-pci,host=3D01:00.3,bus=3Dpci=
e.0
  -usb -device usb-host,hostbus=3D1,hostaddr=3D7 -drive
  if=3Dpflash,format=3Draw,readonly,file=3D$OVMF/OVMF_CODE.fd -drive
  if=3Dpflash,format=3Draw,file=3D$OVMF/OVMF_VARS-1024x768.fd -smbios type=
=3D2
  -device ich9-ahci,id=3Dsata -drive
  id=3DClover,if=3Dnone,snapshot=3Don,format=3Dqcow2,file=3D./'Mo/CloverNG.=
qcow2'
  -device ide-hd,bus=3Dsata.2,drive=3DClover -device ide-
  hd,bus=3Dsata.3,drive=3DInstallMedia -drive
  id=3DInstallMedia,if=3Dnone,file=3DBaseSystemHS.img,format=3Draw -drive
  id=3DBsdHDD,if=3Dnone,file=3D/dev/sdg,format=3Draw -device ide-
  hd,bus=3Dsata.4,drive=3DBsdHDD -netdev
  tap,id=3Dnet0,ifname=3Dtap0,script=3Dno,downscript=3Dno -device
  e1000-82545em,netdev=3Dnet0,id=3Dnet0,mac=3D52:54:00:c9:18:27 -monitor st=
dio

  It seems that this line is not good anymore (it worked with qemu 3.x)
  :

  -usb -device usb-host,hostbus=3D1,hostaddr=3D7 \

  when I removed it,it works. But I need that. With what can I change it
  ? You can reproduce that upgrading ubuntu 19.04 to 19.10 because in
  that way also qemu will be upgraded from 3 to 4. These are the
  packages that I'm using :

  root@ziomario-Z390-AORUS-PRO:/home/ziomario# qemu-system-x86_64 --version
  QEMU emulator version 4.0.0 (Debian 1:4.0+dfsg-0ubuntu9)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1851547/+subscriptions

