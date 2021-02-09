Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC08314782
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 05:27:09 +0100 (CET)
Received: from localhost ([::1]:35128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9KcG-00077w-40
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 23:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9Kb6-0006f1-Mv
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 23:25:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:59288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9Kb4-0001Vw-Dt
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 23:25:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l9Kb1-0002lP-Kv
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 04:25:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9B06F2E8147
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Feb 2021 04:17:20 -0000
From: Launchpad Bug Tracker <1877384@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor richard-maw schoenebeck th-huth
X-Launchpad-Bug-Reporter: Fishface60 (richard-maw)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158886102295.5250.16201751310283363946.malonedeb@chaenomeles.canonical.com>
Message-Id: <161284424109.15411.16099695267443501548.malone@loganberry.canonical.com>
Subject: [Bug 1877384] Re: 9pfs file create with mapped-xattr can fail on
 overlayfs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: 9b2af8c7e1e319d033cd5af37a3274b77ab1bc69
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
Reply-To: Bug 1877384 <1877384@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877384

Title:
  9pfs file create with mapped-xattr can fail on overlayfs

Status in QEMU:
  Expired

Bug description:
  QEMU Version: 3.1.0 as packaged in debian buster, but the code appears to=
 do the same in master.
  qemu command-line: qemu-system-x86_64 -m 1G -nographic -nic "user,model=
=3Dvirtio-net-pci,tftp=3D$(pwd),net=3D10.0.2.0/24,host=3D10.0.2.2" -fsdev l=
ocal,id=3Dfs,path=3D$thisdir/..,security_model=3Dmapped-xattr -device virti=
o-9p-pci,fsdev=3Dfs,mount_tag=3Dfs -drive "file=3D$rootdisk,if=3Dvirtio,for=
mat=3Draw" -kernel "$kernel" -initrd "$initrd" -append "$append"

  =

  I'm using CI that runs in a Docker container and runs a qemu VM with code=
 and results shared via virtio 9p.
  The 9p fsdev is configured with security_model=3Dmapped-xattr
  When the test code attempts to create a log file in an existing directory=
, open with O_CREAT fails with -ENOENT.

  The relevant strace excerpt is:

  28791 openat(11, ".", O_RDONLY|O_NOFOLLOW|O_PATH|O_DIRECTORY) =3D 20
  28791 openat(20, "src", O_RDONLY|O_NOCTTY|O_NONBLOCK|O_NOFOLLOW|O_DIRECTO=
RY) =3D 21
  28791 fcntl(21, F_SETFL, O_RDONLY|O_DIRECTORY) =3D 0
  28791 close(20)                         =3D 0
  28791 openat(21, "client.log", O_WRONLY|O_CREAT|O_NOCTTY|O_NONBLOCK|O_NOF=
OLLOW, 0600) =3D 20
  28791 fcntl(20, F_SETFL, O_WRONLY|O_CREAT|O_NONBLOCK|O_NOFOLLOW) =3D 0
  28791 lsetxattr("/proc/self/fd/21/client.log", "user.virtfs.uid", "\0\0\0=
", 4, 0) =3D -1 ENOENT (No such file or directory)

  My hypothesis for what's going wrong is since the Docker container's
  overlayfs copies-up on writes, when it opens the file it's created a
  new version of the `src` directory containing a `client.log`, but this
  new src directory isn't accessible by file descriptor 20 and the
  lsetxattr call is instead attempting to set attributes on the path in
  the old `src` directory.

  Looking at the code, a fix would be to change `hw/9pfs/9p-local.c` and
  change `local_open2` to instead of calling `local_set_xattrat` to set
  the xattrs by directory file descriptor and file name, to have a
  version of local_set_xattrat` which uses `fsetxattr` to set the virtfs
  attributes instead of the `fsetxattrat_nofollow` helper.

  This reliably happened for me in CI, but I don't have access to the CI
  host or the time to strip the test down to make a minimal test case,
  and had difficulty reproducing the error on other machines.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877384/+subscriptions

