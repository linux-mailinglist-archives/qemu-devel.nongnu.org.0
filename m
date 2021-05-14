Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF91380616
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 11:22:03 +0200 (CEST)
Received: from localhost ([::1]:48774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhU1C-0005Mc-4H
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 05:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhU0C-0004eR-Pt
 for qemu-devel@nongnu.org; Fri, 14 May 2021 05:21:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhU09-0001Qm-KK
 for qemu-devel@nongnu.org; Fri, 14 May 2021 05:21:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhU05-0001XS-6L
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:20:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 299BE2E8194
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:20:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 09:06:14 -0000
From: Thomas Huth <1896754@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ruspartisan th-huth
X-Launchpad-Bug-Reporter: Maskim Bakulin (ruspartisan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160086081591.406.2004357727821714311.malonedeb@chaenomeles.canonical.com>
Message-Id: <162098317450.16886.12108043044107695005.malone@soybean.canonical.com>
Subject: [Bug 1896754] Re: Performance degradation for WinXP boot time after
 b55f54bc
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 141958b7d590b03806e99fd44b7e054f0fc898a4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1896754 <1896754@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ticket has been moved here (thanks, Maksim!):
https://gitlab.com/qemu-project/qemu/-/issues/286
Thus closing this one at Launchpad now.

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #286
   https://gitlab.com/qemu-project/qemu/-/issues/286

** Changed in: qemu
       Status: Incomplete =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1896754

Title:
  Performance degradation for WinXP boot time after b55f54bc

Status in QEMU:
  Invalid

Bug description:
  Qemu 5.1 loads Windows XP in TCG mode 5-6 times slower (~2 minutes)
  than 4.2 (25 seconds), I git bisected it, and it appears that commit
  b55f54bc965607c45b5010a107a792ba333ba654 causes this issue. Probably
  similar to an older fixed bug
  https://bugs.launchpad.net/qemu/+bug/1672383

  Command line is trivial: qemu-system-x86_64 -nodefaults -vga std -m
  4096M -hda WinXP.qcow2 -monitor stdio -snapshot

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1896754/+subscriptions

