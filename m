Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E6A2F2719
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:33:27 +0100 (CET)
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBN0-0008L7-HH
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFv-0008Cy-2V
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:26:07 -0500
Received: from indium.canonical.com ([91.189.90.7]:52408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFs-0000u4-MG
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:26:06 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFf-0004Vy-Uw
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E68602E804B
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:30 -0000
From: Launchpad Bug Tracker <1781515@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: diego-viola fdelapena janitor th-huth
X-Launchpad-Bug-Reporter: Diego Viola (diego-viola)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153144791597.24345.4188684272748961598.malonedeb@chaenomeles.canonical.com>
Message-Id: <161042505051.10246.15005370879125462551.malone@loganberry.canonical.com>
Subject: [Bug 1781515] Re: Resolution switch leads to the screen/image being
 corrupted
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: 00d258818c54d89e9c2649d781576ebdfd1581e4
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
Reply-To: Bug 1781515 <1781515@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1781515

Title:
  Resolution switch leads to the screen/image being corrupted

Status in QEMU:
  Expired

Bug description:
  I am currently using QEMU on a Arch Linux host, the guest OS is also
  Arch Linux.

  The QEMU version is currently 2.12.0-2 packaged by Arch Linux, the
  command line I'm using to fire an Arch VM is:

  $ qemu-system-x86_64 -enable-kvm -hda archlinux.qcow2 -m 4G -smp 4

  The problem I'm currently having is, after firing the VM and running
  startx I want to change the resolution to the native resolution, which
  is 1366x768 on my ThinkPad T450, however, after changing the
  resolution the image on the guest gets corrupted and it's impossible
  to see anything.

  At this point I can only turn off the VM. The only workaround I found
  is to start the VM with -vga virtio.

  The problem in this case occurs with -vga std which is the default
  video driver.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1781515/+subscriptions

