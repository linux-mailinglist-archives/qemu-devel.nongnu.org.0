Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE35E3C32E3
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 06:38:58 +0200 (CEST)
Received: from localhost ([::1]:50822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m24lV-0002wS-UO
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 00:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Zc-0000YV-OA
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24ZS-0000eu-LJ
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m24ZE-0003gg-1k
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DAF9C2E8249
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1904317@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: whpx
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chapuni janitor philmd th-huth
X-Launchpad-Bug-Reporter: Takumi Nakamura (chapuni)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160543118215.29327.13808899207251644228.malonedeb@wampee.canonical.com>
Message-Id: <162589063741.5654.18281374532182514802.malone@loganberry.canonical.com>
Subject: [Bug 1904317] Re: cpu feature selection is not affected to guest 's
 cpuid with whpx
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 4e4033a2b3e87800ff3cdf4560c4e4914658a418
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1904317 <1904317@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904317

Title:
  cpu feature selection is not affected to guest 's cpuid with whpx

Status in QEMU:
  Expired

Bug description:
  On windows with -accel whpx, "-cpu" is ignored without any messages.
  Guest recognizes features as same as host's.

  Confirmed on v5.2.0-rc1.

  I suggest qemu may do,

  - Warn with incompatible -cpu options were given.
  - Enhance cpuid handling.

  Background:
  I was investigated mmio and block copy issue in Linux kernel.
  I met a problem that Linux went ill for touching mmio with whpx. (not wit=
h tcg)
  I suspect erms(enhanced rep movs) might trigger.
  I tried to mask erms on qemu with -feature,erms, but it was ineffective.

  At last, I disabled erms manually, to tweak whpx-all.c to mask erms in
  cpuid.

  FYI, qemu with whpx from/to mmio, "rep movsb" does byte access regardless=
 of erms.
  Linux kernel tends to choose not "rep movsq" but "rep movsb" with erms.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904317/+subscriptions

