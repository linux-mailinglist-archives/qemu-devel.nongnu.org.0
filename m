Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC337700F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:22:58 +0200 (CEST)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfGMb-0005Yz-62
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGKQ-0003XR-5n
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:20:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:54992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGKL-0008WP-NU
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:20:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfGKK-0000No-Gt
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 06:20:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7DBA12E8010
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 06:20:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 06:10:52 -0000
From: Thomas Huth <1893807@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jesussanz2003 th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Jes=C3=BAs_Sanz_del_Rey_=28jesussanz200?=
 =?utf-8?q?3=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159897706621.21998.10972908941872978580.malonedeb@chaenomeles.canonical.com>
Message-Id: <162045425282.10688.17488262048368237700.malone@chaenomeles.canonical.com>
Subject: [Bug 1893807] Re: Crash when launching windows qemu version from WSL2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 0b362bef9fcfc074e5373ae0e4d8272505d770e4
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
Reply-To: Bug 1893807 <1893807@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

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
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1893807

Title:
  Crash when launching windows qemu version from WSL2

Status in QEMU:
  Incomplete

Bug description:
  Version: 5.1.0
  Command line from WSL2:
  qemu-system-x86_64.exe -hdd /home/jesus/proyectos/RWivOS/bin/RELEASE/imag=
e.hdd -m 4G -smp 4 -machine q35 -debugcon stdio

  OS: Windows 10(64 bits) from WSL2 Ubuntu 18.04

  The error:
  ERROR:/home/stefan/src/qemu/repo.or.cz/qemu/ar7/block.c:1325:bdrv_open_dr=
iver: assertion
  =C2=A0failed: (is_power_of_2(bs->bl.request_alignment))

  The problem i'm seeing when i lauch from wsl2 only occurs when
  launched with argument -hdd from WSL2, if i launch it from Windows
  pointing to the WSL path where the file is stored works.

  It occurs on other versions, i tried 4.1.0 too.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1893807/+subscriptions

