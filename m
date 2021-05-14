Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216538102A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 20:59:21 +0200 (CEST)
Received: from localhost ([::1]:58450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhd1s-0003nV-7z
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 14:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhcyV-0007eE-Pe
 for qemu-devel@nongnu.org; Fri, 14 May 2021 14:55:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:34442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhcyS-0002EA-Ez
 for qemu-devel@nongnu.org; Fri, 14 May 2021 14:55:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhcyP-0004dt-Gr
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 18:55:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 68CB62E818D
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 18:55:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 18:49:11 -0000
From: Thomas Huth <1918149@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: galli-leo th-huth
X-Launchpad-Bug-Reporter: Leonardo (galli-leo)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161521552307.29654.2972591810140156041.malonedeb@wampee.canonical.com>
Message-Id: <162101815129.8050.119115394511316991.malone@gac.canonical.com>
Subject: [Bug 1918149] Re: qemu-user reports wrong fault_addr in signal handler
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: aec119bea66c52f353b9722bf1afabdde40abc5c
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
Reply-To: Bug 1918149 <1918149@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1918149

Title:
  qemu-user reports wrong fault_addr in signal handler

Status in QEMU:
  Incomplete

Bug description:
  When a SEGV signal occurs and si_addr of the info struct is nil, qemu
  still tries to translate the address from host to guest
  (handle_cpu_signal in accel/tcg/user-exec.c). This means, that the
  actual signal handler, will receive a fault_addr that is something
  like 0xffffffffbf709000.

  I was able to get this to happen, by branching to a non canonical address=
 on aarch64.
  I used 5.2 (commit: 553032db17). However, building from source, this only=
 seems to happen, if I use the same configure flags as the debian build:

  ../configure --static --target-list=3Daarch64-linux-user --disable-
  system --enable-trace-backends=3Dsimple --disable-linux-io-uring
  --disable-pie --extra-cflags=3D"-fstack-protector-strong -Wformat
  -Werror=3Dformat-security -Wdate-time -D_FORTIFY_SOURCE=3D2"  --extra-
  ldflags=3D"-Wl,-z,relro -Wl,--as-needed"

  Let me know, if you need more details.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1918149/+subscriptions

