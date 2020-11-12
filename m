Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8752B0654
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 14:22:11 +0100 (CET)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdCYE-0008UO-5B
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 08:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdCX6-00083o-7w
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:21:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:41578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdCX4-0000f3-1h
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:20:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdCX2-0006lh-5h
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:20:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 223362E80E9
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:20:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 13:12:49 -0000
From: Thomas Huth <1628971@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pasthelod th-huth
X-Launchpad-Bug-Reporter: Pas (pasthelod)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160929152256.27407.21634.malonedeb@chaenomeles.canonical.com>
Message-Id: <160518677026.4253.15748621354478316327.launchpad@gac.canonical.com>
Subject: [Bug 1628971] Re: -netdev user: guestfwd doesn't work
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: 8cc333e97de8c8ba30748d9af18e219301cdce17
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:20:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1628971 <1628971@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1628971

Title:
  -netdev user: guestfwd doesn't work

Status in QEMU:
  Invalid

Bug description:
  Hello!

  QEMU emulator version 2.6.1 (Debian 1:2.6.1+dfsg-0ubuntu4), Copyright
  (c) 2003-2008 Fabrice Bellard

  The IP address 192.168.1.46 is assigned to eth0.

  qemu-system-x86_64 \
      -no-hpet \
      -nodefconfig \
      -machine accel=3Dkvm \
      -cpu host \
      -smp 2 \
      -drive if=3Dvirtio,file=3Dyakkety-server-cloudimg-amd64.img \
      -device virtio-net-pci,netdev=3Dnet0 \
      -netdev 'user,id=3Dnet0,hostfwd=3Dtcp::2222-:22,guestfwd=3Dtcp:1.2.3.=
4:1234-cmd:nc 192.168.1.46 8842' \
      -m 1024 \
      -initrd yakkety-server-cloudimg-amd64-initrd-generic \
      -kernel yakkety-server-cloudimg-amd64-vmlinuz-generic \
      -append 'root=3D/dev/vda1 modprobe.blacklist=3Dfloppy systemd.log_lev=
el=3Ddebug systemd.journald.forward_to_console=3D1'

  Without the guestfwd=3D... part everything works nicely. With it I get
  the following message.

  =

  qemu-system-x86_64: -netdev user,id=3Dnet0,hostfwd=3Dtcp::2222-:22,guestf=
wd=3Dtcp:1.2.3.4:1234-cmd:nc 192.168.1.46 8842: conflicting/invalid host:po=
rt in guest forwarding rule 'tcp:1.2.3.4:1234-cmd:nc 192.168.1.46 8842'
  qemu-system-x86_64: -netdev user,id=3Dnet0,hostfwd=3Dtcp::2222-:22,guestf=
wd=3Dtcp:1.2.3.4:1234-cmd:nc 192.168.1.46 8842: Device 'user' could not be =
initialized

  =

  But I just compiled c640f2849ee8775fe1bbd7a2772610aa77816f9f, and I get t=
he same behavior.

  pas@strange:~/qemu/x86_64-softmmu$ ./qemu-system-x86_64 -net 'user,guestf=
wd=3Dtcp:1.2.3.4:1234-cmd:nc 192.168.1.48 80'
  qemu-system-x86_64: -net user,guestfwd=3Dtcp:1.2.3.4:1234-cmd:nc 192.168.=
1.48 80: conflicting/invalid host:port in guest forwarding rule 'tcp:1.2.3.=
4:1234-cmd:nc 192.168.1.48 80'
  qemu-system-x86_64: -net user,guestfwd=3Dtcp:1.2.3.4:1234-cmd:nc 192.168.=
1.48 80: Device 'user' could not be initialized

  =

  After poking a bit around it seems that this check fails in slirp/slirp.c=
: (around line 1074)

      if ((guest_addr->s_addr & slirp->vnetwork_mask.s_addr) !=3D
          slirp->vnetwork_addr.s_addr ||
          guest_addr->s_addr =3D=3D slirp->vhost_addr.s_addr ||
          guest_addr->s_addr =3D=3D slirp->vnameserver_addr.s_addr) {
          return -1;
      }

  Because guest_addr, and slirp has equivalent s_addr values.

  x86_64-softmmu/qemu-system-x86_64 -net
  'user,net=3D10.0.2.0/24,host=3D10.0.2.2,guestfwd=3Dtcp:12.0.0.2:80-cmd:ec=
ho
  ok'

  guest_addr: 12.0.0.2
  vnetwork_mask: 12.0.0.2
  vhost_addr: 12.0.0.2
  vnameserver_addr: 12.0.0.2
  guest_addr & mask: 12.0.0.2

  =

  Thanks in advance for looking into this!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1628971/+subscriptions

