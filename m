Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DF02C4E0A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 05:31:35 +0100 (CET)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki8wQ-0000qs-2C
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 23:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ki8rd-0004MV-47
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 23:26:37 -0500
Received: from indium.canonical.com ([91.189.90.7]:47134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ki8ra-0004dA-DX
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 23:26:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ki8rX-00017C-S6
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:26:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F03032E815A
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:26:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2020 04:17:20 -0000
From: Launchpad Bug Tracker <1713825@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h janitor kraxel-redhat th-huth
 uzytkownik2
X-Launchpad-Bug-Reporter: Maciej Piechotka (uzytkownik2)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150404140220.18876.2468100840644103776.malonedeb@chaenomeles.canonical.com>
Message-Id: <160636424041.8545.7416685803319287564.malone@loganberry.canonical.com>
Subject: [Bug 1713825] Re: Booting Windows 2016 with qxl video crashes qemu
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 735fc9348b83a7b06c359b83425e0ae02bc4bb12
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
Reply-To: Bug 1713825 <1713825@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1713825

Title:
  Booting Windows 2016 with qxl video crashes qemu

Status in QEMU:
  Expired

Bug description:
  launched from libvirt.

  qemu version: 2.9.0
  host: Linux <hostname> 4.9.34-gentoo #1 SMP Sat Jul 29 13:28:43 PDT 2017 =
x86_64 Intel(R) Core(TM) i7-3930K CPU @ 3.20GHz GenuineIntel GNU/Linux
  guest: Windows 2016 64 bit

  Thread 28 (Thread 0x7f0e2edff700 (LWP 29860)):
  #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.=
c:51
          set =3D {__val =3D {18446744067266837079, 139698892694944, 139699=
853745096, 139700858749789, 4222451712, 139694281220640, 139694281220741, 1=
39694281220640, 139694281220640, 139694281220810, =

              139694281220940, 139694281220640, 139694281220940, 0, 0, 0}}
          pid =3D <optimized out>
          tid =3D <optimized out>
  #1  0x00007f0ea40b644a in __GI_abort () at abort.c:89
          save_stage =3D 2
          act =3D {__sigaction_handler =3D {sa_handler =3D 0x7f0e2edfe5c0, =
sa_sigaction =3D 0x7f0e2edfe5c0}, sa_mask =3D {__val =3D {139694281219872, =
139698106269697, 139698892695344, 4, 2676511744, 0, 139698892695144, 0, =

                139698892694912, 1, 4737316546111099904, 139700859888720, 4=
737316546111099904, 139700862161824, 139700911349760, 94211934977482}}, sa_=
flags =3D 416, =

            sa_restorer =3D 0x55af6ceb0500 <__PRETTY_FUNCTION__.36381>}
          sigs =3D {__val =3D {32, 0 <repeats 15 times>}}
  #2  0x00007f0ea40abab6 in __assert_fail_base (fmt=3D<optimized out>, asse=
rtion=3Dassertion@entry=3D0x55af6ceafdca "offset < qxl->vga.vram_size", =

      file=3Dfile@entry=3D0x55af6ceaeaa0 "/var/tmp/portage/app-emulation/qe=
mu-2.9.0-r2/work/qemu-2.9.0/hw/display/qxl.c", line=3Dline@entry=3D416, =

      function=3Dfunction@entry=3D0x55af6ceb0500 <__PRETTY_FUNCTION__.36381=
> "qxl_ram_set_dirty") at assert.c:92
          str =3D 0x7f0d1c026220 "\340r\002\034\r\177"
          total =3D 4096
  #3  0x00007f0ea40abb81 in __GI___assert_fail (assertion=3Dassertion@entry=
=3D0x55af6ceafdca "offset < qxl->vga.vram_size", =

      file=3Dfile@entry=3D0x55af6ceaeaa0 "/var/tmp/portage/app-emulation/qe=
mu-2.9.0-r2/work/qemu-2.9.0/hw/display/qxl.c", line=3Dline@entry=3D416, =

      function=3Dfunction@entry=3D0x55af6ceb0500 <__PRETTY_FUNCTION__.36381=
> "qxl_ram_set_dirty") at assert.c:101
  No locals.
  #4  0x000055af6cc58805 in qxl_ram_set_dirty (qxl=3D<optimized out>, ptr=
=3D<optimized out>) at /var/tmp/portage/app-emulation/qemu-2.9.0-r2/work/qe=
mu-2.9.0/hw/display/qxl.c:416
          base =3D <optimized out>
          offset =3D <optimized out>
          qxl =3D <optimized out>
          ptr =3D <optimized out>
          base =3D <optimized out>
          offset =3D <optimized out>
  #5  0x000055af6cc5b9e2 in interface_release_resource (sin=3D0x55af71a91ed=
0, ext=3D...) at /var/tmp/portage/app-emulation/qemu-2.9.0-r2/work/qemu-2.9=
.0/hw/display/qxl.c:767
          qxl =3D 0x55af71a91450
          ring =3D <optimized out>
          item =3D <optimized out>
          id =3D 18446690739814400920
          __func__ =3D "interface_release_resource"
  #6  0x00007f0ea510afa8 in red_drawable_unref (red_drawable=3D0x7f0d1c0261=
20) at red-worker.c:101
  No locals.
  #7  0x00007f0ea510b609 in red_drawable_unref (red_drawable=3D<optimized o=
ut>) at red-worker.c:104
  No locals.
  #8  0x00007f0ea510eae9 in drawable_unref (drawable=3Ddrawable@entry=3D0x7=
f0e68285ac0) at display-channel.c:1438
          display =3D 0x55af71dbd3c0
          __FUNCTION__ =3D "drawable_unref"
  #9  0x00007f0ea51109f7 in draw_until (display=3Ddisplay@entry=3D0x55af71d=
bd3c0, surface=3Dsurface@entry=3D0x7f0e6828aae8, last=3D0x7f0e68285ac0) at =
display-channel.c:1637
          container =3D 0x0
          now =3D 0x7f0e68285ac0
  #10 0x00007f0ea510f93f in display_channel_draw (display=3D0x55af71dbd3c0,=
 area=3D0x7f0e2edfe8e0, surface_id=3D<optimized out>) at display-channel.c:=
1729
          surface =3D 0x7f0e6828aae8
          last =3D <optimized out>
          __FUNCTION__ =3D "display_channel_draw"
          __func__ =3D "display_channel_draw"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1713825/+subscriptions

