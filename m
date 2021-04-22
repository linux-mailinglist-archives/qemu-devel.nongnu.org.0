Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2839E3679DC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 08:23:54 +0200 (CEST)
Received: from localhost ([::1]:45198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZSkj-0006sv-8M
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 02:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZShy-0005JY-Fd
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:21:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:56524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZShs-0004em-BE
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:21:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZShr-0007Ka-7Z
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 06:20:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 37D2A2E815C
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 06:20:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 06:11:53 -0000
From: Thomas Huth <1828507@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: asurati th-huth
X-Launchpad-Bug-Reporter: Amol Surati (asurati)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155746816636.22030.3977137421670178751.malonedeb@chaenomeles.canonical.com>
Message-Id: <161907191363.22765.15492422188760578808.malone@gac.canonical.com>
Subject: [Bug 1828507] Re: qemu-system-ppc64 smp crash on manual reset
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: a06ff677b9547473fce2c7b6bb19490a9709dfbc
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
Reply-To: Bug 1828507 <1828507@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1828507

Title:
  qemu-system-ppc64 smp crash on manual reset

Status in QEMU:
  Incomplete

Bug description:
  Host Environment:
     x86_64 Linux v5.0.2
     QEMU emulator version 4.0.50 (v4.0.0-354-g812b835fb4)
     SLOF:
         Build Date =3D Jan 14 2019 18:00:39
         FW Version =3D git-a5b428e1c1eae703

  Problem: Qemu crash immediately after a manual reset
           (this is not the initial reset which launches the guest).

  Steps:

  1. Download Debian ppc64el mini.iso:
     http://ftp.debian.org/debian/dists/sid/main/installer-ppc64el/current/=
images/netboot/mini.iso
  2. Run qemu on the host. Ensure that it runs with more than one CPUs. Wit=
h a single CPU, I was unable
     to reproduce the crash.
     qemu-system-ppc64 -M pseries -cpu power9 -smp 2 -m 512 -cdrom mini.iso
  3. SLOF prints the version info on the serial device, and proceeds to boo=
t.
  4. After a few seconds, the GRUB menu appears on the VGA screen.
  5. Select one of the install options (I have tested with Default and Expe=
rt), and wait
     for the Debian's text-mode installer (blue-gray-red) screen to appear.
  6. Click Machine->Reset (or enter system_reset on the qemu monitor).
  7. Notice that, on the serial device, SLOF has printed the version info. =
That is, the system
     has reset and is attempting to boot again.
  8. On the host cmd prompt, qemu dies after printing this fatal error and =
spewing the
     contents of the CPU registers:

     qemu: fatal: Trying to deliver HV exception (MSR) 70 with no HV support
     <CPU contents> (See attached out.txt for details)
     Aborted (core dumped)

  =

  The HV exception is either
     (a) 70 =3D HISI, which occurs when NIP contains an outright bogus or i=
naccessible value, or
     (b) 69 =3D HDSI, which occurs when NIP happens to contain a somewhat s=
aner value, and
         the cpu attempts to run the instruction at that address.

  The exception can occur on either of the CPUs. It occurs when qemu is run=
ning the SLOF
  code.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1828507/+subscriptions

