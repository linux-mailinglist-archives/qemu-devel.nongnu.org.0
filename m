Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2ED37D376
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:21:59 +0200 (CEST)
Received: from localhost ([::1]:35936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtUc-0000P9-80
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtK5-0002ZG-Lm
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:11:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:34032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtK2-0006zC-Em
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:11:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgtK1-0000xS-2e
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:11:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0EF1B2E8186
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:11:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 18:03:25 -0000
From: Thomas Huth <1912170@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bratpiorka th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Rafa=C5=82_Rudnicki_=28bratpiorka=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161095951776.13964.8528541534312352624.malonedeb@gac.canonical.com>
Message-Id: <162084260567.1405.12681820515162371052.malone@wampee.canonical.com>
Subject: [Bug 1912170] Re: NUMA nodes created with memory-backend-ram shows
 size different than requested
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 073d52dfaa308058475343606bab32185ed944fc
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
Reply-To: Bug 1912170 <1912170@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1912170

Title:
  NUMA nodes created with memory-backend-ram shows size different than
  requested

Status in QEMU:
  Incomplete

Bug description:
  I created system with 7 NUMA nodes where nodes 0-3 should have 268435456 =
bytes size and nodes 4-6 exactly 1610612736 bytes size, but when I run "num=
actl -H" I got different (smaller) sizes.
  It is essential for me to be able to emulate a system with nodes of exact=
 size - is it possible?

  QEMU version:

  QEMU emulator version 5.1.0
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

  QEMU command:

  qemu-system-x86_64 -hda qemu-image/ubuntu-1804.img -enable-kvm -cpu
  Cascadelake-Server -vnc :5 -netdev user,id=3Dnet0,hostfwd=3Dtcp::10022-:22
  -device virtio-net,netdev=3Dnet0 -boot c -m 5632.0M -object memory-
  backend-ram,id=3Dram-node0,size=3D268435456 -numa
  node,nodeid=3D0,cpus=3D0-3,memdev=3Dram-node0 -object memory-backend-ram,=
id
  =3Dram-node1,size=3D268435456 -numa node,nodeid=3D1,cpus=3D4-7,memdev=3Dr=
am-
  node1 -object memory-backend-ram,id=3Dram-node2,size=3D268435456 -numa
  node,nodeid=3D2,cpus=3D8-11,memdev=3Dram-node2 -object memory-backend-ram=
,id
  =3Dram-node3,size=3D268435456 -numa node,nodeid=3D3,cpus=3D12-15,memdev=
=3Dram-
  node3 -object memory-backend-ram,id=3Dram-node4,size=3D1610612736 -numa
  node,nodeid=3D4,memdev=3Dram-node4 -object memory-backend-ram,id=3Dram-
  node5,size=3D1610612736 -numa node,nodeid=3D5,memdev=3Dram-node5 -object
  memory-backend-ram,id=3Dram-node6,size=3D1610612736 -numa
  node,nodeid=3D6,memdev=3Dram-node6 -numa dist,src=3D0,dst=3D0,val=3D10 -n=
uma
  dist,src=3D0,dst=3D1,val=3D21 -numa dist,src=3D0,dst=3D2,val=3D31 -numa
  dist,src=3D0,dst=3D3,val=3D21 -numa dist,src=3D0,dst=3D4,val=3D17 -numa
  dist,src=3D0,dst=3D5,val=3D38 -numa dist,src=3D0,dst=3D6,val=3D28 -numa
  dist,src=3D1,dst=3D0,val=3D21 -numa dist,src=3D1,dst=3D1,val=3D10 -numa
  dist,src=3D1,dst=3D2,val=3D21 -numa dist,src=3D1,dst=3D3,val=3D31 -numa
  dist,src=3D1,dst=3D4,val=3D28 -numa dist,src=3D1,dst=3D5,val=3D17 -numa
  dist,src=3D1,dst=3D6,val=3D38 -numa dist,src=3D2,dst=3D0,val=3D31 -numa
  dist,src=3D2,dst=3D1,val=3D21 -numa dist,src=3D2,dst=3D2,val=3D10 -numa
  dist,src=3D2,dst=3D3,val=3D21 -numa dist,src=3D2,dst=3D4,val=3D28 -numa
  dist,src=3D2,dst=3D5,val=3D28 -numa dist,src=3D2,dst=3D6,val=3D28 -numa
  dist,src=3D3,dst=3D0,val=3D21 -numa dist,src=3D3,dst=3D1,val=3D31 -numa
  dist,src=3D3,dst=3D2,val=3D21 -numa dist,src=3D3,dst=3D3,val=3D10 -numa
  dist,src=3D3,dst=3D4,val=3D28 -numa dist,src=3D3,dst=3D5,val=3D28 -numa
  dist,src=3D3,dst=3D6,val=3D17 -numa dist,src=3D4,dst=3D0,val=3D17 -numa
  dist,src=3D4,dst=3D1,val=3D28 -numa dist,src=3D4,dst=3D2,val=3D28 -numa
  dist,src=3D4,dst=3D3,val=3D28 -numa dist,src=3D4,dst=3D4,val=3D10 -numa
  dist,src=3D4,dst=3D5,val=3D28 -numa dist,src=3D4,dst=3D6,val=3D28 -numa
  dist,src=3D5,dst=3D0,val=3D38 -numa dist,src=3D5,dst=3D1,val=3D17 -numa
  dist,src=3D5,dst=3D2,val=3D28 -numa dist,src=3D5,dst=3D3,val=3D28 -numa
  dist,src=3D5,dst=3D4,val=3D28 -numa dist,src=3D5,dst=3D5,val=3D10 -numa
  dist,src=3D5,dst=3D6,val=3D28 -numa dist,src=3D6,dst=3D0,val=3D38 -numa
  dist,src=3D6,dst=3D1,val=3D28 -numa dist,src=3D6,dst=3D2,val=3D28 -numa
  dist,src=3D6,dst=3D3,val=3D17 -numa dist,src=3D6,dst=3D4,val=3D28 -numa
  dist,src=3D6,dst=3D5,val=3D28 -numa dist,src=3D6,dst=3D6,val=3D10  -smp
  16,sockets=3D4,dies=3D1,cores=3D4,threads=3D1  -fsdev
  local,security_model=3Dpassthrough,id=3Dfsdev0,path=3D/home/mysuser/share
  -device virtio-9p-pci,id=3Dfs0,fsdev=3Dfsdev0,mount_tag=3Dshare_host
  -daemonize

  output from numactl -H:

  $ numactl -H
  available: 7 nodes (0-6)
  node 0 cpus: 0 1 2 3
  node 0 size: 250 MB
  node 0 free: 191 MB
  node 1 cpus: 4 5 6 7
  node 1 size: 251 MB
  node 1 free: 199 MB
  node 2 cpus: 8 9 10 11
  node 2 size: 251 MB
  node 2 free: 218 MB
  node 3 cpus: 12 13 14 15
  node 3 size: 251 MB
  node 3 free: 118 MB
  node 4 cpus:
  node 4 size: 1511 MB
  node 4 free: 1507 MB
  node 5 cpus:
  node 5 size: 1447 MB
  node 5 free: 1443 MB
  node 6 cpus:
  node 6 size: 1489 MB
  node 6 free: 1484 MB
  node distances:
  node   0   1   2   3   4   5   6
    0:  10  21  31  21  17  38  28
    1:  21  10  21  31  28  17  38
    2:  31  21  10  21  28  28  28
    3:  21  31  21  10  28  28  17
    4:  17  28  28  28  10  28  28
    5:  38  17  28  28  28  10  28
    6:  38  28  28  17  28  28  10

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912170/+subscriptions

