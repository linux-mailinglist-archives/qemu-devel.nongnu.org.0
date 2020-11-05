Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9372A7CC0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 12:16:24 +0100 (CET)
Received: from localhost ([::1]:47470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kadFf-0007SX-Jp
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 06:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kadAi-0002cW-Cx
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 06:11:16 -0500
Received: from indium.canonical.com ([91.189.90.7]:40766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kadAd-000246-ED
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 06:11:16 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kadAa-00087i-0L
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 11:11:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E555D2E811E
 for <qemu-devel@nongnu.org>; Thu,  5 Nov 2020 11:11:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2020 10:57:32 -0000
From: Peter Maydell <1877137@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm tcg testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: edward-vielmetti philippe-vaucher
X-Launchpad-Bug-Reporter: Edward Vielmetti (edward-vielmetti)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
X-Launchpad-Bug-Duplicate: 1861161
References: <158877850307.3759.8884625915619239747.malonedeb@chaenomeles.canonical.com>
Message-Id: <160457385283.19246.16765819084985677848.launchpad@wampee.canonical.com>
Subject: [Bug 1877137] Re: 32-bit Arm emulation spins at 100% during emacs
 build
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 2e2b29c65adef27fcf21d3e658a8fe15852980df
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 04:11:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1877137 <1877137@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1861161 ***
    https://bugs.launchpad.net/bugs/1861161

** This bug has been marked a duplicate of bug 1861161
   qemu-arm-static stuck with 100% CPU when cross-compiling emacs

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877137

Title:
  32-bit Arm emulation spins at 100% during emacs build

Status in QEMU:
  New

Bug description:
  This test case exposes a QEMU bug when crossbuilding to arm32. The bug is=
 only
  exposed on amd64 architecture or aarch64 hosts that can *only* execute
  64 bit applications.

  Usage:

  ./setup.sh # installs docker and tweaks sysctl
  ./qemu.sh # register qemu so you are able to run containers from other
  architectures
  ./build.sh # try to build the docker image. Process should get stuck
  in a 100% CPU loop after a while

  Originally reported by, and test case developed by,
  Philippe Vaucher.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877137/+subscriptions

