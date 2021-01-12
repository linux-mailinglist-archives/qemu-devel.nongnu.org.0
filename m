Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33412F2729
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:38:21 +0100 (CET)
Received: from localhost ([::1]:60304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBRl-0007K9-0f
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFn-00089i-1g
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:26:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:52266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFf-0000tr-JO
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFd-0004UN-TE
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D48EB2E813A
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:33 -0000
From: Launchpad Bug Tracker <1791947@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fkaiser herzing janitor sameeh-j th-huth
X-Launchpad-Bug-Reporter: Florian Kaiser (fkaiser)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153667023142.28323.15936320266422135285.malonedeb@wampee.canonical.com>
Message-Id: <161042505315.10246.12500050262370281316.malone@loganberry.canonical.com>
Subject: [Bug 1791947] Re: isochronous usb device forwarding with windows 10
 and xhci freezes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: b35b81f859e564783ab50590b5b2ed4983698172
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
Reply-To: Bug 1791947 <1791947@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1791947

Title:
  isochronous usb device forwarding with windows 10 and xhci freezes

Status in QEMU:
  Expired

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

