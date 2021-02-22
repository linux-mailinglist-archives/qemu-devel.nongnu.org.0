Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475A5321DC7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:13:49 +0100 (CET)
Received: from localhost ([::1]:40500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEmK-00009K-39
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lEEel-0007xE-8V
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:05:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:48648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lEEej-0002qy-11
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:05:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lEEee-0001Ny-JF
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 17:05:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8ED632E804A
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 17:05:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Feb 2021 16:57:37 -0000
From: Thomas Huth <1914117@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chrispinnock th-huth
X-Launchpad-Bug-Reporter: Chris Pinnock (chrispinnock)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161221293549.4659.2173832767419505412.malonedeb@chaenomeles.canonical.com>
Message-Id: <161401305755.22097.17890600964136315334.malone@wampee.canonical.com>
Subject: [Bug 1914117] Re: Short files returned via FTP on Qemu with various
 architectures and OSes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f759833f01c7f0b01b31b10cf317a55893ebb0ad"; Instance="production"
X-Launchpad-Hash: 8da27c78c604e8815467e89adc2e1749df843a6d
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

Maybe related:
https://bugs.launchpad.net/qemu/+bug/1916344
(and https://gitlab.freedesktop.org/slirp/libslirp/-/issues/35 )

** Bug watch added: gitlab.freedesktop.org/slirp/libslirp/-/issues #35
   https://gitlab.freedesktop.org/slirp/libslirp/-/issues/35

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

