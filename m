Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F43F504D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 16:56:38 +0100 (CET)
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT6cn-0006wX-0m
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 10:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iT6bw-0006Vl-TH
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:55:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iT6bv-0007Dj-RE
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:55:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:57176)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iT6bv-0007DL-LW
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:55:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iT6bu-00031B-7D
 for <qemu-devel@nongnu.org>; Fri, 08 Nov 2019 15:55:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 33CF62E8075
 for <qemu-devel@nongnu.org>; Fri,  8 Nov 2019 15:55:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Nov 2019 15:48:37 -0000
From: IndrasenaReddy Gali <1851664@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alex-l-williamson gisena th-huth
X-Launchpad-Bug-Reporter: IndrasenaReddy Gali (gisena)
X-Launchpad-Bug-Modifier: IndrasenaReddy Gali (gisena)
References: <157313838504.19702.7205622932379991141.malonedeb@wampee.canonical.com>
Message-Id: <157322811767.22614.16776107102766472302.malone@chaenomeles.canonical.com>
Subject: [Bug 1851664] Re: qemu-system-x86_64: "VFIO_MAP_DMA : -28" error when
 we attache 6 VF's to guest machine
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5c12686b9d9099cba4ac987acba0dfa25f374ab9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1851664 <1851664@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After increasing dma_entry_limit limit no issue observed.

But ideal senario device is getting hung and recovery happening only
with host hard rebooting.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1851664

Title:
  qemu-system-x86_64: "VFIO_MAP_DMA : -28" error when we attache 6 VF's
  to guest machine

Status in QEMU:
  Incomplete

Bug description:
  We are trying to attach 6 VF's to the guest machine on 4.1.1 qemu emulato=
r.
  We are observing "VFIO_MAP_DMA : -28" error.

  We are using w-bits=3D48 bits while lunching VM.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1851664/+subscriptions

