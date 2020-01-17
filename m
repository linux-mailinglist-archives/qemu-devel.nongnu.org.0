Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA71408D0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 12:22:08 +0100 (CET)
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isPhW-0001vl-W9
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 06:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1isPgK-0001Dd-I2
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:20:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1isPgG-0004qo-KU
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:20:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:49798)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1isPgG-0004qB-Ex
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:20:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1isPgE-0006Ut-N7
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 11:20:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A7A832E80BA
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 11:20:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jan 2020 11:08:09 -0000
From: Max Reitz <1859989@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 5-plamen xanclic
X-Launchpad-Bug-Reporter: pevogam (5-plamen)
X-Launchpad-Bug-Modifier: Max Reitz (xanclic)
References: <157918316689.4864.12553262908100217782.malonedeb@wampee.canonical.com>
Message-Id: <157925928974.4144.4979931538166834820.malone@soybean.canonical.com>
Subject: [Bug 1859989] Re: qemu-img has broken output with large snapshot names
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f1052173880d8dae43faa7c2fc45da1b42227143";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5164688bf1ed64f522d85c1d0a5269ddc875e880
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
Reply-To: Bug 1859989 <1859989@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sent a patch: https://lists.nongnu.org/archive/html/qemu-
block/2020-01/msg00376.html

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859989

Title:
  qemu-img has broken output with large snapshot names

Status in QEMU:
  New

Bug description:
  On Qemu 4.1.1 the output of snapshots breaks if the chosen state name
  is too long:

  ```
  # qemu-img snapshot -l /mnt/local/some_image.qcow2
  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  1         online_provider_with_dhcp747 MiB 2020-01-15 12:05:01   00:00:45=
.873
  ```

  Prior to 4.1.1 this used to work with extra tabs for the VM SIZE
  values. The collision is also disabling us from using a regex on top
  of this output to detect the snapshot.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859989/+subscriptions

