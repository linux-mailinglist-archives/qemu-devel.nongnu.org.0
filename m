Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94D93686EA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 21:06:47 +0200 (CEST)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZef0-0004f6-BT
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 15:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZedm-0003TX-Dv
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:05:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:34808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZedh-0002OR-Kb
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:05:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZedf-0003T3-K2
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:05:23 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 662C62E815C
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:05:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 16:36:01 -0000
From: Ravishankar <1925417@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rreddy78
X-Launchpad-Bug-Reporter: Ravishankar (rreddy78)
X-Launchpad-Bug-Modifier: Ravishankar (rreddy78)
References: <161906987819.6402.12318771307523732954.malonedeb@chaenomeles.canonical.com>
Message-Id: <161910936165.7282.5149772334218896613.malone@chaenomeles.canonical.com>
Subject: [Bug 1925417] Re: Cannot boot from EFI image on aarch64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: c553fac0eac9dfb4ff0834e10109904aa0302de7
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
Reply-To: Bug 1925417 <1925417@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When i try to do it manually using the instructions provided here:

https://mricher.fr/post/boot-from-an-efi-shell/

I see that

Mapping table
      FS0: Alias(s):HD0m:;BLK4:
          VenHw(837DCA9E-E874-4D82-B29A-23FE0E23D1E2,003E000A00000000)/HD(1=
2,GPT,49037CF8-B2EF-5B4B-8CCE-EF5803A9E8B3,0x3D000,0x10000)
    BLK13: Alias(s):
          VenHw(93E34C7E-B5


BLK4 is not having any EFI file.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1925417

Title:
  Cannot boot from EFI image on aarch64

Status in QEMU:
  New

Bug description:
  I am unable to boot from a EFI disk image on aarch64 qemu.

  I have qemu built and installed from sources on a jetson-nano

  qemu-system-aarch64 -version
  QEMU emulator version 5.2.50 (v5.2.0-3234-gbdee969c0e)
  Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

  KVM and and virtio are enabled in host kernel.

  Now I want to boot a ChromiumOS image. I have the image downloaded
  from here:

  https://chromium.arnoldthebat.co.uk/?dir=3Ddaily

  The image looks fine:

  rreddy78@jetson-nano:~/Downloads$ fdisk -lu chromiumos_image.bin =

  Disk chromiumos_image.bin: 6.2 GiB, 6606109184 bytes, 12902557 sectors
  Units: sectors of 1 * 512 =3D 512 bytes
  Sector size (logical/physical): 512 bytes / 512 bytes
  I/O size (minimum/optimal): 512 bytes / 512 bytes
  Disklabel type: gpt
  Disk identifier: C5B6CA94-0AF1-374E-90B5-A5CF4DC1FF51

  Device                   Start      End Sectors  Size Type
  chromiumos_image.bin1  4513792 12902508 8388717    4G Linux filesystem
  chromiumos_image.bin2    20480    53247   32768   16M ChromeOS kernel
  chromiumos_image.bin3   319488  4513791 4194304    2G ChromeOS root fs
  chromiumos_image.bin4    53248    86015   32768   16M ChromeOS kernel
  chromiumos_image.bin5   315392   319487    4096    2M ChromeOS root fs
  chromiumos_image.bin6    16448    16448       1  512B ChromeOS kernel
  chromiumos_image.bin7    16449    16449       1  512B ChromeOS root fs
  chromiumos_image.bin8    86016   118783   32768   16M Linux filesystem
  chromiumos_image.bin9    16450    16450       1  512B ChromeOS reserved
  chromiumos_image.bin10   16451    16451       1  512B ChromeOS reserved
  chromiumos_image.bin11      64    16447   16384    8M unknown
  chromiumos_image.bin12  249856   315391   65536   32M EFI System

  Partition table entries are not in disk order.

  Now I try booting like this:

  qemu-system-aarch64 -M virt -m 2048 -smp 2 -cpu host -enable-kvm  \
  -device usb-ehci -device usb-kbd  -device usb-mouse -usb -serial stdio  \
  -device virtio-gpu-pci,virgl=3Don,xres=3D1600,yres=3D900 -display sdl,gl=
=3Don \
  -device virtio-blk-device,drive=3Dhd \
  -drive if=3Dnone,file=3Dchromiumos_image.bin,format=3Draw,id=3Dhd   \
  -netdev user,id=3Dmynet   \
  -device virtio-net-device,netdev=3Dmynet \
  -bios edk2-aarch64-code.fd -no-reboot

  But I am unable to boot.

  Memory Type Information settings change.
  [Bds]Booting UEFI Misc Device
   BlockSize : 262144 =

   LastBlock : FF =

  [Bds] Expand VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00) -> <null stri=
ng>
  BdsDxe: failed to load Boot0001 "UEFI Misc Device" from VenHw(93E34C7E-B5=
0E-11DF-9223-2443DFD72085,00): Not Found

  =

  and =


  =

  [Bds] Expand VenHw(837DCA9E-E874-4D82-B29A-23FE0E23D1E2,003E000A00000000)=
 -> <null string>
  BdsDxe: failed to load Boot0002 "UEFI Misc Device 2" from VenHw(837DCA9E-=
E874-4D82-B29A-23FE0E23D1E2,003E000A00000000): Not Found

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1925417/+subscriptions

