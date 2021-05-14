Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B46C381065
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:22:33 +0200 (CEST)
Received: from localhost ([::1]:33894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdOK-0001EM-74
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdMd-0007iT-Iq
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:20:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:41034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdMb-0008VU-Jv
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:20:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhdMY-00008v-UD
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:20:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E16D42E8186
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:20:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 19:12:06 -0000
From: Thomas Huth <1921082@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth yaoaili
X-Launchpad-Bug-Reporter: Yao Aili (yaoaili)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161657493730.24559.14872462058003243751.malonedeb@chaenomeles.canonical.com>
Message-Id: <162101952633.20672.8453366597027570285.malone@soybean.canonical.com>
Subject: [Bug 1921082] Re: VM crash when process broadcast MCE
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: eb1c76df783f6183b1633deed0b3b958a72d79cb
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
Reply-To: Bug 1921082 <1921082@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1921082

Title:
  VM crash when process broadcast MCE

Status in QEMU:
  Incomplete

Bug description:
  When i do memory SRAR test for VM, I meet the following issue:

  My VM has 16 vCPU, I will inject one UE error to memory which is accessed=
 by VM, Then host MCE is raised and SIGBUS is send to VM, and qemu take con=
trol.
  Qemu will check the broadcast attribute by following  cpu_x86_support_mca=
_broadcast();  =


  Then Qemu may inject MCE to all vCPU, as vCPU is just one process for
  HOST, we can't guarantee all the vCPUs will enter MCE hander in 1S
  sync time, and the VM may panic.

  This issue will be easily fixed by expand monarch_timeout
  configuration, but the exact monarch_timeout can't be easily got, as
  it will depand on the num of vCPUs and current system schedule status.

  I am wondering why VM need broadcast attribute for MCE, When qeme
  process MCE event form host, it will always be signaled for one vCPU?
  If so, why does qemu need boradcast the MCE event to all vCPUs?

  Can weu just deliver LMCE to one specifc vCPU and make this behavior
  default?

  If anything wrong, Please point out.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921082/+subscriptions

