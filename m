Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D711C66F0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 06:26:41 +0200 (CEST)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWBdn-0007Vz-ST
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 00:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWBcz-00075a-Og
 for qemu-devel@nongnu.org; Wed, 06 May 2020 00:25:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:46540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWBcx-0004RH-P0
 for qemu-devel@nongnu.org; Wed, 06 May 2020 00:25:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jWBcu-0006G1-4O
 for <qemu-devel@nongnu.org>; Wed, 06 May 2020 04:25:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 03A502E812A
 for <qemu-devel@nongnu.org>; Wed,  6 May 2020 04:25:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 06 May 2020 04:17:20 -0000
From: Launchpad Bug Tracker <1860056@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mips
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: amarkovic andrew-pennebaker janitor
X-Launchpad-Bug-Reporter: mcandre (andrew-pennebaker)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157922250983.5290.10201589814072308267.malonedeb@wampee.canonical.com>
Message-Id: <158873864019.30815.18212477990819399123.malone@loganberry.canonical.com>
Subject: [Bug 1860056] Re: mips binaries segfault
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a702c44c11f9455b2f84be0a675894b7fc3de324
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 22:50:31
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1860056 <1860056@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860056

Title:
  mips binaries segfault

Status in QEMU:
  Expired

Bug description:
  Hello World appears to segfault with qemu mips, on a Debian 10.0.0
  Buster amd64 host.

  Example:

  =

  $ cat mips/test/hello.cpp =

  #include <iostream>
  using std::cout;

  int main() {
      cout << "Hello World!\n";
      return 0;
  }

  $ mips-linux-gnu-g++ -o hello hello.cpp && ./hello
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped

  Note that 64-bit MIPS and little endian 32-bit MIPS qemu work fine.
  The problem is limited to big endian 32-bit MIPS.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860056/+subscriptions

