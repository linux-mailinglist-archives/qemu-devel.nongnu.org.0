Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA9030197B
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 05:29:38 +0100 (CET)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3X1t-0002UI-KO
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 23:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3Wyn-000726-0Z
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 23:26:25 -0500
Received: from indium.canonical.com ([91.189.90.7]:43056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3Wyk-0005h0-KD
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 23:26:24 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l3Wyi-0008JG-4G
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 04:26:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7FA232E8189
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 04:26:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 Jan 2021 04:17:30 -0000
From: Launchpad Bug Tracker <1745354@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: cdos mouse ps2
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: farjon-florian janitor th-huth
X-Launchpad-Bug-Reporter: FARJON (farjon-florian)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151687805035.4532.9757970758658595284.malonedeb@wampee.canonical.com>
Message-Id: <161146185032.22004.7818388582024345159.malone@loganberry.canonical.com>
Subject: [Bug 1745354] Re: CDOS ps/2 mouse problem
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: efc89391775a02de5c3f884937ec9dfdb8a47901
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
Reply-To: Bug 1745354 <1745354@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1745354

Title:
  CDOS ps/2 mouse problem

Status in QEMU:
  Expired

Bug description:
  Qemu v2.10.2 (also tested with 2.11.0)
  Host OS : CentOS 7 x86_64 (1708)
  Guest OS : Concurrent DOS 386 3.0 (with GEM)

  There is my launch command : =

  /usr/local/bin/qemu-system-i386 -m 4m -cpu 486 -hda /home/my_user/HDD.img=
 -vga std

  When I'm launching the guest, it is not responding after focusing in
  the viewer. I think this is due to the ps/2 emulation because when I
  add "-usb -device usb-mouse" in my command I don't have this issue
  (but in this case, mouse is not supported by CDOS).

  I tested with an older version of Qemu (0.11) which uses the Bochs
  bios (instead of SeaBios in newer versions), and I don't have this
  issue either.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1745354/+subscriptions

