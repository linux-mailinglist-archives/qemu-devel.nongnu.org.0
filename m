Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420263C6957
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:27:20 +0200 (CEST)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3A0t-0000E6-AC
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zW-0005ye-1L
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:25:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:40200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zR-0008LR-3X
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:25:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m39zN-0003eO-A8
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2A5952E8186
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Jul 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1917591@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mushoz th-huth
X-Launchpad-Bug-Reporter: Jaap Buurman (mushoz)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161476294129.24350.17797047071467820347.malonedeb@soybean.canonical.com>
Message-Id: <162614983842.15811.12472231618279194820.malone@loganberry.canonical.com>
Subject: [Bug 1917591] Re: qemu-i386 under aarch64: Segfaulting on Steamcmd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: cfaf2aea5d0ba84caee1f1c9aa461162960dbac6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1917591 <1917591@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917591

Title:
  qemu-i386 under aarch64: Segfaulting on Steamcmd

Status in QEMU:
  Expired

Bug description:
  I am trying to set up a Valheim server on my Raspberry Pi 4 (8GB). I
  have installed the aarch64 image of Arm Arch Linux.

  I installed qemu-user-static (version 5.2.0 at this time of writing) from=
 the AUR: https://aur.archlinux.org/packages/qemu-user-static/
  I have correctly set up binfmt support: https://aur.archlinux.org/package=
s/binfmt-qemu-static-all-arch/

  This allows me to successfully run i386 and amd64 docker images:

  [alarm@server ~]$ sudo docker run --rm i386/debian uname -a
  WARNING: The requested image's platform (linux/386) does not match the de=
tected host platform (linux/arm64/v8) and no specific platform was requested
  Linux 9fd8d345b0aa 5.11.1-1-ARCH #1 SMP Tue Feb 23 20:00:47 MST 2021 i686=
 GNU/Linux

  and

  [alarm@server ~]$ sudo docker run --rm amd64/debian uname -a
  WARNING: The requested image's platform (linux/amd64) does not match the =
detected host platform (linux/arm64/v8) and no specific platform was reques=
ted
  Linux 4f50fd228ab6 5.11.1-1-ARCH #1 SMP Tue Feb 23 20:00:47 MST 2021 x86_=
64 GNU/Linux

  However, when I try to run the docker image that is going to host the
  server, the download of Valheim never succeeds because the used
  steamcmd application segfaults:

  The following command successfully runs the server: sudo docker run -d
  --name valheim-server -p 2456-2458:2456-2458/udp -e SERVER_NAME=3D"My
  Server" -e WORLD_NAME=3D"Neotopia" -e SERVER_PASS=3D"secret" lloesche
  /valheim-server

  However, when we look into the container's logs via this command: sudo
  docker logs valheim-server

  We see the following entry in the log file: ./steamcmd.sh: line 38:
  86 Segmentation fault      (core dumped) $DEBUGGER "$STEAMEXE" "$@"

  This means that the download never completes, and therefor the Valheim
  server is never actually started. Any help would be much appreciated.
  If there is anything unclear or if you need more details, please let
  me know!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917591/+subscriptions

