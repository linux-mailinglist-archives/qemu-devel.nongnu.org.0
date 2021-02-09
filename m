Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D6F314789
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 05:31:50 +0100 (CET)
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Kgn-0000WV-HK
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 23:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9Kew-00081O-4m
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 23:29:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:59472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9Keu-0003uf-GX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 23:29:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l9Kes-0002yZ-US
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 04:29:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DD5012E813C
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 04:29:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Feb 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1598029@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: citypw janitor th-huth
X-Launchpad-Bug-Reporter: Shawn the R0ck (citypw)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160701073419.23556.57565.malonedeb@gac.canonical.com>
Message-Id: <161284423926.15411.11008809554634964890.malone@loganberry.canonical.com>
Subject: [Bug 1598029] Re: failed to boot a customized kernel if emulating
 Broadwell/Skylake
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: 6996e7d20ce26aadcf70a4b250756738870917eb
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
Reply-To: Bug 1598029 <1598029@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1598029

Title:
  failed to boot a customized kernel if emulating Broadwell/Skylake

Status in QEMU:
  Expired

Bug description:
  Hardware: X86-64, Intel(R) Core(TM) i7-6500U( Skylake)
  OS: Linux Mint 18
  Host Kernel: 4.5.7 + PaX/Grsecurity
  Qemu: QEMU emulator version 2.5.0 (Debian 1:2.5+dfsg-5ubuntu10.2)

  [Reproduction Steps]
  1, Install a Debian 8 in the guest
  2, Install a customized kernel( using same config to Debian 8)
  3, Reboot:
  qemu-system-x86_64 -hda debian8-test.img -boot d  -m 2048 -enable-kvm -us=
b -usbdevice tablet -net nic -net tap,ifname=3Dtap0,script=3Dno -cpu Broadw=
ell -smp 2

  or

  qemu-system-x86_64 -hda debian8-test.img -boot d  -m 2048 -enable-kvm
  -usb -usbdevice tablet -net nic -net tap,ifname=3Dtap0,script=3Dno -cpu
  host -smp 2

  [Actual Result]  =

  kernel panic or can't login in the system

  [Workaround]
  qemu-system-x86_64 -hda debian8-test.img -boot d  -m 2048 -enable-kvm -us=
b -usbdevice tablet -net nic -net tap,ifname=3Dtap0,script=3Dno -cpu Haswel=
l -smp 2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1598029/+subscriptions

