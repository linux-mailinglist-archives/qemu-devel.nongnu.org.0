Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1892F0BCF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 05:29:32 +0100 (CET)
Received: from localhost ([::1]:39684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyopf-0000Yy-7u
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 23:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kyomJ-00057b-K9
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:26:03 -0500
Received: from indium.canonical.com ([91.189.90.7]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kyomG-0003Py-Aa
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:26:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kyomD-0007Rz-K7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 032BF2E8158
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 Jan 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1777232@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gersner janitor th-huth
X-Launchpad-Bug-Reporter: Shimi Gersner (gersner)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152914728124.2335.1880022102353250655.malonedeb@chaenomeles.canonical.com>
Message-Id: <161033863801.29318.16167394640897848332.malone@loganberry.canonical.com>
Subject: [Bug 1777232] Re: NVME fails on big writes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 47acd530bcfc462df99c78010aaba93ec4b3be00
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
Reply-To: Bug 1777232 <1777232@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1777232

Title:
  NVME fails on big writes

Status in QEMU:
  Expired

Bug description:
  NVME Compliance test 8:3.3.0 tries to write and read back big chunks
  of pages. Currently, on the latest QEMU operation of size 1024 blocks
  will fail when device is backed by a file.

  NVME specification has several types of data transfers from guests,
  one of the is the PRP list (Physical Region Page List). PRP is a list
  of entries pointing to pages to be written. The list it self resides
  in a single or multiple pages.

  NVME device maps the PRP list into QEMUSGList which will be me mapped
  into linux IO vectors. Finally, when the file driver will write the
  changes, it uses the posix pwritev, which fails if the number of
  vectors exceeds the maximum.

  =

  NVME Compliance - https://github.com/nvmecompliance/tnvme/wiki

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1777232/+subscriptions

