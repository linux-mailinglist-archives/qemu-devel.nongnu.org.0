Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587C04BFAB7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 15:15:44 +0100 (CET)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMVx8-0001kM-TA
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 09:15:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nMVnl-0006fT-Tr
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:06:01 -0500
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:34838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nMVnd-0007Fc-Qw
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:06:01 -0500
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 42831405E1
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1645538747;
 bh=4e1rBE3sYuGtl5bwnXE7nCtZjGYe+zeCfIMUTgTWhyA=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=tvKdkuc0ag45/vKcGLuRxN/vE6cWAhH8yxGAjUIeQHzwX60DK9Magv3hkCjscqDJX
 tDIL7uxYqsv2HpTou55KUWjB7CBX9yk6sI5gS4fc3VtojhoKA3pya0BCYy8s3ahVsV
 CFrli3BMVDWO7heSLuLa9e0x8QKsdh4CcFRofbXLXpEKLL/zfV/YmR4o6NGy96dBT4
 GSMQhXcZjG1Zrv4VfqqlNBPGzx2sI4zcNxGaynxn1M8BcZsolWmTV4NAOklo5WfjJf
 ZRMcLGYauAhx6ox3uC2j9lOxyL85cJ37ogUY5GdgPzn9VQQ2UN2h9MFJNYIdDMbAfS
 6OVyehv1KOWHA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DD6F62E8212
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:05:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Feb 2022 13:56:20 -0000
From: Carlo Bramini <1772165@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: arm usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aditya-govardhan andrew-pennebaker carlo-bramix
 clemd davbac dims dougrabson kraxel-redhat pauldzim pmaydell th-huth vortelf
 weberkai
X-Launchpad-Bug-Reporter: George (vortelf)
X-Launchpad-Bug-Modifier: Carlo Bramini (carlo-bramix)
References: <152673688616.9061.7617411809661975686.malonedeb@chaenomeles.canonical.com>
Message-Id: <164553818076.45462.17246694949180967211.malone@dale.internal>
Subject: [Bug 1772165] Re: arm raspi2/raspi3 emulation has no USB support
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="131c1c72b6032652fb002ebff08e63a8deeb8d0a"; Instance="production"
X-Launchpad-Hash: 72c156859a26a8db6838c55efc9634b3f7b1e764
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1772165 <1772165@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm also trying to run QEMU for emulating Raspberry PI, but I'm still unabl=
e to make working external USB devices like keyboard and mouse.
Unlike previous users, I'm not using a linux distro but Microsoft Windows 1=
0 instead.
I'm using the precompiled 64bit executables downloaded from https://qemu.we=
ilnetz.de/w64/ as suggested from the download page at qemu.org for Windows =
targets.
The version printed by the emulator is:

> QEMU emulator version 6.2.0 (v6.2.0-11889-g5b72bf03f5-dirty)
> Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

I'm launching the emulator with this command as administrator:

qemu-system-arm -M raspi2b -drive file=3D2020-12-02-raspios-buster-
armhf.img,format=3Draw,if=3Dsd -dtb qemu-rpi-kernel\native-
emuation\dtbs\bcm2709-rpi-2-b.dtb -kernel qemu-rpi-kernel\native-
emuation\kernels\kernel7.img -append "rw earlycon=3Dpl011,0x3f201000
console=3DttyAMA0 loglevel=3D8 root=3D/dev/mmcblk0p2 fsck.repair=3Dyes
net.ifnames=3D0 rootwait memtest=3D1 dwc_otg.fiq_fsm_enable=3D0" -serial st=
dio
-no-reboot -netdev user,id=3Dnet0 -usb -device usb-kbd -device usb-tablet
-device usb-net,netdev=3Dnet0

Besides few obvious changes, like the separator character for
directories (\ instead of /) and quotes (" instead of '), the command is
the same as the one described above.

The emulator starts, the desktop of the OS appears, but still no keyboard a=
nd no mouse support.
However, I can still login by using the terminal provided by the emulated s=
erial terminal.

Is the feature expected to work also on the port of QEMU for Windows?

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1772165

Title:
  arm raspi2/raspi3 emulation has no USB support

Status in QEMU:
  Fix Released

Bug description:
  Using Qemu 2.12.0 on ArchLinux.

  Trying to emulate arm device with `qemu-system-arm` and attach usb
  device for unput using

  ` -usb -device usb-host,bus=3D001,vendorid=3D0x1d6b,productid=3D0x0002 `

  # lsusb returns

  Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
  Bus 001 Device 014: ID 13d3:3487 IMC Networks=20
  Bus 001 Device 004: ID 0457:11af Silicon Integrated Systems Corp.=20
  Bus 001 Device 003: ID 0bda:57e6 Realtek Semiconductor Corp.=20
  Bus 001 Device 002: ID 0bda:0129 Realtek Semiconductor Corp. RTS5129 Card=
 Reader Controller
  Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

  # qemu returns
  qemu-system-arm: -device usb-host,bus=3D001,vendorid=3D0x1d6b,productid=
=3D0x0002: Bus '001' not found

 =20
  Tried with connecting external usb keyboard but that didn't seem to work =
either.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1772165/+subscriptions


