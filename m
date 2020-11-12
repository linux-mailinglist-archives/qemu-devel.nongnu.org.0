Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3E12B0CB5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:34:46 +0100 (CET)
Received: from localhost ([::1]:58724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHQj-0006BY-L0
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdHNe-0003KE-NH
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:31:34 -0500
Received: from indium.canonical.com ([91.189.90.7]:55826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdHNa-0003zi-BA
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:31:34 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdHNM-0000vU-5J
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 18:31:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 270902E80EA
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 18:31:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 18:24:53 -0000
From: Thomas Huth <1791947@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fkaiser herzing sameeh-j th-huth
X-Launchpad-Bug-Reporter: Florian Kaiser (fkaiser)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153667023142.28323.15936320266422135285.malonedeb@wampee.canonical.com>
Message-Id: <160520549369.5535.8812125319176413419.malone@soybean.canonical.com>
Subject: [Bug 1791947] Re: isochronous usb device forwarding with windows 10
 and xhci freezes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: 1295f285868a9fe8ae9d4008b7ab657cf8060642
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:20:56
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
Reply-To: Bug 1791947 <1791947@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1791947

Title:
  isochronous usb device forwarding with windows 10 and xhci freezes

Status in QEMU:
  Incomplete

Bug description:
  When I try to forward isochronous usb devices (webcam, HID-Audio) via usb=
redir into the VM, the devices work for a few minutes then the device stops=
 working and stays that way until a VM reboot or a windows driver reload.
  It does not matter if I use qemu-xhci or nec-xhci.
  I can gather more information, if its helpful!

  Windows build:
  windows 10 pro 1803 jun 2018

  Linux Version:
  Fedora 28
  $ uname -a
  Linux 4.17.19-200.fc28.x86_64 #1 SMP Fri Aug 24 15:47:41 UTC 2018 x86_64 =
x86_64 x86_64 GNU/Linux

  Qemu Version:
  $ qemu-system-x86_64 -version
  QEMU emulator version 2.11.2(qemu-2.11.2-2.fc28)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  Qemu command line:
  /usr/bin/qemu-system-x86_64 -machine accel=3Dkvm -name guest=3Dwin10,debu=
g-threads=3Don -S -object secret,id=3DmasterKey0,format=3Draw,file=3D/var/l=
ib/libvirt/qemu/domain-1-win10/master-key.aes -machine pc-q35-2.11,accel=3D=
kvm,usb=3Doff,vmport=3Doff,dump-guest-core=3Doff -cpu Skylake-Client-IBRS,s=
s=3Don,hypervisor=3Don,tsc_adjust=3Don,clflushopt=3Don,ssbd=3Don,xsaves=3Do=
n,pdpe1gb=3Don,hv_time,hv_relaxed,hv_vapic,hv_spinlocks=3D0x1fff -m 8192 -r=
ealtime mlock=3Doff -smp 4,sockets=3D4,cores=3D1,threads=3D1 -uuid 38b1258e=
-fea4-41fe-9e21-07c426c5b2b2 -no-user-config -nodefaults -chardev socket,id=
=3Dcharmonitor,path=3D/var/lib/libvirt/qemu/domain-1-win10/monitor.sock,ser=
ver,nowait -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc base=
=3Dlocaltime,driftfix=3Dslew -global kvm-pit.lost_tick_policy=3Ddelay -no-h=
pet -no-shutdown -global ICH9-LPC.disable_s3=3D1 -global ICH9-LPC.disable_s=
4=3D1 -boot strict=3Don -device i82801b11-bridge,id=3Dpci.1,bus=3Dpcie.0,ad=
dr=3D0x1e -device pci-bridge,chassis_nr=3D2,id=3Dpci.2,bus=3Dpci.1,addr=3D0=
x0 -device pcie-root-port,port=3D0x10,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,m=
ultifunction=3Don,addr=3D0x2 -device pcie-root-port,port=3D0x11,chassis=3D4=
,id=3Dpci.4,bus=3Dpcie.0,addr=3D0x2.0x1 -device pcie-root-port,port=3D0x12,=
chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,addr=3D0x2.0x2 -device pcie-root-port,p=
ort=3D0x13,chassis=3D6,id=3Dpci.6,bus=3Dpcie.0,addr=3D0x2.0x3 -device qemu-=
xhci,id=3Dusb,bus=3Dpci.3,addr=3D0x0 -device virtio-serial-pci,id=3Dvirtio-=
serial0,bus=3Dpci.4,addr=3D0x0 -drive file=3D/var/lib/libvirt/images/win10.=
qcow2,format=3Dqcow2,if=3Dnone,id=3Ddrive-sata0-0-0 -device ide-hd,bus=3Did=
e.0,drive=3Ddrive-sata0-0-0,id=3Dsata0-0-0,bootindex=3D1 -drive file=3D/var=
/lib/libvirt/images/en_windows_10_multiple_editions_version_1803_jun_2018.i=
so,format=3Draw,if=3Dnone,id=3Ddrive-sata0-0-1,media=3Dcdrom,readonly=3Don =
-device ide-cd,bus=3Dide.1,drive=3Ddrive-sata0-0-1,id=3Dsata0-0-1 -netdev t=
ap,fd=3D25,id=3Dhostnet0 -device e1000,netdev=3Dhostnet0,id=3Dnet0,mac=3D52=
:54:00:ab:33:11,bus=3Dpci.2,addr=3D0x1 -chardev pty,id=3Dcharserial0 -devic=
e isa-serial,chardev=3Dcharserial0,id=3Dserial0 -chardev spicevmc,id=3Dchar=
channel0,name=3Dvdagent -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D=
1,chardev=3Dcharchannel0,id=3Dchannel0,name=3Dcom.redhat.spice.0 -device us=
b-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 -spice port=3D5900,addr=3D127.0.0=
.1,disable-ticketing,image-compression=3Doff,seamless-migration=3Don -devic=
e qxl-vga,id=3Dvideo0,ram_size=3D67108864,vram_size=3D67108864,vram64_size_=
mb=3D0,vgamem_mb=3D16,max_outputs=3D1,bus=3Dpcie.0,addr=3D0x1 -chardev spic=
evmc,id=3Dcharredir0,name=3Dusbredir -device usb-redir,chardev=3Dcharredir0=
,id=3Dredir0,bus=3Dusb.0,port=3D2 -chardev spicevmc,id=3Dcharredir1,name=3D=
usbredir -device usb-redir,chardev=3Dcharredir1,id=3Dredir1,bus=3Dusb.0,por=
t=3D3 -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.5,addr=3D0x0 -msg =
timestamp=3Don

  Cheers,
  Florian

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1791947/+subscriptions

