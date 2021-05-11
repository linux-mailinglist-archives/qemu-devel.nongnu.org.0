Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18214379F21
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:27:45 +0200 (CEST)
Received: from localhost ([::1]:50476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgKvo-0001W8-6b
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKu4-00081W-Lw
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:25:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:59098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKtu-0003EG-VT
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:25:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgKtt-0002Kl-AU
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:25:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2B9BA2E8187
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:25:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:17:49 -0000
From: Thomas Huth <1870331@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: r-volkmer th-huth
X-Launchpad-Bug-Reporter: Ruben (r-volkmer)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158582730148.12209.12098183760358013098.malonedeb@chaenomeles.canonical.com>
Message-Id: <162071026960.1845.9992944396794100847.malone@wampee.canonical.com>
Subject: [Bug 1870331] Re: default nic device created even though supplied by
 configfile
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: dde9de3b088b41e333aa5b6a3b52002f7a715f60
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1870331 <1870331@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

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
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1870331

Title:
  default nic device created even though supplied by configfile

Status in QEMU:
  Incomplete

Bug description:
  QEMU emulator version 4.1.94

  Documentation states that qemu will create a default nic as long as
  not explicitly forbidden (-nic none) or defined ( e.g. -nic
  <options>).

  Observation:
  Even though qemu-system-ppc is started with "-readconfig" (which defines =
a nic), another nic gets created. When additionally suppling "-nic none", o=
nly the nic of the config file is created.
  As matter of fact, if all items that are defined in config file are suppl=
ied as command line arguments, no further nic is created. =


  Expectation:
  When a nic is defined in config file, the default guest-nic should not ge=
t created.
  That would match behavior when all items, defined in config file are supp=
lied as command line arguments.

  =

  Attached config file.

  (qemu) info pci
   Bus 0, device 0, function 0:
   Host bridge: PCI device 1057:0002
   PCI subsystem 1af4:1100
   id ""
   Bus 0, device 1, function 0:
   VGA controller: PCI device 1234:1111
   PCI subsystem 1af4:1100
   BAR0: 32 bit prefetchable memory at 0x80000000 [0x80ffffff].
   BAR2: 32 bit memory at 0x81000000 [0x81000fff].
   BAR6: 32 bit memory at 0xffffffffffffffff [0x0000fffe].
   id ""
   Bus 0, device 2, function 0:
   Ethernet controller: PCI device 10ec:8029
   PCI subsystem 1af4:1100
   IRQ 23.
   BAR0: I/O at 0x1000 [0x10ff].
   BAR6: 32 bit memory at 0xffffffffffffffff [0x0007fffe].
   id ""
   Bus 0, device 3, function 0:
   Ethernet controller: PCI device 10ec:8029
   PCI subsystem 1af4:1100
   IRQ 24.
   BAR0: I/O at 0x1100 [0x11ff].
   BAR6: 32 bit memory at 0xffffffffffffffff [0x0007fffe].
   id ""

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1870331/+subscriptions

