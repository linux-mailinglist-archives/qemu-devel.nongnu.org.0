Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D602D574D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:36:26 +0100 (CET)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIN7-0001Ba-Ua
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knICY-00081o-Df
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:25:32 -0500
Received: from indium.canonical.com ([91.189.90.7]:36550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knICW-0008RU-5d
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:25:30 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knICV-00087Y-4B
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:25:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1C7B22E8042
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:25:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:14:30 -0000
From: Thomas Huth <1598029@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: citypw th-huth
X-Launchpad-Bug-Reporter: Shawn the R0ck (citypw)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160701073419.23556.57565.malonedeb@gac.canonical.com>
Message-Id: <160759167082.31094.16777048251753187708.malone@soybean.canonical.com>
Subject: [Bug 1598029] Re: failed to boot a customized kernel if emulating
 Broadwell/Skylake
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 311ca5f191b9ddf93a05b9548c4dde99a0cf7dd0
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
Reply-To: Bug 1598029 <1598029@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has be

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1598029

Title:
  failed to boot a customized kernel if emulating Broadwell/Skylake

Status in QEMU:
  Incomplete

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

