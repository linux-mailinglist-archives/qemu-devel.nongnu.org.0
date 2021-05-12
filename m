Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA69237D179
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:56:48 +0200 (CEST)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgt6F-0007Pk-L2
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgt5G-0006du-CN
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:55:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:60752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgt5E-0005bl-6W
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:55:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgt5C-0008AA-4P
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 17:55:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 152912E813A
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 17:55:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 17:46:59 -0000
From: Izorkin <1924738@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h izorkin
X-Launchpad-Bug-Reporter: Izorkin (izorkin)
X-Launchpad-Bug-Modifier: Izorkin (izorkin)
References: <161856700090.8743.17887923677613364195.malonedeb@gac.canonical.com>
Message-Id: <162084161932.6944.5471131131576259415.malone@gac.canonical.com>
Subject: [Bug 1924738] Re: Failed to restore domain - error load load
 virtio-balloon:virtio
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 3758cce90d0de3feb503f30f7489b78c6603a3c0
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
Reply-To: Bug 1924738 <1924738@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

a) Checked for versions 5.2.0 and 6.0.0rc.
b) Save and restore with pc-i440fx-5.1.
c) Used OS Linux NixOS Unstable.
If clean install NixOS system - the error is not reproduced. It was not pos=
sible to track what affects the restore domain.

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

