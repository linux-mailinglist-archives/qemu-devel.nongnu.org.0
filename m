Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8EE226F10
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 21:31:48 +0200 (CEST)
Received: from localhost ([::1]:41792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxbVr-0003kd-0a
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 15:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jxbUq-0003BE-G7
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 15:30:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:34924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jxbUo-0004cC-Ix
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 15:30:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jxbUm-0004aP-Qq
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 19:30:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9FF732E806B
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 19:30:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2020 19:25:35 -0000
From: Gordan Bobic <1888303@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gordanb
X-Launchpad-Bug-Reporter: Gordan Bobic (gordanb)
X-Launchpad-Bug-Modifier: Gordan Bobic (gordanb)
References: <159527271737.12536.2281351511750409436.malonedeb@gac.canonical.com>
Message-Id: <159527313529.8035.17723785224249508984.malone@wampee.canonical.com>
Subject: [Bug 1888303] Re: Intermittent buggines with user mode emulation of
 x86-64 on aarch64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4809fcb62f445aaa3ae919f7f6c3cc7d156ea57a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c75c0383080f5e3161af6faaf349cf04379cc530
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 11:25:44
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

As another interesting data point - with dynamically linked qemu-x86_64,
when it doesn't work, the process is consuming about 140% of CPU. On a
successful run, the process is consuming about 30% of CPU.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888303

Title:
  Intermittent buggines with user mode emulation of x86-64 on aarch64

Status in QEMU:
  New

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

