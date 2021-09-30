Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1076641D39A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:52:00 +0200 (CEST)
Received: from localhost ([::1]:60892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpvD-0006xl-4N
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mVpCi-0003Cd-Ob
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 02:06:01 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:46070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mVpCW-00049Y-Mp
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 02:06:00 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 01719405F1
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 06:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1632981943;
 bh=SoQDCiDs8lJBO+bLCKLWwIVWqICvDsiHELdi7EjAZVo=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=Bkq0a74zckbyuUf4o+Ob9VWFqcQQ1nm4gGtv/JP6CqPLo7oSKiJ+MnUWL+/szipME
 S9A0Wln02T3VXw4QtrCwv4PZoF4O0NQ2n9pOTIFSkTmjYSjyIQkTLCMeKwY9A3HJjf
 UY9Z95wuNrFnXX30ez0iOy7YBMILvqOoToOgpnTNhfAOHNXuIKFWapPUJ+LR4HoGdu
 Sih1UhPNnAbLiXbb+k848Du9A45YnObPJxpUwqeoYXyOGiQlYwwzLMs7fOGXr7nx6W
 gvUm3GbRcWnKBhtHUC8t81Ft03NTtdM1YdN76YWOexpXTAE6eIDUeYX58mG3KLgyI7
 Jz3Ucvps5CiAw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E64412E8175
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 06:05:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Sep 2021 05:59:46 -0000
From: Thomas Huth <1945540@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jgneff th-huth
X-Launchpad-Bug-Reporter: John Neffenger (jgneff)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <163295886256.12676.6273345579938490980.malonedeb@chaenomeles.canonical.com>
Message-Id: <163298158624.17588.10133177975957227638.malone@soybean.canonical.com>
Subject: [Bug 1945540] Re: Java crashes on s390x VM with SIGILL/ILL_PRVOPC at
 '__kernel_getcpu+0x8'
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="732145c78fc09841c9906082a9f784c21494fca6"; Instance="production"
X-Launchpad-Hash: d9124a8eb8943d14f50fb3f24993ab2af6e77946
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1945540 <1945540@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There were some fixes in QEMU v6.1. Please try that one to see whether
it solves your problem, too.

** Project changed: qemu =3D> qemu (Ubuntu)

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1945540

Title:
  Java crashes on s390x VM with SIGILL/ILL_PRVOPC at
  '__kernel_getcpu+0x8'

Status in qemu package in Ubuntu:
  New

Bug description:
  Host environment

  - Operating system: Ubuntu 20.04.3 LTS Desktop
  - OS/kernel version: Linux tower 5.11.0-37-generic #41~20.04.2-Ubuntu
      SMP Fri Sep 24 09:06:38 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
  - Architecture: amd64
  - QEMU flavor: qemu-system-s390x
  - QEMU version: QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.17)
  - QEMU command line: See attached file 'command-line.txt'

  Emulated/Virtualized environment

  - Operating system: Ubuntu 20.04.3 LTS Server
  - OS/kernel version: Linux s390x-focal 5.4.0-88-generic #99-Ubuntu
      SMP Thu Sep 23 17:27:44 UTC 2021 s390x s390x s390x GNU/Linux
  - Architecture: s390x

  Description of problem

  Java crashes as shown below:

  $ java --version
  #
  # A fatal error has been detected by the Java Runtime Environment:
  #
  #  SIGILL (0x4) at pc=3D0x000003ff9f5fe6f4, pid=3D6789, tid=3D6818
  #
  # JRE version:  (17.0+35) (build )
  # Java VM: OpenJDK 64-Bit Server VM (17+35-snap, mixed mode, sharing,
  # tiered, compressed oops, compressed class ptrs, g1 gc, linux-s390x)
  # Problematic frame:
  # C  [linux-vdso64.so.1+0x6f8]  __kernel_getcpu+0x8
  #
  # Core dump will be written. Default location: core.6789 (may not
  # exist)
  #
  # An error report file with more information is saved as:
  # /home/ubuntu/src/hs_err_pid6789.log
  #
  #
  Aborted (core dumped)

  Steps to reproduce

  Run any Java program to reproduce the problem.

  Because the 'openjdk' packages in Ubuntu run the 'java' command during
  installation, they hit the same error and fail to install. As an
  alternative, you can install the OpenJDK Snap package for the 's390x'
  architecture as follows:

    $ sudo snap install openjdk

  The OpenJDK Snap package has been tested to work on a real IBM/S390
  8561 system, namely the IBM LinuxONE III LT1 at Marist College:

    Marist College Installs World=E2=80=99s First IBM LinuxONE III=E2=84=A2
    https://www.marist.edu/-/marist-first-linuxone-iii

  Additional information

  See the following attached files:

  command-line.txt - the command-line used to start the virtual machine
  hs_err_pid6789.log - the log file resulting from 'java --version'

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1945540/+subscriptions


