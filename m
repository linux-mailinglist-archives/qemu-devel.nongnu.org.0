Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0504143261
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 05:36:57 +0200 (CEST)
Received: from localhost ([::1]:36748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbGXo-0003q3-8U
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 23:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56325)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hbGWR-0002mV-Hc
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hbGWQ-0002jV-7S
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:35:31 -0400
Received: from indium.canonical.com ([91.189.90.7]:57002)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hbGWQ-0002iC-28
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:35:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hbGWN-0006J1-Cr
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 03:35:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4AE632E80CB
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 03:35:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Jun 2019 03:29:50 -0000
From: tsiros <1774853@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alexaltea masonleeback tsiros
X-Launchpad-Bug-Reporter: tsiros (tsiros)
X-Launchpad-Bug-Modifier: tsiros (tsiros)
References: <152802310962.26200.2575137842813128178.malonedeb@wampee.canonical.com>
 <156038485941.16569.13243320428077514633.malone@soybean.canonical.com>
Message-Id: <CAMm8ofSLYu35ZpLHV2P6FuPCdP0KgjBQwK2mYSvvd2vcDWzD9A@mail.gmail.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18978";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 2fa0ecf4fa7f6ebfe7740436d5b76efea2a9af40
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: Re: [Qemu-devel] [Bug 1774853] Re: claims temp file is used by
 another process
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
Reply-To: Bug 1774853 <1774853@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I can't remember at all!

i am sorry i know how frustrating this is

i don't remember even if i fixed it or if i gave up

On Thu, Jun 13, 2019, 03:20 Alexandro Sanchez Bach <
1774853@bugs.launchpad.net> wrote:

> @tsiros, can you explain why this isn't an issue for you anymore? This
> is precisely what happens to me, specifically when I create drives as
> `file=3Dfat:rw:path/to/dir`. When I type `fat:path/to/dir`, everything
> works fine, though I get some warnings. Was this fixed in newer versions
> or did you simply realized some issue on your side? Thanks.
>
> --
> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1774853
>
> Title:
>   claims temp file is used by another process
>
> Status in QEMU:
>   New
>
> Bug description:
>   QEMU emulator version 2.12.50 (v2.12.0-12378-g99a34dc4d2-dirty)
>
>   "c:\Program Files\qemu\qemu-system-x86_64.exe" -net none -parallel none
> -bios OVMF.fd -L . -hda fat:rw:image
>   vvfat image chs 1024,16,63
>   c:\Program Files\qemu\qemu-system-x86_64.exe: -hda fat:rw:image: Could
> not open 'C:\Users\tsiros\AppData\Local\Temp\qem5B92.tmp': The process
> cannot access the file because it is being used by another process.
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1774853/+subscriptions
>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1774853

Title:
  claims temp file is used by another process

Status in QEMU:
  New

Bug description:
  QEMU emulator version 2.12.50 (v2.12.0-12378-g99a34dc4d2-dirty)

  "c:\Program Files\qemu\qemu-system-x86_64.exe" -net none -parallel none -=
bios OVMF.fd -L . -hda fat:rw:image
  vvfat image chs 1024,16,63
  c:\Program Files\qemu\qemu-system-x86_64.exe: -hda fat:rw:image: Could no=
t open 'C:\Users\tsiros\AppData\Local\Temp\qem5B92.tmp': The process cannot=
 access the file because it is being used by another process.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1774853/+subscriptions

