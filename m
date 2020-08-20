Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A832B24C244
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 17:33:41 +0200 (CEST)
Received: from localhost ([::1]:42452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8mZQ-000563-Md
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 11:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mRy-00065F-Ga
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:25:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:55712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mRw-0000V3-In
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:25:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k8mRt-0002kP-My
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:25:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4BBC62E810F
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2020 15:16:43 -0000
From: Thomas Huth <1874539@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hdeller philmd th-huth
X-Launchpad-Bug-Reporter: Helge Deller (hdeller)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158767392171.23001.17996085062254045820.malonedeb@chaenomeles.canonical.com>
Message-Id: <159793660313.450.15985019009317546542.malone@wampee.canonical.com>
Subject: [Bug 1874539] Re: tulip driver broken in v5.0.0-rc4
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: 2b4d65bc0ca4ecc7b57a4ad1c190f249174f55ba
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 10:50:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1874539 <1874539@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch has been included here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dd9b69640391618045

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874539

Title:
  tulip driver broken in v5.0.0-rc4

Status in QEMU:
  Fix Released

Bug description:
  In a qemu-system-hppa system, qemu release v5.0.0-rc, the tulip nic drive=
r is broken.
  The tulip nic is detected, even getting DHCP info does work.
  But when trying to download bigger files via network, the tulip driver ge=
ts stuck.

  For example when trying to download a 100MB file:

  root@debian:~# wget https://speed.hetzner.de/100MB.bin
  --2020-04-23 20:26:43--  https://speed.hetzner.de/100MB.bin
  Resolving speed.hetzner.de (speed.hetzner.de)... 88.198.248.254, 2a01:4f8=
:0:59ed::2
  Connecting to speed.hetzner.de (speed.hetzner.de)|88.198.248.254|:443... =
connected.
  <waiting and stuck here>

  When reverting this commit, everything works again:
  commit 8ffb7265af64ec81748335ec8f20e7ab542c3850
  Author: Prasad J Pandit <pjp@fedoraproject.org>
  Date:   Tue Mar 24 22:57:22 2020 +0530
  PATCH: net: tulip: check frame size and r/w data length

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1874539/+subscriptions

