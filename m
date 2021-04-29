Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243A736E4ED
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 08:37:09 +0200 (CEST)
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0IO-0003w7-0v
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 02:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc0Gu-0003OP-T3
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 02:35:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:49460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc0Gr-0004zH-W9
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 02:35:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc0Gp-0002qb-V3
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 06:35:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BFBF42E8031
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 06:35:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 06:26:51 -0000
From: Howard Spoelstra <1926497@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: m68k q800
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cat-7 jrmuizel laurent-vivier
X-Launchpad-Bug-Reporter: Jeff (jrmuizel)
X-Launchpad-Bug-Modifier: Howard Spoelstra (cat-7)
References: <161963801251.13717.437360863998468941.malonedeb@wampee.canonical.com>
 <161964487066.14015.8898428089827057186.malone@wampee.canonical.com>
Message-Id: <CABLmASGjYD=okbcHbENPjRfhkrvBKtTKGsY7yGXTkeC398+btg@mail.gmail.com>
Subject: Re: [Bug 1926497] Re: dp83932 stops working after a short while
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: e4f40c9c8a5acd5dec66abe7825a41cf0ea1667a
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
Reply-To: Bug 1926497 <1926497@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 28, 2021 at 11:31 PM Jeff <1926497@bugs.launchpad.net> wrote:
>
> It looks like using
> https://cdimage.debian.org/cdimage/ports/snapshots/2021-04-17/debian-10.0=
.0
> -m68k-NETINST-1.iso instead fixes the issue. Perhaps the instruction on
> https://wiki.qemu.org/Documentation/Platforms/m68k should be updated.
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1926497
>
> Title:
>   dp83932 stops working after a short while
>
> Status in QEMU:
>   New
>
> Bug description:
>   Following the instructions here
>   https://wiki.qemu.org/Documentation/Platforms/m68k I was able to
>   successfully install debian. However, running apt-get update stalls
>   after the first 1-2MB.
>
>   root@debian:~# apt-get update
>   Get:1 http://ftp.ports.debian.org/debian-ports sid InRelease [55.3 kB]
>   Ign:1 http://ftp.ports.debian.org/debian-ports sid InRelease
>   Get:2 http://ftp.ports.debian.org/debian-ports sid/main all Packages [8=
,735 kB]
>   18% [2 Packages 2,155 kB/8,735 kB 25%]
>
>   After running apt-get update. I don't seem to be able to send any
>   packets anymore. ping host lookups fail and a subsequent apt-get
>   update makes no progress.
>
>   I'm launching qemu with:
>
>     qemu-system-m68k -boot c \
>    -M q800 -serial none -serial mon:stdio -m 1000M \
>    -net nic,model=3Ddp83932 -net user \
>    -append "root=3D/dev/sda2 rw console=3DttyS0 console=3Dtty" \
>    -kernel vmlinux-4.16.0-1-m68k \
>    -initrd initrd.img-4.16.0-1-m68k \
>    -drive file=3Dm68k-deb10.qcow2,format=3Dqcow2 \
>    -nographic
>
>   I see this with qemu v6.0.0-rc5
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1926497/+subscriptions

I've updated the page to include:

Please note that the instructions below use kernel versions that might
have been superseded by newer ones on the most recent installation cd
images! Also, during installation on hard disk image the update
process might install a newer kernel. Always make sure to extract the
latest kernel and initrd.gz from your hard disk image after
installation or update and replace the kernel names in the examples
below with what is currently installed.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926497

Title:
  dp83932 stops working after a short while

Status in QEMU:
  New

Bug description:
  Following the instructions here
  https://wiki.qemu.org/Documentation/Platforms/m68k I was able to
  successfully install debian. However, running apt-get update stalls
  after the first 1-2MB.

  root@debian:~# apt-get update
  Get:1 http://ftp.ports.debian.org/debian-ports sid InRelease [55.3 kB]
  Ign:1 http://ftp.ports.debian.org/debian-ports sid InRelease
  Get:2 http://ftp.ports.debian.org/debian-ports sid/main all Packages [8,7=
35 kB]
  18% [2 Packages 2,155 kB/8,735 kB 25%]

  After running apt-get update. I don't seem to be able to send any
  packets anymore. ping host lookups fail and a subsequent apt-get
  update makes no progress.

  I'm launching qemu with:

    qemu-system-m68k -boot c \
   -M q800 -serial none -serial mon:stdio -m 1000M \
   -net nic,model=3Ddp83932 -net user \
   -append "root=3D/dev/sda2 rw console=3DttyS0 console=3Dtty" \
   -kernel vmlinux-4.16.0-1-m68k \
   -initrd initrd.img-4.16.0-1-m68k \
   -drive file=3Dm68k-deb10.qcow2,format=3Dqcow2 \
   -nographic

  I see this with qemu v6.0.0-rc5

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926497/+subscriptions

