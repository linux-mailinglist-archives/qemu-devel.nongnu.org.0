Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F064630CE1F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:42:48 +0100 (CET)
Received: from localhost ([::1]:53736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l73Rg-0000iR-13
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l73Pw-00083B-Kp
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 16:41:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:36262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l73Pr-0000cL-RE
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 16:41:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l73Pq-00009A-DB
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 21:40:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 603172E8135
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 21:40:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Feb 2021 21:30:25 -0000
From: Chris Pinnock <1914117@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chrispinnock th-huth
X-Launchpad-Bug-Reporter: Chris Pinnock (chrispinnock)
X-Launchpad-Bug-Modifier: Chris Pinnock (chrispinnock)
References: <161221293549.4659.2173832767419505412.malonedeb@chaenomeles.canonical.com>
Message-Id: <161230142602.4200.6237334786579910170.malone@chaenomeles.canonical.com>
Subject: [Bug 1914117] Re: Short files returned via FTP on Qemu with various
 architectures and OSes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 430bee13b58c03c1b96b48f1d4b880f6d987f4cb
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
Reply-To: Bug 1914117 <1914117@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First boot in previous comment was with:
qemu-system-i386 -m 256M -hda openbsd-disk-i386.img -net user -net nic

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914117

Title:
  Short files returned via FTP on Qemu with various architectures and
  OSes

Status in QEMU:
  New

Bug description:
  =

  Qemu 5.2 on Mac OS X Big Sur.

  I originally thought that it might be caused by the home-brew version of =
Qemu, but this evening I have removed the brew edition and compiled from sc=
ratch (using Ninja & Xcode compiler). =

  Still getting the same problem,.

  On the following architectures: =

  arm64, amd64 and sometimes i386 running NetBSD host OS; =

  i386 running OpenBSD host OS:

  I have seen a consistent problem with FTP returning short files. The
  file will be a couple of bytes too short. I do not believe this is a
  problem with the OS. Downloading the perl source code from CPAN does
  not work properly, nor does downloading bind from isc. I've tried this
  on different architectures as above.

  (Qemu 4.2 on Ubuntu/x86_64 with NetBSD/i386 seems to function fine. My
  gut feel is there is something not right on the Mac OS version of Qemu
  or a bug in 5.2 - obviously in the network layer somewhere. If you
  have anything you want me to try, please let me know - happy to help
  get a resolution.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914117/+subscriptions

