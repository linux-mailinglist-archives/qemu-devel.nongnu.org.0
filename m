Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379C8377EA1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 10:53:03 +0200 (CEST)
Received: from localhost ([::1]:40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1ew-0006bK-9H
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 04:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg1dD-0003zy-5F
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:51:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:34020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg1dB-0008Pv-IB
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:51:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lg1d7-0002eq-77
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:51:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CC27D2E821F
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:51:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 08:42:16 -0000
From: Thomas Huth <1873341@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ruthan th-huth
X-Launchpad-Bug-Reporter: ruthan (ruthan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158706625888.5694.6270218999335358584.malonedeb@chaenomeles.canonical.com>
Message-Id: <162063613703.2111.17943552857782134003.malone@wampee.canonical.com>
Subject: [Bug 1873341] Re: Qemu Win98 VM with KVM videocard passthrough DOS
 mode video is not working for most of games..
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: a1cebc7c7f5a0c205685136d2e165980762541be
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
Reply-To: Bug 1873341 <1873341@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/253


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #253
   https://gitlab.com/qemu-project/qemu/-/issues/253

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873341

Title:
  Qemu Win98 VM with KVM videocard passthrough DOS mode video is not
  working for most of games..

Status in QEMU:
  Expired

Bug description:
  Hello,
  im using Win98 machine with KVM videocards passthrough which is working f=
ine, but when i try Windows 98 - Dosbox mode, there is something work with =
all videocards which i tried PCI-E/PCI - Nvidia, 3Dfx, Matrox.

  =C2=A0Often is framerate is very slow, as slideshow:
  Doom 2,Battle Arena Toshidden 1 demo, Blood, even for Fdisk start - i can=
 see how its slowly rendering individual lines, or its not working at all -=
 freeze / black screen only - Warcraft 2 demo (vesa 640x480).

  =C2=A0There is something wrong with it. I can add more games info if is
  needed, most of games which i tried are not working.

  =C2=A0Qemu 2.11 + 4.2, Linux Mint 19.3. Gigabyte Z170 MB.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873341/+subscriptions

