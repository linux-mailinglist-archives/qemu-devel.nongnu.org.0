Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C066136A15
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 10:42:00 +0100 (CET)
Received: from localhost ([::1]:43154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipqnn-00071f-6E
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 04:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ipqmy-0006YC-D1
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:41:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ipqmx-00048O-1o
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:41:08 -0500
Received: from indium.canonical.com ([91.189.90.7]:37812)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ipqmw-000411-RY
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:41:06 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ipqmv-0001W4-46
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 09:41:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 12CC82E80C8
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 09:41:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jan 2020 09:30:58 -0000
From: Thomas Huth <1657841@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth therock247uk
X-Launchpad-Bug-Reporter: therock247uk (therock247uk)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170119170931.14633.66977.malonedeb@soybean.canonical.com>
Message-Id: <157864865808.5627.18436996078930916436.malone@gac.canonical.com>
Subject: [Bug 1657841] Re: QEMU Intel HAX Windows
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: b82b0bcb43c4587d5dedae80151f9975128b7819
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
Reply-To: Bug 1657841 <1657841@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Which version were you exactly using? Can you still reproduce the
problem with the latest version of QEMU?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1657841

Title:
  QEMU Intel HAX Windows

Status in QEMU:
  Incomplete

Bug description:
  Hi,

  Using the latest exe's from http://qemu.weilnetz.de/w32/

  C:\Users\therock247uk\Desktop\jan\qemu-w64-setup-20170113>qemu-system-i38=
6 --enable-hax -m 512 -cdrom C:\Users\therock247uk\Desktop\jan\en_windows_x=
p_professional_with_service_pack_3_x86_cd_x14-80428.iso
  HAX is working and emulator runs in fast virt mode.
  Failed to allocate 20000000 memory

  The emulator seems to hang/get stuck during booting from the CD taking
  out --enable-hax allows it to boot.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1657841/+subscriptions

