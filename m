Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E9217F77B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 13:32:26 +0100 (CET)
Received: from localhost ([::1]:59858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBe3d-0005H2-Ay
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 08:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jBe2B-00046o-Sd
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 08:30:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jBe2A-0001Sw-2c
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 08:30:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:50478)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jBe29-0001LP-SR
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 08:30:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jBe28-0002fW-D1
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 12:30:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 568702E80CC
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 12:30:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Mar 2020 12:21:16 -0000
From: tstrike <1813165@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: albrt brogers-q dgilbert-h himbeere lersek
 tstrike34 vkuznets
X-Launchpad-Bug-Reporter: Thomas (himbeere)
X-Launchpad-Bug-Modifier: tstrike (tstrike34)
References: <154833838504.19548.14915901097039330455.malonedeb@gac.canonical.com>
Message-Id: <158384287698.7681.16187641845324352564.malone@chaenomeles.canonical.com>
Subject: [Bug 1813165] Re: KVM internal error. Suberror: 1 emulation failure
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e0878392dc799b267dea80578fa65500a5d74155";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 3b94ca6b5fbf50cd57f42a91367042a8f9ea3a38
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1813165 <1813165@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok. I will open another bug report. Give me about an hour or so I can
regather my logs (plus get my workout in) for a repost.

I am not a libvirt expert per se (although a LONG time user). Should I
run an apport report to post up on the new bug so that the packages can
get a birds eye view on my system?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1813165

Title:
  KVM internal error. Suberror: 1 emulation failure

Status in QEMU:
  New

Bug description:
  Hello Devs.

  Having problems getting VM to run with qemu 3.1.0. I should mention
  it's a nested configuration.

  2019-01-24 13:46:08.648+0000: starting up libvirt version: 4.10.0, qemu v=
ersion: 3.1.0, kernel: 4.14.94, hostname: one....
  LC_ALL=3DC PATH=3D/bin:/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin:/usr/=
sbin:/usr/local/bin:/usr/local/sbin:/opt/bin HOME=3D/root USER=3Droot QEMU_=
AUDIO_DRV=3Dnone /usr/bin/kvm -name guest=3Done-266,debug-threads=3Don -S -=
object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/dom=
ain-1-one-266/master-key.aes -machine pc-i440fx-2.9,accel=3Dkvm,usb=3Doff,d=
ump-guest-core=3Doff -cpu Skylake-Client-IBRS,ss=3Don,hypervisor=3Don,tsc_a=
djust=3Don,clflushopt=3Don,ssbd=3Don,xsaves=3Don,pdpe1gb=3Don -m 1024 -real=
time mlock=3Doff -smp 2,sockets=3D2,cores=3D1,threads=3D1 -uuid b219b45d-a2=
f0-4128-a948-8673a7abf968 -no-user-config -nodefaults -chardev socket,id=3D=
charmonitor,fd=3D21,server,nowait -mon chardev=3Dcharmonitor,id=3Dmonitor,m=
ode=3Dcontrol -rtc base=3Dutc -no-shutdown -boot strict=3Don -device piix3-=
usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 -drive file=3D/var/lib/one//da=
tastores/0/266/disk.0,format=3Dqcow2,if=3Dnone,id=3Ddrive-virtio-disk0,cach=
e=3Dnone -device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x4,drive=3Dd=
rive-virtio-disk0,id=3Dvirtio-disk0,bootindex=3D1,write-cache=3Don -drive f=
ile=3D/var/lib/one//datastores/0/266/disk.1,format=3Draw,if=3Dnone,id=3Ddri=
ve-ide0-0-0,readonly=3Don -device ide-cd,bus=3Dide.0,unit=3D0,drive=3Ddrive=
-ide0-0-0,id=3Dide0-0-0 -netdev tap,fd=3D23,id=3Dhostnet0 -device rtl8139,n=
etdev=3Dhostnet0,id=3Dnet0,mac=3D02:00:00:76:69:85,bus=3Dpci.0,addr=3D0x3 -=
chardev pty,id=3Dcharserial0 -device isa-serial,chardev=3Dcharserial0,id=3D=
serial0 -vnc 0.0.0.0:266 -device cirrus-vga,id=3Dvideo0,bus=3Dpci.0,addr=3D=
0x2 -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x5 -sandbo=
x on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=
=3Ddeny -msg timestamp=3Don
  char device redirected to /dev/pts/1 (label charserial0)
  KVM internal error. Suberror: 1
  emulation failure
  EAX=3D00000001 EBX=3D000f7c2c ECX=3D00000001 EDX=3D00000001
  ESI=3D00006a26 EDI=3D3ffbdc48 EBP=3D000069e6 ESP=3D000a8000
  EIP=3D000fd057 EFL=3D00010016 [----AP-] CPL=3D0 II=3D0 A20=3D1 SMM=3D1 HL=
T=3D0
  ES =3D0010 00000000 ffffffff 00c09300
  CS =3D0000 00000000 00000fff 00809b00
  SS =3D0010 00000000 ffffffff 00c09300
  DS =3D0010 00000000 ffffffff 00c09300
  FS =3D0010 00000000 ffffffff 00c09300
  GS =3D0010 00000000 ffffffff 00c09300
  LDT=3D0000 00000000 0000ffff 00008200
  TR =3D0000 00000000 0000ffff 00008b00
  GDT=3D     10387cfe 0000fe6c
  IDT=3D     0010387c 00003810
  CR0=3D00000010 CR2=3D00000000 CR3=3D00000000 CR4=3D00000000
  DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=
=3D0000000000000000
  DR6=3D00000000fffecffc DR7=3D000000000e1e0400
  EFER=3D0000000000000000
  Code=3Dcb 66 ba 4d d0 0f 00 e9 c8 fe bc 00 80 0a 00 e8 31 3a ff ff <0f> a=
a fa fc 66 ba 66 d0 0f 00 e9 b1 fe f3 90 f0 0f ba 2d ac 3b 0f 00 00 72 f3 8=
b 25 a8 3b
  2019-01-24T13:47:39.383366Z kvm: terminating on signal 15 from pid 2708 (=
/usr/sbin/libvirtd)

  Someone has an idea whats going wrong here?

  thanks and cheers
  t.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1813165/+subscriptions

