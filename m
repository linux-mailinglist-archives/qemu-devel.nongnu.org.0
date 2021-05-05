Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99040374755
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:58:30 +0200 (CEST)
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLn1-0004fZ-65
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leLfZ-0000bp-8P
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:50:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:51750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leLfV-0007jM-CH
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:50:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leLfT-0002GQ-0H
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 17:50:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F0CD02E8187
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 17:50:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 17:42:55 -0000
From: Thomas Huth <1818483@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lpeng pmaydell th-huth wzssyqa
X-Launchpad-Bug-Reporter: Luyou Peng (lpeng)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155168800961.29550.2360664198558693792.malonedeb@chaenomeles.canonical.com>
Message-Id: <162023657539.4215.8025304006253850860.malone@gac.canonical.com>
Subject: [Bug 1818483] Re: qemu user mode does not support binfmt_misc config
 with flags include "P"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 66e341634e33d4958a673423ec929383f45a94ab
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
Reply-To: Bug 1818483 <1818483@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Tags added: linux-user

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1818483

Title:
  qemu user mode does not support binfmt_misc config with flags include
  "P"

Status in QEMU:
  Incomplete

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

