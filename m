Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C2383D6E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:30:43 +0200 (CEST)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiws-0002mr-Gb
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liisF-0001i8-7y
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:25:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:33272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liis4-0003q2-T7
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:25:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1liis1-00039f-NJ
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 19:25:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 785C02E818A
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 19:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 May 2021 19:15:45 -0000
From: Thomas Huth <1924738@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h izorkin th-huth
X-Launchpad-Bug-Reporter: Izorkin (izorkin)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161856700090.8743.17887923677613364195.malonedeb@gac.canonical.com>
Message-Id: <162127894525.1939.14130785326464760940.malone@wampee.canonical.com>
Subject: [Bug 1924738] Re: Failed to restore domain - error load load
 virtio-balloon:virtio
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: c0803556b2418eae3b44ca3bd5dcb570680d0e81
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
Reply-To: Bug 1924738 <1924738@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know how to transfer the bug to the new system if
(if still necessary). Thus we're setting the status to "Incomplete" now.

In the unlikely case that the bug has already been fixed in the final
6.0 release version of QEMU, then please close this ticket as "Fix released=
".

If it is not fixed yet and you think that this bug report here should be
moved to the new system, then you have two options:

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
https://bugs.launchpad.net/bugs/1924738

Title:
  Failed to restore domain - error load load virtio-balloon:virtio

Status in QEMU:
  Incomplete

Bug description:
  I noticed a domain restore error on my virtual machines.
  I can't reproduce the error on a test virtual machine.

  sudo virsh save linux2020 /var/lib/libvirt/qemu/save/linux2020.save
  Domain 'linux2020' saved to /var/lib/libvirt/qemu/save/linux2020.save

  sudo virsh restore /var/lib/libvirt/qemu/save/linux2020.save
  error: Failed to restore domain from /var/lib/libvirt/qemu/save/linux2020=
.save
  error: =D0=B2=D0=BD=D1=83=D1=82=D1=80=D0=B5=D0=BD=D0=BD=D1=8F=D1=8F =D0=
=BE=D1=88=D0=B8=D0=B1=D0=BA=D0=B0: QEMU =D0=BD=D0=B5=D0=BE=D0=B6=D0=B8=D0=
=B4=D0=B0=D0=BD=D0=BD=D0=BE =D0=B7=D0=B0=D0=B2=D0=B5=D1=80=D1=88=D0=B8=D0=
=BB =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D1=83 =D0=BC=D0=BE=D0=BD=D0=B8=D1=82=D0=
=BE=D1=80=D0=B0: qemu-system-x86_64: -chardev socket,id=3Dcharchannel0,fd=
=3D52,server,nowait: warning: short-form boolean option 'server' deprecated
  Please use server=3Don instead
  qemu-system-x86_64: -chardev socket,id=3Dcharchannel0,fd=3D52,server,nowa=
it: warning: short-form boolean option 'nowait' deprecated
  Please use wait=3Doff instead
  qemu-system-x86_64: -spice port=3D5900,addr=3D0.0.0.0,disable-ticketing,i=
mage-compression=3Doff,seamless-migration=3Don: warning: short-form boolean=
 option 'disable-ticketing' deprecated
  Please use disable-ticketing=3Don instead
  2021-04-16T09:47:15.037700Z qemu-system-x86_64: VQ 0 size 0x80 < last_ava=
il_idx 0x0 - used_idx 0xcccc
  2021-04-16T09:47:15.037737Z qemu-system-x86_64: Failed to load virtio-bal=
loon:virtio
  2021-04-16T09:47:15.037744Z qemu-system-x86_64: error while loading state=
 for instance 0x0 of device '0000:00:02.0/virtio-balloon'
  2021-04-16T09:47:15.037849Z qemu-system-x86_64: load of migration failed:=
 Operation not permitted

  If in the machine configuration replace
  <type arch=3D"x86_64" machine=3D"pc-i440fx-5.1">hvm</type>
  to
  <type arch=3D"x86_64" machine=3D"pc-i440fx-5.0">hvm</type>
  the virtual machine is recovering normally

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1924738/+subscriptions

