Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D1C377B57
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 06:55:25 +0200 (CEST)
Received: from localhost ([::1]:55398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfxwy-0002gs-Bi
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 00:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxsV-00022q-67
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:50:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:51742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxsP-0002sA-K3
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:50:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfxsL-00017s-QL
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:50:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9A3A92E8188
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:50:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 04:45:09 -0000
From: Thomas Huth <1906185@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: graphics resolution
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fghgfh832 th-huth
X-Launchpad-Bug-Reporter: johannes (fghgfh832)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160668512846.21904.17586532859181577922.malonedeb@gac.canonical.com>
Message-Id: <162062190919.6163.12587088499662434397.malone@gac.canonical.com>
Subject: [Bug 1906185] Re: Guest display resolution cannot be changed when
 using certain graphics/interface combinations
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: a9fea80a0e2aa530f48957e349b9b7631a63a7c9
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
Reply-To: Bug 1906185 <1906185@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1906185

Title:
  Guest display resolution cannot be changed when using certain
  graphics/interface combinations

Status in QEMU:
  Incomplete

Bug description:
  Guest display resolution cannot be changed with certain virtual
  graphics card (-vga) and interface (-display) combinations.

  For example, resolution changing doesn't work with the following QEMU
  start commands, it resets to the default resolution immediately:

  QXL with SDL interface:
  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom ./linux/kubu=
ntu-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda -display sdl

  QXL with GTK interface:
  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom ./linux/kubu=
ntu-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda -display gtk

  QXL with "remote" SPICE interface via unix socket:
  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom ./linux/kubu=
ntu-20.04-desktop-amd64.iso -boot d -soundhw hda -vga qxl -device virtio-se=
rial-pci -device virtserialport,chardev=3Dspicechannel0,name=3Dcom.redhat.s=
pice.0 -chardev spicevmc,id=3Dspicechannel0,name=3Dvdagent -spice unix,addr=
=3D/tmp/vm_spice.socket,disable-ticketing

  for "remote" access:
  remote-viewer spice+unix:///tmp/vm_spice.socket


  Other tested combinations:
  -- virtio + SDL (GL on): works!
  -- virtio + GTK (GL on): does not work properly. The resolution is change=
d but window size is not so the guest screen will look like garbage.
  -- vmware: The initial Kubuntu setup screen is visible but booting does n=
ot progress to the desktop
  -- std + GTK: works!
  -- std + SDL: works!

  =

  QEMU version: 5.1.0
  Guest: Kubuntu 20.04 64-bit (live) with 5.4.0-26 kernel; may occur with o=
ther guests as well
  Host: Arch Linux, with KDE desktop

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906185/+subscriptions

