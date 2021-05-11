Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C1379F1B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:23:18 +0200 (CEST)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgKrV-0004JA-8K
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKpZ-0002EB-2A
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:21:17 -0400
Received: from indium.canonical.com ([91.189.90.7]:58536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKpN-0000oz-PB
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:21:16 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgKpK-00018d-Hc
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:21:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9E9A92E81AA
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:21:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:14:38 -0000
From: Thomas Huth <1779955@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: likan pmaydell th-huth
X-Launchpad-Bug-Reporter: Kan Li (likan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153065712229.13372.17157400567540509420.malonedeb@gac.canonical.com>
Message-Id: <162071007870.10641.8306173867945189523.malone@chaenomeles.canonical.com>
Subject: [Bug 1779955] Re: qemu linux-user requires read permissions on memory
 passed to syscalls that should only need write access
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 102bb365eefbff51b9e130399707de89a33ff33b
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
Reply-To: Bug 1779955 <1779955@bugs.launchpad.net>
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
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1779955

Title:
  qemu linux-user requires read permissions on memory passed to syscalls
  that should only need write access

Status in QEMU:
  Incomplete

Bug description:
  When read() function takes an mmap'ed address as output buffer, it
  returns EFAULT. The expected behavior is it should just work.

  The following code works for qemu-system-arm, but not for qemu-arm-
  static.

  QEMU version affected: latest release 2.12.0.

  Steps to reproduce (please substitute /path/to/qemu-arm-static with
  the path of the binary, and /tmp/a.cpp with the example source code
  attached):

  # First register binfmt_misc
  [hidden]$ docker run --rm --privileged multiarch/qemu-user-static:registe=
r --reset

  # Compile the code and run
  [hidden]$ docker run --rm -it -v /tmp/a.cpp:/tmp/a.cpp -v /path/to/qemu-a=
rm-static:/usr/bin/qemu-arm-static arm32v7/ubuntu:18.04 bash -c '{ apt upda=
te -y && apt install -y g++; } >& /dev/null && g++ -std=3Dc++14 /tmp/a.cpp =
-o /tmp/a.out && echo hehe > /tmp/haha.txt && /tmp/a.out'
  ofd=3D3
  ftruncate=3D0
  mmap=3D0xff3f5000
  fd=3D4
  0xff3f5023 -1 14

  The expected result in qemu-system-arm as well as natively on x86_64 host:
  hidden$ ./a.out
  ofd=3D3
  ftruncate=3D0
  mmap=3D0xb6fb7000
  fd=3D4
  0xb6fb7023 5 0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1779955/+subscriptions

