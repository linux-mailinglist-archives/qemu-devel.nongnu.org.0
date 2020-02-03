Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA72C1509AF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 16:21:37 +0100 (CET)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iydXd-0005Mt-1h
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 10:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iydWg-00041z-5j
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 10:20:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iydWf-0003SK-4p
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 10:20:38 -0500
Received: from indium.canonical.com ([91.189.90.7]:57692)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iydWe-0003Od-VL
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 10:20:37 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iydWe-00046P-4x
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 15:20:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 209CF2E80AD
 for <qemu-devel@nongnu.org>; Mon,  3 Feb 2020 15:20:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Feb 2020 15:14:34 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1861692@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: audio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
Message-Id: <158074287462.9078.13948577712209976443.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1861692] [NEW] wavcapture does not record silence
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 3bc9aa5da1e8d6334af66ec9db6a8967d95bc0ec
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1861692 <1861692@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Using setup described in https://bugs.launchpad.net/qemu/+bug/1861677 a
wav file is generated with all the silences stripped out. IOW silence
frames are not recorded.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: audio

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861692

Title:
  wavcapture does not record silence

Status in QEMU:
  New

Bug description:
  Using setup described in https://bugs.launchpad.net/qemu/+bug/1861677
  a wav file is generated with all the silences stripped out. IOW
  silence frames are not recorded.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861692/+subscriptions

