Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD373BB66E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 06:34:25 +0200 (CEST)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0GJM-0007ZL-Fj
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 00:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBj-0004UE-3Q
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:31 -0400
Received: from indium.canonical.com ([91.189.90.7]:49408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBh-0002wd-3K
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0GBS-0004SE-Fy
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 04:26:14 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 470D92E81DD
 for <qemu-devel@nongnu.org>; Mon,  5 Jul 2021 04:26:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Jul 2021 04:17:32 -0000
From: Launchpad Bug Tracker <1818483@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor lpeng pmaydell th-huth wzssyqa
X-Launchpad-Bug-Reporter: Luyou Peng (lpeng)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <155168800961.29550.2360664198558693792.malonedeb@chaenomeles.canonical.com>
Message-Id: <162545865297.12677.16700330462575304585.malone@loganberry.canonical.com>
Subject: [Bug 1818483] Re: qemu user mode does not support binfmt_misc config
 with flags include "P"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 29a4f561bc62cd0ca6615c39e9be3e513f686fb5
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1818483 <1818483@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1818483

Title:
  qemu user mode does not support binfmt_misc config with flags include
  "P"

Status in QEMU:
  Expired

Bug description:
  Hi Sir:
  During our test in chroot environment with qemu-user-static, we got some =
test cases failed because of program output warning with unexpected full pa=
th name.
  For example in test module "Devscripts"
  the test item for broken tarball expected the warning info:
  <tar: This does not look like a tar archive
  tar: ******* >
  but the output was:
  </bin/tar: This does not look like a tar archive
  /bin/tar: ******>
  the cause is the config file of binfmt_misc was set not to send argv0, fo=
r example:
  type command "tar" after chroot:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
  lpeng@lpeng-VirtualBox:~/projects_lpeng/qemu/mips_2/sid$ sudo chroot .
  [sudo] password for lpeng: =

  root@lpeng-VirtualBox:/# tar
  /bin/tar: You must specify one of the '-Acdtrux', '--delete' or '--test-l=
abel' options
  Try '/bin/tar --help' or '/bin/tar --usage' for more information.
  root@lpeng-VirtualBox:/# =

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

  by adding output log in main()@qemu/Linux-user/main.c
  we found the original input command was changed, and qemu do not know tha=
t, we got the input args:
  argv_0----/usr/bin/qemu-mips64el-static---
  argv_1----/bin/tar---
  argv_2----NULL---

  Next step we modified the flags=3DP in the corresponding config under fol=
der /proc/sys/fs/binfmt_misc, then binfmt_misc sent argv[0] to qemu.
  But chroot could not start bash because in current qemu dose not consider=
 about this unexpected one more"argv[0]"

  =

  After modified qemu code temporary to handle the new argv list we got the=
 input args, and from argv[2] is the original input command
  argv_0----/usr/bin/qemu-mips64el-static---
  argv_1----/bin/tar---
  argv_2----tar---

  We need the original input from command line, so is it possible that let =
binfmt_misc to pass one more additional args or env to qemu as a token of t=
he binfmt_misc flag, then qemu can judge how to parse the input args by it?
  looking forward your suggestions.

  Thanks
  luyou

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1818483/+subscriptions

