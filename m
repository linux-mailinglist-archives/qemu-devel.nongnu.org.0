Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A023BF4BC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:28:33 +0200 (CEST)
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LeL-0004b9-1h
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1Lbq-0005Kj-DE
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:25:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:57850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1Lbo-0003JL-Nx
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:25:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1Lbl-0000mv-FX
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 04:25:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 492292E80BA
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 04:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Jul 2021 04:17:27 -0000
From: Launchpad Bug Tracker <1894617@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bigboy0822 janitor th-huth
X-Launchpad-Bug-Reporter: Tony.LI (bigboy0822)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159947176304.11179.15547014994707599381.malonedeb@chaenomeles.canonical.com>
Message-Id: <162571784737.7916.17005368763092061761.malone@loganberry.canonical.com>
Subject: [Bug 1894617] Re: qemu-i386 mmap but offset greater than 32 bits
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 0bb538081e057c134284b652eba28221bf67aa43
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
Reply-To: Bug 1894617 <1894617@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894617

Title:
  qemu-i386 mmap but offset greater than 32 bits

Status in QEMU:
  Expired

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

