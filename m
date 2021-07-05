Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C04B3BB651
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 06:27:29 +0200 (CEST)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0GCe-00066G-Ei
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 00:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBP-0003cN-CV
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:48634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBN-0002mq-0H
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0GBF-0004RG-H5
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 04:26:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0DFBC2E81D5
 for <qemu-devel@nongnu.org>; Mon,  5 Jul 2021 04:25:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1863096@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chengjiang janitor th-huth
X-Launchpad-Bug-Reporter: Cheng Jiang (chengjiang)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158159775529.28653.1884388369388986202.malonedeb@chaenomeles.canonical.com>
Message-Id: <162545864116.12677.10770766897315667403.malone@loganberry.canonical.com>
Subject: [Bug 1863096] Re: vhost-user multi-queues interrupt failed when Qemu
 reconnection happens
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 8d9adf4082fa45f6be6e25965f5eceac716fd27d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1863096 <1863096@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863096

Title:
  vhost-user multi-queues interrupt failed when Qemu reconnection
  happens

Status in QEMU:
  Expired

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

