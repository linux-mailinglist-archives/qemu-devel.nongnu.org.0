Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED53AD06C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:31:18 +0200 (CEST)
Received: from localhost ([::1]:47456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luHOn-0001ak-PM
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luHNA-0000sF-UQ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:29:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:40172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luHN9-0005yc-2u
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:29:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1luHN6-0005Lh-Mu
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 16:29:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A269F2E8058
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 16:29:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Jun 2021 16:18:38 -0000
From: Thomas Huth <612452@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: massimo-tuxel s-v-melnikov th-huth
X-Launchpad-Bug-Reporter: qwe (s-v-melnikov)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20100802081511.22698.82887.malonedeb@palladium.canonical.com>
Message-Id: <162403311820.17377.17055445686786811623.launchpad@gac.canonical.com>
Subject: [Bug 612452] Re: Problems with the number of serial ports for more
 than two
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: a74acbcecbe031169c0b5929774c22ebcef70cac
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
Reply-To: Bug 612452 <612452@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Bug watch removed: Debian Bug tracker #574051
   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D574051

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/612452

Title:
  Problems with the number of serial ports for more than two

Status in QEMU:
  Incomplete

Bug description:
  qemu --version
  QEMU emulator version 0.13.50, Copyright (c) 2003-2008 Fabrice Bellard

  Command line:

  qemu -serial null -serial null -serial file:test1 hd.img

  Error:

  isa irq 4 already assigned

  echo $?
  1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/612452/+subscriptions

