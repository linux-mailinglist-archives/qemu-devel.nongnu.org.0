Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809FE1D6CE1
	for <lists+qemu-devel@lfdr.de>; Sun, 17 May 2020 22:26:07 +0200 (CEST)
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaPrJ-0005ij-Vk
	for lists+qemu-devel@lfdr.de; Sun, 17 May 2020 16:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jaPpq-00051m-If
 for qemu-devel@nongnu.org; Sun, 17 May 2020 16:24:34 -0400
Received: from indium.canonical.com ([91.189.90.7]:45752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jaPpn-0008Dn-TP
 for qemu-devel@nongnu.org; Sun, 17 May 2020 16:24:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jaPpl-0005RK-Qr
 for <qemu-devel@nongnu.org>; Sun, 17 May 2020 20:24:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B98012E810A
 for <qemu-devel@nongnu.org>; Sun, 17 May 2020 20:24:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2020 20:10:49 -0000
From: mizz <1502613@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Wishlist;
 assignee=snizovtsev@gmail.com; 
X-Launchpad-Bug-Tags: battery management power virtual
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kranebrain naftaly-avadiaev snizovtsev
 wolfgangandreas
X-Launchpad-Bug-Reporter: Wolfgang Andreas (wolfgangandreas)
X-Launchpad-Bug-Modifier: mizz (kranebrain)
References: <20151004131253.1871.94138.malonedeb@wampee.canonical.com>
Message-Id: <158974624996.31351.4231767700521859983.malone@chaenomeles.canonical.com>
Subject: [Bug 1502613] Re: [Feature Request] Battery Status / Virtual Battery
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0385b538081bc4718df6fb844a3afc89729c94ce";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: fe7ade300aeb861b1df2167055a27e9658577716
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 16:24:30
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
Reply-To: Bug 1502613 <1502613@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Has there been any progress? I'm using KVM for ubuntu 20.04 and would
love to have this feature.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1502613

Title:
  [Feature Request] Battery Status / Virtual Battery

Status in QEMU:
  In Progress

Bug description:
  When using virtualization on notebooks heavily then virtual machines
  do not realize that they're running on a notebook device causing high
  power consumption because they're not switching into a optimized
  "laptop mode". This leads to the circumstance that they are trying to
  do things like defragmentation / virtus scan / etc. while the host is
  still running on batteries.

  So it would be great if QEMU / KVM would have support for emulating
  "Virtual Batteries" to guests causing them to enable power-saving
  options like disabling specific services / devices / file operations
  automatically by OS.

  Optionally a great feature would be to set virtual battery's status
  manually. For example: Current charge rate / charging / discharging /
  ...

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1502613/+subscriptions

