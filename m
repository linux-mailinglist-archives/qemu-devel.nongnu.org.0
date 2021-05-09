Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8646377741
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:18:22 +0200 (CEST)
Received: from localhost ([::1]:52262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflCH-0006b3-SW
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfl9n-0003pt-Oh
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:15:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:55802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfl9a-0004nd-UO
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:15:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfl9Z-0000VU-HZ
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:15:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7EB942E813A
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:15:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:09:18 -0000
From: Thomas Huth <1861161@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philippe-vaucher pmaydell th-huth
X-Launchpad-Bug-Reporter: Philippe Vaucher (philippe-vaucher)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158022582642.18726.3284794136336139049.malonedeb@gac.canonical.com>
Message-Id: <162057295874.16222.919760122404084346.malone@soybean.canonical.com>
Subject: [Bug 1861161] Re: qemu-arm-static stuck with 100% CPU when
 cross-compiling emacs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: ce93225a3fe6dc61587707683809c5937b13e97e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1861161 <1861161@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861161

Title:
  qemu-arm-static stuck with 100% CPU when cross-compiling emacs

Status in QEMU:
  Incomplete

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

