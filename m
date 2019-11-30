Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CBD10DE00
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Nov 2019 16:26:32 +0100 (CET)
Received: from localhost ([::1]:41114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ib4df-0000jJ-KA
	for lists+qemu-devel@lfdr.de; Sat, 30 Nov 2019 10:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ib4ct-0000IL-9G
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 10:25:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ib4cs-0007mm-1k
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 10:25:39 -0500
Received: from indium.canonical.com ([91.189.90.7]:48130)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ib4cr-0007lj-SZ
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 10:25:37 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ib4cp-0006gl-Tb
 for <qemu-devel@nongnu.org>; Sat, 30 Nov 2019 15:25:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D5DC92E8048
 for <qemu-devel@nongnu.org>; Sat, 30 Nov 2019 15:25:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 Nov 2019 15:19:00 -0000
From: "Phil.Chang" <1854577@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: soso7885
X-Launchpad-Bug-Reporter: Phil.Chang (soso7885)
X-Launchpad-Bug-Modifier: Phil.Chang (soso7885)
Message-Id: <157512714096.22533.6951833586552059273.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1854577] [NEW] unable to boot arm64 image
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 94f0c267b61004ef15bc4d3dad1baa53ca83722b
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
Reply-To: Bug 1854577 <1854577@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi

Now I facing boot linux-5.3 arm64 image failed, without any log, just
hang here.

Host machine: ubuntu-18.04 with 4.15.0-70-generic kernel
Qemu version: qemu-system-aarch64-version 4.1.0
use command: qemu-system-aarch64 -kernel <IAMGE> -append "console=3DttyAMA0=
" -m 2048M -smp 2 -M virt -cpu cortex-a57 -nographic

could anyone teach me how to debug this?

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1854577

Title:
  unable to boot arm64 image

Status in QEMU:
  New

Bug description:
  Hi

  Now I facing boot linux-5.3 arm64 image failed, without any log, just
  hang here.

  Host machine: ubuntu-18.04 with 4.15.0-70-generic kernel
  Qemu version: qemu-system-aarch64-version 4.1.0
  use command: qemu-system-aarch64 -kernel <IAMGE> -append "console=3DttyAM=
A0" -m 2048M -smp 2 -M virt -cpu cortex-a57 -nographic

  could anyone teach me how to debug this?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1854577/+subscriptions

