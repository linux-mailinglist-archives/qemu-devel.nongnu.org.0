Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7C63BE218
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 06:28:36 +0200 (CEST)
Received: from localhost ([::1]:57796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0zAp-0004Hq-Lc
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 00:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0z8G-0006ql-0F
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:25:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:42342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0z8C-0003HL-Fs
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:25:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0z8A-0006K1-HX
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 04:25:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 318E02E8181
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 04:25:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1889421@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor ptspts th-huth
X-Launchpad-Bug-Reporter: pts (ptspts)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159603062878.10118.11664292810636734356.malonedeb@chaenomeles.canonical.com>
Message-Id: <162563144180.23671.14483890782896035380.malone@loganberry.canonical.com>
Subject: [Bug 1889421] Re: VVFAT is not writable from Windows NT 3.5,
 3.51 and 4.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: bc44d877958608b4968b2dd708be7bf25a512345
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
Reply-To: Bug 1889421 <1889421@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1889421

Title:
  VVFAT is not writable from Windows NT 3.5, 3.51 and 4.0

Status in QEMU:
  Expired

Bug description:
  I'm running Windows NT 3.5, 3.51 and 4.0 in QEMU 4.2.0 on Linux. I'm
  using a VVFAT filesystem. Command lines:

  $ qemu-system-i386 -L pc -cpu 486 -m 64 -vga cirrus -drive
  file=3Dnt351.img,format=3Draw -net nic,model=3Dpcnet -net user -soundhw
  sb16,pcspk -drive file=3Dfat:rw:drived,format=3Draw

  $ qemu-system-i386 --version
  QEMU emulator version 4.2.0 (Debian 1:4.2-6)
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

  Creating a new directory or file on drive D: (the VVFAT filesystem)
  fails on Windows NT 3.5, 3.51 and 4.0 (see screenshot). It succeeds on
  Windows NT 3.1.

  Is there a workaround, e.g. a QEMU flag or a change in the Windows NT
  driver settings?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1889421/+subscriptions

