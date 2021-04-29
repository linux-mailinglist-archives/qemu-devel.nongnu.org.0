Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA1936E98B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:27:31 +0200 (CEST)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4pO-00078I-Dc
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc4ns-0006D9-T7
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:25:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:46276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc4np-0002Ph-Rx
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:25:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc4nn-0003cr-Vg
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 11:25:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EECEB2E8157
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 11:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 11:20:39 -0000
From: Thomas Huth <1824778@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jkan th-huth
X-Launchpad-Bug-Reporter: Johan Carlsson (jkan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155531895115.20861.16647644389038821246.malonedeb@chaenomeles.canonical.com>
Message-Id: <161969523936.11353.11234357281383676635.malone@soybean.canonical.com>
Subject: [Bug 1824778] Re: PowerPC64: tlbivax does not work for addresses
 above 4G
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 24c37e70693c81ef9214137b6a2c757a61e7d6ab
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1824778 <1824778@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/52


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #52
   https://gitlab.com/qemu-project/qemu/-/issues/52

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1824778

Title:
  PowerPC64: tlbivax does not work for addresses above 4G

Status in QEMU:
  Expired

Bug description:
  The tlbivax instruction in QEMU does not work for address above 4G. The r=
eason behind this is a simple 32bit trunction of an address.
  Changing the argument ea from uint32_t to target_ulong for the function b=
ooke206_invalidate_ea_tlb() in target/ppc/mmu_helper.c solves the issue.

  I did not reproduce this using Linux so I have no public example for
  reproducing it. However it's a pretty straight forward change.

  Issue can be seen in all version of QEMU.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1824778/+subscriptions

