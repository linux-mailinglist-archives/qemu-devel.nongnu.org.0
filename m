Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DC3376210
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 10:32:38 +0200 (CEST)
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1levuX-0007VN-Ry
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 04:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1levt9-0006Ib-Hc
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:31:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:36154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1levt5-0007nX-N2
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:31:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1levt2-00016B-Fl
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 08:31:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 712C82E8219
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 08:30:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 08:22:49 -0000
From: Thomas Huth <1889421@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ptspts th-huth
X-Launchpad-Bug-Reporter: pts (ptspts)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159603062878.10118.11664292810636734356.malonedeb@chaenomeles.canonical.com>
Message-Id: <162037576930.354.10014881230501059581.malone@chaenomeles.canonical.com>
Subject: [Bug 1889421] Re: VVFAT is not writable from Windows NT 3.5,
 3.51 and 4.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: cb99541c7f9d8790f8e517e79abef4e3673d809b
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
Reply-To: Bug 1889421 <1889421@bugs.launchpad.net>
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
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1889421

Title:
  VVFAT is not writable from Windows NT 3.5, 3.51 and 4.0

Status in QEMU:
  Incomplete

Bug description:
  I'm running Windows NT 3.5, 3.51 and 4.0 in QEMU 4.2.0 on Linux. I'm
  using a VVFAT filesystem. Command lines:

  $ qemu-system-i386 -L pc -cpu 486 -m 64 -vga cirrus -drive
  file=3Dnt351.img,format=3Draw -net nic,model=3Dpcnet -net user -soundhw
  sb16,pcspk -drive file=3Dfat:rw:drived,format=3Draw

  $ qemu-system-i386 --version
  QEMU emulator version 4.2.0 (Debian 1:4.2-6)
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

  Creating a new directory or file on drive D: (the VVFAT filesystem)
  fails on Windows NT 3.5, 3.51 and 4.0 (see screenshot). It succeeds on
  Windows NT 3.1.

  Is there a workaround, e.g. a QEMU flag or a change in the Windows NT
  driver settings?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1889421/+subscriptions

