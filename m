Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5EC374F0C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 07:52:21 +0200 (CEST)
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leWvs-0000y4-J0
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 01:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leWuf-00083F-0F
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:51:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:42894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leWub-00052p-LY
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:51:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leWuZ-0005pI-LB
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 05:50:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 480A72E8193
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 05:50:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 05:44:13 -0000
From: Thomas Huth <1864704@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier th-huth xiaoxing-fang
X-Launchpad-Bug-Reporter: Xiaoxing Fang (xiaoxing-fang)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158266147970.14929.12590183127375701795.malonedeb@wampee.canonical.com>
Message-Id: <162027985377.4321.1887538672047136030.malone@gac.canonical.com>
Subject: [Bug 1864704] Re: No compatible -machine option in qemu-system-ppc64
 for e6500 core
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 410923e20879c6d4550f90304beada2c3fc4c1c5
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
Reply-To: Bug 1864704 <1864704@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You could try to build an image for this machine with buildroot (see
https://buildroot.org/). Anyway, I'm closing this ticket now since this
was not a bug.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1864704

Title:
  No compatible -machine option in qemu-system-ppc64 for e6500 core

Status in QEMU:
  Invalid

Bug description:
  Hi,

  I'm trying to use qemu-system-ppc64 for emulating a QorIQ T2080 (with e65=
00 cores). =

  However, I couldn't find any -machine option that matches -cpu e6500 opti=
on, which are listed below:

  C:\Program Files\qemu>qemu-system-ppc64 -machine help
  Supported machines are:
  40p                  IBM RS/6000 7020 (40p)
  bamboo               bamboo
  g3beige              Heathrow based PowerMAC
  mac99                Mac99 based PowerMAC
  mpc8544ds            mpc8544ds
  none                 empty machine
  powernv8             IBM PowerNV (Non-Virtualized) POWER8
  powernv              IBM PowerNV (Non-Virtualized) POWER9 (alias of power=
nv9)
  powernv9             IBM PowerNV (Non-Virtualized) POWER9
  ppce500              generic paravirt e500 platform
  prep                 PowerPC PREP platform (deprecated)
  pseries-2.1          pSeries Logical Partition (PAPR compliant)
  pseries-2.10         pSeries Logical Partition (PAPR compliant)
  pseries-2.11         pSeries Logical Partition (PAPR compliant)
  pseries-2.12         pSeries Logical Partition (PAPR compliant)
  pseries-2.12-sxxm    pSeries Logical Partition (PAPR compliant)
  pseries-2.2          pSeries Logical Partition (PAPR compliant)
  pseries-2.3          pSeries Logical Partition (PAPR compliant)
  pseries-2.4          pSeries Logical Partition (PAPR compliant)
  pseries-2.5          pSeries Logical Partition (PAPR compliant)
  pseries-2.6          pSeries Logical Partition (PAPR compliant)
  pseries-2.7          pSeries Logical Partition (PAPR compliant)
  pseries-2.8          pSeries Logical Partition (PAPR compliant)
  pseries-2.9          pSeries Logical Partition (PAPR compliant)
  pseries-3.0          pSeries Logical Partition (PAPR compliant)
  pseries-3.1          pSeries Logical Partition (PAPR compliant)
  pseries-4.0          pSeries Logical Partition (PAPR compliant)
  pseries-4.1          pSeries Logical Partition (PAPR compliant)
  pseries              pSeries Logical Partition (PAPR compliant) (alias of=
 pseries-4.2)
  pseries-4.2          pSeries Logical Partition (PAPR compliant) (default)
  ref405ep             ref405ep
  sam460ex             aCube Sam460ex
  taihu                taihu
  virtex-ml507         Xilinx Virtex ML507 reference design

  I am wondering if anyone knows that is if any of them can be selected
  for such emulation? Thank you!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1864704/+subscriptions

