Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F3D368439
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:52:35 +0200 (CEST)
Received: from localhost ([::1]:57746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZbd5-0003S8-0z
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZbbH-0002as-Bm
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:50:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:51900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZbbE-0002GL-UP
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:50:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZbbD-0003PN-22
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 15:50:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 052D82E815B
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 15:50:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 15:41:07 -0000
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
 <Pine.NEB.4.64.2104220510480.29617@speedy.whooppee.com>
 <24705.28709.3368.276346@guava.gson.org>
 <CAEJNuHyOLS1QgXbb0dx7DV7QscX=rtO2PvHeo-O28aetZ5-v9g@mail.gmail.com>
Message-Id: <Pine.NEB.4.64.2104220837080.4423@speedy.whooppee.com>
Subject: Re: [Bug 1743191] Re: Interacting with NetBSD serial console boot
 blocks no longer works
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: fd905a66a867661fe435b7bb8591edff67596fb5
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

On Thu, 22 Apr 2021, Ottavio Caruso wrote:

> On Thu, 22 Apr 2021 at 13:46, Andreas Gustafsson
> <1743191@bugs.launchpad.net> wrote:
>>
>> Paul Goyette wrote:
>>> This bug was fixed long ago, so long ago that I have no idea when!
>>
>> No, it is not fixed, and I did actually check before I switched the
>> bug state back to "new".
>>
>> Perhaps you are specifying "-machine graphics=3Don" as suggested in one
>> of the comments?  If so, that's a work-around, and an ugly and
>> nonintuitive one at that, not a fix.

Andreas is correct - I am using the suggested work-around, and the
original bug is NOT fixed.

I believe Andreas has moved the bug back to New status to reflect
that it is not fixed.  (Whether or not it is fixed, _I_ should not
have asked to have _his_ bug closed.  It's been so long, I almost
believed it was my bug. :)  My apologies to Andreas and everyone
else.)


>> --
>> Andreas Gustafsson, gson@gson.org
>
> I am currently using:
>
> $ qemu-system-x86_64 --version
> QEMU emulator version 5.2.0
>
> And I have no problem selecting from menu in serial console, so I
> assume this is fixed for me. This is my command line:
>
> $ cat opt/bin/boot-netbsd-virtio
> #!/bin/sh
> qemu-system-x86_64 \
> -drive if=3Dvirtio,file=3D/home/oc/VM/img/netbsd.image,index=3D0,media=3D=
disk \
> -drive if=3Dvirtio,file=3D/home/oc/VM/img/netbsd.image.old,index=3D1,medi=
a=3Ddisk \
> -M q35,accel=3Dkvm -m 250M -cpu host -smp $(nproc) \
> -nic user,hostfwd=3Dtcp:127.0.0.1:5555-:22,model=3Dvirtio-net-pci,ipv6=3D=
off  \
> -daemonize -display none  -vga none \
> -serial mon:telnet:127.0.0.1:6665,server,nowait \
> -pidfile /home/oc/VM/pid/netbsd-pid -nodefaults
>
> telnet 127.0.0.1 6665
>
>
> -- =

> Ottavio Caruso
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
>  New
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
> !DSPAM:608193ed146681924717040!
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

