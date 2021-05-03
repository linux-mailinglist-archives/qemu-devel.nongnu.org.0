Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1D3716D1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 16:42:27 +0200 (CEST)
Received: from localhost ([::1]:48874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldZmE-0004og-4S
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 10:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldZkw-00046B-ET
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:41:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:35360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldZks-0002ih-9B
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:41:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldZko-0004sD-P9
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:40:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BCD042E8157
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 14:40:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 14:33:04 -0000
From: elmarco <1926952@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: firecode95 marcandre-lureau
X-Launchpad-Bug-Reporter: Firecode95 (firecode95)
X-Launchpad-Bug-Modifier: elmarco (marcandre-lureau)
References: <162004304487.4348.9374620020070858180.malonedeb@chaenomeles.canonical.com>
 <162004313799.12465.17531572055756650478.malone@soybean.canonical.com>
Message-Id: <CAJ+F1CLVVCv2HVTUrMynu-A-eEE+A+g8jmxv2xFCAhSMYK=vpQ@mail.gmail.com>
Subject: Re: [Bug 1926952] Re: SPICE support broken with 6.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: ef4820846432070a33bbb72b406cafd489fcda06
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
Reply-To: Bug 1926952 <1926952@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, May 3, 2021 at 4:07 PM Firecode95 <1926952@bugs.launchpad.net>
wrote:

> Also just removing spice part makes it bootable:
> -spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1926952
>
> Title:
>   SPICE support broken with 6.0
>
> Status in QEMU:
>   New
>
> Bug description:
>   Using latest relase 6.0.0 while using Intel GVT-G DMA-BUF and SPICE
>   for usb redirection Qemu won't start:
>
>   qemu-system-x86_64: The console requires display DMABUF support.
>
>   However just patching ui/console.c:
>
>   if (flags & GRAPHIC_FLAGS_DMABUF &&
>           !displaychangelistener_has_dmabuf(dcl)) {
>           error_setg(errp, "The console requires display DMABUF support."=
);
>           return false;
>   }
>
>   to always return true for dmabuf part works just fine:
>
>   if (flags & GRAPHIC_FLAGS_DMABUF &&
>           !displaychangelistener_has_dmabuf(dcl)) {
>           error_setg(errp, "The console requires display DMABUF support."=
);
>           return true;
>   }
>
>   This behavior wasn't in qemu 5.x version.
>
>   To reproduce this bug need to use:
>
>   /usr/bin/qemu-system-x86_64 \
>   -machine q35 \
>   -enable-kvm \
>   -no-user-config \
>   -nodefaults \
>   -no-hpet \
>   -display gtk,gl=3Don \
>   -device
> pcie-root-port,port=3D0x0,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifuncti=
on=3Don,addr=3D0x1
> \
>   -device
> vfio-pci,id=3Dhostdev2,driver=3Dvfio-pci-nohotplug,romfile=3D/sys/devices=
/pci0000:00/0000:00:02.0/gvt_firmware,sysfsdev=3D/sys/bus/mdev/devices/1ae4=
0c36-b180-4af0-8fab-c27de21f597d,x-igd-opregion=3Don,ramfb=3Don,display=3Do=
n,xres=3D1920,yres=3D1080,bus=3Dpcie.0,multifunction=3Don,addr=3D0x2
> \
>   -spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1926952/+subscriptions
>
>

Did you actually get the dmabuf update displayed over spice? If not, then
it is not a bug, it's a bug fix :) But I might be missing something.. I
don't see how this could happen without egl-headless though.


-- =

Marc-Andr=C3=A9 Lureau

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926952

Title:
  SPICE support broken with 6.0

Status in QEMU:
  New

Bug description:
  Using latest relase 6.0.0 while using Intel GVT-G DMA-BUF and SPICE
  for usb redirection Qemu won't start:

  qemu-system-x86_64: The console requires display DMABUF support.

  However just patching ui/console.c:

  if (flags & GRAPHIC_FLAGS_DMABUF &&
          !displaychangelistener_has_dmabuf(dcl)) {
          error_setg(errp, "The console requires display DMABUF support.");
          return false;
  }

  to always return true for dmabuf part works just fine:

  if (flags & GRAPHIC_FLAGS_DMABUF &&
          !displaychangelistener_has_dmabuf(dcl)) {
          error_setg(errp, "The console requires display DMABUF support.");
          return true;
  }

  This behavior wasn't in qemu 5.x version.

  To reproduce this bug need to use:

  /usr/bin/qemu-system-x86_64 \
  -machine q35 \
  -enable-kvm \
  -no-user-config \
  -nodefaults \
  -no-hpet \
  -display gtk,gl=3Don \
  -device pcie-root-port,port=3D0x0,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,mul=
tifunction=3Don,addr=3D0x1 \
  -device vfio-pci,id=3Dhostdev2,driver=3Dvfio-pci-nohotplug,romfile=3D/sys=
/devices/pci0000:00/0000:00:02.0/gvt_firmware,sysfsdev=3D/sys/bus/mdev/devi=
ces/1ae40c36-b180-4af0-8fab-c27de21f597d,x-igd-opregion=3Don,ramfb=3Don,dis=
play=3Don,xres=3D1920,yres=3D1080,bus=3Dpcie.0,multifunction=3Don,addr=3D0x=
2 \
  -spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926952/+subscriptions

