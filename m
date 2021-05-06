Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57307375918
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:18:30 +0200 (CEST)
Received: from localhost ([::1]:35228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehdt-0007wa-EU
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lehb8-0006SW-7b
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:15:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:36220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lehb3-0002JN-QA
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:15:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1legfK-0006lD-Kt
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 16:15:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6402B2E818C
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 16:15:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 16:08:27 -0000
From: Thomas Huth <1882350@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ide-hd
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake th-huth winndows
X-Launchpad-Bug-Reporter: marshell (winndows)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159144063074.3735.15991486640962003601.malonedeb@soybean.canonical.com>
Message-Id: <162031730752.15527.17420488178270658789.malone@soybean.canonical.com>
Subject: [Bug 1882350] Re: it always create sdx device when I configure ide
 device with hdx name
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: e730512a132e8811f882f912f4390dec6711c1b4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1882350 <1882350@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Which kernel / linux distro are you using in the guest? Can you spot
something related in the output of "dmesg" in the guest?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1882350

Title:
  it always create sdx device when I configure ide device with hdx name

Status in QEMU:
  Incomplete

Bug description:
  I have configured 2 ide disks with name starting with hd, but when the
  vm boots up, it shows disks whose name starting with sd.

  1. ide disks in vm xml:

      <disk type=3D'file' device=3D'disk'>
        <driver name=3D'qemu' type=3D'raw'/>
        <source file=3D'/data3_raw.qcow2'/>
        <target dev=3D'hdc' bus=3D'ide'/>
      </disk>
      <disk type=3D'file' device=3D'disk'>
        <driver name=3D'qemu' type=3D'qcow2'/>
        <source file=3D'/data2.qcow2'/>
        <target dev=3D'hdb' bus=3D'ide'/>
      </disk>

  =

  2. in VM:

  sda            8:0    0    2G  0 disk
  sdb            8:16   0    1G  0 disk

  =

  3. from vm.log:

  le=3D/data2.qcow2,format=3Dqcow2,if=3Dnone,id=3Ddrive-ide0-0-1 -device id=
e-
  hd,bus=3Dide.0,unit=3D1,drive=3Ddrive-ide0-0-1,id=3Dide0-0-1 -drive
  file=3D/data3_raw.qcow2,format=3Draw,if=3Dnone,id=3Ddrive-ide0-1-0 -device
  ide-hd,bus=3Dide.1,unit=3D0,drive=3Ddrive-ide0-1-0,id=3Dide0-1-0 -netdev t

  =

  4. rpm info: (I got the same issue on 2 diff envs)
  (1) env1
  qemu-kvm-1.5.3-105
  libvirt-3.2.0-14.el7
  (2) env2
  libvirt-5.9.0-1.el8
  qemu-4.1.0-1.el8

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1882350/+subscriptions

