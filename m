Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEAA5BBD91
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 13:18:23 +0200 (CEST)
Received: from localhost ([::1]:47928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZsJa-0002Yw-An
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 07:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1oZsGg-0000ef-DA
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 07:15:22 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:38670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1oZsGc-0003VD-HR
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 07:15:20 -0400
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 4616A40BCD
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1663499713;
 bh=UP8bJNO513fllsOKgbR69k9LLCnYo/aRfNhjifIbrzw=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=MAhKEsF+3Tm9Sj6GdCjq4KWpBG+Y/BMA43bLEPYl1hzVmIVmmlK5cd9Hni9GNPChd
 /apvmY8gB++cC0tNze/EPpW7EzWl+685eNUlBoWzqTE4VgukI7pUjavB71xtKF0i4o
 nMWZFYzNPvgxEtwpcvYVABBAY8T01QrjewTBsAuUDair7UMRdGLUy5UcaFvV2/ARjW
 nwr5XlvD8ikui+e6uywhVRJ/UBkC7WPZa2GVB71FRhH/FI6j5lPtf+f2MuN61GMq0O
 JM6E6yJfsXJZHbPbaI4Ga0qhtHcRhT4m2B4XsAm7DvOl1CeQu0z/jkp/Z9+U3Au+Cu
 FQZWF1d26S26g==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 3028B4018A
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 11:15:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Sep 2022 11:07:45 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1772165@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: arm usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aditya-govardhan andrew-pennebaker carlo-bramix
 clemd davbac dims dougrabson kraxel-redhat pauldzim philmd pmaydell th-huth
 vortelf weberkai
X-Launchpad-Bug-Reporter: George (vortelf)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd=29?=
References: <152673688616.9061.7617411809661975686.malonedeb@chaenomeles.canonical.com>
 <164553818076.45462.17246694949180967211.malone@dale.internal>
Message-Id: <CAAdtpL6NTm6h9KeXsDTUUTF1YcsLNcLKtFAR=BYAiZg0ceUydQ@mail.gmail.com>
Subject: Re: [Bug 1772165] Re: arm raspi2/raspi3 emulation has no USB support
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26a6866b96cbe27080a0dd50a67efeae15dd1018"; Instance="production"
X-Launchpad-Hash: fdb4f15820e33f69c26bec7f67cd3ef5ae316acd
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Feb 22, 2022 at 3:15 PM Carlo Bramini
<1772165@bugs.launchpad.net> wrote:
>
> I'm also trying to run QEMU for emulating Raspberry PI, but I'm still una=
ble to make working external USB devices like keyboard and mouse.
> Unlike previous users, I'm not using a linux distro but Microsoft Windows=
 10 instead.
> I'm using the precompiled 64bit executables downloaded from https://qemu.=
weilnetz.de/w64/ as suggested from the download page at qemu.org for Window=
s targets.

> The emulator starts, the desktop of the OS appears, but still no keyboard=
 and no mouse support.
> However, I can still login by using the terminal provided by the emulated=
 serial terminal.
>
> Is the feature expected to work also on the port of QEMU for Windows?

Yes.

However upstream QEMU bugs are now tracked on https://gitlab.com/qemu-
project/qemu/-/issues - so if you can reproduce it with the latest
version from upstream QEMU, please report it there.

Regards,

Phil.

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


