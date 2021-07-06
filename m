Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1F73BC585
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:32:32 +0200 (CEST)
Received: from localhost ([::1]:54086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cl5-0004W3-LK
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cf9-0007iH-Gl
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:23 -0400
Received: from indium.canonical.com ([91.189.90.7]:51166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cf7-00039l-Gg
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:23 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cf2-0004wn-NN
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 984122E825E
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:46 -0000
From: Launchpad Bug Tracker <1884425@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cutefatseal331 janitor th-huth
X-Launchpad-Bug-Reporter: Seal Sealy (cutefatseal331)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159273949988.14781.1194342587449588493.malonedeb@wampee.canonical.com>
Message-Id: <162554506711.7821.1672364127806521997.malone@loganberry.canonical.com>
Subject: [Bug 1884425] Re: MIPS64EL emu hangs at reboot
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 5674a09d33ea59e89ec3214e367aaa901f15fe4b
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
Reply-To: Bug 1884425 <1884425@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884425

Title:
  MIPS64EL emu hangs at reboot

Status in QEMU:
  Expired

Bug description:
  QEMU Release version: 5.0.50 (v5.0.0-1411-g26bf4a2921-dirty)

  Full command line: qemu-system-mips64el -hda nt4svr.qcow2 -M magnum -L
  . -global ds1225y.filename=3Dnvram  -global ds1225y.size=3D8200 -net nic
  -net user -cdrom en_winnt_4.0_svr.iso

  Host machine: Windows 10 1909 64-bit, QEMU running under WSL with the
  latest Kali distro and the latest Xming.

  Guest machine: MIPS64EL Magnum machine, no OS needs to be installed to
  reproduce - just change some stuff in the Setup program and try to
  exit

  Note: Custom ROM with Windows NT support used, NTPROM.RAW used from
  http://hpoussineau.free.fr/qemu/firmware/magnum-4000/setup.zip

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884425/+subscriptions

