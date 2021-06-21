Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAF33AE263
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:28:05 +0200 (CEST)
Received: from localhost ([::1]:59984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBXY-0001HJ-74
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBVb-0006uI-Qj
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:26:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:37254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBVa-0007JZ-3R
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:26:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvBVU-0002C7-NM
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:25:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 78CC82E81F3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Jun 2021 04:17:45 -0000
From: Launchpad Bug Tracker <1731277@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: davidhildenbrand janitor pmaydell th-huth
X-Launchpad-Bug-Reporter: David Hildenbrand (davidhildenbrand)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151023792928.3447.3728561425384648409.malonedeb@gac.canonical.com>
Message-Id: <162424906578.11837.11285476701920881321.malone@loganberry.canonical.com>
Subject: [Bug 1731277] Re: Provide target specific qemu man pages
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 7179ff1ac15fc4e5ad33ca60146aefbef731d442
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1731277 <1731277@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1731277

Title:
  Provide target specific qemu man pages

Status in QEMU:
  Expired

Bug description:
  Right now, all qemu target binaries (qemu-system-...) share the same
  man page.

  The current man page is primarily focused on x86, and therefore the
  information given is entirely wrong for e.g. arm, powerpc or s390x.

  NAME
         qemu-doc - QEMU Emulator User Documentation

  SYNOPSIS
         qemu-system-i386 [options] [disk_image]

  DESCRIPTION
         The QEMU PC System emulator simulates the following peripherals:

         -   i440FX host PCI bridge and PIIX3 PCI to ISA bridge

         -   Cirrus CLGD 5446 PCI VGA card or dummy VGA card with Bochs VES=
A extensions (hardware level, including all non
             standard modes).

         -   PS/2 mouse and keyboard

         -   2 PCI IDE interfaces with hard disk and CD-ROM support

         -   Floppy disk

  ...

  We should have target specific man pages, with the common
  options/settings factored out, so they are included in all target
  specific man pages.

  "man qemu-system-s390x" should give s390x specific (+common)
  information and "man qemu-system-x86_64" should contain x86 specific
  (+common) information.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1731277/+subscriptions

