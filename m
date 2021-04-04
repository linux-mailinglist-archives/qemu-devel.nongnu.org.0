Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267363539EF
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Apr 2021 22:36:45 +0200 (CEST)
Received: from localhost ([::1]:55748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lT9UB-0005nQ-RL
	for lists+qemu-devel@lfdr.de; Sun, 04 Apr 2021 16:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lT9TB-0005Ld-5d
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 16:35:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:58248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lT9T8-0004k8-FL
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 16:35:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lT9T6-000092-0Z
 for <qemu-devel@nongnu.org>; Sun, 04 Apr 2021 20:35:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F2DD32E8166
 for <qemu-devel@nongnu.org>; Sun,  4 Apr 2021 20:35:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Apr 2021 20:27:02 -0000
From: Howard Spoelstra <1850570@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cat-7 johncanada programmingkidx
X-Launchpad-Bug-Reporter: John Canada (johncanada)
X-Launchpad-Bug-Modifier: Howard Spoelstra (cat-7)
References: <157240001496.28481.10507378472210680134.malonedeb@chaenomeles.canonical.com>
 <161756045467.30007.996672314397132559.malone@gac.canonical.com>
Message-Id: <CABLmASEKnvsx85Rx9r7HbqXH4zcGsHE5vYYYO6SR816DGaStQA@mail.gmail.com>
Subject: Re: [Bug 1850570] Re: Cannot use usb-host on Mac OS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: ad6a1f6d40e9803f2ec62c1c6965ad3f2facc7cb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1850570 <1850570@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 4, 2021 at 8:30 PM John Arbuckle <1850570@bugs.launchpad.net> w=
rote:
>
> I am also having problems with using real USB devices. I tried a C-Media
> USB sound card, a CISCO USB headset, and a PNY flash drive. All of them
> seem to be detected by the Windows 7 guest, but can't be started for
> some reason. I have tried running as root. I didn't see any libusb
> errors. My Windows 2000 guest also has issues with starting the USB
> sound card.
>
> My command-line:
> sudo qemu-system-x86_64 -hda "Windows 7 HD.qcow2" -boot "c" -m 5000 -devi=
ce ich9-usb-ehci1 -device usb-host,vendorid=3D0x0930,productid=3D0x6545
>
> Even when I unmount the flash drive first Mac OS 11.1 will actually
> mount the flash drive when I try using it in QEMU.
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
>   qemu-system-i386 image.qcow -usb -device usb-kbd  -device usb-host,vend=
orid=3D0x0781,productid=3D0x5571
>   libusb: error [darwin_claim_interface] USBInterfaceOpen: another proces=
s has device opened for exclusive access
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
>   libusb: error [darwin_claim_interface] USBInterfaceOpen: another proces=
s has device opened for exclusive access
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

Hi John,

I experience similar issues when passing through USB devices in
qemu-system-ppc. macOS load a kext for the device and will not unload
it when libusb tries to connect to the device. I wrote this on the
emaculation site:

For USB storage devices you might need to:
Run a terminal and execute: sudo kextunload
/System/Library/Extensions/IOUSBMassStorageDriver.kext

Other devices might be using other kexts (drivers), so you would need
to find out which kext is loaded for the device. Some devices might be
using a kext that is also in use for other host devices. If you unload
such a kext, the host will loose access to those devices.

I have not yet found a way to reliably find which kexts are loaded and
to unload them.

Best,
Howard

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

