Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190322F8B25
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 05:29:23 +0100 (CET)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0dDF-00012z-JT
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 23:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dAG-0007rZ-Cz
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:26:16 -0500
Received: from indium.canonical.com ([91.189.90.7]:46690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dAC-00066z-8m
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:26:16 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0dA9-0001on-G9
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:26:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 703552E8144
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:26:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 Jan 2021 04:17:53 -0000
From: Launchpad Bug Tracker <1743337@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: corruption hpfs i386 os2 warp4
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mvoloshin th-huth
X-Launchpad-Bug-Reporter: MVoloshin (mvoloshin)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151600970022.20222.12880965081591608460.malonedeb@chaenomeles.canonical.com>
Message-Id: <161077067364.27726.10353131097710150663.malone@loganberry.canonical.com>
Subject: [Bug 1743337] Re: OS/2 Warp 4 HPFS corruption
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 14c467252761358612bc7280441685bfdefad090
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
Reply-To: Bug 1743337 <1743337@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1743337

Title:
  OS/2 Warp 4 HPFS corruption

Status in QEMU:
  Expired

Bug description:
  How to reproduce:
  Install OS/2 Warp 4 onto HPFS-formatted partition. After reboot there wil=
l be messages about "missing" files and OS2.INI not found. Chkdsk C: compla=
ins about FS corruption. Nothing changes even after fixing errors and next =
reboot. If you install OS/2 onto FAT partition instead, everything will be =
OK. I also tried booting images with OS/2 pre-installed through VBOX with s=
ame results. Is that HPFS driver or QEMU fault?
  There is an image for bug reproducing: https://yadi.sk/d/skMswNoy7txIg

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1743337/+subscriptions

