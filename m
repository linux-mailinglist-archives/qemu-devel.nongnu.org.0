Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A162C790C
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 13:23:35 +0100 (CET)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjLjq-0005iC-EU
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 07:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjLh6-00051J-8p
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 07:20:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:35224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjLh2-0006FB-Vw
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 07:20:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kjLh0-0003XU-Io
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 12:20:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 839732E8139
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 12:20:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 29 Nov 2020 12:14:07 -0000
From: Russell Morris <1906155@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-u3untu-h
X-Launchpad-Bug-Reporter: Russell Morris (6-u3untu-h)
X-Launchpad-Bug-Modifier: Russell Morris (6-u3untu-h)
Message-Id: <160665204764.20800.6154983348315700727.malonedeb@gac.canonical.com>
Subject: [Bug 1906155] [NEW] USB Passthrough Fails on Start, Needs domain Reset
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="12d09381f8e8eee3115395875b132e165fa96574"; Instance="production"
X-Launchpad-Hash: 055b9e7c3c591ebf9fea3ec1e7f73609de8b0993
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1906155 <1906155@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi,

I am seeing (consistently =3D always), USB Passthrough for my Logitech
Keyboard and Mouse ... they don't work / no response on domain (VM)
startup. After a reset of the VM they then work - but why are they
"dead" on initial startup of the VM? Is this a known issue?

Running,
QEMU emulator version 5.0.0 (Debian 1:5.0-5ubuntu9.1)
Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

And if it makes a difference, this is a macOS guest (on a Linux host).

Thanks!

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906155

Title:
  USB Passthrough Fails on Start, Needs domain Reset

Status in QEMU:
  New

Bug description:
  Hi,

  I am seeing (consistently =3D always), USB Passthrough for my Logitech
  Keyboard and Mouse ... they don't work / no response on domain (VM)
  startup. After a reset of the VM they then work - but why are they
  "dead" on initial startup of the VM? Is this a known issue?

  Running,
  QEMU emulator version 5.0.0 (Debian 1:5.0-5ubuntu9.1)
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

  And if it makes a difference, this is a macOS guest (on a Linux host).

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906155/+subscriptions

