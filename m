Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437812B9846
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:43:45 +0100 (CET)
Received: from localhost ([::1]:37328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfn28-00052M-8I
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfmuS-0004l9-BC
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:35:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfmuJ-0004kH-5T
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:35:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfmuH-0006Rg-6K
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:35:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2EE592E813E
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:35:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2020 16:18:01 -0000
From: Thomas Huth <1557057@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: s3 wake windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: iaopenbug th-huth
X-Launchpad-Bug-Reporter: Ilia (iaopenbug)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160314164743.1669.86603.malonedeb@gac.canonical.com>
Message-Id: <160580268151.17610.9653093656109674072.malone@gac.canonical.com>
Subject: [Bug 1557057] Re: Windows 10 guest under qemu cannot wake up from S3
 using rtc wake with -no_hpet
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 496695c29d45926e8f8d0447a7720de967ddc145
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 09:30:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1557057 <1557057@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1557057

Title:
  Windows 10 guest under qemu cannot wake up from S3 using rtc wake with
  -no_hpet

Status in QEMU:
  Incomplete

Bug description:
  Problem : Windows 10 guest cannot wake up from S3 using rtc wake when
  hpet is disabled(  -no_hpet)

  Steps to reproduce.

  1. Boot Windows 10 Guest VM.
  2. Create  scheduled task (using Task Scheduler) to  +5 minutes time  fro=
m current time to run notepad and enabling "Wake the computer to run this t=
ask" option
  3. Click Start->Power ->Sleep
  4. Guest VM enters suspend mode( screen is black)
  5. Wait 10 minutes - nothing happens
  6. Press key in spicy window
  7. VM resumes

  Expected behavior - VM should wake after 5 minutes in step 5.

  NOTE: problem happens only with -no_hpet option

  More information:
  #uname -a
  Linux vm-host 4.4.3-300.fc23.x86_64 #1 SMP Fri Feb 26 18:45:40 UTC 2016 x=
86_64 x86_64 x86_64 GNU/Linux

  # /usr/local/bin/qemu-system-x86_64 --version
  QEMU emulator version 2.5.50, Copyright (c) 2003-2008 Fabrice Bellard

  -----------------QEMU guest config---------------------
  OPTS=3D"$OPTS -enable-kvm "
  OPTS=3D"$OPTS -name win10_35"
  #OPTS=3D"$OPTS -bios seabios/out/bios.bin"
  OPTS=3D"$OPTS -machine pc-q35-2.4,accel=3Dkvm,usb=3Doff,vmport=3Doff"
  OPTS=3D"$OPTS -cpu Broadwell,hv_time,hv_relaxed,hv_vapic,hv_spinlocks=3D0=
x1fff"
  OPTS=3D"$OPTS -m 4096"
  OPTS=3D"$OPTS -realtime mlock=3Doff"
  OPTS=3D"$OPTS -smp 2,sockets=3D2,cores=3D1,threads=3D1"
  OPTS=3D"$OPTS -uuid e09cbfe5-9016-40b0-a027-62e0d2ef0ba1"
  OPTS=3D"$OPTS -no-user-config"
  OPTS=3D"$OPTS -nodefaults "
  OPTS=3D"$OPTS -rtc base=3Dlocaltime,driftfix=3Dslew"
  OPTS=3D"$OPTS -global kvm-pit.lost_tick_policy=3Ddiscard"
  OPTS=3D"$OPTS -no-hpet"
  OPTS=3D"$OPTS -no-shutdown"
  OPTS=3D"$OPTS -global ICH9-LPC.disable_s3=3D0"
  OPTS=3D"$OPTS -global ICH9-LPC.disable_s4=3D0"
  OPTS=3D"$OPTS -boot order=3Dc,menu=3Don,strict=3Don"
  OPTS=3D"$OPTS -device i82801b11-bridge,id=3Dpci.1,bus=3Dpcie.0,addr=3D0x1=
e"
  OPTS=3D"$OPTS -device pci-bridge,chassis_nr=3D2,id=3Dpci.2,bus=3Dpci.1,ad=
dr=3D0x1"
  OPTS=3D"$OPTS -device ich9-usb-ehci1,id=3Dusb,bus=3Dpci.2,addr=3D0x3.0x7"
  OPTS=3D"$OPTS -device ich9-usb-uhci1,masterbus=3Dusb.0,firstport=3D0,bus=
=3Dpci.2,multifunction=3Don,addr=3D0x3"
  OPTS=3D"$OPTS -device ich9-usb-uhci2,masterbus=3Dusb.0,firstport=3D2,bus=
=3Dpci.2,addr=3D0x3.0x1"
  OPTS=3D"$OPTS -device ich9-usb-uhci3,masterbus=3Dusb.0,firstport=3D4,bus=
=3Dpci.2,addr=3D0x3.0x2"
  OPTS=3D"$OPTS -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.2,a=
ddr=3D0x4"
  OPTS=3D"$OPTS -drive file=3D/var/lib/images/win10-run2.qcow2,format=3Dqco=
w2,if=3Dnone,id=3Ddrive-sata0-0-0,cache=3Dnone"
  OPTS=3D"$OPTS -device ide-hd,bus=3Dide.0,drive=3Ddrive-sata0-0-0,id=3Dsat=
a0-0-0"
  OPTS=3D"$OPTS -drive file=3D/var/lib/images/diskd.vhd,format=3Dvpc,if=3Dn=
one,id=3Ddrive-sata0-0-1"
  OPTS=3D"$OPTS -device ide-hd,bus=3Dide.1,drive=3Ddrive-sata0-0-1,id=3Dsat=
a0-0-1"
  OPTS=3D"$OPTS -drive file=3Dvirtio-win.iso,format=3Draw,if=3Dnone,media=
=3Dcdrom,id=3Ddrive-sata0-0-2,readonly=3Don"
  OPTS=3D"$OPTS -device ide-cd,bus=3Dide.2,drive=3Ddrive-sata0-0-2,id=3Dsat=
a0-0-2 "
  OPTS=3D"$OPTS -chardev pty,id=3Dcharserial0"
  OPTS=3D"$OPTS -device isa-serial,chardev=3Dcharserial0,id=3Dserial0"
  OPTS=3D"$OPTS -chardev spicevmc,id=3Dcharchannel0,name=3Dvdagent"
  OPTS=3D"$OPTS -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,charde=
v=3Dcharchannel0,id=3Dchannel0,name=3Dcom.redhat.spice.0"
  OPTS=3D"$OPTS -device usb-tablet,id=3Dinput0"
  OPTS=3D"$OPTS -spice port=3D5901,addr=3D127.0.0.1,disable-ticketing,image=
-compression=3Doff,seamless-migration=3Don"
  OPTS=3D"$OPTS -device qxl-vga,id=3Dvideo0,ram_size=3D67108864,vram_size=
=3D67108864,vgamem_mb=3D16,bus=3Dpcie.0,addr=3D0x1"
  OPTS=3D"$OPTS -device intel-hda,id=3Dsound0,bus=3Dpci.2,addr=3D0x2"
  OPTS=3D"$OPTS -device hda-duplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D=
0"
  OPTS=3D"$OPTS -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.2,addr=
=3D0x5"
  OPTS=3D"$OPTS -msg timestamp=3Don"
  OPTS=3D"$OPTS -monitor stdio"
  #OPTS=3D"$OPTS -qmp stdio"
  #OPTS=3D"$OPTS -chardev stdio,id=3Dseabios -device isa-debugcon,iobase=3D=
0x402,chardev=3Dseabios"

  /usr/local/bin/qemu-system-x86_64 $OPTS

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1557057/+subscriptions

