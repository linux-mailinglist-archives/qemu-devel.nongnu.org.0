Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D51137394B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:27:51 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFh0-0001yV-Ai
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFfC-0000gr-W4
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:25:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:48824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFf7-0002EV-UO
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:25:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leFf6-0000ev-Eh
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:25:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6BBEF2E8188
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:18:04 -0000
From: Thomas Huth <1819108@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cavanxg th-huth
X-Launchpad-Bug-Reporter: cavanxg (cavanxg)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155202794501.28960.14152482675587823273.malonedeb@wampee.canonical.com>
Message-Id: <162021348439.6519.12420713318335442974.malone@wampee.canonical.com>
Subject: [Bug 1819108] Re: qemu-bridge-helper failure but qemu not exit
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 1458f328472fd580c23351fcc505109e891b513c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1819108 <1819108@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/166


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #166
   https://gitlab.com/qemu-project/qemu/-/issues/166

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1819108

Title:
  qemu-bridge-helper failure but qemu not exit

Status in QEMU:
  Expired

Bug description:
  When qemu-bridge-helper run failed, its parent process qemu is still aliv=
e.
  This is my command line:

  qemu-system-x86_64 -curses -enable-kvm -cpu host -smp 4 -m 4096 \
    -vnc :1 \
    -kernel /data/xugang_vms/boot/vmlinuz \
    -initrd /data/xugang_vms/boot/initram \
    -append 'module_blacklist=3Ddrm,evbug net.ifnames=3D0 biosdevname=3D0 R=
OOTDEV=3Drootfs' \
    -drive file=3D/data/xugang_vms/instances/vn7/rootfs.img,format=3Dqcow2,=
if=3Dvirtio \
    -monitor unix:/data/xugang_vms/var/monitor/vn7.sock,server,nowait \
    -netdev bridge,br=3Dvmbr99,helper=3D"/root/bridgehelper --ns=3Dkvm_1 ",=
id=3Dn1 -device virtio-net,netdev=3Dn1,mac=3D92:99:98:76:01:07

  "/root/bridgehelper" is self defined helper binary by me. But after
  bridge-helper exited with failure(not send fd to qemu process yet),
  the linux vm's console will be messed up. I checked the qemu source
  code(at net/tap.c) and found following snip:

  =3D=3D=3D>
  do {
              fd =3D recv_fd(sv[0]);
          } while (fd =3D=3D -1 && errno =3D=3D EINTR);
          saved_errno =3D errno;

          close(sv[0]);

          while (waitpid(pid, &status, 0) !=3D pid) {
              /* loop */
          }
  <=3D=3D=3D=3D=3D=3D=3D=3D=3D

  why recv_fd will infinitely wait for recv? Maybe it shall waitpid and
  then recv_fd ?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1819108/+subscriptions

