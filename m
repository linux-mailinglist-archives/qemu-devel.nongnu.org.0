Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A9D371CEF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:56:56 +0200 (CEST)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbsN-00031X-Qg
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbqE-0001RJ-7L
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:54:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:35758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbq9-0003Zo-61
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:54:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldbq4-0004fD-EG
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 16:54:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4EC582E81AF
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 16:54:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 16:40:26 -0000
From: Thomas Huth <1336794@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=None; component=None;
 status=Confirmed; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: agretha crobinso ericvh gkurz infinoid janitor
 l-admin-o maxim-kuvyrkov th-huth
X-Launchpad-Bug-Reporter: Cole Robinson (crobinso)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140702135258.23882.15100.malonedeb@soybean.canonical.com>
Message-Id: <162006002672.13577.9072876984591344550.malone@wampee.canonical.com>
Subject: [Bug 1336794] Re: 9pfs does not honor open file handles on unlinked
 files
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 2dea3ced4594d64bcd22b34d24e6928681642dce
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
Reply-To: Bug 1336794 <1336794@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/103


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #103
   https://gitlab.com/qemu-project/qemu/-/issues/103

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1336794

Title:
  9pfs does not honor open file handles on unlinked files

Status in QEMU:
  Expired
Status in Ubuntu:
  Confirmed

Bug description:
  This was originally filed over here:
  https://bugzilla.redhat.com/show_bug.cgi?id=3D1114221

  The open-unlink-fstat idiom used in some places to create an anonymous
  private temporary file does not work in a QEMU guest over a virtio-9p
  filesystem.

  Version-Release number of selected component (if applicable):

  qemu-kvm-1.6.2-6.fc20.x86_64
  qemu-system-x86-1.6.2-6.fc20.x86_64
  (those are fedora RPMs)

  How reproducible:

  Always. See this example C program:

  https://bugzilla.redhat.com/attachment.cgi?id=3D913069

  Steps to Reproduce:
  1. Export a filesystem with virt-manager for the guest.
        (type: mount, driver: default, mode: passthrough)
  2. Start guest and mount that filesystem
        (mount -t 9p -o trans=3Dvirtio,version=3D9p2000.L  ...)
  3. Run a program that uses open-unlink-fstat
        (in my case it was trying to compile Perl 5.20)

  Actual results:

  fstat fails:

  open("/home/tst/filename", O_RDWR|O_CREAT|O_EXCL, 0600) =3D 3
  unlink("/home/tst/filename")            =3D 0
  fstat(3, 0x23aa1a8)                     =3D -1 ENOENT (No such file or di=
rectory)
  close(3)

  Expected results:

  open("/home/tst/filename", O_RDWR|O_CREAT|O_EXCL, 0600) =3D 3
  unlink("/home/tst/filename")            =3D 0
  fstat(3, {st_mode=3DS_IFREG|0600, st_size=3D0, ...}) =3D 0
  fcntl(3, F_SETFD, FD_CLOEXEC)           =3D 0
  close(3) =


  Additional info:

  There was a patch put into the kernel back in '07 to handle this very
  problem for other filesystems; maybe its helpful:

        http://lwn.net/Articles/251228/

  There is also a thread on LKML from last December specifically about
  this very problem:

        https://lkml.org/lkml/2013/12/31/163

  There was a discussion on the QEMU list back in '11 that doesn't seem
  to have come to a conclusion, but did provide the test program that
  i've attached to this report:

        http://marc.info/?l=3Dqemu-devel&m=3D130443605720648&w=3D2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1336794/+subscriptions

