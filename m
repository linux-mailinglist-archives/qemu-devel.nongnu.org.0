Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FB6367B7B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:52:28 +0200 (CEST)
Received: from localhost ([::1]:53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZU8R-0001Pc-No
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZU7F-0008N4-DL
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:51:13 -0400
Received: from indium.canonical.com ([91.189.90.7]:43974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZU78-0000CH-IF
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:51:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZU76-0000bf-Rz
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:51:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D047C2E8157
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:51:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:44:06 -0000
From: Thomas Huth <1848244@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: docmax3 th-huth
X-Launchpad-Bug-Reporter: Anastasios Vacharakis (docmax3)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157116697702.19855.6802467063820397619.malonedeb@gac.canonical.com>
Message-Id: <161907744629.32121.187276788829642266.malone@soybean.canonical.com>
Subject: [Bug 1848244] Re: QEMU KVM IGD SandyBridge Passthrough crash
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 62bbf778c1c9c70df932d9c2c4b18f0c502f0b9e
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
Reply-To: Bug 1848244 <1848244@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm closing this now since there seems to be a workaround available and
nobody updated this bug in the past 1.5 years anymore

** Changed in: qemu
       Status: New =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1848244

Title:
  QEMU KVM IGD SandyBridge Passthrough crash

Status in QEMU:
  Won't Fix

Bug description:
  I try to passthrough my Intel GPU with this command:

  qemu-system-x86_64 -nodefaults -parallel none -k de -rtc
  base=3Dlocaltime -serial unix:/run/qemu/win7-serial.sock,server,nowait
  -monitor unix:/run/qemu/win7-monitor.sock,server,nowait -netdev
  user,id=3Dnet0 -device virtio-net-pci,netdev=3Dnet0,mac=3D52:54:00:00:00:=
07
  -device vfio-pci,host=3D0000:00:02.0,addr=3D0x2 -device vfio-
  pci,host=3D0000:00:1b.0 -device virtio-keyboard-pci -device virtio-
  mouse-pci -object input-linux,id=3Dkbd1,evdev=3D/dev/input/by-
  path/pci-0000:00:1a.0-usb-0:1.2.2:1.2-event-kbd,grab_all=3Don,repeat=3Don
  -object input-linux,id=3Dmouse1,evdev=3D/dev/input/by-
  path/pci-0000:00:1a.0-usb-0:1.2.2:1.2-event-mouse -enable-kvm -cpu
  host -smp 4,sockets=3D1,cores=3D4,threads=3D1 -vga none -display none -m =
2g
  -device virtio-blk-pci,drive=3Dboot,bootindex=3D1 -drive
  file=3D/opt/vm/qcow2/win7.qcow2,format=3Dqcow2,if=3Dnone,id=3Dboot

  This ONLY works if i remove "-enable-kvm" else the windows (7 and 10)
  boot crashes in bluescreen "stop 0x0000003b" (probably while loading
  the intel gpu driver (intel graphics 3000).

  The system is an older ThinkPad T420 with Intel(R) Core(TM) i5-2520M
  CPU @ 2.50GHz.

  CMDLINE: BOOT_IMAGE=3D/vmlinuz-linux root=3DLABEL=3Droot rw ipv6.disable=
=3D0
  net.ifnames=3D0 intel_iommu=3Don iommu=3Dpt video=3DLVDS-1:d

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1848244/+subscriptions

