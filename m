Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB82D09A7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 05:28:35 +0100 (CET)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km88Y-00067C-Pn
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 23:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1km86M-0005GF-JZ
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:26:18 -0500
Received: from indium.canonical.com ([91.189.90.7]:39868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1km86J-0008KU-Sp
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:26:18 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1km86F-00018v-FR
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 04:26:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C71E12E8145
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 04:26:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Dec 2020 04:17:33 -0000
From: Launchpad Bug Tracker <1723488@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth ubuntu-weilnetz widgetii
X-Launchpad-Bug-Reporter: Dmitry Ilyin (widgetii)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150791693020.21864.9239859411466983104.malonedeb@gac.canonical.com>
Message-Id: <160731465357.2079.8721484099357877178.malone@loganberry.canonical.com>
Subject: [Bug 1723488] Re: HAX on Windows, memory lease error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="15cd58601e77a273f7390fc4f4fcd16efe814a43"; Instance="production"
X-Launchpad-Hash: 9e32c304a874e39690792bd1d25a846c0e26b5f3
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
Reply-To: Bug 1723488 <1723488@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1723488

Title:
  HAX on Windows, memory lease error

Status in QEMU:
  Expired

Bug description:
  Today I tried to use QEMU on Windows 8.1 x64 with Intel HAX.

  Command line: qemu-system-x86_64.exe -accel hax -m 8000 -hda
  /opt/disk/ubuntu.img -cdrom /opt/iso/ubuntu-17.04-server-amd64.iso

  Host machine has 32Gb physical memory, I got error:

  HAX is working and emulator runs in fast virt mode.
  **
  ERROR:A:/msys64/home/admin/git/qemu/target/i386/hax-mem.c:210:hax_process=
_section: assertion failed: (size <=3D UINT32_MAX)

  When using -m 4000 (and below) everything is fine. But if I try use
  >4000 and <8000 I get crash with errors:

  HAX is working and emulator runs in fast virt mode.
  hax_transaction_commit: Failed mapping @0x0000000100000000+0x78800000 fla=
gs 00
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request
  VCPU shutdown request

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1723488/+subscriptions

