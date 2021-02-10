Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA49316FA1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 20:07:39 +0100 (CET)
Received: from localhost ([::1]:51884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9upu-0006Hj-DR
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 14:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9uoC-0005RY-Oc
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 14:05:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:49932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9uo7-0004rG-I6
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 14:05:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l9uo6-0005y3-5Q
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 19:05:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 269782E8074
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 19:05:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Feb 2021 19:00:27 -0000
From: John Arbuckle <1914294@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: programmingkidx
X-Launchpad-Bug-Reporter: John Arbuckle (programmingkidx)
X-Launchpad-Bug-Modifier: John Arbuckle (programmingkidx)
References: <161229965531.12871.15940133447161704311.malonedeb@soybean.canonical.com>
Message-Id: <161298362720.17875.17754016963946540105.malone@wampee.canonical.com>
Subject: [Bug 1914294] Re: Windows XP displays black screen when smp option is
 used
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: 58fda6f8bca6a7c4607f97b1001c8c6d90480eec
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
Reply-To: Bug 1914294 <1914294@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I restarted QEMU without the '-smp 2' option and Windows XP started
working again. The only problem is the host CPU usage will stay at 100%
even with the guest CPU load being close to 0%. The only way to fix this
problem that I know currently is to reinstall Windows XP.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914294

Title:
  Windows XP displays black screen when smp option is used

Status in QEMU:
  New

Bug description:
  When I use Windows XP with the -smp option, the screen goes black. The
  only thing I can see is a cursor. I have tried -smp 2, -smp cores=3D4,
  and -smp cores=3D2.

  My info:

  Host:
  M1 Mac
  Mac OS 11.1
  QEMU 5.2 at cf7ca7d5b9faca13f1f8e3ea92cfb2f741eb0c0e.

  Guest:
  32-bit Windows XP SP3 build 2600.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914294/+subscriptions

