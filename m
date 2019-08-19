Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9FD922BE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 13:51:28 +0200 (CEST)
Received: from localhost ([::1]:48318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzgC7-00046U-8P
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 07:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33042)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hzgBJ-0003gE-Jx
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hzgBI-0000wc-Ck
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:50:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:32882)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hzgBI-0000w7-7g
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:50:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hzgBG-0003RS-N5
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 11:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9DAAB2E80CB
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 11:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Aug 2019 11:44:37 -0000
From: dcb <1840648@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dcb314
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: dcb (dcb314)
Message-Id: <156621507803.27191.12691707359014650062.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 923dc32e5bd87fa45f29577331eaa69fd327493e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1840648] [NEW]
 qemu-4.1.0/roms/edk2/MdeModulePkg/Universal/Disk/UdfDxe/FileName.c:161:
 logical fault ?
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
Reply-To: Bug 1840648 <1840648@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

qemu-4.1.0/roms/edk2/MdeModulePkg/Universal/Disk/UdfDxe/FileName.c:161:71:
warning: Logical disjunction always evaluates to true: EXPR !=3D '\\' ||
EXPR !=3D '\0'. [incorrectLogicOperator]

Source code is

       if ((*(FileName - 1) !=3D L'\\') && ((*(FileName + 2) !=3D L'\\') ||
                                           (*(FileName + 2) !=3D L'\0'))) {

Maybe better code:

       if ((*(FileName - 1) !=3D L'\\') && ((*(FileName + 2) !=3D L'\\') &&
                                           (*(FileName + 2) !=3D L'\0'))) {

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840648

Title:
  qemu-4.1.0/roms/edk2/MdeModulePkg/Universal/Disk/UdfDxe/FileName.c:161:
  logical fault ?

Status in QEMU:
  New

Bug description:
  qemu-4.1.0/roms/edk2/MdeModulePkg/Universal/Disk/UdfDxe/FileName.c:161:71:
  warning: Logical disjunction always evaluates to true: EXPR !=3D '\\' ||
  EXPR !=3D '\0'. [incorrectLogicOperator]

  Source code is

         if ((*(FileName - 1) !=3D L'\\') && ((*(FileName + 2) !=3D L'\\') =
||
                                             (*(FileName + 2) !=3D L'\0')))=
 {

  Maybe better code:

         if ((*(FileName - 1) !=3D L'\\') && ((*(FileName + 2) !=3D L'\\') =
&&
                                             (*(FileName + 2) !=3D L'\0')))=
 {

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840648/+subscriptions

