Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67358368700
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 21:15:32 +0200 (CEST)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZenT-0003Of-FN
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 15:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZehA-0006KG-E8
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:09:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:46738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZeh5-0004d8-Sf
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:09:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZeh4-00026s-3t
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:08:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1AB102E815D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:08:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 17:32:28 -0000
From: Thomas Huth <1642421@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mail-wz6bkyhu4uqpfausw0ege9b0y3 rodrivg th-huth
X-Launchpad-Bug-Reporter: manut (mail-wz6bkyhu4uqpfausw0ege9b0y3)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20161116225238.8681.9123.malonedeb@gac.canonical.com>
Message-Id: <161911274896.31777.2844355555838403028.launchpad@soybean.canonical.com>
Subject: [Bug 1642421] Re: qemu-system-x86_64: ipv6 and dns is broken with
 netdev user
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 5b3292ec51d18f907fb6322c90ad465c30368c89
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
Reply-To: Bug 1642421 <1642421@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Bug watch removed: Sourceware.org Bugzilla #5475
   https://sourceware.org/bugzilla/show_bug.cgi?id=3D5475

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1642421

Title:
  qemu-system-x86_64: ipv6 and dns is broken with netdev user

Status in QEMU:
  Incomplete

Bug description:
  Hi,

  dhcp inside qemu returns an ipv6 address as dns-server. However this is n=
ot
  working. If i replace it with the ipv4 address '10.0.0.2' dns is working
  again. I would expect that the qemu emulated dhcp server responds either =
an
  ipv4 configuration that is working or its dns server/forwarder listens on=
 the
  ipv6 address returned by the emulated dhcp server.

  I used latest qemu from git (
  b0bcc86d2a87456f5a276f941dc775b265b309cf) and used the following
  commands:

  $ ./qemu-system-x86_64 -enable-kvm -M pc -device virtio-rng-pci -device
  virtio-net-pci,netdev=3Duser.0 -drive file=3Dbuildenv.img,if=3Dvirtio,bus=
=3D1,unit=3D0
  -no-reboot -netdev user,id=3Duser.0,hostfwd=3Dtcp::5022-:22,hostfwd=3Dtcp=
::7587-:7588
  -m 1024 -usb -nographic -smp 4

  buildenv.img is a debian jessie amd64 installation.

  Inside qemu the network is configured to use dhcp:

  $ cat /etc/network/interfaces
  allow-hotplug eth0
  iface eth0 inet dhcp

  $ ifconfig eth0
  eth0      Link encap:Ethernet  HWaddr 52:54:00:12:34:56
            inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
            inet6 addr: fe80::5054:ff:fe12:3456/64 Scope:Link
            inet6 addr: fec0::5054:ff:fe12:3456/64 Scope:Site
            UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
            RX packets:10 errors:0 dropped:0 overruns:0 frame:0
            TX packets:28 errors:0 dropped:0 overruns:0 carrier:0
            collisions:0 txqueuelen:1000
            RX bytes:3215 (3.1 KiB)  TX bytes:3638 (3.5 KiB)

  $ cat /etc/resolv.conf
  nameserver fec0::3

  $ arp google.de
  google.de: Host name lookup failure

  $ strace -f arp google.de
  ...
  socket(PF_INET6, SOCK_DGRAM|SOCK_NONBLOCK, IPPROTO_IP) =3D 4
  connect(4, {sa_family=3DAF_INET6, sin6_port=3Dhtons(53), inet_pton(AF_INE=
T6, "fec0::3", &sin6_addr), sin6_flowinfo=3D0, sin6_scope_id=3D0}, 28) =3D 0
  poll([{fd=3D4, events=3DPOLLOUT}], 1, 0)    =3D 1 ([{fd=3D4, revents=3DPO=
LLOUT}])
  sendto(4, "\17\320\1\0\0\1\0\0\0\0\0\0\6google\2de\0\0\1\0\1", 27, MSG_NO=
SIGNAL, NULL, 0) =3D 27
  poll([{fd=3D4, events=3DPOLLIN}], 1, 5000)  =3D 0 (Timeout)
  poll([{fd=3D4, events=3DPOLLOUT}], 1, 0)    =3D 1 ([{fd=3D4, revents=3DPO=
LLOUT}])
  sendto(4, "\17\320\1\0\0\1\0\0\0\0\0\0\6google\2de\0\0\1\0\1", 27, MSG_NO=
SIGNAL, NULL, 0) =3D 27
  poll([{fd=3D4, events=3DPOLLIN}], 1, 5000)  =3D 0 (Timeout)
  close(4)                                =3D 0
  ...

  $ echo nameserver 10.0.0.2 > /etc/resolv.conf

  $ arp google.de
  google.de (216.58.208.35) -- no entry

  Note: I reported this bug also to debian: https://bugs.debian.org/cgi-
  bin/bugreport.cgi?bug=3D844566

  Regards,

    Manuel

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1642421/+subscriptions

