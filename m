Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084C9395307
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 23:26:09 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnSwh-00086L-KN
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 17:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lnSvM-0006px-DE
 for qemu-devel@nongnu.org; Sun, 30 May 2021 17:24:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:36708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lnSvK-0006MX-CL
 for qemu-devel@nongnu.org; Sun, 30 May 2021 17:24:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lnSvI-00041Y-2m
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 21:24:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0A8372E805B
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 21:24:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 May 2021 21:12:10 -0000
From: Apteryx <1414466@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hostfwd qemu trusty ubuntu xenial
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor maxco nagaraju-goruganti pconstantine
 piotr.orzechowski sergey-e srinirap88 th-huth
X-Launchpad-Bug-Reporter: Sergey V. Lobanov (sergey-e)
X-Launchpad-Bug-Modifier: Apteryx (maxco)
References: <20150125172405.12316.8764.malonedeb@soybean.canonical.com>
Message-Id: <162240913024.29906.7400181678243877227.malone@chaenomeles.canonical.com>
Subject: [Bug 1414466] Re: -net user,hostfwd=... is not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="925b661396f90467a0d31fdfb13d4990b7239925"; Instance="production"
X-Launchpad-Hash: 1dee7efd757106e564920ab09322a22448dbcb66
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
Reply-To: Bug 1414466 <1414466@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's what `tcpdump -i lo` reports during attempting the SSH access:

17:09:30.573545 IP localhost.55526 > localhost.3333: Flags [S], seq 1198531=
632, win 65495, options [mss 65495,sackOK,TS val 1662149852 ecr 0,nop,wscal=
e 7], length 0
17:09:30.573569 IP localhost.3333 > localhost.55526: Flags [S.], seq 476868=
813, ack 1198531633, win 65483, options [mss 65495,sackOK,TS val 1662149852=
 ecr 1662149852,nop,wscale 7], length 0
17:09:30.573588 IP localhost.55526 > localhost.3333: Flags [.], ack 1, win =
512, options [nop,nop,TS val 1662149852 ecr 1662149852], length 0
17:09:30.574162 IP localhost.55526 > localhost.3333: Flags [P.], seq 1:22, =
ack 1, win 512, options [nop,nop,TS val 1662149853 ecr 1662149852], length =
21
17:09:30.574176 IP localhost.3333 > localhost.55526: Flags [.], ack 22, win=
 512, options [nop,nop,TS val 1662149853 ecr 1662149853], length 0
17:09:35.127136 IP localhost.3333 > localhost.55518: Flags [R.], seq 1, ack=
 1, win 512, options [nop,nop,TS val 1662154406 ecr 1662125014], length 0

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1414466

Title:
  -net user,hostfwd=3D... is not working

Status in QEMU:
  Confirmed

Bug description:
  QEMU version: git a46b3aaf6bb038d4f6f192a84df204f10929e75c

   /opt/qemu.git/bin/qemu-system-aarch64 --version
  QEMU emulator version 2.2.50, Copyright (c) 2003-2008 Fabrice Bellard

  Hosts:
  ovs - host machine (Ubuntu 14.04.1, x86_64)
  debian8-arm64 - guest =


  Guest start:
  user@ovs:~$ /opt/qemu.git/bin/qemu-system-aarch64 -machine virt -cpu cort=
ex-a57 -nographic -smp 1 -m 512 -kernel vmlinuz-run -initrd initrd-run.img =
-append "root=3D/dev/sda2 console=3DttyAMA0" -global virtio-blk-device.scsi=
=3Doff -device virtio-scsi-device,id=3Dscsi -drive file=3Ddebian8-arm64.img=
,id=3Drootimg,cache=3Dunsafe,if=3Dnone -device scsi-hd,drive=3Drootimg -net=
dev user,id=3Dunet -device virtio-net-device,netdev=3Dunet -net user,hostfw=
d=3Dtcp:127.0.0.1:1122-:22

  root@debian8-arm64:~# netstat -ntplu | grep ssh
  tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTE=
N      410/sshd        =

  tcp6       0      0 :::22                   :::*                    LISTE=
N      410/sshd       =


  (no firewall in guest vm)

  user@ovs:~$ netstat -ntplu | grep 1122
  tcp        0      0 127.0.0.1:1122          0.0.0.0:*               LISTE=
N      18722/qemu-system-a

  user@ovs:~$ time ssh user@127.0.0.1 -p 1122
  ssh_exchange_identification: read: Connection reset by peer

  real	1m29.341s
  user	0m0.005s
  sys	0m0.000s

  Inside guest vm sshd works fine:
  root@debian8-arm64:~# ssh user@127.0.0.1 -p 22
  user@127.0.0.1's password: =

  ....
  user@debian8-arm64:~$ exit
  logout
  Connection to 127.0.0.1 closed.

  root@debian8-arm64:~# ssh user@10.0.2.15 -p 22
  user@10.0.2.15's password: =

  ...
  user@debian8-arm64:~$ exit
  logout
  Connection to 10.0.2.15 closed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1414466/+subscriptions

