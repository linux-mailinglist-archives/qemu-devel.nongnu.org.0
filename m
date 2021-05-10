Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17810377EA4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 10:53:09 +0200 (CEST)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1f2-0006it-6v
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 04:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg1dE-00040R-8y
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:51:16 -0400
Received: from indium.canonical.com ([91.189.90.7]:34084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg1dC-0008Qh-Fz
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:51:16 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lg1d8-0002ei-BS
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:51:10 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5CE1C2E81AA
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:51:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 08:42:08 -0000
From: Thomas Huth <1873340@bugs.launchpad.net>
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
References: <158706597063.17331.9857104872351030807.malonedeb@wampee.canonical.com>
Message-Id: <162063612828.16552.6487367584602626725.malone@soybean.canonical.com>
Subject: [Bug 1873340] Re: KVM Old ATI(pre) AMD card passthrough is not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 91ca688aad50811d53a85efdc4a0554cdbb5f589
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
Reply-To: Bug 1873340 <1873340@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/252


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #252
   https://gitlab.com/qemu-project/qemu/-/issues/252

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873340

Title:
  KVM Old ATI(pre) AMD card passthrough is not working

Status in QEMU:
  Expired

Bug description:
  Hello,
  tried to passthroug old ATI pre AMD PCI / PCI-E cards, on machine where a=
nything else is working - Nvidia /Matrox / 3dfx cards..

  Here are results:
  ATI Mach 64 PCI - videocard - machine start segfault
  ATI Rage XL PCI - videocard - machine start segfault
  ATI Radeon 7000 PCI - Segmentation fault
  ATI X600 Giabyte GV-RX60P128D - Segmentation fault
  ATI X700 PCI-E Legend - videocard - completely broken picture from boot
  ATI X800 XL PCI-E Gigabyte - videocard - completely broken picture from b=
oot
  =C2=A0=C2=A0All cards have last bioses.

  ATI X600 - HP one professional with DMS-59 connector, im unable to
  make passthrough, but im not able to set in Windows 98/WinXP machine..
  anything less than 16 bit colors.. Im getting VM crashes or boot
  freezes, when i try to boot with more colors.

  =C2=A0Qemu 2.11 and 4.2, is the same, Mint Linux 19.3. Giabyte Z170 MB.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873340/+subscriptions

