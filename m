Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943F52A2E6
	for <lists+qemu-devel@lfdr.de>; Sat, 25 May 2019 06:34:34 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUOO9-0000XW-Qw
	for lists+qemu-devel@lfdr.de; Sat, 25 May 2019 00:34:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hUOJy-0006cC-CT
	for qemu-devel@nongnu.org; Sat, 25 May 2019 00:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hUOJx-0000jA-2Y
	for qemu-devel@nongnu.org; Sat, 25 May 2019 00:30:14 -0400
Received: from indium.canonical.com ([91.189.90.7]:56152)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hUOJw-0000hQ-RI
	for qemu-devel@nongnu.org; Sat, 25 May 2019 00:30:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hUOJv-000452-Tp
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 04:30:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id DFB712E8024
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 04:30:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 May 2019 04:17:24 -0000
From: Launchpad Bug Tracker <504368@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
	assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu-kvm; component=main; 
	status=Expired; importance=Low; assignee=None; 
X-Launchpad-Bug-Tags: amd64 apport-bug
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anthony-codemonkey hramrach janitor jcollins
	kirkland lekensteyn prateek.karandikar serge-hallyn th-huth
X-Launchpad-Bug-Reporter: Jamin W. Collins (jcollins)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20100107173707.12658.18712.malonedeb@palladium.canonical.com>
Message-Id: <155875784447.26936.10155490463738702176.malone@loganberry.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 5c4e9c4b07663811a4a8ec67fd27f8c3c579b10b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 504368] Re: sdl window intermittently scales
 instead of resizing
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 504368 <504368@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/504368

Title:
  sdl window intermittently scales instead of resizing

Status in QEMU:
  Expired
Status in qemu-kvm package in Ubuntu:
  Expired

Bug description:
  Binary package hint: qemu-kvm

  Normally, the SDL output window for a VM resizes to match the VM's
  resolution.  However, intermittently the output is instead scaled
  within the window.  I can't seem to find any pattern to when the
  output is scaled versus when the window is resized.  I would prefer
  that the window be resized as needed to display the VM in a 1:1
  manner.

  ProblemType: Bug
  Architecture: amd64
  Date: Thu Jan  7 10:30:10 2010
  DistroRelease: Ubuntu 9.10
  InstallationMedia: Ubuntu 9.10 "Karmic Koala" - Release amd64 (20091027)
  KvmCmdLine:
   UID        PID  PPID  C    SZ   RSS PSR STIME TTY          TIME CMD
   root     27618     1 38 241752 804668 1 10:05 ?        00:09:39 /usr/bin=
/kvm -S -M pc-0.11 -cpu qemu32 -m 768 -smp 1 -name win2k3 -uuid da414aa0-f1=
8a-7a02-3d1b-1dbf13137bc9 -monitor unix:/var/run/libvirt/qemu/win2k3.monito=
r,server,nowait -localtime -boot c -drive file=3D/media/qpc-devel/testing/w=
in2k3/testing.ovl,if=3Dide,index=3D0,boot=3Don -drive file=3D/media/qpc-dev=
el/testing/win2k3/../../isos/en_win_srv_2003_r2_standard_cd1.iso,if=3Dide,m=
edia=3Dcdrom,index=3D2 -net nic,macaddr=3D00:16:3e:d6:f5:60,vlan=3D0,model=
=3Dne2k_pci,name=3Dne2k_pci.0 -net tap,fd=3D18,vlan=3D0,name=3Dtap.0 -seria=
l pty -parallel none -usb -usbdevice tablet -vga cirrus
   root     28306     1 54 177732 545520 1 10:28 ?        00:00:49 /usr/bin=
/kvm -S -M pc-0.11 -cpu qemu32 -m 512 -smp 1 -name win2k -uuid 153d6125-acb=
5-70bc-c7d2-bcbf87c5be86 -monitor unix:/var/run/libvirt/qemu/win2k.monitor,=
server,nowait -localtime -boot c -drive file=3D/media/qpc-devel/testing/win=
2k/testing.ovl,if=3Dide,index=3D0,boot=3Don -drive file=3D/media/qpc-devel/=
testing/win2k/../../isos/windows_2000.iso,if=3Dide,media=3Dcdrom,index=3D2 =
-net nic,macaddr=3D68:29:6b:13:50:c6,vlan=3D0,model=3Dne2k_pci,name=3Dne2k_=
pci.0 -net tap,fd=3D19,vlan=3D0,name=3Dtap.0 -serial pty -parallel none -us=
b -usbdevice tablet -vga cirrus
  NonfreeKernelModules: nvidia
  Package: kvm 1:84+dfsg-0ubuntu16+0.11.0+0ubuntu6.3
  PccardctlIdent:
   Socket 0:
     no product info available
  PccardctlStatus:
   Socket 0:
     no card
  ProcCmdLine: BOOT_IMAGE=3D/boot/vmlinuz-2.6.31-16-generic root=3DUUID=3D3=
0218f9a-6f90-4eab-9ba5-f54897e842cb ro quiet splash
  ProcEnviron:
   PATH=3D(custom, user)
   LANG=3Den_US.UTF-8
   SHELL=3D/bin/bash
  ProcVersionSignature: Ubuntu 2.6.31-16.53-generic
  SourcePackage: qemu-kvm
  Uname: Linux 2.6.31-16-generic x86_64
  dmi.bios.date: 02/20/2008
  dmi.bios.vendor: LENOVO
  dmi.bios.version: 7LETB2WW (2.12 )
  dmi.board.vendor: LENOVO
  dmi.board.version: Not Available
  dmi.chassis.asset.tag: No Asset Information
  dmi.chassis.type: 10
  dmi.chassis.vendor: LENOVO
  dmi.chassis.version: Not Available
  dmi.modalias: dmi:bvnLENOVO:bvr7LETB2WW(2.12):bd02/20/2008:svnLENOVO:pn:p=
vrThinkPadT61p:rvnLENOVO:rn:rvrNotAvailable:cvnLENOVO:ct10:cvrNotAvailable:
  dmi.product.version: ThinkPad T61p
  dmi.sys.vendor: LENOVO

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/504368/+subscriptions

