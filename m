Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116A5373EB9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:40:07 +0200 (CEST)
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJd8-00022C-1R
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJUS-0001uR-Cl
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:31:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:46414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJUN-0005Hf-No
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:31:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leJUK-0005qO-4a
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 15:31:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BF1FD2E818A
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 15:30:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 15:21:56 -0000
From: Thomas Huth <1861875@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mvgijssel th-huth
X-Launchpad-Bug-Reporter: Maarten (mvgijssel)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158082639262.26675.4971489062247211077.malonedeb@soybean.canonical.com>
Message-Id: <162022811673.6225.1351207178781231208.malone@wampee.canonical.com>
Subject: [Bug 1861875] Re: VDE networking barely working 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: acf4298e32f32e63b23251897a7908a8b1a0352d
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
Reply-To: Bug 1861875 <1861875@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861875

Title:
  VDE networking barely working

Status in QEMU:
  Incomplete

Bug description:
  Running qemu with a vde_switch and slirpvde:

  =C2=A0=C2=A0vde_switch -F -sock /tmp/qemu_vde_switch -M /tmp/qemu_vde_mgmt
  =C2=A0=C2=A0slirpvde -s /tmp/qemu_vde_switch -dhcp
  =C2=A0=C2=A0qemu-system-x86_64 -m 2048 -smp 2 -serial mon:stdio -display =
none -vga none -nodefaults -accel hax -net nic,macaddr=3D52:54:00:0e:e0:61,=
model=3Dvirtio -net vde,sock=3D/tmp/qemu_vde_switch -device virtio-rng-pci =
-drive file=3Dworker.qcow2,if=3Dvirtio -drive file=3Dcloud-init.iso,format=
=3Draw,if=3Dvirtio

  There is some network connectivity, ping and curl work, but bigger
  transfers like apt-get update or iperf break with the following errors
  printed in the output of vde_switch:

  =C2=A0=C2=A0vde_switch: send_sockaddr port 2: No buffer space available
  =C2=A0=C2=A0vde_switch: send_sockaddr port 2: No buffer space available
  =C2=A0=C2=A0vde_switch: send_sockaddr port 2: No buffer space available

  I've tried to change the MTU size and model of the adapter inside of
  the VM, but nothing worked.

  OS: macOS 10.15.2
  qemu: 4.2.0
  vde2 (vde_switch / slirpvde): 2.3.2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861875/+subscriptions

