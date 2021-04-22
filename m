Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437CB36804B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:23:31 +0200 (CEST)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYMk-0003j1-CD
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZYKM-0001w5-8E
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:21:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:57804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZYKH-0007jy-Pk
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:21:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZYKE-0002jv-QQ
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 12:20:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A5D442E8163
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 12:20:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 12:11:30 -0000
From: Paul Goyette <1743191@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: regression
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gson kraxel-redhat ottaviocr paul-whooppee philmd
 stefanha th-huth
X-Launchpad-Bug-Reporter: Andreas Gustafsson (gson)
X-Launchpad-Bug-Modifier: Paul Goyette (paul-whooppee)
References: <151591854188.4596.10964938100242408667.malonedeb@wampee.canonical.com>
 <161906949228.9315.10102465599512061473.malone@wampee.canonical.com>
Message-Id: <Pine.NEB.4.64.2104220510480.29617@speedy.whooppee.com>
Subject: Re: [Bug 1743191] Re: Interacting with NetBSD serial console boot
 blocks no longer works
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: eda981335c5c10e7727c50bfa2de64593bc91182
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
Reply-To: Bug 1743191 <1743191@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bug was fixed long ago, so long ago that I have no idea when!

Please close wiwth an appropriate status.


On Thu, 22 Apr 2021, Thomas Huth wrote:

> The QEMU project is currently considering to move its bug tracking to
> another system. For this we need to know which bugs are still valid
> and which could be closed already. Thus we are setting older bugs to
> "Incomplete" now.
>
> If you still think this bug report here is valid, then please switch
> the state back to "New" within the next 60 days, otherwise this report
> will be marked as "Expired". Or please mark it as "Fix Released" if
> the problem has been solved with a newer version of QEMU already.
>
> Thank you and sorry for the inconvenience.
>
> ** Changed in: qemu
>       Status: New =3D> Incomplete
>
> -- =

> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1743191
>
> Title:
>  Interacting with NetBSD serial console boot blocks no longer works
>
> Status in QEMU:
>  Incomplete
>
> Bug description:
>  The NetBSD boot blocks display a menu allowing the user to make a
>  selection using the keyboard.  For example, when booting a NetBSD
>  installation CD-ROM, the menu looks like this:
>
>           1. Install NetBSD
>           2. Install NetBSD (no ACPI)
>           3. Install NetBSD (no ACPI, no SMP)
>           4. Drop to boot prompt
>
>      Choose an option; RETURN for default; SPACE to stop countdown.
>      Option 1 will be chosen in 30 seconds.
>
>  When booting NetBSD in a recent qemu using an emulated serial console,
>  making this menu selection no longer works: when you type the selected
>  number, the keyboard input is ignored, and the 30-second countdown
>  continues.  In older versions of qemu, it works.
>
>  To reproduce the problem, run:
>
>     wget http://ftp.netbsd.org/pub/NetBSD/NetBSD-7.1.1/amd64/installation=
/cdrom/boot-com.iso
>     qemu-system-x86_64 -nographic -cdrom boot-com.iso
>
>  During the 30-second countdown, press 4
>
>  Expected behavior: The countdown stops and you get a ">" prompt
>
>  Incorrect behavior: The countdown continues
>
>  There may also be some corruption of the terminal output; for example,
>  "Option 1 will be chosen in 30 seconds" may be displayed as "Option 1
>  will be chosen in p0 seconds".
>
>  Using bisection, I have determined that the problem appeared with qemu
>  commit 083fab0290f2c40d3d04f7f22eed9c8f2d5b6787, in which seabios was
>  updated to 1.11 prerelease, and the problem is still there as of
>  commit 7398166ddf7c6dbbc9cae6ac69bb2feda14b40ac.  The host operating
>  system used for the tests was Debian 9 x86_64.
>
>  Credit for discovering this bug goes to Paul Goyette.
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1743191/+subscriptions
>
> !DSPAM:60811a8265601949211437!
>
>

+--------------------+--------------------------+-----------------------+
| Paul Goyette       | PGP Key fingerprint:     | E-mail addresses:     |
| (Retired)          | FA29 0E3B 35AF E8AE 6651 | paul@whooppee.com     |
| Software Developer | 0786 F758 55DE 53BA 7731 | pgoyette@netbsd.org   |
+--------------------+--------------------------+-----------------------+

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1743191

Title:
  Interacting with NetBSD serial console boot blocks no longer works

Status in QEMU:
  New

Bug description:
  The NetBSD boot blocks display a menu allowing the user to make a
  selection using the keyboard.  For example, when booting a NetBSD
  installation CD-ROM, the menu looks like this:

           1. Install NetBSD
           2. Install NetBSD (no ACPI)
           3. Install NetBSD (no ACPI, no SMP)
           4. Drop to boot prompt

      Choose an option; RETURN for default; SPACE to stop countdown.
      Option 1 will be chosen in 30 seconds.

  When booting NetBSD in a recent qemu using an emulated serial console,
  making this menu selection no longer works: when you type the selected
  number, the keyboard input is ignored, and the 30-second countdown
  continues.  In older versions of qemu, it works.

  To reproduce the problem, run:

     wget http://ftp.netbsd.org/pub/NetBSD/NetBSD-7.1.1/amd64/installation/=
cdrom/boot-com.iso
     qemu-system-x86_64 -nographic -cdrom boot-com.iso

  During the 30-second countdown, press 4

  Expected behavior: The countdown stops and you get a ">" prompt

  Incorrect behavior: The countdown continues

  There may also be some corruption of the terminal output; for example,
  "Option 1 will be chosen in 30 seconds" may be displayed as "Option 1
  will be chosen in p0 seconds".

  Using bisection, I have determined that the problem appeared with qemu
  commit 083fab0290f2c40d3d04f7f22eed9c8f2d5b6787, in which seabios was
  updated to 1.11 prerelease, and the problem is still there as of
  commit 7398166ddf7c6dbbc9cae6ac69bb2feda14b40ac.  The host operating
  system used for the tests was Debian 9 x86_64.

  Credit for discovering this bug goes to Paul Goyette.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1743191/+subscriptions

