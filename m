Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752C32DC58F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:46:08 +0100 (CET)
Received: from localhost ([::1]:37950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpasJ-0007ta-H2
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpaiP-0005S8-Su
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:35:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:36278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpaiA-0001xc-92
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:35:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kpai7-0000bj-RP
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 17:35:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A344F2E813D
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 17:35:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Dec 2020 17:26:39 -0000
From: Kenneth Van Alstyne <1884990@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kvanals philmd
X-Launchpad-Bug-Reporter: Kenneth Van Alstyne (kvanals)
X-Launchpad-Bug-Modifier: Kenneth Van Alstyne (kvanals)
References: <159301342319.25339.2718719880566533302.malonedeb@gac.canonical.com>
Message-Id: <160813959919.3007.15221041545037787703.malone@wampee.canonical.com>
Subject: [Bug 1884990] Re: Cirrus graphics results in monochrome colour depth
 at 640x480 resolution
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a68a6d599c812dd1dd335307d9c5c017c50ba81b"; Instance="production"
X-Launchpad-Hash: e54e79b923017a792d2ef4e9f56eafebaee2fdd7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Reply-To: Bug 1884990 <1884990@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This issue is still marked as unresolved almost 6 months later. Has the
submodule been updated and merged into QEMU yet?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884990

Title:
  Cirrus graphics results in monochrome colour depth at 640x480
  resolution

Status in QEMU:
  New

Bug description:
  Recently we upgraded to a distribution that bundled QEMU 4.2.0.  We
  were previously running on QEMU 3.0.0.  When booting Windows 10 VMs on
  x86_64, users experienced slow, monochrome graphics and the resolution
  was restricted to 640x480.  Reverting to the prior vgabios-cirrus.bin
  from the prior source tarball remediated the issue.

  An example QEMU command line is below, if needed:
  /bin/qemu-system-x86_64 -vnc 0.0.0.0:100 -device cirrus-vga,id=3Dvideo0,b=
us=3Dpci.0,addr=3D0x2  -machine pc-i440fx-4.2,accel=3Dkvm,usb=3Doff,dump-gu=
est-core=3Doff -cpu qemu64 -m 2048 -overcommit mem-lock=3Doff -smp 1,socket=
s=3D1,cores=3D1,threads=3D1 -no-user-config -nodefaults -hda test.raw &

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884990/+subscriptions

