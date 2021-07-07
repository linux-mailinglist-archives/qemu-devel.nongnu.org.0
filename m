Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604B43BE21F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 06:31:27 +0200 (CEST)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0zDa-0002l7-FR
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 00:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0z8I-0006st-2D
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:25:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:42604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0z8G-0003I5-Gm
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:25:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0z8E-00072D-99
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 04:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3DA242E8187
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 04:25:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Jul 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1888303@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gordanb janitor th-huth
X-Launchpad-Bug-Reporter: Gordan Bobic (gordanb)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159527271737.12536.2281351511750409436.malonedeb@gac.canonical.com>
Message-Id: <162563143802.23671.4436077333832905569.malone@loganberry.canonical.com>
Subject: [Bug 1888303] Re: Intermittent buggines with user mode emulation of
 x86-64 on aarch64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 4b62f09dd2190d842e15f00626ff7d59fdab7cd7
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
Reply-To: Bug 1888303 <1888303@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888303

Title:
  Intermittent buggines with user mode emulation of x86-64 on aarch64

Status in QEMU:
  Expired

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

