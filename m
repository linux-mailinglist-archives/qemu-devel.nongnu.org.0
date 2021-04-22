Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8031368922
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 00:47:15 +0200 (CEST)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZi6M-0003ak-ID
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 18:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZi4z-00034h-Nz
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 18:45:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:59304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZi4x-0007f9-GV
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 18:45:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZi4v-0002QC-0a
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 22:45:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 01D7B2E815D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 22:45:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 22:40:04 -0000
From: Ottavio Caruso <1743191@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: Ottavio Caruso (ottaviocr)
References: <151591854188.4596.10964938100242408667.malonedeb@wampee.canonical.com>
 <161906949228.9315.10102465599512061473.malone@wampee.canonical.com>
 <Pine.NEB.4.64.2104220510480.29617@speedy.whooppee.com>
 <24705.28709.3368.276346@guava.gson.org>
 <CAEJNuHyOLS1QgXbb0dx7DV7QscX=rtO2PvHeo-O28aetZ5-v9g@mail.gmail.com>
 <24705.45345.929472.140678@guava.gson.org>
Message-Id: <CAEJNuHxpwEg=pZX695dTkpu5EH10Hn60Yc0ePkZPCKdhsErhaA@mail.gmail.com>
Subject: Re: [Bug 1743191] Re: Interacting with NetBSD serial console boot
 blocks no longer works
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 8e4d198a360555d2a8cbfa537e1546d56d675a1f
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

On Thu, 22 Apr 2021 at 18:23, Andreas Gustafsson
<1743191@bugs.launchpad.net> wrote:
>
> Ottavio Caruso wrote:
> > I am currently using:
> >
> > $ qemu-system-x86_64 --version
> > QEMU emulator version 5.2.0
> >
> > And I have no problem selecting from menu in serial console, so I
> > assume this is fixed for me. This is my command line:
> >
> > $ cat opt/bin/boot-netbsd-virtio
> > #!/bin/sh
> > qemu-system-x86_64 \
> > -drive if=3Dvirtio,file=3D/home/oc/VM/img/netbsd.image,index=3D0,media=
=3Ddisk \
> > -drive if=3Dvirtio,file=3D/home/oc/VM/img/netbsd.image.old,index=3D1,me=
dia=3Ddisk \
> > -M q35,accel=3Dkvm -m 250M -cpu host -smp $(nproc) \
> > -nic user,hostfwd=3Dtcp:127.0.0.1:5555-:22,model=3Dvirtio-net-pci,ipv6=
=3Doff  \
> > -daemonize -display none  -vga none \
> > -serial mon:telnet:127.0.0.1:6665,server,nowait \
> > -pidfile /home/oc/VM/pid/netbsd-pid -nodefaults
> >
> > telnet 127.0.0.1 6665
>
> Have you tried the test case in the original bug report?
> --
> Andreas Gustafsson, gson@gson.org

You're right. Using the boot-com install image, the problem persists.


-- =

Ottavio Caruso

A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

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

