Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C903C6955
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:27:18 +0200 (CEST)
Received: from localhost ([::1]:37878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3A0r-00004x-QM
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zT-0005xr-Kl
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:25:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:40146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zR-0008Kg-5O
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:25:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m39zM-0003eU-HJ
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 80E302E817D
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Jul 2021 04:17:14 -0000
From: Launchpad Bug Tracker <1917661@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gdb riscv
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bog-dan-ro janitor th-huth
X-Launchpad-Bug-Reporter: BogDan (bog-dan-ro)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161479886143.24350.9355670718334050866.malonedeb@soybean.canonical.com>
Message-Id: <162614983552.15811.1318282526954438997.malone@loganberry.canonical.com>
Subject: [Bug 1917661] Re: qemu gdb wrong registers group for riscv64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 7d37c32eb1d7ccc9bd2b7e7fd0b3b36e43546a03
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1917661 <1917661@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917661

Title:
  qemu gdb wrong registers group for riscv64

Status in QEMU:
  Expired

Bug description:
  Step to reproduce:
  1. run qemu-system-riscv64 in gdb mode
  2. attach gdb
  3. set a breakpoint and run
  4. print register-groups using "maintenance print register-groups" command

  ...
   sbadaddr   4162 4162   1628       8 long            all,general
   msounteren 4163 4163   1636       8 long            all,general
   mbadaddr   4164 4164   1644       8 long            all,general
   htimedeltah 4165 4165   1652       8 long            all,general

  These registers don't belong to general group, instead they belong to
  all, system and csr groups.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917661/+subscriptions

