Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCEE30B86F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 08:12:41 +0100 (CET)
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6prc-0002DB-W2
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 02:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6pqF-0001GH-BV
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:11:15 -0500
Received: from indium.canonical.com ([91.189.90.7]:32956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6pqD-0005qo-9a
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:11:15 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l6pqB-0005tE-JU
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:11:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 890702E8138
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 07:11:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Feb 2021 06:58:31 -0000
From: Chris Pinnock <1914117@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chrispinnock th-huth
X-Launchpad-Bug-Reporter: Chris Pinnock (chrispinnock)
X-Launchpad-Bug-Modifier: Chris Pinnock (chrispinnock)
References: <161221293549.4659.2173832767419505412.malonedeb@chaenomeles.canonical.com>
 <161224346461.12729.1918028041427875480.malone@soybean.canonical.com>
Message-Id: <143E5D65-DF52-40B8-A958-7E2B2BEE86A5@mac.com>
Subject: Re: [Bug 1914117] Short files returned via FTP on Qemu with various
 architectures and OSes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: b41857640d39fb1f53639c86c0b79a6d2c32f5ac
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
Reply-To: Bug 1914117 <1914117@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apologies.


Host OS is Big Sur Mac OS X latest - with Xcode latest. Qemu is 5.2 - tar b=
all directly from the website.

- Compile Qemu on Mac OS/Big Sur - completely stock build :  install Ninja,=
 mkdir build  && cd build && ../configure && make && make install
- But also the issue is with the binary in home-brew (e.g. brew install Qem=
u) - both methods get me to the same problem.

* Installed NetBSD/amd64 or i386 or OpenBSD/i386. =

Qemu-image create -f raw image 10G
qmu-system-ARCH -m 256M -hda image -cdrom =E2=80=9Cnetbsd.iso=E2=80=9D  -bo=
ot d -net user  -net nic

(For i386 & amd64 I tend to add -nographic for the installer)

* Run the image:
Qmu-system-ARCH -m 256M -hda $IMAGE -net user -net nic

Also NetBSD/arm64 has the issue using their image.
qemu-system-aarch64 -M virt -cpu cortex-a53 -smp 4 -m 4g \
      -drive if=3Dnone,file=3Dnetbsd-disk-arm64.img,id=3Dhd0 -device virtio=
-blk-device,drive=3Dhd0 \
      -netdev type=3Duser,id=3Dnet0 -device virtio-net-device,netdev=3Dnet0=
,mac=3D00:11:22:33:44:55 \
      -bios QEMU_EFI.fd -nographic

* The issue seems to be downloading large files. =

In the host OS two files that seem to tickle the bug often are:

* ftp -a http://cpan.pair.com/src/5.0/perl-5.32.1.tar.xz
On NetBSD this file seems to be one byte shorter than it should be. On arm6=
4 is was several bytes shorter.

* ftp -a ftp://ftp.isc.org/isc/bind9/9.16.11/bind-9.16.11.tar.xz
Also seems to tickle the bug


I saw this while trying to use pkgsrc on NetBSD. Saw this on Amd64, i386
and arm64. Tried OpenBSD to rule out NetBSD as the problem. OpenBSD/i386
sees the same issue (ftp returns short read and file is a couple of
bytes smaller).

The screenshot is from amd64 - a fresh boot this morning running on a
fairly idle host.

Kind regards
Chris

> On 2 Feb 2021, at 05:24, Thomas Huth <1914117@bugs.launchpad.net> wrote:
> =

> Please provide more information: How did you compile QEMU? Which version
> did you exactly use? And most important: How do you *run* QEMU? System
> emulation? User mode? What kind of FTP are you doing??
> =

> ** Changed in: qemu
>       Status: New =3D> Incomplete
> =

> -- =

> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1914117
> =

> Title:
>  Short files returned via FTP on Qemu with various architectures and
>  OSes
> =

> Status in QEMU:
>  Incomplete
> =

> Bug description:
> =

>  Qemu 5.2 on Mac OS X Big Sur.
> =

>  I originally thought that it might be caused by the home-brew version of=
 Qemu, but this evening I have removed the brew edition and compiled from s=
cratch (using Ninja & Xcode compiler). =

>  Still getting the same problem,.
> =

>  On the following architectures: =

>  arm64, amd64 and sometimes i386 running NetBSD host OS; =

>  i386 running OpenBSD host OS:
> =

>  I have seen a consistent problem with FTP returning short files. The
>  file will be a couple of bytes too short. I do not believe this is a
>  problem with the OS. Downloading the perl source code from CPAN does
>  not work properly, nor does downloading bind from isc. I've tried this
>  on different architectures as above.
> =

>  (Qemu 4.2 on Ubuntu/x86_64 with NetBSD/i386 seems to function fine. My
>  gut feel is there is something not right on the Mac OS version of Qemu
>  or a bug in 5.2 - obviously in the network layer somewhere. If you
>  have anything you want me to try, please let me know - happy to help
>  get a resolution.)
> =

> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1914117/+subscriptions


** Attachment added: "PastedGraphic-1.tiff"
   https://bugs.launchpad.net/bugs/1914117/+attachment/5459003/+files/Paste=
dGraphic-1.tiff

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914117

Title:
  Short files returned via FTP on Qemu with various architectures and
  OSes

Status in QEMU:
  Incomplete

Bug description:
  =

  Qemu 5.2 on Mac OS X Big Sur.

  I originally thought that it might be caused by the home-brew version of =
Qemu, but this evening I have removed the brew edition and compiled from sc=
ratch (using Ninja & Xcode compiler). =

  Still getting the same problem,.

  On the following architectures: =

  arm64, amd64 and sometimes i386 running NetBSD host OS; =

  i386 running OpenBSD host OS:

  I have seen a consistent problem with FTP returning short files. The
  file will be a couple of bytes too short. I do not believe this is a
  problem with the OS. Downloading the perl source code from CPAN does
  not work properly, nor does downloading bind from isc. I've tried this
  on different architectures as above.

  (Qemu 4.2 on Ubuntu/x86_64 with NetBSD/i386 seems to function fine. My
  gut feel is there is something not right on the Mac OS version of Qemu
  or a bug in 5.2 - obviously in the network layer somewhere. If you
  have anything you want me to try, please let me know - happy to help
  get a resolution.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914117/+subscriptions

