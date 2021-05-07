Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CEF375F8E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 06:48:12 +0200 (CEST)
Received: from localhost ([::1]:47620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lesPL-0005Gq-Jh
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 00:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lesMz-00033W-3H
 for qemu-devel@nongnu.org; Fri, 07 May 2021 00:45:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:37112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lesMw-0001Wa-RG
 for qemu-devel@nongnu.org; Fri, 07 May 2021 00:45:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lesMv-0003vH-2c
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 04:45:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 10C172E8135
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 04:45:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 04:40:30 -0000
From: Thomas Huth <1888303@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gordanb th-huth
X-Launchpad-Bug-Reporter: Gordan Bobic (gordanb)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159527271737.12536.2281351511750409436.malonedeb@gac.canonical.com>
Message-Id: <162036243028.6829.16976520031644970728.malone@wampee.canonical.com>
Subject: [Bug 1888303] Re: Intermittent buggines with user mode emulation of
 x86-64 on aarch64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 58230e1dbebdb4f55668e293200974755b3534f8
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
Reply-To: Bug 1888303 <1888303@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1888303

Title:
  Intermittent buggines with user mode emulation of x86-64 on aarch64

Status in QEMU:
  Incomplete

Bug description:
  QEMU Version: 5.0.0
  ./configure --target-list=3Dx86_64-linux-user --enable-user --prefix=3D/o=
pt/qemu --static

  Testing using node_exporter from pmm-client-1.17.4-1.el8.x86_64.rpm

  aarch64 system is running CentOS 8 with a mainline 5.4.52 kernel built
  for 4KB memory pages.

  On aarch64 machine, invoke:

  ./qemu-x86_64-static /usr/local/percona/pmm-
  client/node_exporter.x86_64 -web.listen-address=3D192.168.0.10:42000
  -web.auth-file=3D/usr/local/percona/pmm-client/pmm.yml -web.ssl-key-
  file=3D/usr/local/percona/pmm-client/server.key -web.ssl-cert-
  file=3D/usr/local/percona/pmm-client/server.crt
  -collectors.enabled=3Ddiskstats,filefd,filesystem,loadavg,meminfo,netdev,=
netstat,stat,time,uname,vmstat,meminfo_numa,textfile

  Most of the time it will outright segfault within a few seconds,
  seemingly when the prometheus server polls for data.

  But, about once every 10 times, it will not sefault and will continue
  working just fine forever.

  The dynamically linked version of qemu (built without --static) always
  works without segfaulting, but it just doesn't work, the prometheus
  server gets no data from it. Again, once in a while it will work, but
  even when it doesn't work it won't segfault.

  This vaguely feels like a memory alignment issue somewhere, but my
  debug-fu is not quite strong enough to attack the problem.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888303/+subscriptions

