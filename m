Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64526370E89
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:38:17 +0200 (CEST)
Received: from localhost ([::1]:47628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldGyu-0003Ha-F7
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGrn-0004V4-K7
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:30:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:46328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGrh-0002qL-MA
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:30:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldGrg-0001Cy-F8
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:30:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6E8EA2E8058
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 18:30:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 18:21:33 -0000
From: Thomas Huth <1859081@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: programmingkidx roemeeeer th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Roman_B=C3=A4riswyl_=28roemeeeer=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157860451191.3344.46185682085252095.malonedeb@soybean.canonical.com>
Message-Id: <161997969350.4004.3426857470082892192.malone@chaenomeles.canonical.com>
Subject: [Bug 1859081] Re: Mouse way too fast when Qemu is on a Windows VM
 with a OS 9 Guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 20a8f48ca79e7503cd19d9a5575ecd31f3524f82
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
Reply-To: Bug 1859081 <1859081@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1859081

Title:
  Mouse way too fast when Qemu is on a Windows VM with a OS 9 Guest

Status in QEMU:
  Incomplete

Bug description:
  On a server, I have a Windows 10 VM with Qemu 4.1.0 (latest) from https:/=
/qemu.weilnetz.de/w64/ installed.
  There I have a Mac OS 9.2.2 machine.
  Now if I connect to the Windows VM with VNC or RDP or even VMWare console=
, the Mouse in the Mac OS Guest inside Qemu is waaaay to fast. Even when lo=
wering the mouse speed in the Mac OS mouse setting, one pixel in the Host (=
Windows 10 VM) still moves the mouse by 10 pixels inside the Qemu machine.
  I tried different resolutions but that does not help.
  Is there any way to fix this or any way how I can provide more informatio=
n?
  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859081/+subscriptions

