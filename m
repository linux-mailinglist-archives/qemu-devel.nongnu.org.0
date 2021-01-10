Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A51E2F0521
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:35:36 +0100 (CET)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySRz-00048j-Dl
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySJ0-0007vA-3q
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:19 -0500
Received: from indium.canonical.com ([91.189.90.7]:40788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIx-0000k6-M8
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:17 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySIm-0000Ch-DF
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:26:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 61B892E8139
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:26:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:31 -0000
From: Launchpad Bug Tracker <1675458@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aaron-doyle-48 janitor th-huth
X-Launchpad-Bug-Reporter: Aaron Doyle (aaron-doyle-48)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170323155104.30547.10490.malonedeb@soybean.canonical.com>
Message-Id: <161025225164.18863.12609227855028437252.malone@loganberry.canonical.com>
Subject: [Bug 1675458] Re: attach-interface - unexpected action
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: b22528a7093cb69c05fbbfd3096f81e79f0ede51
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
Reply-To: Bug 1675458 <1675458@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1675458

Title:
  attach-interface - unexpected action

Status in QEMU:
  Expired

Bug description:
  Hello,

  Not sure where to report this, or if it is a bug. However, I feel like
  the behaviour is not what would/should be expected.

  -------------------------------------------------------------------------=
---------------------------------

  Environment:
  KVM Version:		root@hostname:~# virsh version
        			Compiled against library: libvirt 1.2.9
  			Using library: libvirt 1.2.9
  			Using API: QEMU 1.2.9
  			Running hypervisor: QEMU 2.1.2
  uname -a:		Linux hostname 3.16.0-4-amd64 #1 SMP Debian 3.16.39-1+deb8u2 (=
2017-03-07) x86_64 GNU/Linux
  CPU:			Intel(R) Xeon(R) CPU E3-1240 V2 @ 3.40GHz
  Host Debian Version:	8.7 (Jessie)
  Guest Debian Version:	8.7 (Jessie)

  -------------------------------------------------------------------------=
---------------------------------

  Issue:
  When adding an interface to a live VM, the position of interfaces within =
the VM may change post reboot.
  It appears a new interface takes up the first available =E2=80=9Cpci slot=
=E2=80=9D. If you have removed an interface in the past, this will be the o=
ne that is taken up.

  -------------------------------------------------------------------------=
---------------------------------

  Example:

  If the VM Has the following interfaces layout:

  eth0  HWaddr 00:00:00:00:00:00
  eth1  HWaddr 11:11:11:11:11:11
  eth2  HWaddr 22:22:22:22:22:22
  eth3  HWaddr 33:33:33:33:33:33

  Now I delete the interface with MAC address 11:11:11:11:11:11, you now
  have this:

  eth0  HWaddr 00:00:00:00:00:00
  eth1  HWaddr 22:22:22:22:22:22
  eth2  HWaddr 33:33:33:33:33:33

  And then you add a new interface with MAC address 44:44:44:44:44:44,
  using virsh:

  virsh attach-interface --domain guest --type bridge --source br3 --mac
  44:44:44:44:44:44 --model e1000 --target vmeth3 --live --persistent

  It will now look like this:

  eth0  HWaddr 00:00:00:00:00:00
  eth1  HWaddr 22:22:22:22:22:22
  eth2  HWaddr 33:33:33:33:33:33
  eth3  HWaddr 44:44:44:44:44:44

  However, after a reboot, it will look like this:

  eth0  HWaddr 00:00:00:00:00:00
  eth1  HWaddr 44:44:44:44:44:44
  eth2  HWaddr 22:22:22:22:22:22
  eth3  HWaddr 33:33:33:33:33:33 =


  This can be a problem, as /etc/network/interfaces file, etc., will be
  pointing to the wrong interfaces. I.E. originally eth1 was connected
  to br1 (for example), after reboot eth1 is now connected to br3.

  To resolve this issue, I need to edit the .xml file in the KVM
  machine, and edit the following lines:

        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x0c'
  function=3D'0x0'/>

  Changing these into the order I want them to be loaded in, i.e. eth0,
  eth1, eth2=E2=80=A6. (I know 4 are taken already and not usable by ethern=
et
  interfaces.)

  -------------------------------------------------------------------------=
---------------------------------

  =

  Thanks in advance.

  Kind regards,

  Aaron Doyle

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1675458/+subscriptions

