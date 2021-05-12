Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ACA37D2B0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:14:56 +0200 (CEST)
Received: from localhost ([::1]:51340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtNn-0008Oq-EG
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtK3-0002TR-Ut
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:11:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:33996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtK1-0006xf-LB
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:11:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgtK0-0000wf-70
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:11:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3367A2E8186
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:11:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 18:00:03 -0000
From: Thomas Huth <1912857@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: imperialguy th-huth
X-Launchpad-Bug-Reporter: Ven Karri (imperialguy)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161135175608.19792.5002633896122919993.malonedeb@wampee.canonical.com>
Message-Id: <162084240397.26912.10681890276898720541.malone@chaenomeles.canonical.com>
Subject: [Bug 1912857] Re: virtio-serial blocks hostfwd ssh on windows 10 host
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: c3803f844e5f0a1a90687e9286dead0903add682
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
Reply-To: Bug 1912857 <1912857@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1912857

Title:
  virtio-serial blocks hostfwd ssh on windows 10 host

Status in QEMU:
  Incomplete

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

