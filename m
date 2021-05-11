Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65D1379F70
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:58:43 +0200 (CEST)
Received: from localhost ([::1]:38684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLPm-00079T-Ux
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgLMu-0004jW-V7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:55:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:35074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgLMt-0003RD-6M
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:55:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgLMr-000607-0l
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:55:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E44FD2E813A
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:55:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:48:48 -0000
From: Thomas Huth <1883083@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pjps th-huth
X-Launchpad-Bug-Reporter: P J P (pjps)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159186981638.8308.16825672026309340419.malonedeb@gac.canonical.com>
Message-Id: <162071212822.10782.16933776928757401234.malone@chaenomeles.canonical.com>
Subject: [Bug 1883083] Re: QEMU: block/vvfat driver issues
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 2c91a6bd75c49ffac15e2bd7cd3ef0e8767660dd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, LOTS_OF_MONEY=0.001, MONEY_NOHTML=1.65,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1883083 <1883083@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This ticket has been transferred to QEMU's new bug tracker here:
https://gitlab.com/qemu-project/qemu/-/issues/272
... thus closing the issue on Launchpad now.

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #272
   https://gitlab.com/qemu-project/qemu/-/issues/272

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883083

Title:
  QEMU: block/vvfat driver issues

Status in QEMU:
  Invalid

Bug description:
  Nathan Huckleberry <nhuck15@gmail.com> has reported following issues
  in the block/vvfat driver for the virtual VFAT file system image, used
  to share a host system directory with a guest VM.

  Please note:
    -> https://www.qemu.org/docs/master/system/images.html#virtual-fat-disk=
-images

  Virtual VFAT read/write support is available only for (beta) testing
  purposes.

  Following issues are reproducible with:

     host)$ ./bin/qemu-system-x86_64 -nographic -enable-kvm \
                -drive file=3Dfat:rw:/tmp/var/run/,index=3D2  -m 2048 /var/=
lib/libvirt/images/f27vm.qcow2

    guest)# mount -t vfat /dev/sdb1 /mnt/

  The attached reproducers (run inside a guest) include:

  1. dir.sh: - directory traversal on the host
     - It creates a file under /mnt/yyyy
     - Then edits the VFAT directory entry to make it -> /mnt/../y
     - The handle_renames_and_mkdirs() routine does not check this new file=
 name
       and creates a file outside of the shared directory on the host

  2. dos.sh: hits an assertion failure in vvfat driver
     - Creates a deep directory tree like - /mnt/0/1/2/3/4/5/6/../29/30/
     - While updating vvfat commits, driver hits an assertion in
       handle_renames_and_mkdirs
         ...
         } else if (commit->action =3D=3D ACTION_MKDIR) {
             ...
             assert(j < s->mapping.next);    <=3D=3D it fails

  3. read.sh: reads past vvfat directory entries
     - Creates a file with: echo "x" > /mnt/a
     - Reads past VVFAT directory entry structure with

         # head -c 1000000 $MNTDEV | xxd | grep x -A 512

     - It may disclose some heap addresses.

  4. write.sh: heap buffer overflow
     - Creates large number of files as /mnt/file[1..35]
     - while syncing directory tree with the host, driver hits an overflow
       while doing memmove(3) in array_roll() routine

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883083/+subscriptions

