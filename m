Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98BD367DB4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:29:25 +0200 (CEST)
Received: from localhost ([::1]:33416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVeH-0006Fd-1y
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVX7-0008JP-BW
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:22:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:42796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVX4-0004tc-Iy
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:22:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZVWy-00024y-V5
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:21:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AD8BB2E8160
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:21:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 09:05:48 -0000
From: Thomas Huth <1855617@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h nevilad th-huth
X-Launchpad-Bug-Reporter: Alex (nevilad)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157583794032.6937.10802857034135783842.malonedeb@soybean.canonical.com>
Message-Id: <161908234860.9125.9878190579045724373.malone@wampee.canonical.com>
Subject: [Bug 1855617] Re: savevm with hax saves wrong register state
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: f7afa548ec52336571fcebfcc0dd2280fa02bbac
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
Reply-To: Bug 1855617 <1855617@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1855617

Title:
  savevm with hax saves wrong register state

Status in QEMU:
  Incomplete

Bug description:
  I use qemu-i386 with IntelHaxm on Windows 10 x64 host with Windows 7 x86 =
guest. I run the guest till OS loads and create a snapshot with savevm, the=
n close qemu, run it again and try to load the snapshot with loadvm. The gu=
est crashes or freezes. I dumped registers on snapshot creation and loading=
 (in Haxm) and found that they are different.
  When returning from Haxm in hax_vcpu_hax_exec, there is no regular regist=
er read. I found hax_arch_get_registers function which reads registers from=
 Haxm and is called from a synchronization procedure. I placed a breakpoint=
 on it, ran qemu and found that it is hit one time during guest OS boot. Ex=
actly these registers where saved in the snapshot.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1855617/+subscriptions

