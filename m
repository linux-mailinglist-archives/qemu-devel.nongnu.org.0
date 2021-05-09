Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC137770E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:44:35 +0200 (CEST)
Received: from localhost ([::1]:37362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfkfa-0000K0-3p
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkc7-0002rk-3y
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:40:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:53424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkbz-0002GT-9L
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:40:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfkbx-0005gf-OM
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:40:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AECF52E800F
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:40:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 14:31:43 -0000
From: Thomas Huth <1900122@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm docker ioctl linux-user video
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: khamenya th-huth
X-Launchpad-Bug-Reporter: vak (khamenya)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160284373799.25039.16464171690101536645.malonedeb@soybean.canonical.com>
Message-Id: <162057070345.2033.10845683627969539053.malone@wampee.canonical.com>
Subject: [Bug 1900122] Re: Unsupported ioctl: cmd=0xffffffff80685600 when
 accessing /dev/video* in aarch64 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 64fbff69df60945d67b1a2f98979bc1c591bbf6a
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
Reply-To: Bug 1900122 <1900122@bugs.launchpad.net>
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
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1900122

Title:
  Unsupported ioctl: cmd=3D0xffffffff80685600 when accessing /dev/video*
  in aarch64 guest

Status in QEMU:
  Incomplete

Bug description:
  **Description:**
  Any attempt to work with video in aarch64 architecture emulated on x86_64=
 leads currently to the error "Function not implemented". For example:

  ```
  # v4l2-ctl -l --verbose
  Failed to open /dev/video0: Function not implemented

  root@12dd9b6fcfcb:/# ll /dev/video*
  crw-rw---- 1 root video 81, 0 Oct 16 09:23 /dev/video0
  crw-rw---- 1 root video 81, 1 Oct 16 09:23 /dev/video1

  ```

  **Steps to reproduce the issue:**

  I have a following setup:

  Host Hardware: x86_64 equipped with a webcam (tried different webcams)
  Host OS: Ubuntu 20.04.1

  Guest Architecture: aarch64
  Guest OS: Ubuntu 20.04 (also tried 16.x and 18.x)

  Emulation: quemu-user-static (also tried binfmt)

  Guest OS is running via Docker + QEMU

  ```
  =E2=9E=9C cat /proc/sys/fs/binfmt_misc/qemu-aarch64
  enabled
  interpreter /usr/bin/qemu-aarch64-static
  flags: F
  offset 0
  magic 7f454c460201010000000000000000000200b700
  mask ffffffffffffff00fffffffffffffffffeffffff
  ```

  **Results received:**
  see desrciption.

  =

  **Environment:**

  * QEMU version: (if you can know it):

  ipxe-qemu-256k-compat-efi-roms/focal,now 1.0.0+git-20150424.a25a16d-0ubun=
tu4 all [installed,automatic]
  ipxe-qemu/focal-updates,now 1.0.0+git-20190109.133f4c4-0ubuntu3.2 all [in=
stalled,automatic]
  qemu-block-extra/focal-updates,now 1:4.2-3ubuntu6.7 amd64 [installed,auto=
matic]
  qemu-kvm/focal-updates,now 1:4.2-3ubuntu6.7 amd64 [installed]
  qemu-system-common/focal-updates,now 1:4.2-3ubuntu6.7 amd64 [installed,au=
tomatic]
  qemu-system-data/focal-updates,now 1:4.2-3ubuntu6.7 all [installed,automa=
tic]
  qemu-system-gui/focal-updates,now 1:4.2-3ubuntu6.7 amd64 [installed,autom=
atic]
  qemu-system-x86/focal-updates,now 1:4.2-3ubuntu6.7 amd64 [installed,autom=
atic]
  qemu-user-binfmt/focal-updates,now 1:4.2-3ubuntu6.7 amd64 [installed,auto=
matic]
  qemu-user/focal-updates,now 1:4.2-3ubuntu6.7 amd64 [installed]
  qemu-utils/focal-updates,now 1:4.2-3ubuntu6.7 amd64 [installed,automatic]
  qemu/focal-updates,now 1:4.2-3ubuntu6.7 amd64 [installed]

  * Container application: Docker

  **Output of `docker version`, `podman version` or `singularity
  version`**

  ```
  =E2=9E=9C docker version
  Client: Docker Engine - Community
  =C2=A0Version:           20.10.0-beta1
  =C2=A0API version:       1.40
  =C2=A0Go version:        go1.13.15
  =C2=A0Git commit:        ac365d7
  =C2=A0Built:             Tue Oct 13 18:15:22 2020
  =C2=A0OS/Arch:           linux/amd64
  =C2=A0Context:           default
  =C2=A0Experimental:      true

  Server: Docker Engine - Community
  =C2=A0Engine:
  =C2=A0=C2=A0Version:          19.03.13
  =C2=A0=C2=A0API version:      1.40 (minimum version 1.12)
  =C2=A0=C2=A0Go version:       go1.13.15
  =C2=A0=C2=A0Git commit:       4484c46d9d
  =C2=A0=C2=A0Built:            Wed Sep 16 17:01:20 2020
  =C2=A0=C2=A0OS/Arch:          linux/amd64
  =C2=A0=C2=A0Experimental:     false
  =C2=A0containerd:
  =C2=A0=C2=A0Version:          1.4.1
  =C2=A0=C2=A0GitCommit:        c623d1b36f09f8ef6536a057bd658b3aa8632828
  =C2=A0runc:
  =C2=A0=C2=A0Version:          1.0.0-rc92
  =C2=A0=C2=A0GitCommit:        ff819c7e9184c13b7c2607fe6c30ae19403a7aff
  =C2=A0docker-init:
  =C2=A0=C2=A0Version:          0.18.0
  =C2=A0=C2=A0GitCommit:        fec3683

  ```

  Guest aarch64 runs in privileged mode:

  `docker run --privileged --device=3D/dev/video0:/dev/video0 --env
  DISPLAY=3Dunix$DISPLAY -v $XAUTH:/root/.Xauthority  -v
  /tmp/.X11-unix:/tmp/.X11-unix -it --rm arm64v8/ubuntu:20.04 bash`

  **Additional information:**
  I tried also binfmt way to register emulators. The output of `v4l-ctl` wa=
s a little bit different:

  ```
  # v4l2-ctl -l
  Unsupported ioctl: cmd=3D0xffffffff80685600
  Failed to open /dev/video0: Function not implemented

  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1900122/+subscriptions

