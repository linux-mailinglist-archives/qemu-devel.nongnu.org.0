Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAD13ADCD9
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:36:26 +0200 (CEST)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lupC5-0007ip-5b
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup2N-0000uG-Rd
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:23 -0400
Received: from indium.canonical.com ([91.189.90.7]:45974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup2J-0002sM-9p
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:23 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lup25-0003YF-P2
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:26:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 29B8C2E826F
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:26:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Jun 2021 04:17:24 -0000
From: Launchpad Bug Tracker <1808563@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alan.jones janitor th-huth
X-Launchpad-Bug-Reporter: Alan Jones (alan.jones)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154480918291.23267.15132018418369155034.malonedeb@soybean.canonical.com>
Message-Id: <162416264483.7948.9693387858046296407.malone@loganberry.canonical.com>
Subject: [Bug 1808563] Re: Listing the contents of / lists QEMU_LD_PREFIX
 instead
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: d9c1d4d6d5672cd7c16e02d9bc31fdfcb8521c02
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
Reply-To: Bug 1808563 <1808563@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1808563

Title:
  Listing the contents of / lists QEMU_LD_PREFIX instead

Status in QEMU:
  Expired

Bug description:
  Seeing this in qemu-user version 3.1.0

  Demo:
  $ QEMU_LD_PREFIX=3D$(pwd)/usr/armv7a-cros-linux-gnueabi ../run/qemu-arm /=
tmp/coreutils --coreutils-prog=3Dls / =

  etc  lib  usr
  $ ls /
  boot  etc   lib     lib64   lost+found  mnt    root  sbin  sys  usr
  bin   dev   export  home    lib32       net    proc  run   tmp  var
  $ ls usr/armv7a-cros-linux-gnueabi
  etc  lib  usr

  In strace, the openat for "/" is remapped to the directory specified in Q=
EMU_LD_PREFIX:
  [pid  5302] openat(AT_FDCWD, "/tmp/qemu/usr/armv7a-cros-linux-gnueabi", O=
_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) =3D 3

  As an aside, if I change the code to do chdir("/"); opendir("."); it
  works fine.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1808563/+subscriptions

