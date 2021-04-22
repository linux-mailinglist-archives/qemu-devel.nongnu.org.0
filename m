Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ED8367B0F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:27:30 +0200 (CEST)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTkH-0001zX-4w
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTin-0000LS-D3
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:25:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:37912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTik-00014C-LC
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:25:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTij-0005Qz-E6
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:25:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5F2CD2E815D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:15:59 -0000
From: Thomas Huth <1838228@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hugelgupf marcandre-lureau th-huth
X-Launchpad-Bug-Reporter: Chris Koch (hugelgupf)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156438177001.5960.9261076941599056117.malonedeb@soybean.canonical.com>
Message-Id: <161907575923.31966.86273588184552886.malone@soybean.canonical.com>
Subject: [Bug 1838228] Re: Slirp Broadcast traffic
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 290e8a3dcb093c356066b1fe68db1b3ded4f2784
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
Reply-To: Bug 1838228 <1838228@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ticket in the libslirp tracker has been closed a year ago, so I
think we can close this ticket here, too.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838228

Title:
  Slirp Broadcast traffic

Status in QEMU:
  Fix Released

Bug description:
  Hi all,

  Version: QEMU emulator version 3.1.0 (Debian 1:3.1+dfsg-7+build1)

  I'm running some DHCP traffic to a *custom* DHCP server with user-mode
  networking in QEMU. I'm using port 30067 for the server, so this does
  not conflict with the built-in DHCP server.

  DHCP broadcasts to and from the server, and I'm observing issues with
  both sending and receiving packets.

  Firstly, from the VM, a packet sent to IPv4 x.x.x.2:30067 (gateway)
  makes it to the server, but a packet sent to 255.255.255.255 does not.
  I'd suspect that Slirp has to support sending to the broadcast IP
  address? Or is this something I can turn on with a configuration
  option? (My QEMU version too old?)

  Secondly, the source address in a DHCP IPv4 packet must be 0.0.0.0 (by
  RFC). That means that any return packet will have 0.0.0.0 swapped in
  as its destination address. However, that packet doesn't make it into
  the VM at all. I know that if you deliver this packet to Linux, a raw
  socket will spit it back out. The packets' destination address should
  not prevent the packet from being delivered to the right VM, since
  Slirp (should?) know exactly which VM the session belongs to. (It's a
  proxy, not a router.)

  WDYT? Did I miss some configuration options or use too old a version?

  Thanks,
  Chris

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838228/+subscriptions

