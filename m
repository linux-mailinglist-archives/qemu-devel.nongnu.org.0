Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127683C7D91
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 06:31:34 +0200 (CEST)
Received: from localhost ([::1]:57320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3WYX-00027L-20
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 00:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUd-00048m-0Y
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:31 -0400
Received: from indium.canonical.com ([91.189.90.7]:51954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUb-0003lb-Cx
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3WUX-0006vG-NV
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:27:26 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 056DA2E852C
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:26:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Jul 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1920871@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor taoxu92 th-huth
X-Launchpad-Bug-Reporter: Tao Xu (taoxu92)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161648172746.20702.497420976182520260.malonedeb@wampee.canonical.com>
Message-Id: <162623624309.32682.13869700738813645034.malone@loganberry.canonical.com>
Subject: [Bug 1920871] Re: netperf UDP_STREAM high packet loss on QEMU tap
 network
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="48411ad9fd448ca55fc57f9555fc375624a85324"; Instance="production"
X-Launchpad-Hash: fcb88e57b3392bfc6a4190d46dcb1ac46412ec01
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1920871 <1920871@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920871

Title:
  netperf UDP_STREAM high packet loss on QEMU tap network

Status in QEMU:
  Expired

Bug description:
  Hi, I boot a guest with "-netdev
  tap,id=3Dhn0,vhost=3Doff,br=3Dbr0,helper=3D/usr/local/libexec/qemu-bridge-
  helper" network option, and using "netperf -H IP -t UDP_STREAM" to
  test guest UDP performance, I got the following output:

  Socket  Message  Elapsed      Messages               =20
  Size    Size     Time         Okay Errors   Throughput
  bytes   bytes    secs            #      #   10^6bits/sec

  212992   65507   10.00      144710      0    7583.56
  212992           10.00          32              1.68

  We can find most of UDP packets are lost. But I test another host machine=
 or use "-netdev usr,xxxxx". I can got:
  Socket  Message  Elapsed      Messages               =20
  Size    Size     Time         Okay Errors   Throughput
  bytes   bytes    secs            #      #   10^6bits/sec

  212992   65507   10.00       18351      0     961.61
  212992           10.00       18350            961.56

  most of UDP packets are recived.

  And If we check the tap qemu used, we can see:
  ifconfig tap0
  tap0: flags=3D4419<UP,BROADCAST,RUNNING,PROMISC,MULTICAST>  mtu 1500
          inet6 fe80::ecc6:21ff:fe6f:b174  prefixlen 64  scopeid 0x20<link>
          ether ee:c6:21:6f:b1:74  txqueuelen 1000  (Ethernet)
          RX packets 282  bytes 30097 (29.3 KiB)
          RX errors 0  dropped 0  overruns 0  frame 0
          TX packets 9086214  bytes 12731596673 (11.8 GiB)
          TX errors 0  dropped 16349024 overruns 0  carrier 0  collisions 0
  lots of TX packets are dropped.

  list other packet size:

  =E2=9E=9C  boot netperf -H 192.168.199.200 -t UDP_STREAM -- -m 1
  MIGRATED UDP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 192.168=
.199.200 () port 0 AF_INET
  Socket  Message  Elapsed      Messages               =20
  Size    Size     Time         Okay Errors   Throughput
  bytes   bytes    secs            #      #   10^6bits/sec

  212992       1   10.00     2297941      0       1.84
  212992           10.00     1462024              1.17

  =E2=9E=9C  boot netperf -H 192.168.199.200 -t UDP_STREAM -- -m 128
  MIGRATED UDP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 192.168=
.199.200 () port 0 AF_INET
  Socket  Message  Elapsed      Messages               =20
  Size    Size     Time         Okay Errors   Throughput
  bytes   bytes    secs            #      #   10^6bits/sec

  212992     128   10.00     2311547      0     236.70
  212992           10.00     1359834            139.25

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920871/+subscriptions


