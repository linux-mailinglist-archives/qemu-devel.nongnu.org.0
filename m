Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9453237BC53
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 14:13:06 +0200 (CEST)
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgnjd-0002jZ-MP
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 08:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnhZ-000108-BR
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:10:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:42174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnhT-0001SY-TZ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:10:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgnhQ-0001a0-4m
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:10:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 211952E802E
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:10:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 12:00:46 -0000
From: Stefan Hajnoczi <1910540@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: stefanha xiangjzh123456
X-Launchpad-Bug-Reporter: xiangjzh (xiangjzh123456)
X-Launchpad-Bug-Modifier: Stefan Hajnoczi (stefanha)
References: <161002468026.7039.7388884162638063038.malonedeb@soybean.canonical.com>
Message-Id: <162082084681.7584.2135877485465286221.malone@wampee.canonical.com>
Subject: [Bug 1910540] Re: where the trace file  "trace-*"  
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: 5698e5db9f7dd8411176594292e9215de4d1335b
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
Reply-To: Bug 1910540 <1910540@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I tested qemu.git/master on Linux x86_64 to confirm that the simple
trace backend works. trace-$pid files are written to the current working
directory.

If QEMU prints a warning that the trace event name does not exist, try
escaping the asterisk on your command-line: -trace nvme\*

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910540

Title:
  where the trace file  "trace-*"

Status in QEMU:
  New

Bug description:
  I compile qemu-system-aarch64 with  --enable-trace-backends=3Dsimple
  option, then start qemu with -trace nvme*  , qemu start successful but
  I cann't find the trace file  "trace-*" at qemu started  directory.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910540/+subscriptions

