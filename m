Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E360F375932
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:23:54 +0200 (CEST)
Received: from localhost ([::1]:47378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehj8-0004cw-18
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lehbJ-0006VP-KF
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:15:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:36416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lehbG-0002Oo-FM
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:15:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lehbA-0005Ys-MB
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 17:15:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A66AA2E804C
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 17:15:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 17:07:05 -0000
From: Thomas Huth <1879590@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chrisp99 mike-papersolve th-huth
X-Launchpad-Bug-Reporter: chris pugmire (chrisp99)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158993637415.31242.3259652866813380059.malonedeb@chaenomeles.canonical.com>
Message-Id: <162032082568.14776.6979243209489697815.malone@soybean.canonical.com>
Subject: [Bug 1879590] Re: Using qemu-system-sparc64 no network interface
 seems to exist
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 37e4e3a54d046708ba8021febb7798f5cba70028
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1879590 <1879590@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879590

Title:
  Using qemu-system-sparc64 no network interface seems to exist

Status in QEMU:
  Incomplete

Bug description:
  Using boot command:

  qemu-system-sparc64 -M niagara -L /home/chrisp/sparc/S10image/
  -nographic -m 256 -drive
  if=3Dpflash,readonly=3Don,file=3D/home/chrisp/sparc/S10image/disk.s10hw2

  After I log into solaris system I see no network devices other than the l=
oopback device.
  All the docs I can see suggest it should come up with a default network d=
evice that allows communication via the hosts network. Host is ubuntu 64bit=
.  =


  root@giant:/home/chrisp/sparc# qemu-system-sparc64 -version
  QEMU emulator version 5.0.0
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

  =

  dladm show-link
  ifconfig -a


  ok boot
  Loading ufs-file-system package 1.4 04 Aug 1995 13:02:54.
  FCode UFS Reader 1.12 00/07/17 15:48:16.
  Loading: /platform/SUNW,Sun-Fire-T2000/ufsboot
  Loading: /platform/sun4v/ufsboot
  SunOS Release 5.10 Version Generic_118822-23 64-bit
  Copyright 1983-2005 Sun Microsystems, Inc.  All rights reserved.
  Use is subject to license terms.
  Hostname: unknown

  unknown console login: root
  Last login: Wed Feb  8 09:01:28 on console
  Sun Microsystems Inc.   SunOS 5.10      Generic January 2005
  # dladm show-link
  # ifconfig -a
  lo0: flags=3D2001000849<UP,LOOPBACK,RUNNING,MULTICAST,IPv4,VIRTUAL> mtu 8=
232 index 1
          inet 127.0.0.1 netmask ff000000

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1879590/+subscriptions

