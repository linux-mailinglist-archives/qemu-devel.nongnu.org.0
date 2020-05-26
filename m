Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45061CE257
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 20:12:47 +0200 (CEST)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYCv0-0007EB-Qy
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 14:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jYCtU-0005oy-Bv
 for qemu-devel@nongnu.org; Mon, 11 May 2020 14:11:13 -0400
Received: from indium.canonical.com ([91.189.90.7]:56244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jYCtS-0005DM-8y
 for qemu-devel@nongnu.org; Mon, 11 May 2020 14:11:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jYCtQ-0000kV-3U
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 18:11:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 183FF2E80E7
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 18:11:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2020 17:55:16 -0000
From: Fishface60 <richard.maw@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: richard-maw schoenebeck
X-Launchpad-Bug-Reporter: Fishface60 (richard-maw)
X-Launchpad-Bug-Modifier: Fishface60 (richard-maw)
References: <158886102295.5250.16201751310283363946.malonedeb@chaenomeles.canonical.com>
 <158903263420.12425.18211080645503971430.malone@wampee.canonical.com>
Message-Id: <CAB2Vqob+wczZfnQbszy_usWEEzXxgxSLunpA_3wSuz3ERcXsAA@mail.gmail.com>
Subject: Re: [Bug 1877384] Re: 9pfs file create with mapped-xattr can fail on
 overlayfs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 92370f9063a915bd48930852945b87623bf5d911
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 11:35:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
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
Reply-To: Bug 1877384 <1877384@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've tested it (eventually, hit
https://github.com/torvalds/linux/commit/467d12f5c7842896d2de3ced74e4147ee2=
9e97c8
while trying to build it),
it doesn't help, since my program wasn't failing from attempting to
use O_NOATIME.

The following patch fixed the -ENOENT on file create for me. I also
applied the fix to symlink. Potentially it could happen to mknod and
other calls that create a new directory entry, which couldn't be
simply fixed by altering the open file, but I've not encountered
issues there.

On Sat, 9 May 2020 at 15:05, Christian Schoenebeck
<1877384@bugs.launchpad.net> wrote:
>
> Since the report is about overlayfs being involved, could you please try =
if
> the following patch makes a difference?
>
> https://github.com/gkurz/qemu/commit/f7f5a1b01307af1c7b6c94672f2ce75c36f1=
0565
>
> It's not yet on master, but will be soon.
>
> --
> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1877384
>
> Title:
>   9pfs file create with mapped-xattr can fail on overlayfs
>
> Status in QEMU:
>   New
>
> Bug description:
>   QEMU Version: 3.1.0 as packaged in debian buster, but the code appears =
to do the same in master.
>   qemu command-line: qemu-system-x86_64 -m 1G -nographic -nic "user,model=
=3Dvirtio-net-pci,tftp=3D$(pwd),net=3D10.0.2.0/24,host=3D10.0.2.2" -fsdev l=
ocal,id=3Dfs,path=3D$thisdir/..,security_model=3Dmapped-xattr -device virti=
o-9p-pci,fsdev=3Dfs,mount_tag=3Dfs -drive "file=3D$rootdisk,if=3Dvirtio,for=
mat=3Draw" -kernel "$kernel" -initrd "$initrd" -append "$append"
>
>
>   I'm using CI that runs in a Docker container and runs a qemu VM with co=
de and results shared via virtio 9p.
>   The 9p fsdev is configured with security_model=3Dmapped-xattr
>   When the test code attempts to create a log file in an existing directo=
ry, open with O_CREAT fails with -ENOENT.
>
>   The relevant strace excerpt is:
>
>   28791 openat(11, ".", O_RDONLY|O_NOFOLLOW|O_PATH|O_DIRECTORY) =3D 20
>   28791 openat(20, "src", O_RDONLY|O_NOCTTY|O_NONBLOCK|O_NOFOLLOW|O_DIREC=
TORY) =3D 21
>   28791 fcntl(21, F_SETFL, O_RDONLY|O_DIRECTORY) =3D 0
>   28791 close(20)                         =3D 0
>   28791 openat(21, "client.log", O_WRONLY|O_CREAT|O_NOCTTY|O_NONBLOCK|O_N=
OFOLLOW, 0600) =3D 20
>   28791 fcntl(20, F_SETFL, O_WRONLY|O_CREAT|O_NONBLOCK|O_NOFOLLOW) =3D 0
>   28791 lsetxattr("/proc/self/fd/21/client.log", "user.virtfs.uid", "\0\0=
\0", 4, 0) =3D -1 ENOENT (No such file or directory)
>
>   My hypothesis for what's going wrong is since the Docker container's
>   overlayfs copies-up on writes, when it opens the file it's created a
>   new version of the `src` directory containing a `client.log`, but this
>   new src directory isn't accessible by file descriptor 20 and the
>   lsetxattr call is instead attempting to set attributes on the path in
>   the old `src` directory.
>
>   Looking at the code, a fix would be to change `hw/9pfs/9p-local.c` and
>   change `local_open2` to instead of calling `local_set_xattrat` to set
>   the xattrs by directory file descriptor and file name, to have a
>   version of local_set_xattrat` which uses `fsetxattr` to set the virtfs
>   attributes instead of the `fsetxattrat_nofollow` helper.
>
>   This reliably happened for me in CI, but I don't have access to the CI
>   host or the time to strip the test down to make a minimal test case,
>   and had difficulty reproducing the error on other machines.
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1877384/+subscriptions


** Patch added: "0001-9pfs-Fix-ENOENT-on-overlayfs.patch"
   https://bugs.launchpad.net/bugs/1877384/+attachment/5369986/+files/0001-=
9pfs-Fix-ENOENT-on-overlayfs.patch

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877384

Title:
  9pfs file create with mapped-xattr can fail on overlayfs

Status in QEMU:
  New

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

