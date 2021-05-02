Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD729370A6B
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 08:05:55 +0200 (CEST)
Received: from localhost ([::1]:34290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld5Eo-000100-Op
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 02:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld5AC-00073G-U4
 for qemu-devel@nongnu.org; Sun, 02 May 2021 02:01:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:35794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld5A6-0008F1-Ox
 for qemu-devel@nongnu.org; Sun, 02 May 2021 02:01:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ld5A3-0004k6-W8
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 06:01:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F21B82E8144
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 06:00:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 05:50:31 -0000
From: Thomas Huth <1793904@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: glusterfs
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jnsnow th-huth zem-g
X-Launchpad-Bug-Reporter: Hans (zem-g)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153763821634.24720.16203204034487714411.malonedeb@gac.canonical.com>
Message-Id: <161993463171.10390.7994810799775598545.malone@gac.canonical.com>
Subject: [Bug 1793904] Re: files are randomly overwritten by Zero Bytes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 365ca638c89c3a5404af263e81554a11c490c8cb
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
Reply-To: Bug 1793904 <1793904@bugs.launchpad.net>
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


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1793904

Title:
  files are randomly overwritten by Zero Bytes

Status in QEMU:
  Incomplete

Bug description:
  Hello together,

  I am currently tracking down a "Hard to reproduce" bug on my systems
  that I first discovered during gitlab installation:

  =

  Here is the Text from the Gitlab Bug https://gitlab.com/gitlab-org/gitlab=
-ce/issues/51023
  -------------------------------------------------------------------------=
---------------------

  Steps to reproduce

  I still do not have all the steps together to reproduce, so far it is:
  apt install gitlab-ce and
  gitlab-rake backup:recovery
  Then it works for some time before it fails.

  What is the current bug behavior?

  I have a 12 hour old Installation of gitlab ce 11.2.3-ce.0 for debian
  stretch on a fresh debian stretch system together with our imported
  data. However it turns out that some gitlab related files contain Zero
  bytes instead of actual data.

  root@gitlab:~# xxd -l 16 /opt/gitlab/bin/gitlab-ctl
  00000000: 0000 0000 0000 0000 0000 0000 0000 0000  ................

  This behaviour is somewhat strange because it was working for a few
  minutes/hours. I did write a shell script to find out which files are
  affected of this memory loss. It turns out that only files located
  under /opt/gitlab are affected, if I rule out files like
  /var/log/faillog and some postgresql table files.

  What I find even stranger is that it does not seem to affect
  Logfiles/databases/git_repositorys but application files, like .rb
  scripts. and not all of them. No non gitlab package is affected.

  What is the expected correct behavior?
  Binarys and .rb files should stay as they are.

  Possible fixes

  I am still investigating, I hope that it is not an infrastructure problem=
 (libvirt/qemu/glusterfs) it can still be one but the point that files of /=
opt/gitlab are affected and not any logfile and that we to not have similar=
 problems with any other system leads me to the application for now.
  If I would have used docker the same problem might have caused a reboot o=
f the container.
  But for the Debian package it is a bit of work to recover. That is all a =
workaround, however.
  -------------------------------------------------------------------------=
--------------------

  I do have found 2 more systems having the same problem with different
  software:

  root@erp:~# xxd -l 16 /usr/share/perl/5.26.2/constant.pm
  00000000: 0000 0000 0000 0000 0000 0000 0000 0000  ................

  The Filesize itself is, compared with another machine 00001660 Bytes
  for both the corrupted and the intact file. It looks to me from the
  outside that if some data in the qcow2 file is written too many bytes
  get written so it sometimes overwites data of existing files located
  right after the position in memory where the write goes to.

  I would like to rule out Linux+Ext4 filesystems because I find it
  highly unlikely that such an error keeps undiscovered in that part of
  the environment for long. I think the same might go for qemu.

  Which leaves qemu, gemu+gluster:// mount, qcow2 volumes, glusterfs,
  network. So I am now going to check if I can find any system which
  gets its volumes via fusermount instead of gluster:// path if the
  error is gone there. This may take a while.

  =

  ----- some software versions---------------

  QEMU emulator version 2.12.0 (Debian 1:2.12+dfsg-3)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  libvirt-daemon-driver-storage-gluster/testing,unstable,now 4.6.0-2
  amd64 [installed]

  ii  glusterfs-client   4.1.3-1        amd64

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1793904/+subscriptions

