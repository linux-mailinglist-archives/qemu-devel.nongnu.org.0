Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978D02B5177
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:50:44 +0100 (CET)
Received: from localhost ([::1]:36914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekWR-0007Sw-D6
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kek7Z-0007Cr-SY
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:25:03 -0500
Received: from indium.canonical.com ([91.189.90.7]:57858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kek7T-0006vl-Pp
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:25:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kek7R-0000eM-RH
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 19:24:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C9DFE2E8134
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 19:24:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2020 19:07:45 -0000
From: =?utf-8?q?Jos=C3=A9_Pekkarinen?= <1505759@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: koalinux th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Jos=C3=A9_Pekkarinen_=28koalinux=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Jos=C3=A9_Pekkarinen_=28koalinux=29?=
References: <20151013173129.21250.22285.malonedeb@gac.canonical.com>
Message-Id: <160555366509.14043.12932603848342452426.malone@soybean.canonical.com>
Subject: [Bug 1505759] Re: Usb passthrough of devices plugged to AMD FCH USB
 OHCI Controller failing on q35.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: fc92dcec284b2eb41bda2de12a127a5e9cb0d257
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:11:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1505759 <1505759@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found a different arrangement that made it for me, so that particular cas=
e,
I don't know if it works for me, or if it still fails the same, and versions
has gone so far to check, I'd simply mark this invalid and forget of it.

Best regards.

Jos=C3=A9.

** Changed in: qemu
       Status: Incomplete =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1505759

Title:
  Usb passthrough of devices plugged to AMD FCH USB OHCI Controller
  failing on q35.

Status in QEMU:
  Invalid

Bug description:
  I'm trying to setup a q35 vm with windows 7 guest for vga passthrough.
  The machine works well for this purpose, but the usb devices passed to
  the vm does not. I receive the following errors on screen:

  qemu-system-x86_64: libusb_release_interface: -4 [NO_DEVICE]
  libusb: error [_open_sysfs_attr} open =

  /sys/bus/usb/devices/3-5/bConfigurationValue failed ret=3D-1 errno=3D2
  qemu-system-x86_64: libusb_release_interface: -4 [NO_DEVICE]
  libusb: error [_open_sysfs_attr} open =

  /sys/bus/usb/devices/4-1/bConfigurationValue failed ret=3D-1 errno=3D2
  Disabling IRQ #18
  Disabling IRQ #17

  And from the system log I can see the following:

  Oct 13 20:13:25 koalita kernel: vfio-pci 0000:01:00.1: enabling device (0=
400 -> 0402)
  Oct 13 20:13:29 koalita kernel: usb 3-5: reset low-speed USB device numbe=
r 2 using ohci-pci
  Oct 13 20:13:30 koalita kernel: usb 4-1: reset low-speed USB device numbe=
r 2 using ohci-pci
  Oct 13 20:13:30 koalita kernel: usb 10-2: reset low-speed USB device numb=
er 2 using xhci_hcd
  Oct 13 20:13:31 koalita kernel: usb 10-2: ep 0x81 - rounding interval to =
64 microframes, ep desc says 80 microframes
  Oct 13 20:13:31 koalita kernel: usb 10-2: ep 0x1 - rounding interval to 6=
4 microframes, ep desc says 80 microframes
  Oct 13 20:13:31 koalita kernel: usb 3-5: reset low-speed USB device numbe=
r 2 using ohci-pci
  Oct 13 20:13:31 koalita kernel: usb 10-2: reset low-speed USB device numb=
er 2 using xhci_hcd
  Oct 13 20:13:32 koalita kernel: usb 10-2: ep 0x81 - rounding interval to =
64 microframes, ep desc says 80 microframes
  Oct 13 20:13:32 koalita kernel: usb 10-2: ep 0x1 - rounding interval to 6=
4 microframes, ep desc says 80 microframes
  Oct 13 20:13:32 koalita kernel: usb 4-1: reset low-speed USB device numbe=
r 2 using ohci-pci
  Oct 13 20:13:33 koalita kernel: usb 3-5: reset low-speed USB device numbe=
r 2 using ohci-pci
  Oct 13 20:13:33 koalita kernel: usb 4-1: reset low-speed USB device numbe=
r 2 using ohci-pci
  Oct 13 20:13:34 koalita kernel: usb 3-5: reset low-speed USB device numbe=
r 2 using ohci-pci
  Oct 13 20:13:34 koalita kernel: usb 10-2: reset low-speed USB device numb=
er 2 using xhci_hcd
  Oct 13 20:13:35 koalita kernel: usb 10-2: ep 0x81 - rounding interval to =
64 microframes, ep desc says 80 microframes
  Oct 13 20:13:35 koalita kernel: usb 10-2: ep 0x1 - rounding interval to 6=
4 microframes, ep desc says 80 microframes
  Oct 13 20:13:35 koalita kernel: usb 10-2: reset low-speed USB device numb=
er 2 using xhci_hcd
  Oct 13 20:13:35 koalita kernel: usb 10-2: ep 0x81 - rounding interval to =
64 microframes, ep desc says 80 microframes
  Oct 13 20:13:35 koalita kernel: usb 10-2: ep 0x1 - rounding interval to 6=
4 microframes, ep desc says 80 microframes

  I tried to any combination of usb devices, and even disabling the ICH9
  usb devices to make the setup looks close to the 440fx machine that is
  working for me.

  Version of qemu is 2.2.1(all newer versions fails on usb passthrough,
  even in 440fx machines), and kernel is 4.1.8.

  The script to launch it is the following:

  qemu-system-x86_64 -enable-kvm -M q35 -vga none -cpu host -smp 3,cores=3D=
3,threads=3D1 -m 6144 \
          -L /usr/x86_64-pc-linux-gnu/usr/share/qemu \
          -nodefaults -nodefconfig \
          -device ioh3420,multifunction=3Don,id=3Dpcie \
          -device vfio-pci,host=3D01:00.0,addr=3D1c.0,x-vga=3Don,multifunct=
ion=3Don,bus=3Dpcie \
          -device vfio-pci,host=3D01:00.1,addr=3D1c.1,bus=3Dpcie \
          -netdev user,id=3Duser.0 -device virtio-net-pci,netdev=3Duser.0 \
          -device usb-ehci,id=3Dehci -device nec-usb-xhci,id=3Dxhci \
          -usb -usbdevice host:03f0:134a -usbdevice host:03f0:0024 -usbdevi=
ce host:0079:0006 \
          -drive file=3Dq35_win7.img,format=3Draw,cache=3Dnone,aio=3Dnative=
,if=3Dvirtio

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1505759/+subscriptions

