Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD83BB658
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 06:29:09 +0200 (CEST)
Received: from localhost ([::1]:37564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0GEG-0003Ei-Tp
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 00:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBV-0003lF-QT
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:17 -0400
Received: from indium.canonical.com ([91.189.90.7]:49030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBQ-0002rh-Sa
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:17 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0GBM-0004Rc-Bp
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 04:26:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8ADEA2E82B0
 for <qemu-devel@nongnu.org>; Mon,  5 Jul 2021 04:25:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Jul 2021 04:17:25 -0000
From: Launchpad Bug Tracker <1861875@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mvgijssel th-huth
X-Launchpad-Bug-Reporter: Maarten (mvgijssel)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158082639262.26675.4971489062247211077.malonedeb@soybean.canonical.com>
Message-Id: <162545864529.12677.1838923864893973999.malone@loganberry.canonical.com>
Subject: [Bug 1861875] Re: VDE networking barely working 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 7a5d6aff34f0bfc2f27eabf74cde26914532045c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1861875 <1861875@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861875

Title:
  VDE networking barely working

Status in QEMU:
  Expired

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

