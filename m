Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA412AD9E6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:14:54 +0100 (CET)
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVME-0008E2-0M
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcVIf-0004mo-TE
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:11:13 -0500
Received: from indium.canonical.com ([91.189.90.7]:37676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcVIV-0002O0-Vx
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:11:11 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcVIS-0006UD-A2
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 15:11:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2E91C2E8079
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 15:11:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 14:57:20 -0000
From: Thomas Huth <1674056@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: popere.noel th-huth
X-Launchpad-Bug-Reporter: spongebob (popere.noel)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170319055044.30113.9822.malonedeb@wampee.canonical.com>
Message-Id: <160502024034.17972.11430511970223835126.malone@wampee.canonical.com>
Subject: [Bug 1674056] Re: USB keyboard and mouse sucked into qemu-kvm
 (somewhere)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 02d8c247c22f1b28263c50ecf5576400b4ccaa6d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1674056 <1674056@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1674056

Title:
  USB keyboard and mouse sucked into qemu-kvm (somewhere)

Status in QEMU:
  Incomplete

Bug description:
  i am unable to run a command line qemu that does not "suck in" the keyboa=
rd and mouse of the host PC
  i tried all that i could from the command line parameters i want to run a=
 headless gui-less kvm host

  if i specify a second set of keyboard and mouse with the -usb the only th=
ing that is diffrent is that i have a keyboard and mouse in the VM if i spe=
cify the host keyboard and mouse same thing ... the vm is working fine but =
the host has no control , no keyboard. i dont see any output of anything =

  the only recourse i have is ctrl+alt+delete  and that resets the host aft=
er 2-3 times. =


  i tried ctrl+alt, ctrl+alt+x , c , z , 2 , etc... also alt + all those co=
mbination and alt with F keys =

  no luck. =


  =

  my command line looks like this (altough i tried many other variations)
   =

  qemu-system-x86_64 -M q35 -enable-kvm \
  -cpu host,kvm=3Doff -m 4096 -smp cpu=3D4,sockets=3D1,cores=3D4,treads=3D1=
 \
  -drive file=3Dxyz.qcow2,if=3Dscsi \
  -device vfio-pci, ... (GPU) \
  -device vfio-pci, .... (GPU audio) \
  -usb -usbdevice host:XXXX:XXXX -usbdevice host:XXXX:XXXX \   <<< same beh=
aviour with and without
  -vga none -vnc localhost:1 -daemonize  =


  i tried with -nographics , -curses, -monitor stdio, pty and none, same re=
sult and with -serial as well
  tried </dev/null at the end of the command no luck same with & =


  my guess is that the keyboard and mouse gets grabbed by the "window"
  of the qemu regardless if there is graphics or not and i have not foud
  a "-headless" ,"-nograb" or "-nopussygrab" mode . (yeah had to make
  the joke :P)

  hardware:
  Z97N-wifi =

  Intel(R) Core(TM) i5-4690K CPU @ 3.50GHz
  ram > 8Gb
  keyboard is logitech
  mouse is logitech

  distro is suse leap 42.1 (made with suseStudio)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1674056/+subscriptions

