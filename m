Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6315B3758B3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:50:00 +0200 (CEST)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehCJ-0004dZ-Gq
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1legol-000809-VL
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:25:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:50938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1legog-000494-Sa
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:25:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1legof-0000ew-8T
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 16:25:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 228822E813A
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 16:25:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 16:20:16 -0000
From: Thomas Huth <1884425@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cutefatseal331 th-huth
X-Launchpad-Bug-Reporter: Seal Sealy (cutefatseal331)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159273949988.14781.1194342587449588493.malonedeb@wampee.canonical.com>
Message-Id: <162031801659.6598.11457540238830961543.malone@wampee.canonical.com>
Subject: [Bug 1884425] Re: MIPS64EL emu hangs at reboot
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: d6b6d177450c51de23d49ba40a4895cdc6e5865b
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
Reply-To: Bug 1884425 <1884425@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884425

Title:
  MIPS64EL emu hangs at reboot

Status in QEMU:
  Incomplete

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

