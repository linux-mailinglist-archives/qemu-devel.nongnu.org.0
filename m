Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F9D2EEC81
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:30:18 +0100 (CET)
Received: from localhost ([::1]:58622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjPl-0006hT-4a
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:30:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLo-0001Ke-Ls
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:12 -0500
Received: from indium.canonical.com ([91.189.90.7]:55852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLY-0003dn-Py
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:12 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxjLV-0003pR-L6
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5E4302E8148
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 04:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1661758@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jplarocque th-huth
X-Launchpad-Bug-Reporter: Jean-Paul Larocque (jplarocque)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170203222029.20222.70658.malonedeb@gac.canonical.com>
Message-Id: <161007944167.27824.8852666543230509514.malone@loganberry.canonical.com>
Subject: [Bug 1661758] Re: qemu-nbd causes data corruption in VDI-format disk
 images
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: 81f6f3e6fb274259c0e1183cf49a146379e11633
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1661758 <1661758@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1661758

Title:
  qemu-nbd causes data corruption in VDI-format disk images

Status in QEMU:
  Expired

Bug description:
  Hi,

  This is a duplicate of #1422307.  I can't figure out a way to re-open
  it--the status of "Fix Released" is changeable only by a project
  maintainer or bug supervisor--so I'm opening a new bug to make sure
  this gets looked at again.

  qemu-nbd will sometimes corrupt VDI disk images.  The bug was thought
  to be fixed in commit f0ab6f109630940146cbaf47d0cd99993ddba824, but
  I'm able to reproduce it in both that commit and in the latest commit
  (a951316b8a5c3c63254f20a826afeed940dd4cba).  I just needed to run more
  iterations of the test.  It's possible that it was partially fixed, or
  that the added serialization made it harder to catch this
  non-deterministic bug, but the same symptoms persist: data corruption
  of VDI-format disk images.

  This affects at least qemu-nbd.  I haven't tried reproducing the issue
  with qemu proper or qemu-img, but the original bug report suggests
  that the bug in the common VDI backend may corrupt data written by
  those programs.

  Please let me know if I can provide any further information or help
  with testing.  Thank you very much for looking into this!

  Test procedure
  **************

  The procedure used is the one given by Max Reitz (xanclic) in the
  original bug report, comment 3
  (https://bugs.launchpad.net/qemu/+bug/1422307/comments/3), in the
  section "VDI and NBD over /dev/nbd0", but with up to 1000 iterations
  instead of 10:

    $ cd ~/qemu-origfix-f0ab6f1/bin
    $ dd if=3D/dev/urandom of=3Dblob.raw bs=3D1M count=3D64
    64+0 records in
    64+0 records out
    67108864 bytes (67 MB) copied, 4.36475 s, 15.4 MB/s
    $ sudo sh -c 'for i in $(seq 0 999); do ./qemu-img create -f vdi test.v=
di 64M > /dev/null; ./qemu-nbd -c /dev/nbd0 test.vdi; sleep 1; ./qemu-img c=
onvert -n blob.raw /dev/nbd0; ./qemu-img convert /dev/nbd0 test1.raw; sync;=
 echo 1 > /proc/sys/vm/drop_caches; ./qemu-img convert /dev/nbd0 test2.raw;=
 ./qemu-nbd -d /dev/nbd0 > /dev/null; if ! ./qemu-img compare -q test1.raw =
test2.raw; then md5sum test1.raw test2.raw; echo "$i failed"; break; fi; do=
ne; echo "done"'
  27a66c3a8ac2cf06f2c925968ea9e964  test1.raw
  2da9bf169041a7c2bd144c4ab3a29aea  test2.raw
  64 failed
  done

  I've run this process a handful of times, and I've seen it take as
  little as 10 iterations and as many as 161 (taking 32 minutes in the
  latter case).  Please be patient.  Putting the images on tmpfs will
  probably help it go faster, and I have successfully reproduced the
  issue on tmpfs in addition to ext4.

  Nothing different was needed to reproduce the issue in a directory
  containing a build of the latest commit.  It still takes somewhere
  around 1-200 iterations to find, in my testing.

  Build procedure
  ***************

    $ git clone git://git.qemu-project.org/qemu.git
    [omitted]
    $ git clone qemu qemu-origfix-f0ab6f1
    Cloning into 'qemu-origfix-f0ab6f1'...
    done.
    $ cd qemu-origfix-f0ab6f1
    $ git checkout f0ab6f109630940146cbaf47d0cd99993ddba824
    Note: checking out 'f0ab6f109630940146cbaf47d0cd99993ddba824'.
    =

    You are in 'detached HEAD' state. You can look around, make experimental
    changes and commit them, and you can discard any commits you make in th=
is
    state without impacting any branches by performing another checkout.
    =

    If you want to create a new branch to retain commits you create, you may
    do so (now or later) by using -b with the checkout command again. Examp=
le:
    =

      git checkout -b new_branch_name
    =

    HEAD is now at f0ab6f1... block/vdi: Add locking for parallel requests
    $ mkdir bin
    $ cd bin
    $ script -c'time (../configure --enable-debug --target-list=3Dx86_64-so=
ftmmu && make -j6; echo "result: $?")'
    Script started, file is typescript
    [omitted; the build typescript is attached separately]
      LINK  x86_64-softmmu/qemu-system-x86_64
    result: 0
    =

    real    1m5.733s
    user    2m3.904s
    sys     0m13.828s
    Script done, file is typescript

  Nothing different was done when building the latest commit (besides
  cloning to a different directory, and not running `git checkout`).

  Environment
  ***********

    * Machine: x86_64
    =

    * Hypervisor: Xen 4.4 (Debian package xen-hypervisor-4.4-amd64,
      version 4.4.1-9+deb8u8)
    =

    * A Xen domU (guest) for building QEMU and reproducing the issue.
      All testing was done within the virtual machine for convenience
      and access to better hardware than what I have for my development
      machine (I expected the build to take much longer than it really
      does).
    =

        - x86_64 architecture with six VCPUs and 1.2 GiB RAM allocated,
          operating in HVM (fully virtualized) mode.
        =

        - Distribution: Debian 8.7 Jessie amd64
        =

        - Kernel: Linux 3.16.0 x86_64 (Debian package
          linux-image-3.16.0-4-amd64, version 3.16.39-1)
        =

        - Compiler: GCC 4.9.2 (Debian package gcc-4.9, version 4.9.2-10)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1661758/+subscriptions

