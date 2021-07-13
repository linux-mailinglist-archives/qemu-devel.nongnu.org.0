Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041113C6962
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:32:01 +0200 (CEST)
Received: from localhost ([::1]:54466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3A5Q-0002cQ-3c
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39za-0006CF-O2
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:25:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:40710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zZ-0008Rg-5T
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:25:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m39zV-0003eG-9p
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 266A82E81C7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Jul 2021 04:17:20 -0000
From: Launchpad Bug Tracker <1915431@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: acceptance avocado test
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cleber-gnu janitor th-huth
X-Launchpad-Bug-Reporter: Cleber Rosa (cleber-gnu)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161306401637.17135.13575858265804852248.malonedeb@wampee.canonical.com>
Message-Id: <162614984069.15811.12007488215909869647.malone@loganberry.canonical.com>
Subject: [Bug 1915431] Re: QEMU processes started by Acceptance Tests are left
 running
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: c57b3252026e8e7137bedee6f98b3cf919ad063e
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
Reply-To: Bug 1915431 <1915431@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915431

Title:
  QEMU processes started by Acceptance Tests are left running

Status in QEMU:
  Expired

Bug description:
  Every now and then, QEMU processes started by the Acceptance Tests
  (thus by Avocado) will be left running.

  From Avocado's perspective, when everything "goes well" and a test
  reaches completion, there's no attempt to terminate any processes it
  indirectly started.  Some frameworks and tests built on top of
  Avocado, for instance Avocado-VT, will keep processes running between
  various tests.

  When a job (and consequently a test) is manually interrupted, then
  Avocado tries to terminate the entire process tree.

  It may be possible to improve the situation in which, at the very least, =
the user is:
   * notified of left over processes
   * have a configuration option that will attempt to kill all processes at=
 the end of the test execution

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915431/+subscriptions

