Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818773089CF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:17:55 +0100 (CET)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5VX0-00021K-K6
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5VVA-0001Y0-0l
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:16:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:35220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5VV7-0006du-HB
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:15:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l5VV2-0002FK-Gi
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:15:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5B3BC2E813E
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:15:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Jan 2021 15:08:13 -0000
From: John Arbuckle <1913505@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balaton-4 mark-cave-ayland mishari pmaydell
 programmingkidx th-huth
X-Launchpad-Bug-Reporter: Mishari Muqbil (mishari)
X-Launchpad-Bug-Modifier: John Arbuckle (programmingkidx)
References: <161180131265.32409.4817508561083668447.malonedeb@chaenomeles.canonical.com>
Message-Id: <A6B43E75-ACEC-423D-BF4D-28F0139FD5B5@gmail.com>
Subject: [Bug 1913505] Re: Windows XP slow on Apple M1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 3cb925ab8dd1be61fcd03351ad2aa098c9845e93
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
Reply-To: Bug 1913505 <1913505@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Jan 29, 2021, at 1:20 AM, qemu-devel-request@nongnu.org wrote:
> =

> Message: 14
> Date: Fri, 29 Jan 2021 06:06:41 -0000
> From: Thomas Huth <1913505@bugs.launchpad.net>
> To: qemu-devel@nongnu.org
> Subject: [Bug 1913505] Re: Windows XP slow on Apple M1
> Message-ID:
> 	<161190040137.32137.17544748693681218726.malone@chaenomeles.canonical.co=
m>
> 	=

> Content-Type: text/plain; charset=3D"utf-8"
> =

> Did you compile QEMU on your own? If so, which parameters did you use
> for the "configure" script?
> =

> -- =

> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1913505
> =

> Title:
>  Windows XP slow on Apple M1
> =

> Status in QEMU:
>  New
> =

> Bug description:
>  Qemu installed by using brew install qemu -s on M1
> =

>  QEMU emulator version 5.2.0
>  XP image from: https://archive.org/details/WinXPProSP3x86
> =

>  Commands run:
>  $ qemu-img create -f qcow2 xpsp3.img 10G
>  $ qemu-system-i386 -m 512 -hda xpsp3.img -cdrom WinXPProSP3x86/en_window=
s_xp_professional_with_service_pack_3_x86_cd_vl_x14-73974.iso -boot d
> =

>  It's taken 3 days now with qemu running at around 94% CPU and
>  installation hasn't finished. The mouse pointer moves and occasionally
>  changes between the pointer and hourglass so it doesn't seem to have
>  frozen.
> =

> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1913505/+subscriptions


Hi, I followed your directions on reproducing this issue. My times were ver=
y different from yours. =


I used my own patch to make qemu-system-i386 on my M1 Mac running Mac OS
11.1. It is on the list if you want to try it.

For Windows XP, I used my own copy. It was build 2600 and Service Pack
3.

Installing Windows XP took about 23 minutes. After the installation was
completed Windows tried to start up but probably crashed so I had to
reboot the VM. After that it started up without problems.

Here are some benchmarks I did:

For my ARM-based QEMU I saw these start up times to the login screen:
1:20, 1:19, 1:16, 1:18

For a QEMU binary I made a few years ago that is x86_64-based, I saw
these times: 1:09, 1:09

The ARM-based QEMU is at version 5.2.50 (git commit
9cd69f1a270235b652766f00b94114f48a2d603f).

The x86_64-based QEMU is at version 2.10.1.

I would have bet that the ARM-based QEMU would run circles around the
x86_64 version, but the opposite happened.

These are my theories about what could be wrong:
- A patch somewhere made QEMU slow
  -- feature bloat
  -- bugs
  -- emulated hardware issues
- The ARM TCG isn't as good as the x86_64 version
- Non-optimal command-line options

Please let me know if you have any ideas or suggestions.

Thank you.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913505

Title:
  Windows XP slow on Apple M1

Status in QEMU:
  New

Bug description:
  Qemu installed by using brew install qemu -s on M1

  QEMU emulator version 5.2.0
  XP image from: https://archive.org/details/WinXPProSP3x86

  Commands run:
  $ qemu-img create -f qcow2 xpsp3.img 10G
  $ qemu-system-i386 -m 512 -hda xpsp3.img -cdrom WinXPProSP3x86/en_windows=
_xp_professional_with_service_pack_3_x86_cd_vl_x14-73974.iso -boot d

  It's taken 3 days now with qemu running at around 94% CPU and
  installation hasn't finished. The mouse pointer moves and occasionally
  changes between the pointer and hourglass so it doesn't seem to have
  frozen.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913505/+subscriptions

