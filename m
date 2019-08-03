Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49A9803F9
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Aug 2019 04:34:35 +0200 (CEST)
Received: from localhost ([::1]:38260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htjsQ-0003C5-Nx
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 22:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43584)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1htjp8-00022P-1L
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 22:31:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1htjox-0007hx-Sr
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 22:31:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:33130)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1htjop-0007Vn-HS
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 22:30:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1htjoe-0003PM-9e
 for <qemu-devel@nongnu.org>; Sat, 03 Aug 2019 02:30:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2D4942E8019
 for <qemu-devel@nongnu.org>; Sat,  3 Aug 2019 02:30:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Aug 2019 02:22:17 -0000
From: "Laszlo Ersek \(Red Hat\)" <lersek@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gschafer lersek philmd
X-Launchpad-Bug-Reporter: Toolybird (gschafer)
X-Launchpad-Bug-Modifier: Laszlo Ersek (Red Hat) (lersek)
References: <156469612119.27436.5161465617131751094.malonedeb@chaenomeles.canonical.com>
Message-Id: <156479893713.25516.8864112070930000648.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19014";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: f88006df8d44535a04813e2d1d8e2f59d037c778
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838703] Re: Makefile BUG in edk2 firmware
 install 4.1.0-rc3
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
Reply-To: Bug 1838703 <1838703@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The same issue was reported and patched on qemu-devel by Olaf Hering two
months ago. The patch received three Reviewed-by tags, but nobody
bothered to queue it.

[Qemu-devel] [PATCH v1] Makefile: remove DESTDIR from firmware file cont

The thread is split over two months, hence two links below, into the mailin=
g list archive:
https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg07093.html
https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg00690.html

Patchew link:
https://patchew.org/QEMU/20190530192812.17637-1-olaf@aepfle.de/

There shouldn't be a need to post a new patch, just for someone to pick
up what's been posted already.

Phil: "get_maintainer.pl" reports no official owners for the root
Makefile, but you come out on top as commit-signer (26/70). Can you pick
this one up, please? Thanks!

** Changed in: qemu
       Status: New =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838703

Title:
  Makefile BUG in edk2 firmware install 4.1.0-rc3

Status in QEMU:
  In Progress

Bug description:
  DESTDIR installs end up with wrong paths in JSON files installed to
  $prefix/share/qemu/firmware. For example, the file:

    50-edk2-x86_64-secure.json

  ends up incorrectly with:

    "filename": "/build/qemu/pkg/qemu/usr/share/qemu/edk2-x86_64-secure-
  code.fd",

  instead of the correct:

    "filename": "/usr/share/qemu/edk2-x86_64-secure-code.fd",

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838703/+subscriptions

