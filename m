Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAC1371455
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:34:37 +0200 (CEST)
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWqS-0007gs-L8
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldWln-0003Xc-IY
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:29:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldWli-0005nC-U5
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:29:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldWlh-0003tm-5c
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:29:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 297C42E8157
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 11:29:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 11:19:42 -0000
From: Thomas Huth <944628@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: phantall th-huth
X-Launchpad-Bug-Reporter: Brian Vandenberg (phantall)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20120302082252.15034.14041.malonedeb@gac.canonical.com>
Message-Id: <162004078308.12215.16888350162816982184.malone@soybean.canonical.com>
Subject: [Bug 944628] Re: Documentation for mtdblock, option-rom,
 and pflash is non-existent
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: c6f67bbd61723e30970670e7647893945c37a996
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 944628 <944628@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/89


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #89
   https://gitlab.com/qemu-project/qemu/-/issues/89

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/944628

Title:
  Documentation for mtdblock, option-rom, and pflash is non-existent

Status in QEMU:
  Expired

Bug description:
  The options -mtdblock, -option-rom, and -pflash are severely under-
  documented.  For example:

  -mtdblock  -- It isn't at all clear what this does from --help or the
  documentation, and it's especially not clear that it's only
  implemented for ARM right now

  -option-rom is only implemented for a handful of architectures,
  including palm, pc, pci, and one or two others

  -pflash looks to be implemented for most if not all architectures, but
  there's nothing informing the user that it replaces the bios if -bios
  isn't used in tandem with -pflash, and it isn't clear whether the user
  could add multiple pflash roms

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/944628/+subscriptions

