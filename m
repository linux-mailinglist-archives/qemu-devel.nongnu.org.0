Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEF7EB4B4
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Oct 2019 17:27:33 +0100 (CET)
Received: from localhost ([::1]:52314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQDIJ-0005AF-Lb
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 12:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iQD2B-0005B4-Mv
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 12:10:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iQD29-0005aH-GE
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 12:10:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:42722)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iQD29-0005Yj-5m
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 12:10:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iQD27-0004zT-Hd
 for <qemu-devel@nongnu.org>; Thu, 31 Oct 2019 16:10:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 815BA2E8076
 for <qemu-devel@nongnu.org>; Thu, 31 Oct 2019 16:10:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 31 Oct 2019 16:01:43 -0000
From: John Arbuckle <programmingkidx@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: johncanada programmingkidx
X-Launchpad-Bug-Reporter: John Canada (johncanada)
X-Launchpad-Bug-Modifier: John Arbuckle (programmingkidx)
References: <157240001496.28481.10507378472210680134.malonedeb@chaenomeles.canonical.com>
Message-Id: <CAKyx-3NXjmx13rJ7EJwt_6ovG4CGAqePiWduAus7SyYMUp+E0A@mail.gmail.com>
Subject: Re: [Bug 1850570] [NEW] Cannot use usb-host on Mac OS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="469f241f4e73cc0bdffa4e30654052a2af068e06";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: facf7e706b7e381fee939367f5fc7c98cda63180
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1850570 <1850570@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>
> Message: 9
> Date: Wed, 30 Oct 2019 01:46:54 -0000
> From: John Canada <1850570@bugs.launchpad.net>
> To: qemu-devel@nongnu.org
> Subject: [Bug 1850570] [NEW] Cannot use usb-host on Mac OS
> Message-ID:
>         <
> 157240001496.28481.10507378472210680134.malonedeb@chaenomeles.canonical.c=
om
> >
>
> Content-Type: text/plain; charset=3D"utf-8"
>
> Public bug reported:
>
> Usb-host will not work on Mac OS 10.15.  Qemu runs, though it gives
> these errors and the drive does not show up.  Also, when Qemu is
> starting the drive ejects and remounts twice. Qemu built with
> ./configure --target-list=3Di386-softmmu,x86_64-softmmu --enable-sdl
> --disable-cocoa --enable-sdl-image.
>
> qemu-system-i386 image.qcow -usb -device usb-kbd  -device
> usb-host,vendorid=3D0x0781,productid=3D0x5571
> libusb: error [darwin_claim_interface] USBInterfaceOpen: another process
> has device opened for exclusive access
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] USBInterfaceOpen: another process
> has device opened for exclusive access
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
> libusb: error [darwin_claim_interface] interface not found
>
> ** Affects: qemu
>      Importance: Undecided
>          Status: New
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1850570
>
> Title:
>   Cannot use usb-host on Mac OS
>
> Status in QEMU:
>   New
>
> Bug description:
>   Usb-host will not work on Mac OS 10.15.  Qemu runs, though it gives
>   these errors and the drive does not show up.  Also, when Qemu is
>   starting the drive ejects and remounts twice. Qemu built with
>   ./configure --target-list=3Di386-softmmu,x86_64-softmmu --enable-sdl
>   --disable-cocoa --enable-sdl-image.
>
>   qemu-system-i386 image.qcow -usb -device usb-kbd  -device
> usb-host,vendorid=3D0x0781,productid=3D0x5571
>   libusb: error [darwin_claim_interface] USBInterfaceOpen: another process
> has device opened for exclusive access
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] USBInterfaceOpen: another process
> has device opened for exclusive access
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>   libusb: error [darwin_claim_interface] interface not found
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1850570/+subscriptions
>
>
>
Have you tried running QEMU under root yet? I had a similar issue with
accessing the optical drive on my computer until I ran QEMU like this:

sudo qemu-system-i386 ...

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1850570

Title:
  Cannot use usb-host on Mac OS

Status in QEMU:
  New

Bug description:
  Usb-host will not work on Mac OS 10.15.  Qemu runs, though it gives
  these errors and the drive does not show up.  Also, when Qemu is
  starting the drive ejects and remounts twice. Qemu built with
  ./configure --target-list=3Di386-softmmu,x86_64-softmmu --enable-sdl
  --disable-cocoa --enable-sdl-image.

  qemu-system-i386 image.qcow -usb -device usb-kbd  -device usb-host,vendor=
id=3D0x0781,productid=3D0x5571
  libusb: error [darwin_claim_interface] USBInterfaceOpen: another process =
has device opened for exclusive access
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] USBInterfaceOpen: another process =
has device opened for exclusive access
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found
  libusb: error [darwin_claim_interface] interface not found

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1850570/+subscriptions

