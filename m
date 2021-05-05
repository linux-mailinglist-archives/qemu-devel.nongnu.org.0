Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC5373EAE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:37:42 +0200 (CEST)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJan-0006f6-GQ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJPO-0004fn-Ap
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:25:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:44920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJPC-00028K-Bz
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:25:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leJP9-00044n-Vg
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 15:25:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EE6182E8136
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 15:25:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 15:15:57 -0000
From: Thomas Huth <1863096@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chengjiang th-huth
X-Launchpad-Bug-Reporter: Cheng Jiang (chengjiang)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158159775529.28653.1884388369388986202.malonedeb@chaenomeles.canonical.com>
Message-Id: <162022775784.821.9445232063059617484.malone@chaenomeles.canonical.com>
Subject: [Bug 1863096] Re: vhost-user multi-queues interrupt failed when Qemu
 reconnection happens
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 93436fd7b7b632be96d2eb803c1df54d383dd5b8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1863096 <1863096@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1863096

Title:
  vhost-user multi-queues interrupt failed when Qemu reconnection
  happens

Status in QEMU:
  Incomplete

Bug description:
  After upgrade qemu to v4.2.0, vhost-user multi-queues interrupt failed
  with event idx interrupt mode when reconnection happens.

  Test Environment:
  DPDK version: DPDK v19.11
  Other software versions: qemu 4.2.0.
  OS: Linux 4.15.0-20-generic
  Compiler: gcc (Ubuntu 7.3.0-16ubuntu3) 7.3.0
  Hardware platform: Purley.

  The reproduce step is:
  1. Launch l3fwd-power example app with client mode::

      ./l3fwd-power -l 1-16 \
      -n 4 --socket-mem 1024,1024 --legacy-mem --no-pci\
      --log-level=3D9 \
      --vdev 'eth_vhost0,iface=3D/vhost-net0,queues=3D16,client=3D1' \
      -- -p 0x1 \
      --parse-ptype 1 \
      --config "(0,0,1),(0,1,2),(0,2,3),(0,3,4),(0,4,5),(0,5,6),(0,6,7),(0,=
7,8),(0,8,9),(0,9,10),(0,10,11),(0,11,12),(0,12,13),(0,13,14),(0,14,15),(0,=
15,16)"

  2. Launch VM1 with server mode:

  3. Relauch l3fwd-power sample to for reconnection:

      ./l3fwd-power -l 1-16 \
      -n 4 --socket-mem 1024,1024 --legacy-mem --no-pci\
      --log-level=3D9 \
      --vdev 'eth_vhost0,iface=3D/vhost-net0,queues=3D16,client=3D1' \
      -- -p 0x1 \
      --parse-ptype 1 \
      --config "(0,0,1),(0,1,2),(0,2,3),(0,3,4),(0,4,5),(0,5,6),(0,6,7),(0,=
7,8),(0,8,9),(0,9,10),(0,10,11),(0,11,12),(0,12,13),(0,13,14),(0,14,15),(0,=
15,16)"

  4. Set vitio-net with 16 quques and give vitio-net ip address:

      ethtool -L [ens3] combined 16    # [ens3] is the name of virtio-net
      ifconfig [ens3] 1.1.1.1

  5. Send packets with different IPs from virtio-net, notice to bind
  each vcpu to different send packets process::

      taskset -c 0 ping 1.1.1.2
      taskset -c 1 ping 1.1.1.3
      taskset -c 2 ping 1.1.1.4
      taskset -c 3 ping 1.1.1.5
      taskset -c 4 ping 1.1.1.6
      taskset -c 5 ping 1.1.1.7
      taskset -c 6 ping 1.1.1.8
      taskset -c 7 ping 1.1.1.9
      taskset -c 8 ping 1.1.1.2
      taskset -c 9 ping 1.1.1.2
      taskset -c 10 ping 1.1.1.2
      taskset -c 11 ping 1.1.1.2
      taskset -c 12 ping 1.1.1.2
      taskset -c 13 ping 1.1.1.2
      taskset -c 14 ping 1.1.1.2
      taskset -c 15 ping 1.1.1.2

  If everything ok, then we can see the result such as following:

      L3FWD_POWER: lcore 0 is waked up from rx interrupt on port 0 queue 0
      ...
      ...
      L3FWD_POWER: lcore 15 is waked up from rx interrupt on port 0 queue 15

  But we can't see the log above because of the bug.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863096/+subscriptions

