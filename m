Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CC33C1E9C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:47:01 +0200 (CEST)
Received: from localhost ([::1]:52970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iPk-00047b-Bx
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i68-0006cR-Cr
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:33250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5n-0001P8-RX
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i5W-0005Dm-Io
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:26:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 230932E819E
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:32 -0000
From: Launchpad Bug Tracker <1861161@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor philippe-vaucher pmaydell th-huth
X-Launchpad-Bug-Reporter: Philippe Vaucher (philippe-vaucher)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158022582642.18726.3284794136336139049.malonedeb@gac.canonical.com>
Message-Id: <162580425236.19936.973276260916121260.malone@loganberry.canonical.com>
Subject: [Bug 1861161] Re: qemu-arm-static stuck with 100% CPU when
 cross-compiling emacs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 8679ba4f4292f8239a34cdc1b84c2eb291ca7aa9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1861161 <1861161@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861161

Title:
  qemu-arm-static stuck with 100% CPU when cross-compiling emacs

Status in QEMU:
  Expired

Bug description:
  Hello,

  I'm trying to build multi-arch docker images for
  https://hub.docker.com/r/silex/emacs.

  Here is the machine I'm building on (hetzner cloud machine):

  root@ubuntu-4gb-fsn1-1:~# lsb_release -a
  No LSB modules are available.
  Distributor ID: Ubuntu
  Description:    Ubuntu 18.04.3 LTS
  Release:        18.04
  Codename:       bionic
  root@ubuntu-4gb-fsn1-1:~# uname -a
  Linux ubuntu-4gb-fsn1-1 4.15.0-74-generic #84-Ubuntu SMP Thu Dec 19 08:06=
:28 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

  Whenever I try to build the following alpine Dockerfile
  https://gitlab.com/Silex777/docker-
  emacs/blob/master/26.3/alpine/3.9/dev/Dockerfile like this:

  $ sysctl kernel.randomize_va_space=3D0
  $ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
  $ docker build --pull -t test --platform arm .

  It builds fine until this:

  root@ubuntu-4gb-fsn1-1:~# ps -ef | grep qemu
  root     26473 26465 99 14:26 pts/0    01:59:58 /usr/bin/qemu-arm-static =
../src/bootstrap-emacs -batch --no-site-file --no-site-lisp --eval (setq lo=
ad-prefer-newer t) -f batch-byte-compile emacs-lisp/macroexp.el

  This is supposed to take a few seconds, but here it takes 100% CPU and
  never ends. When I strace the process I see a never ending loop like
  this:

  getdents64(5, /* 0 entries */, 2048)    =3D 0
  lseek(5, 0, SEEK_SET)                   =3D 0
  getdents64(5, /* 5 entries */, 2048)    =3D 120
  tgkill(5875, 5878, SIGRT_2)             =3D -1 EAGAIN (Resource temporari=
ly unavailable)
  getdents64(5, /* 0 entries */, 2048)    =3D 0
  lseek(5, 0, SEEK_SET)                   =3D 0
  getdents64(5, /* 5 entries */, 2048)    =3D 120
  tgkill(5875, 5878, SIGRT_2)             =3D -1 EAGAIN (Resource temporari=
ly unavailable)
  getdents64(5, /* 0 entries */, 2048)    =3D 0
  lseek(5, 0, SEEK_SET)                   =3D 0
  getdents64(5, /* 5 entries */, 2048)    =3D 120
  tgkill(5875, 5878, SIGRT_2)             =3D -1 EAGAIN (Resource temporari=
ly unavailable)
  getdents64(5, /* 0 entries */, 2048)    =3D 0
  lseek(5, 0, SEEK_SET)                   =3D 0
  getdents64(5, /* 5 entries */, 2048)    =3D 120
  tgkill(5875, 5878, SIGRT_2)             =3D -1 EAGAIN (Resource temporari=
ly unavailable)
  getdents64(5, /* 0 entries */, 2048)    =3D 0
  lseek(5, 0, SEEK_SET)                   =3D 0
  getdents64(5, /* 5 entries */, 2048)    =3D 120
  tgkill(5875, 5878, SIGRT_2)             =3D -1 EAGAIN (Resource temporari=
ly unavailable)

  It happens with all the QEMU versions I tested:
  - 2.11.1 (OS version)
  - 4.1.1-1 (from multiarch/qemu-user-static:4.1.1-1)
  - 4.2.0-2 (from multiarch/qemu-user-static)

  Any ideas of what I could do to debug it further?

  Kind regards,
  Philippe

  p.s: Everything builds fine when the base image is ubuntu. I also had
  similar hangs with basic commands like "apt-get install foo"
  sometimes.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861161/+subscriptions

