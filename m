Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CFE381047
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:06:24 +0200 (CEST)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhd8g-0002KO-Qb
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhd3d-0005v8-1N
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:01:12 -0400
Received: from indium.canonical.com ([91.189.90.7]:35264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhd3O-0004qu-Nl
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:01:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhd3M-0005CZ-9A
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:00:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0E0932E8187
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:00:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 18:54:55 -0000
From: Thomas Huth <1920871@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: taoxu92 th-huth
X-Launchpad-Bug-Reporter: Tao Xu (taoxu92)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161648172746.20702.497420976182520260.malonedeb@wampee.canonical.com>
Message-Id: <162101849605.20719.6453188866186431281.malone@soybean.canonical.com>
Subject: [Bug 1920871] Re: netperf UDP_STREAM high packet loss on QEMU tap
 network
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: cbba951ff44d9a1784504559deb5d646fbd98fe8
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
Reply-To: Bug 1920871 <1920871@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1920871

Title:
  netperf UDP_STREAM high packet loss on QEMU tap network

Status in QEMU:
  Incomplete

Bug description:
  Hi, I boot a guest with "-netdev
  tap,id=3Dhn0,vhost=3Doff,br=3Dbr0,helper=3D/usr/local/libexec/qemu-bridge-
  helper" network option, and using "netperf -H IP -t UDP_STREAM" to
  test guest UDP performance, I got the following output:

  Socket  Message  Elapsed      Messages                =

  Size    Size     Time         Okay Errors   Throughput
  bytes   bytes    secs            #      #   10^6bits/sec

  212992   65507   10.00      144710      0    7583.56
  212992           10.00          32              1.68

  We can find most of UDP packets are lost. But I test another host machine=
 or use "-netdev usr,xxxxx". I can got:
  Socket  Message  Elapsed      Messages                =

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
  Socket  Message  Elapsed      Messages                =

  Size    Size     Time         Okay Errors   Throughput
  bytes   bytes    secs            #      #   10^6bits/sec

  212992       1   10.00     2297941      0       1.84
  212992           10.00     1462024              1.17

  =E2=9E=9C  boot netperf -H 192.168.199.200 -t UDP_STREAM -- -m 128
  MIGRATED UDP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 192.168=
.199.200 () port 0 AF_INET
  Socket  Message  Elapsed      Messages                =

  Size    Size     Time         Okay Errors   Throughput
  bytes   bytes    secs            #      #   10^6bits/sec

  212992     128   10.00     2311547      0     236.70
  212992           10.00     1359834            139.25

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920871/+subscriptions

