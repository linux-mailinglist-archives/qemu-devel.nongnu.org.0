Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C16937700E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:22:54 +0200 (CEST)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfGMW-0005Vh-OE
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGKN-0003Vm-4W
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:20:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:54980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGKL-0008VH-Ck
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:20:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfGKJ-0000Os-Qt
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 06:20:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C42852E8135
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 06:20:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 06:10:06 -0000
From: Thomas Huth <1894617@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bigboy0822 th-huth
X-Launchpad-Bug-Reporter: Tony.LI (bigboy0822)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159947176304.11179.15547014994707599381.malonedeb@chaenomeles.canonical.com>
Message-Id: <162045420672.3040.17859022009872440555.malone@wampee.canonical.com>
Subject: [Bug 1894617] Re: qemu-i386 mmap but offset greater than 32 bits
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 1f2f47cfa840ce24c3280eb3a3e86cc62db1a04e
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
Reply-To: Bug 1894617 <1894617@bugs.launchpad.net>
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

** Tags added: i386 linux-user

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894617

Title:
  qemu-i386 mmap but offset greater than 32 bits

Status in QEMU:
  Incomplete

Bug description:
  I don't know if it's a problem, but I did, and it bothered me for a long =
time.
  When I use qemu-i386 and interact with the video card device,an error has=
 occurred:

  18534 ioctl(4,DRM_IOCTL_MODE_GETENCODER,{39,0,0,0,0}) =3D 0 ({39,4,34,3,0=
})
  18534 ioctl(4,DRM_IOCTL_MODE_CREATE_DUMB,{1080,1920,32,0,0,0,0}) =3D 0 ({=
1080,1920,32,0,1,7680,8294400})
  18534 ioctl(4,DRM_IOCTL_MODE_ADDFB,{0,1920,1080,7680,32,24,1}) =3D 0 ({66=
,1920,1080,7680,32,24,1})
  18534 ioctl(4,DRM_IOCTL_MODE_MAP_DUMB,{1,0,0}) =3D 0 ({1,0,5543018496})
  18534 mmap2(NULL,8294400,PROT_READ|PROT_WRITE,MAP_SHARED,4,0x14a63c) =3D =
-1 errno=3D22 (Invalid argument)

  "5543018496" is the offset through ioctl() and it is "0x14a63c000".
  In qemu=EF=BC=9A
  ret =3D target_mmap(arg1, arg2, arg3,
        target_to_host_bitmask(arg4, mmap_flags_tbl),
        arg5, arg6 << MMAP_SHIFT);

  The type of "arg6" is ulong.When use qemu-i386, arg6 can't be set to
  "0x14a63c000".So it's wrong for my program.

  I want to find a good way to deal with this kind of problem, but I'm not =
very familiar with QEMU=EF=BC=8C
  so I came to ask how to deal with this problem.

  Thank you=EF=BC=81

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894617/+subscriptions

