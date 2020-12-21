Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548F92DFA10
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 09:42:41 +0100 (CET)
Received: from localhost ([::1]:44752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krGm8-0000Ab-CG
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 03:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1krGkb-0007kg-K8
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 03:41:05 -0500
Received: from indium.canonical.com ([91.189.90.7]:41904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1krGkZ-0005RP-Nj
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 03:41:05 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1krGkX-0000tb-L4
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 08:41:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 61B042E8148
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 08:41:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Dec 2020 08:33:02 -0000
From: Thomas Huth <1884990@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kvanals philmd th-huth
X-Launchpad-Bug-Reporter: Kenneth Van Alstyne (kvanals)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159301342319.25339.2718719880566533302.malonedeb@gac.canonical.com>
Message-Id: <160853958222.28187.4523789356940435325.malone@gac.canonical.com>
Subject: [Bug 1884990] Re: Cirrus graphics results in monochrome colour depth
 at 640x480 resolution
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: b971b861adbed00ef94206fdd0971fe73523705c
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
Reply-To: Bug 1884990 <1884990@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch mentioned by Philippe ("vga: fix cirrus bios") has been included =
into QEMU via this commit here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dde15df5ead400b7c3d0cf2
... which has been released as part of QEMU v5.1 already. Thus this issue s=
hould be fixed now.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884990

Title:
  Cirrus graphics results in monochrome colour depth at 640x480
  resolution

Status in QEMU:
  Fix Released

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

