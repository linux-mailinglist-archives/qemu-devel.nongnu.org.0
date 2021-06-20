Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6EF3ADCD1
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:32:49 +0200 (CEST)
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup8a-0007zk-GK
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup23-0008Bx-8m
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:45292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup1z-0002jE-Vz
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lup1u-0003YF-IT
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3F98A2E81FB
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Jun 2021 04:17:41 -0000
From: Launchpad Bug Tracker <1819908@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahasenack janitor th-huth
X-Launchpad-Bug-Reporter: Andreas Hasenack (ahasenack)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <155248066265.30093.16981724484173262651.malonedeb@gac.canonical.com>
Message-Id: <162416266159.7948.13537695610391919257.malone@loganberry.canonical.com>
Subject: [Bug 1819908] Re: slight screen corruption when maximizing window
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: a10d168b48317ed68c2f462177ca30463dc20430
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
Reply-To: Bug 1819908 <1819908@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1819908

Title:
  slight screen corruption when maximizing window

Status in QEMU:
  Expired

Bug description:
  Host: Ubuntu disco
  qemu-kvm: 1:3.1+dfsg-2ubuntu2
  libvirt: 5.0.0-1ubuntu2

  Guest: ubuntu bionic
  guest is using cirrus video, with the extra modules kernel package instal=
led and the cirrus kernel module loaded. I also tried QXL, but got the same=
 problem.

  A non-maximized terminal window works just fine. As an example, I run
  "lsmod". It fills the screen, which then scrolls a bit.

  The moment I maximize that window, though, the rendering breaks. I can
  see the commands I type, but not their output. See attached video.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1819908/+subscriptions

