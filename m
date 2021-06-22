Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB243AFC2D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:47:01 +0200 (CEST)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYJQ-00079K-57
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzi-0007Ns-8X
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:56804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzg-00057K-F6
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzR-00013W-WD
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:22 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 69A682E81D3
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:24 -0000
From: Launchpad Bug Tracker <1837909@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crobinso janitor marcandre-lureau philmd th-huth
X-Launchpad-Bug-Reporter: Cole Robinson (crobinso)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156406441263.18058.18411127090440261548.malonedeb@gac.canonical.com>
Message-Id: <162433550459.20423.4782481909054890219.malone@loganberry.canonical.com>
Subject: [Bug 1837909] Re: test-char fails if host has no network interfaces
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 971dc2a11689ae8fec483acde6819bd47ca7b7e9
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
Reply-To: Bug 1837909 <1837909@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1837909

Title:
  test-char fails if host has no network interfaces

Status in QEMU:
  Expired

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

