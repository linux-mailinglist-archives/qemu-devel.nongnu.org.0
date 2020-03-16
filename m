Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A962F187109
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:20:45 +0100 (CET)
Received: from localhost ([::1]:43566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDtPw-0005T3-O2
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34246)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jDrEj-0003j9-L1
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:01:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jDrEc-0006ps-83
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:01:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:42106)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jDrEb-0006fU-R5
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:00:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jDrEa-0000E2-6R
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 15:00:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2D7692E80C3
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 15:00:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Mar 2020 14:52:54 -0000
From: Andreas Hasenack <andreas@canonical.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Incomplete; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahasenack dbaxps0220 dgilbert-h paelzer tstrike34
X-Launchpad-Bug-Reporter: tstrike (tstrike34)
X-Launchpad-Bug-Modifier: Andreas Hasenack (ahasenack)
References: <158386023038.12575.5865810528923078550.malonedeb@soybean.canonical.com>
Message-Id: <158437037457.20839.9665549952321489437.malone@wampee.canonical.com>
Subject: [Bug 1866870] Re: KVM Guest pauses after upgrade to Ubuntu 20.04
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: d7db7766dbc21b65729676073f753fb4a34feeac
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
Reply-To: Bug 1866870 <1866870@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also crashed with the packages from the other ppa:

ubuntu@f1:~$ qemu-system-x86_64 --help 2>&1|head -n 1
QEMU emulator version 4.2.0 (Debian 1:4.2-3ubuntu3~exp1)

ubuntu@f1:~$ qemu-system-x86_64 --enable-kvm -cpu Penryn,vmx=3Don -m 512 --=
nodefaults --nographic
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
01H:ECX.sse4.1 [bit 19]
KVM internal error. Suberror: 1
emulation failure
EAX=3D00000000 EBX=3D00000000 ECX=3D000086d4 EDX=3D00000000
ESI=3D00000000 EDI=3D00000000 EBP=3D000086d4 ESP=3D00006d7c
EIP=3D00007acf EFL=3D00000002 [-------] CPL=3D0 II=3D0 A20=3D1 SMM=3D0 HLT=
=3D0
ES =3D0000 00000000 ffffffff 00809300
CS =3Df000 000f0000 ffffffff 00809b00
SS =3D0000 00000000 ffffffff 00809300
DS =3D0000 00000000 ffffffff 00809300
FS =3D0000 00000000 ffffffff 00809300
GS =3D0000 00000000 ffffffff 00809300
LDT=3D0000 00000000 0000ffff 00008200
TR =3D0000 00000000 0000ffff 00008b00
GDT=3D     000f6200 00000037
IDT=3D     00000000 000003ff
CR0=3D00000010 CR2=3D00000000 CR3=3D00000000 CR4=3D00000000
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=3D=
0000000000000000 =

DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
EFER=3D0000000000000000
Code=3Db8 90 d9 00 00 66 e8 6b f7 ff ff 66 b8 0a 00 00 00 e9 61 f2 <f3> 0f =
1e fb 66 57 66 56 66 53 66 53 66 89 c7 67 66 89 14 24 66 89 ce 66 e8 15 f8 =
ff ff 88


ubuntu@f1:~$ apt-cache policy qemu-kvm
qemu-kvm:
  Installed: 1:4.2-3ubuntu3~exp1
  Candidate: 1:4.2-3ubuntu3~exp1
  Version table:
 *** 1:4.2-3ubuntu3~exp1 500
        500 http://ppa.launchpad.net/paelzer/bug-1866870-qemu-penryn-crash-=
fullreverts/ubuntu focal/main amd64 Packages
        100 /var/lib/dpkg/status
     1:4.2-3ubuntu2 500
        500 http://br.archive.ubuntu.com/ubuntu focal/main amd64 Packages

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1866870

Title:
  KVM Guest pauses after upgrade to Ubuntu 20.04

Status in QEMU:
  New
Status in qemu package in Ubuntu:
  Incomplete

Bug description:
  Symptom:
  Error unpausing domain: internal error: unable to execute QEMU command 'c=
ont': Resetting the Virtual Machine is required

  Traceback (most recent call last):
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 75, in cb_=
wrapper
      callback(asyncjob, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 111, in tm=
pcb
      callback(*args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/libvirtobject.py", lin=
e 66, in newfn
      ret =3D fn(self, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/domain.py", line 1311,=
 in resume
      self._backend.resume()
    File "/usr/lib/python3/dist-packages/libvirt.py", line 2174, in resume
      if ret =3D=3D -1: raise libvirtError ('virDomainResume() failed', dom=
=3Dself)
  libvirt.libvirtError: internal error: unable to execute QEMU command 'con=
t': Resetting the Virtual Machine is required

  =

  ---

  As outlined here:
  https://bugs.launchpad.net/qemu/+bug/1813165/comments/15

  After upgrade, all KVM guests are in a default pause state. Even after
  forcing them off via virsh, and restarting them the guests are paused.

  These Guests are not nested.

  A lot of diganostic information are outlined in the previous bug
  report link provided. The solution mentioned in previous report had
  been allegedly integrated into the downstream updates.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1866870/+subscriptions

