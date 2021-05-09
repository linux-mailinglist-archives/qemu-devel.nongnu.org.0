Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A41E37770B
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:42:27 +0200 (CEST)
Received: from localhost ([::1]:60104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfkdW-00057P-1Q
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkc2-0002om-Fo
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:40:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:53362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkbz-0002GJ-8n
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:40:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfkbv-0005dM-Tu
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:40:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DEFB72E800F
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 14:33:40 -0000
From: Thomas Huth <1900919@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bwidawsk th-huth
X-Launchpad-Bug-Reporter: bwidawsk (bwidawsk)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160331877993.30496.14778848047318719784.malonedeb@chaenomeles.canonical.com>
Message-Id: <162057082077.16410.352907942766350834.malone@soybean.canonical.com>
Subject: [Bug 1900919] Re: PXB selected as root bus incorrectly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 114e10bd70bb0032256a3e378bd8aad761ae7ddd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1900919 <1900919@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1900919

Title:
  PXB selected as root bus incorrectly

Status in QEMU:
  Incomplete

Bug description:
  release: 4c41341af76cfc85b5a6c0f87de4838672ab9f89

  qdev_device_add() will search for the "closest" bus possible, and bail ou=
t early if that bus is a root bus. pxb devices are considered root buses an=
d so if you either
  1. Add a PCI device on the QEMU command line *after* a pxb device, or
  2. Add an integrated PCI device (like a watchdog)

  #1: -device pxb-pcie,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52 -device ahci,id=
=3Dsata0,addr=3D0x8
  #2: -watchdog i6300esb -device pxb-pcie,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D=
52

  The PXB will get selected as the bus (instead of the real root bus)
  and this will cause an assertion failure with the message like "qemu-
  system-x86_64: -device ahci,id=3Dsata0,addr=3D0x8: PCI: Only PCI/PCIe
  bridges can be plugged into pxb-pcie"

  I think this is relatively solvable in the code base by determining if
  a bus is an expander, and skipping it if so. However, I wonder if it
  makes more sense to just allow expanders to have endpoint devices.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1900919/+subscriptions

