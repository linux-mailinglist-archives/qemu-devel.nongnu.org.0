Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D01CA538
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 09:31:50 +0200 (CEST)
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWxU4-0000o0-U3
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 03:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWxT5-0008V3-88
 for qemu-devel@nongnu.org; Fri, 08 May 2020 03:30:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:40432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWxT3-0006SL-RI
 for qemu-devel@nongnu.org; Fri, 08 May 2020 03:30:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jWxT1-0001ed-Oy
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 07:30:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B7F872E80BA
 for <qemu-devel@nongnu.org>; Fri,  8 May 2020 07:30:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2020 07:21:56 -0000
From: Prashant <1877526@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: agpr123
X-Launchpad-Bug-Reporter: Prashant (agpr123)
X-Launchpad-Bug-Modifier: Prashant (agpr123)
Message-Id: <158892251663.4400.3590186641467240793.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1877526] [NEW] KVM internal crash
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c9080e6f669e7a0bb377d0eda11de340f30b71f7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 03:30:44
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1877526 <1877526@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi,
I am new to this. (apologies if I miss something)

I see the following error on my host mc when I run an application on my
QEMU based VM running ubuntu linux:

Code=3D4d 39 c8 7f 64 0f 1f 40 00 4d 8d 40 80 49 81 f8 80 00 00 00 <66> 0f =
7f 07 66 0f 7f 47 10 66 0f 7f 47 20 66 0f 7f 47 30
66 0f 7f 47 40 66 0f 7f 47 50 66
KVM internal error. Suberror: 1
emulation failure
RAX=3D00007fffeb85a000 RBX=3D00000000069ee400 RCX=3D0000000000000000 RDX=3D=
0000000000000000
RSI=3D0000000000000000 RDI=3D00007fffeb85a000 RBP=3D00007fffffff9570 RSP=3D=
00007fffffff9548
R8 =3D0000000000000f80 R9 =3D0000000001000000 R10=3D0000000000000000 R11=3D=
0000003694e83f3a
R12=3D0000000000000000 R13=3D0000000000000000 R14=3D0000000000000000 R15=3D=
0000000006b75350
RIP=3D0000003694e8443b RFL=3D00010206 [-----P-] CPL=3D3 II=3D0 A20=3D1 SMM=
=3D0 HLT=3D0
ES =3D0000 0000000000000000 ffffffff 00000000
CS =3D0033 0000000000000000 ffffffff 00a0fb00 DPL=3D3 CS64 [-RA]
SS =3D002b 0000000000000000 ffffffff 00c0f300 DPL=3D3 DS   [-WA]
DS =3D0000 0000000000000000 ffffffff 00000000
FS =3D0000 00007ffff45b5720 ffffffff 00000000
GS =3D0000 0000000000000000 ffffffff 00000000
LDT=3D0000 0000000000000000 ffffffff 00000000
TR =3D0040 ffff88047fd13140 00002087 00008b00 DPL=3D0 TSS64-busy
GDT=3D	 ffff88047fd04000 0000007f
IDT=3D	 ffffffffff57c000 00000fff
CR0=3D80050033 CR2=3D00007ffff7ff4000 CR3=3D000000046cb38000 CR4=3D000006e0
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=3D=
0000000000000000
DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
EFER=3D0000000000000d01

This occurs with qemu-kvm version(host m/c has RHEL 6.6) :
Name        : qemu-kvm
Arch        : x86_64
Epoch       : 2
Version     : 0.12.1.2
Release     : 2.506.el6_10.7

I have another m/c with RHEL 7.5, and the same test case passes with the 1.=
5.3 version.
yum info qemu-kvm
Name        : qemu-kvm
Arch        : x86_64
Epoch       : 10
Version     : 1.5.3

How do I investigate this?
I would need to patch up the qemu-kvm on the host to get this fixed, I thin=
k.

Please let me know if I need to provide more info, (and what?)

Regards,
Prashant

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

  Hi,
  I am new to this. (apologies if I miss something)
  =

- I see the following error when I run an application on my QEMU based VM
- running ubuntu linux:
+ I see the following error on my host mc when I run an application on my
+ QEMU based VM running ubuntu linux:
  =

  Code=3D4d 39 c8 7f 64 0f 1f 40 00 4d 8d 40 80 49 81 f8 80 00 00 00 <66> 0=
f 7f 07 66 0f 7f 47 10 66 0f 7f 47 20 66 0f 7f 47 30
  66 0f 7f 47 40 66 0f 7f 47 50 66
  KVM internal error. Suberror: 1
  emulation failure
  RAX=3D00007fffeb85a000 RBX=3D00000000069ee400 RCX=3D0000000000000000 RDX=
=3D0000000000000000
  RSI=3D0000000000000000 RDI=3D00007fffeb85a000 RBP=3D00007fffffff9570 RSP=
=3D00007fffffff9548
  R8 =3D0000000000000f80 R9 =3D0000000001000000 R10=3D0000000000000000 R11=
=3D0000003694e83f3a
  R12=3D0000000000000000 R13=3D0000000000000000 R14=3D0000000000000000 R15=
=3D0000000006b75350
  RIP=3D0000003694e8443b RFL=3D00010206 [-----P-] CPL=3D3 II=3D0 A20=3D1 SM=
M=3D0 HLT=3D0
  ES =3D0000 0000000000000000 ffffffff 00000000
  CS =3D0033 0000000000000000 ffffffff 00a0fb00 DPL=3D3 CS64 [-RA]
  SS =3D002b 0000000000000000 ffffffff 00c0f300 DPL=3D3 DS   [-WA]
  DS =3D0000 0000000000000000 ffffffff 00000000
  FS =3D0000 00007ffff45b5720 ffffffff 00000000
  GS =3D0000 0000000000000000 ffffffff 00000000
  LDT=3D0000 0000000000000000 ffffffff 00000000
  TR =3D0040 ffff88047fd13140 00002087 00008b00 DPL=3D0 TSS64-busy
  GDT=3D	 ffff88047fd04000 0000007f
  IDT=3D	 ffffffffff57c000 00000fff
  CR0=3D80050033 CR2=3D00007ffff7ff4000 CR3=3D000000046cb38000 CR4=3D000006=
e0
- DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=
=3D0000000000000000 =

+ DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=
=3D0000000000000000
  DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
  EFER=3D0000000000000d01
  =

- This occurs with qemu-kvm version(host m/c has RHEL 6.6) : =

+ This occurs with qemu-kvm version(host m/c has RHEL 6.6) :
  Name        : qemu-kvm
  Arch        : x86_64
  Epoch       : 2
  Version     : 0.12.1.2
  Release     : 2.506.el6_10.7
  =

  I have another m/c with RHEL 7.5, and the same test case passes with the =
1.5.3 version.
  yum info qemu-kvm
  Name        : qemu-kvm
  Arch        : x86_64
  Epoch       : 10
  Version     : 1.5.3
  =

- =

  How do I investigate this?
  I would need to patch up the qemu-kvm on the host to get this fixed, I th=
ink.
  =

  Please let me know if I need to provide more info, (and what?)
  =

  Regards,
  Prashant

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877526

Title:
  KVM internal crash

Status in QEMU:
  New

Bug description:
  Hi,
  I am new to this. (apologies if I miss something)

  I see the following error on my host mc when I run an application on
  my QEMU based VM running ubuntu linux:

  Code=3D4d 39 c8 7f 64 0f 1f 40 00 4d 8d 40 80 49 81 f8 80 00 00 00 <66> 0=
f 7f 07 66 0f 7f 47 10 66 0f 7f 47 20 66 0f 7f 47 30
  66 0f 7f 47 40 66 0f 7f 47 50 66
  KVM internal error. Suberror: 1
  emulation failure
  RAX=3D00007fffeb85a000 RBX=3D00000000069ee400 RCX=3D0000000000000000 RDX=
=3D0000000000000000
  RSI=3D0000000000000000 RDI=3D00007fffeb85a000 RBP=3D00007fffffff9570 RSP=
=3D00007fffffff9548
  R8 =3D0000000000000f80 R9 =3D0000000001000000 R10=3D0000000000000000 R11=
=3D0000003694e83f3a
  R12=3D0000000000000000 R13=3D0000000000000000 R14=3D0000000000000000 R15=
=3D0000000006b75350
  RIP=3D0000003694e8443b RFL=3D00010206 [-----P-] CPL=3D3 II=3D0 A20=3D1 SM=
M=3D0 HLT=3D0
  ES =3D0000 0000000000000000 ffffffff 00000000
  CS =3D0033 0000000000000000 ffffffff 00a0fb00 DPL=3D3 CS64 [-RA]
  SS =3D002b 0000000000000000 ffffffff 00c0f300 DPL=3D3 DS   [-WA]
  DS =3D0000 0000000000000000 ffffffff 00000000
  FS =3D0000 00007ffff45b5720 ffffffff 00000000
  GS =3D0000 0000000000000000 ffffffff 00000000
  LDT=3D0000 0000000000000000 ffffffff 00000000
  TR =3D0040 ffff88047fd13140 00002087 00008b00 DPL=3D0 TSS64-busy
  GDT=3D	 ffff88047fd04000 0000007f
  IDT=3D	 ffffffffff57c000 00000fff
  CR0=3D80050033 CR2=3D00007ffff7ff4000 CR3=3D000000046cb38000 CR4=3D000006=
e0
  DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=
=3D0000000000000000
  DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
  EFER=3D0000000000000d01

  This occurs with qemu-kvm version(host m/c has RHEL 6.6) :
  Name        : qemu-kvm
  Arch        : x86_64
  Epoch       : 2
  Version     : 0.12.1.2
  Release     : 2.506.el6_10.7

  I have another m/c with RHEL 7.5, and the same test case passes with the =
1.5.3 version.
  yum info qemu-kvm
  Name        : qemu-kvm
  Arch        : x86_64
  Epoch       : 10
  Version     : 1.5.3

  How do I investigate this?
  I would need to patch up the qemu-kvm on the host to get this fixed, I th=
ink.

  Please let me know if I need to provide more info, (and what?)

  Regards,
  Prashant

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877526/+subscriptions

