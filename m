Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343DB2F8B2B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 05:31:52 +0100 (CET)
Received: from localhost ([::1]:40610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0dFf-0003qU-8S
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 23:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dAH-0007rt-Ms
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:26:18 -0500
Received: from indium.canonical.com ([91.189.90.7]:46744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dAD-00067Z-0n
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:26:17 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0dAA-0001VU-BP
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:26:10 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 556482E8142
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:26:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 Jan 2021 04:17:52 -0000
From: Launchpad Bug Tracker <1743214@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: broken i386 os2 support trap warp
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balaton-4 janitor mvoloshin th-huth
X-Launchpad-Bug-Reporter: MVoloshin (mvoloshin)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151593225024.11261.9880390596143098449.malonedeb@soybean.canonical.com>
Message-Id: <161077067277.27726.14721517715262770977.malone@loganberry.canonical.com>
Subject: [Bug 1743214] Re: OS/2 Warp 3 support broken in 2.11
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: f6d15d0e5cf0d183879d5a771009db022ed9af4e
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
Reply-To: Bug 1743214 <1743214@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1743214

Title:
  OS/2 Warp 3 support broken in 2.11

Status in QEMU:
  Expired

Bug description:
  Hello, I used to run OS/2 Warp 3 on QEMU with the following command line:=
 qemu-system-i386 -vga cirrus -soundhw sb16 -hda os2warp3v2.img -boot c. It=
 runs OK on QEMU 2.10, but immediately gives TRAP 0006 (invalid opcode?) on=
 QEMU 2.11 (see screenshot).
  If it is important I have Fixpack 40 and GRADD installed in OS/2.
  Here is the image:
  https://drive.google.com/open?id=3D15umPecy7JlPLKUP6520MB_87CfrCDWO5

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1743214/+subscriptions

