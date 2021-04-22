Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F546367AFC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:22:49 +0200 (CEST)
Received: from localhost ([::1]:36862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTfk-00079L-Fo
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTdu-0006HS-VF
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:20:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:37182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTdq-0006Q3-Qm
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:20:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTdp-0004ru-Mq
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:20:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A1CCF2E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:20:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:11:03 -0000
From: Thomas Huth <1837909@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crobinso marcandre-lureau philmd th-huth
X-Launchpad-Bug-Reporter: Cole Robinson (crobinso)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156406441263.18058.18411127090440261548.malonedeb@gac.canonical.com>
Message-Id: <161907546382.32357.13760338395802083217.malone@soybean.canonical.com>
Subject: [Bug 1837909] Re: test-char fails if host has no network interfaces
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: b761fb6037ed0a980586b46f97b6282159a86286
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
Reply-To: Bug 1837909 <1837909@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1837909

Title:
  test-char fails if host has no network interfaces

Status in QEMU:
  Incomplete

Bug description:
  # ./tests/test-char =

  # random seed: R02S8602535bf831a74bca571d8c416d8161
  1..34
  # Start of char tests
  ...
  ok 12 /char/websocket
  # Start of stdio tests
  # End of stdio tests
  # Start of socket tests
  # Start of server tests
  # Start of mainloop tests
  Unexpected error in inet_parse_connect_saddr() at util/qemu-sockets.c:421:
  # =

  # address resolution failed for 127.0.0.1:42275: Name or service not known
  # =


  Aborted (core dumped)

  =

  # ip a
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group=
 default qlen 1000
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
      inet 127.0.0.1/8 scope host lo
         valid_lft forever preferred_lft forever
      inet6 ::1/128 scope host =

         valid_lft forever preferred_lft forever

  =

  This seems to be related to use of AI_ADDRCONFIG in qemu-sockets.c inet_p=
arse_connect_saddr, dropping it fixes the test. 'man getaddrinfo' makes it =
sound like AI_ADDRCONFIG requires the host to have a non-loopback ipv4 or i=
pv6 address available

  This host setup may seem niche, but it is what the 'mock' RPM build
  tool has by default. In Fedora we run the test suite during the RPM
  build, so the failing test causes a bit of pain for certain workflows

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1837909/+subscriptions

