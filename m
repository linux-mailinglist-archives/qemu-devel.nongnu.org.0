Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704AE2C4FEF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 09:04:23 +0100 (CET)
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiCGM-0006jb-Cs
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 03:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kiCDX-00056J-N1
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 03:01:31 -0500
Received: from indium.canonical.com ([91.189.90.7]:44480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kiCDT-0007yh-2s
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 03:01:27 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kiCDQ-0002kT-Cs
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 08:01:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5C5632E813A
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 08:01:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2020 07:52:54 -0000
From: Thomas Huth <1821054@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: brianl723 dgilbert-h th-huth
X-Launchpad-Bug-Reporter: Brian Liddle (brianl723)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155310378408.17549.16030757294518265758.malonedeb@gac.canonical.com>
Message-Id: <160637717478.28607.10617860404678313281.malone@chaenomeles.canonical.com>
Subject: [Bug 1821054] Re: qemu segfault error when using pcie to dual pci
 adapter
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: f92cab64c9a01aa00607c2c1cda61dd41e98ba12
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
Reply-To: Bug 1821054 <1821054@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, thanks for getting back. So I'm closing this now due to insufficient
data.

** Changed in: qemu
       Status: Incomplete =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1821054

Title:
  qemu segfault error when using pcie to dual pci adapter

Status in QEMU:
  Won't Fix

Bug description:
  All the information I have is located in the Unraid forum on post "https:=
//forums.unraid.net/topic/78545-internal-error-qemu-unexpectedly-closed-the=
-monitor"
  I am happy to provide any addition information requested. Please let me k=
now. Reporting bug here based on recommendation by admin in that forum.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1821054/+subscriptions

