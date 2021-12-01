Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D85464938
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 08:57:12 +0100 (CET)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msKUI-0007OR-Qq
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 02:57:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1msKTA-0006ZV-8r
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 02:56:00 -0500
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:56990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1msKT6-00057H-NU
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 02:55:59 -0500
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id C435640447
 for <qemu-devel@nongnu.org>; Wed,  1 Dec 2021 07:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1638345351;
 bh=6naoVHlOZsbTFnH9OTebw8OxI7MIe72hWvOZ9b4wAEE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=eD2hG7k4FKWRz1FoLCXjD/+v6SDLpYF5rK9g1J6FQetnzNsD5Xs3mi2DYLcdYBdZ9
 l2CnC9TsNfuzgEO4pdKi7nyWKePUeJtX9oeRzJYN1RK1f9OsJOm78G/Akt7jRNZXhN
 anN+AUpEwJfFU81eVNXK3R7jPriOy/a6OaNgCle37uZHHgyvaBa93Apq5A7C3TqS7e
 S3hyLXixvP+DE3AdvpTv8HbAqX+Y4uoNgEKAvbZOLIhPTdGRCTkDF9NO/O93dli2Wm
 cM5BsyOtW0PqmddrtGpTqiCUJsClKL6I1FNkj27QGOYzeiUs+w00swCddoYhQ60KpH
 XM9tFklDZkL0A==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EF7EF2E820E
 for <qemu-devel@nongnu.org>; Wed,  1 Dec 2021 07:55:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Dec 2021 07:46:52 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1749393@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Fix Released; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu;
 component=main; status=Fix Committed; importance=Medium;
 assignee=christian.ehrhardt@canonical.com; 
X-Launchpad-Bug-Tags: arm linux-user qemu-20.10 server-next verification-done
 verification-done-focal
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: brian-murray doko gerard-f-vidal-4 hertzog janitor
 komainu8 laurent-vivier paelzer peterogden pmaydell racb rth sebunger44
X-Launchpad-Bug-Reporter: =?utf-8?q?Rapha=C3=ABl_Hertzog_=28hertzog=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer=29?=
References: <151859702399.9461.6832978283203997178.malonedeb@chaenomeles.canonical.com>
Message-Id: <163834481217.16949.4440775239207313037.malone@chaenomeles.canonical.com>
Subject: [Bug 1749393] Re: sbrk() not working under qemu-user with a
 PIE-compiled binary?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="78346d219e01c6c7b1bfd882aa0bbcbb42d4e568"; Instance="production"
X-Launchpad-Hash: 317c7a46cdc28297bbacf821f64ca3f235418f5b
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1749393 <1749393@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Focal

old

$ sudo apt install --reinstall qemu-user-static=3D1:4.2-3ubuntu6.18
Reading package lists... Done
Building dependency tree      =20
Reading state information... Done
0 upgraded, 0 newly installed, 1 reinstalled, 0 to remove and 0 not upgrade=
d.
Need to get 21.3 MB of archives.
After this operation, 0 B of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 qemu-us=
er-static amd64 1:4.2-3ubuntu6.18 [21.3 MB]
Fetched 21.3 MB in 1s (16.4 MB/s)          =20
(Reading database ... 126154 files and directories currently installed.)
Preparing to unpack .../qemu-user-static_1%3a4.2-3ubuntu6.18_amd64.deb ...
Unpacking qemu-user-static (1:4.2-3ubuntu6.18) over (1:4.2-3ubuntu6.18) ...
Setting up qemu-user-static (1:4.2-3ubuntu6.18) ...
Processing triggers for man-db (2.9.1-1) ...

ubuntu@f-1928075-qemuuserstatic:~$ sudo chroot /home/ubuntu/bullseye-arm64 =
/bin/sh /debootstrap/debootstrap --second-stage
W: Failure trying to run:  /sbin/ldconfig
W: See //debootstrap/debootstrap.log for details
ubuntu@f-1928075-qemuuserstatic:~$ tail -n 2 bullseye-arm64/debootstrap/deb=
ootstrap.log
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault (core dumped)

Upgrade


ubuntu@f-1928075-qemuuserstatic:~$ apt-cache policy qemu-user-static
qemu-user-static:
  Installed: 1:4.2-3ubuntu6.18
  Candidate: 1:4.2-3ubuntu6.19
  Version table:
     1:4.2-3ubuntu6.19 500
        500 http://archive.ubuntu.com/ubuntu focal-proposed/universe amd64 =
Packages
 *** 1:4.2-3ubuntu6.18 500
        500 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 P=
ackages
        100 /var/lib/dpkg/status
     1:4.2-3ubuntu6.17 500
        500 http://security.ubuntu.com/ubuntu focal-security/universe amd64=
 Packages
     1:4.2-3ubuntu6 500
        500 http://archive.ubuntu.com/ubuntu focal/universe amd64 Packages
ubuntu@f-1928075-qemuuserstatic:~$ sudo apt install qemu-user-static
Reading package lists... Done
Building dependency tree      =20
Reading state information... Done
The following packages will be upgraded:
  qemu-user-static
1 upgraded, 0 newly installed, 0 to remove and 65 not upgraded.
Need to get 21.3 MB of archives.
After this operation, 0 B of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal-proposed/universe amd64 qemu-u=
ser-static amd64 1:4.2-3ubuntu6.19 [21.3 MB]
Fetched 21.3 MB in 2s (9092 kB/s)          =20
(Reading database ... 126160 files and directories currently installed.)
Preparing to unpack .../qemu-user-static_1%3a4.2-3ubuntu6.19_amd64.deb ...
Unpacking qemu-user-static (1:4.2-3ubuntu6.19) over (1:4.2-3ubuntu6.18) ...
Setting up qemu-user-static (1:4.2-3ubuntu6.19) ...
Processing triggers for man-db (2.9.1-1) ...
ubuntu@f-1928075-qemuuserstatic:~$ sudo update-binfmts  --test --display  q=
emu-aarch64
qemu-aarch64 (enabled):
     package =3D qemu-user-static
        type =3D magic
      offset =3D 0
       magic =3D \x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x=
00\x00\x02\x00\xb7\x00
        mask =3D \xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\x=
ff\xff\xfe\xff\xff\xff
 interpreter =3D /usr/bin/qemu-aarch64-static
    detector =3D=20


Test with new versio

ubuntu@f-1928075-qemuuserstatic:~$ sudo chroot /home/ubuntu/bullseye-arm64 =
/bin/sh /debootstrap/debootstrap --second-stage
I: Installing core packages...
W: Failure trying to run:  dpkg --force-depends --install /var/cache/apt/ar=
chives/base-passwd_3.5.51_arm64.deb
W: See //debootstrap/debootstrap.log for details
ubuntu@f-1928075-qemuuserstatic:~$ tail -n 2 bullseye-arm64/debootstrap/deb=
ootstrap.log
dpkg: error: parsing file '/var/lib/dpkg/status' near line 5 package 'dpkg':
 duplicate value for 'Package' field


That is the good case and also a full run now completes.

$ sudo rm -rf bullseye-arm64; sudo qemu-debootstrap --arch=3Darm64 bullseye=
 bullseye-arm64 http://ftp.debian.org/debian
I: Running command: debootstrap --arch arm64 --foreign bullseye bullseye-ar=
m64 http://ftp.debian.org/debian
W: Cannot check Release signature; keyring file not available /usr/share/ke=
yrings/debian-archive-keyring.gpg
I: Retrieving InRelease=20
I: Retrieving Packages=20
...
I: Configuring tasksel...
I: Configuring libc-bin...
I: Base system installed successfully.


I can't run the docker test due to networking restrictions, but it was
the same fault and the same fix - so that should be ok. If anyone else
can test -proposed with docker please feel free to do so.

** Tags removed: verification-needed verification-needed-focal
** Tags added: verification-done verification-done-focal

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1749393

Title:
  sbrk() not working under qemu-user with a PIE-compiled binary?

Status in QEMU:
  Fix Released
Status in qemu package in Ubuntu:
  Fix Released
Status in qemu source package in Focal:
  Fix Committed

Bug description:
  [Impact]

  =C2=A0* The current space reserved can be too small and we can end up
  =C2=A0=C2=A0=C2=A0with no space at all for BRK. It can happen to any case=
, but is
  =C2=A0=C2=A0=C2=A0much more likely with the now common PIE binaries.

  =C2=A0* Backport the upstream fix which reserves a bit more space while l=
oading
  =C2=A0=C2=A0=C2=A0and giving it back after interpreter and stack is loade=
d.

  [Test Plan]

  =C2=A0* On x86 run:
  sudo apt install -y qemu-user-static docker.io
  sudo docker run --rm arm64v8/debian:bullseye bash -c 'apt update && apt i=
nstall -y wget'
  ...
  Running hooks in /etc/ca-certificates/update.d...
  done.
  Errors were encountered while processing:
  =C2=A0libc-bin
  E: Sub-process /usr/bin/dpkg returned an error code (1)

 =20
  Second test from bug 1928075

  $ sudo qemu-debootstrap --arch=3Darm64 bullseye bullseye-arm64
  http://ftp.debian.org/debian

  In the bad case this is failing like
  W: Failure trying to run: /sbin/ldconfig
  W: See //debootstrap/debootstrap.log for detail

  And in that log file you'll see the segfault
  $ tail -n 2 bullseye-arm64/debootstrap/debootstrap.log
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault (core dumped)

  [Where problems could occur]

  =C2=A0* Regressions would be around use-cases of linux-user that is
  =C2=A0=C2=A0=C2=A0emulation not of a system but of binaries.
  =C2=A0=C2=A0=C2=A0Commonly uses for cross-tests and cross-builds so that =
is the
  =C2=A0=C2=A0=C2=A0space to watch for regressions

  [Other Info]

  =C2=A0* n/a

  ---

  In Debian unstable, we recently switched bash to be a PIE-compiled
  binary (for hardening). Unfortunately this resulted in bash being
  broken when run under qemu-user (for all target architectures, host
  being amd64 for me).

  $ sudo chroot /srv/chroots/sid-i386/ qemu-i386-static /bin/bash
  bash: xmalloc: .././shell.c:1709: cannot allocate 10 bytes (0 bytes alloc=
ated)

  bash has its own malloc implementation based on sbrk():
  https://git.savannah.gnu.org/cgit/bash.git/tree/lib/malloc/malloc.c

  When we disable this internal implementation and rely on glibc's
  malloc, then everything is fine. But it might be that glibc has a
  fallback when sbrk() is not working properly and it might hide the
  underlying problem in qemu-user.

  This issue has also been reported to the bash upstream author and he sugg=
ested that the issue might be in qemu-user so I'm opening a ticket here. He=
re's the discussion with the bash upstream author:
  https://lists.gnu.org/archive/html/bug-bash/2018-02/threads.html#00080

  You can find the problematic bash binary in that .deb file:
  http://snapshot.debian.org/archive/debian/20180206T154716Z/pool/main/b/ba=
sh/bash_4.4.18-1_i386.deb

  The version of qemu I have been using is 2.11 (Debian package qemu-
  user-static version 1:2.11+dfsg-1) but I have had reports that the
  problem is reproducible with older versions (back to 2.8 at least).

  Here are the related Debian bug reports:
  https://bugs.debian.org/889869
  https://bugs.debian.org/865599

  It's worth noting that bash used to have this problem (when compiled as a=
 PIE binary) even when run directly but then something got fixed in the ker=
nel and now the problem only appears when run under qemu-user:
  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1518483

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1749393/+subscriptions


