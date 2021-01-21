Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484832FE0C0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 05:32:41 +0100 (CET)
Received: from localhost ([::1]:51390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ReC-0006Ji-AW
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 23:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l2RcV-0004ZT-B3
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 23:30:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:54766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l2RcT-00070p-K8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 23:30:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l2RcS-0002iA-CE
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 04:30:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 59D562E805B
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 04:30:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Jan 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1756538@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gilius janitor th-huth
X-Launchpad-Bug-Reporter: gilius (gilius)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152129153470.15061.1404987375350201277.malonedeb@chaenomeles.canonical.com>
Message-Id: <161120263797.14063.8252205406701704642.malone@loganberry.canonical.com>
Subject: [Bug 1756538] Re: Minimal Ubuntu vs. Debian differences
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: 90e3a51f39fdf3815f6c55faf8a91212a3a6e68b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1756538 <1756538@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1756538

Title:
  Minimal Ubuntu vs. Debian differences

Status in QEMU:
  Expired

Bug description:
  I'm using Qemu on Ubuntu (minimal) and Debian (minimal) on Android
  (Arch64) via Linux Deploy to run Windows guests. Here's a few issues I
  encountered:

  1) Qemu on (minimal) Debian 9 and Ubuntu cannot run Windows 7-10
  guests (only Windows XP and below) because there's a black screen
  after the boot menu. Qemu on Debian 10, however, can run Windows 7.
  Incidentally, these distros run on the host in bios compatibility mode
  instead of UEFI. Ubuntu Desktop (full distro) on other hosts does not
  display the black screen when running Qemu.

  2) Qemu on Debian 9-10 (minimal) does not display fullscreen - but
  Ubuntu minimal does display full-screen.

  3) Qemu on Limbo PC Emulator and on Debian 9-10 only run windows
  guests at 1 GHz using the default Qemu CPU, but Ubuntu runs windows
  guests at 2 GHz using the default Qemu CPU.

  4) Enable KVM doesn't work, and virtualization isn't detected through
  Limbo PC Emulator and minimal Linux distros running on Android -
  perhaps is a problem with running Linux distros via Linux Deploy using
  Chroot on Android (not so much a Qemu-KVM issue) and failing to detect
  ARMv8-A CPUs that are indeed capable of virtualization.

  Can anyone explain these differences? I believe they are all using the
  latest versions of Qemu.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1756538/+subscriptions

