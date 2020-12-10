Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E62D5D66
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:21:25 +0100 (CET)
Received: from localhost ([::1]:56646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMou-0002f0-70
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knMVS-0008KD-7q
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:01:18 -0500
Received: from indium.canonical.com ([91.189.90.7]:50102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knMVM-0006x6-3q
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:01:17 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knMVJ-00009M-LJ
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 14:01:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9E8732E8047
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 14:01:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 13:49:23 -0000
From: Christian Schoenebeck <1877384@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: richard-maw schoenebeck th-huth
X-Launchpad-Bug-Reporter: Fishface60 (richard-maw)
X-Launchpad-Bug-Modifier: Christian Schoenebeck (schoenebeck)
References: <158886102295.5250.16201751310283363946.malonedeb@chaenomeles.canonical.com>
Message-Id: <160760816365.16006.11449144423149063527.malone@chaenomeles.canonical.com>
Subject: [Bug 1877384] Re: 9pfs file create with mapped-xattr can fail on
 overlayfs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 6dbdf6b8f04ecd3791a91da15feb435e35104253
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
Reply-To: Bug 1877384 <1877384@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Good to know. Then it makes sense to close this report for now. Feel
free to reopen it if necessary.

Thanks!

** Changed in: qemu
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877384

Title:
  9pfs file create with mapped-xattr can fail on overlayfs

Status in QEMU:
  Incomplete

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

