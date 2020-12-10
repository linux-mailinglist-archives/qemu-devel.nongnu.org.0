Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A662A2D55A9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 09:52:38 +0100 (CET)
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knHgj-0004LA-N3
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 03:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHfW-0003Mh-6l
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:51:22 -0500
Received: from indium.canonical.com ([91.189.90.7]:58374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHfT-0005mY-Nv
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:51:21 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knHfQ-0003kH-62
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 08:51:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D2FDD2E814A
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 08:51:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 08:43:34 -0000
From: Thomas Huth <1900155@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ide
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jnsnow philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160285970200.13301.15621205793966891788.malonedeb@wampee.canonical.com>
Message-Id: <160758981464.5286.17826121174716069186.malone@gac.canonical.com>
Subject: [Bug 1900155] Re: MIPS Malta fails booting due to IDE error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 2c3382ddf742a1a8cb88cf02c03913009c6ed471
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
Reply-To: Bug 1900155 <1900155@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Released with QEMU v5.2.0.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1900155

Title:
  MIPS Malta fails booting due to IDE error

Status in QEMU:
  Fix Released

Bug description:
  As of commit 3e407488349:

  $ avocado --show=3Dconsole run -t machine:malta tests/acceptance/boot_lin=
ux_console.py    =

  console: [    0.000000] Linux version 4.5.0-2-4kc-malta (debian-kernel@li=
sts.debian.org) (gcc version 5.3.1 20160519 (Debian 5.3.1-20) ) #1 Debian 4=
.5.5-1 (2016-05-29)
  console: [    0.000000] earlycon: Early serial console at I/O port 0x3f8 =
(options '38400n8')
  console: [    0.000000] bootconsole [uart0] enabled
  console: [    0.000000] CPU0 revision is: 00019300 (MIPS 24Kc)
  console: [    0.000000] FPU revision is: 00739300
  console: [    0.000000] MIPS: machine is mti,malta
  [...]
  console: ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
  console: ata2.00: Drive reports diagnostics failure. This may indicate a =
drive
  console: ata2.00: fault or invalid emulation. Contact drive vendor for in=
formation.
  console: ata2.00: configured for UDMA/33
  console: scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ P=
Q: 0 ANSI: 5
  console: Freeing unused kernel memory: 412K (80979000 - 809e0000)
  console: do_page_fault(): sending SIGSEGV to mount for invalid write acce=
ss to 0018a000
  console: epc =3D 775cca54 in libc-2.27.so[775b3000+177000]
  console: ra  =3D 77754618 in ld-2.27.so[77743000+24000]
  console: do_page_fault(): sending SIGSEGV to klogd for invalid write acce=
ss to 0018a000
  console: epc =3D 770f0a54 in libc-2.27.so[770d7000+177000]
  console: ra  =3D 77278618 in ld-2.27.so[77267000+24000]
  console: do_page_fault(): sending SIGSEGV to S20urandom for invalid write=
 access to 0018a000
  console: epc =3D 77d0ca54 in libc-2.27.so[77cf3000+177000]
  console: ra  =3D 77e94618 in ld-2.27.so[77e83000+24000]
  console: do_page_fault(): sending SIGSEGV to mkdir for invalid write acce=
ss to 0018a000
  console: epc =3D 776b8a54 in libc-2.27.so[7769f000+177000]
  console: ra  =3D 77840618 in ld-2.27.so[7782f000+24000]
  console: do_page_fault(): sending SIGSEGV to sh for invalid write access =
to 0018a000
  console: epc =3D 77364a54 in libc-2.27.so[7734b000+177000]
  console: ra  =3D 774ec618 in ld-2.27.so[774db000+24000]
  console: do_page_fault(): sending SIGSEGV to sh for invalid write access =
to 0018a000
  console: epc =3D 77bd4a54 in libc-2.27.so[77bbb000+177000]
  console: ra  =3D 77d5c618 in ld-2.27.so[77d4b000+24000]
  console: do_page_fault(): sending SIGSEGV to awk for invalid write access=
 to 0018a000
  console: epc =3D 76f44a54 in libc-2.27.so[76f2b000+177000]
  console: ra  =3D 770cc618 in ld-2.27.so[770bb000+24000]
  console: do_page_fault(): sending SIGSEGV to cat for invalid write access=
 to 0018a000
  console: epc =3D 770cca54 in libc-2.27.so[770b3000+177000]
  console: ra  =3D 77254618 in ld-2.27.so[77243000+24000]
  $ echo $?
  8

  55adb3c45620c31f29978f209e2a44a08d34e2da is the first bad commit
  commit 55adb3c45620c31f29978f209e2a44a08d34e2da
  Author: John Snow <jsnow@redhat.com>
  Date:   Fri Jul 24 01:23:00 2020 -0400

      ide: cancel pending callbacks on SRST

      The SRST implementation did not keep up with the rest of IDE; it is
      possible to perform a weak reset on an IDE device to remove the BSY/D=
RQ
      bits, and then issue writes to the control/device registers which can
      cause chaos with the state machine.

      Fix that by actually performing a real reset.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1900155/+subscriptions

