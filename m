Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD03C430C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 06:30:52 +0200 (CEST)
Received: from localhost ([::1]:40110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2nal-0007Zq-EQ
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 00:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWU-0007bn-4R
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:26 -0400
Received: from indium.canonical.com ([91.189.90.7]:38702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWS-0006OA-IO
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:25 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2nWO-0005Lk-7K
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 80FC32E81C7
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2021 04:17:55 -0000
From: Launchpad Bug Tracker <1912857@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: imperialguy janitor th-huth
X-Launchpad-Bug-Reporter: Ven Karri (imperialguy)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161135175608.19792.5002633896122919993.malonedeb@wampee.canonical.com>
Message-Id: <162606347581.2726.3818728862374590332.malone@loganberry.canonical.com>
Subject: [Bug 1912857] Re: virtio-serial blocks hostfwd ssh on windows 10 host
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 1960dcf633515f529f10a65629d194adce6869eb
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
Reply-To: Bug 1912857 <1912857@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912857

Title:
  virtio-serial blocks hostfwd ssh on windows 10 host

Status in QEMU:
  Expired

Bug description:
  qemu-system-x86_64
  =C2=A0=C2=A0-display none
  =C2=A0=C2=A0-hda archlinux.qcow2
  =C2=A0=C2=A0-m 4G
  =C2=A0=C2=A0-netdev user,id=3Dn1,hostfwd=3Dtcp::2222-:22
  =C2=A0=C2=A0-device virtio-net-pci,netdev=3Dn1

  --> THIS WORKS - meaning I can ssh into the vm via port 2222

  qemu-system-x86_64
  =C2=A0=C2=A0-display none
  =C2=A0=C2=A0-hda archlinux.qcow2
  =C2=A0=C2=A0-m 4G
  =C2=A0=C2=A0-netdev user,id=3Dn1,hostfwd=3Dtcp::2222-:22
  =C2=A0=C2=A0-device virtio-net-pci,netdev=3Dn1
  =C2=A0=C2=A0-device virtio-serial
  =C2=A0=C2=A0-device virtserialport,chardev=3Dcid0
  =C2=A0=C2=A0-chardev socket,id=3Dcid0,host=3Dlocalhost,port=3D55298,serve=
r,nowait

  --> DOES NOT WORK - meaning I cannot ssh into the vm

  Not only does the port 2222 not work, but I am not able to perform any
  serial transfer on port 55298 as well.

  The following doesn't work either:

  qemu-system-x86_64
  =C2=A0=C2=A0-display none
  =C2=A0=C2=A0-hda archlinux.qcow2
  =C2=A0=C2=A0-m 4G
  =C2=A0=C2=A0-netdev user,id=3Dn1,hostfwd=3Dtcp::2222-:22
  =C2=A0=C2=A0-device virtio-net-pci,netdev=3Dn1
  =C2=A0=C2=A0-device virtio-serial
  =C2=A0=C2=A0-device virtserialport,chardev=3Dcid0
  =C2=A0=C2=A0-chardev file,id=3Dcid0,path=3Dmypath

  No matter which character device I use for my virtserialport
  communication (socket or udp or file or pipe), the hostfwd doesn't
  work.

  Also, if I enable the display, I am unable to type anything in the
  emulator window when I use virtserialport.

  Host: Windows 10
  Guest: archlinux
  QEMU version 5.2

  The same thing works just fine on a Mac OS X host (tested on Big Sur)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912857/+subscriptions

