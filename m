Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D376A10CC81
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 17:11:16 +0100 (CET)
Received: from localhost ([::1]:50450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaMNu-0002QD-RY
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 11:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iaLN1-0004WO-4h
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 10:06:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iaLMt-0007p8-4x
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 10:06:08 -0500
Received: from indium.canonical.com ([91.189.90.7]:50468)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iaLMr-0007lY-09
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 10:06:06 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iaLMm-0002Fc-Mc
 for <qemu-devel@nongnu.org>; Thu, 28 Nov 2019 15:06:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A79E82E80CC
 for <qemu-devel@nongnu.org>; Thu, 28 Nov 2019 15:06:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 Nov 2019 14:52:09 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1852196@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided;
 assignee=lersek@redhat.com; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lersek philmd
X-Launchpad-Bug-Reporter: Laszlo Ersek (Red Hat) (lersek)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <157355353271.7205.5763587027166419396.malonedeb@gac.canonical.com>
Message-Id: <157495272942.21735.14449487928343967817.malone@soybean.canonical.com>
Subject: [Bug 1852196] Re: update edk2 submodule & binaries to
 edk2-stable201911
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9b83c5d440427b4c40facc85538251295e26a986
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
Reply-To: Bug 1852196 <1852196@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laszlo,

Do you have a particular reason to update the submodule *after* the v4.2.0 =
release?
I'd rather see QEMU 4.2 released with edk2-stable201911, as it fixes variou=
s CVE (therefore a patch for 4.2-rc4 seems acceptable to me).

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1852196

Title:
  update edk2 submodule & binaries to edk2-stable201911

Status in QEMU:
  New

Bug description:
  edk2-stable201911 will be tagged soon:

    https://github.com/tianocore/tianocore.github.io/wiki/EDK-II-
  Release-Planning

    https://github.com/tianocore/edk2/releases/tag/edk2-stable201911
    [upcoming link]

  It should be picked up by QEMU, after the v4.2.0 release.

  Relevant fixes / features in edk2, since edk2-stable201905 (which is
  what QEMU bundles at the moment, from LP#1831477):

  - enable UEFI HTTPS Boot in ArmVirtQemu* platforms
    https://bugzilla.tianocore.org/show_bug.cgi?id=3D1009
    (this is from edk2-stable201908)

  - fix CVE-2019-14553 (Invalid server certificate accepted in HTTPS Boot)
    https://bugzilla.tianocore.org/show_bug.cgi?id=3D960

  - consume OpenSSL-1.1.1d, for fixing CVE-2019-1543, CVE-2019-1552 and
    CVE-2019-1563
    https://bugzilla.tianocore.org/show_bug.cgi?id=3D2226

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1852196/+subscriptions

