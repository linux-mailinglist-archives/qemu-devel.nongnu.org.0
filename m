Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FDC1A3AB2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 21:42:09 +0200 (CEST)
Received: from localhost ([::1]:54658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMd3u-0004Lr-QP
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 15:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jMd2s-0003Rg-Ao
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 15:41:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jMd2r-0007yX-6o
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 15:41:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:49708)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jMd2r-0007y5-1I
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 15:41:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jMd2p-0004ho-Ag
 for <qemu-devel@nongnu.org>; Thu, 09 Apr 2020 19:40:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4FC7C2E8108
 for <qemu-devel@nongnu.org>; Thu,  9 Apr 2020 19:40:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2020 19:31:46 -0000
From: James Le Cuirot <chewi@aura-online.co.uk>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: configure pie windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee chewi
X-Launchpad-Bug-Reporter: James Le Cuirot (chewi)
X-Launchpad-Bug-Modifier: James Le Cuirot (chewi)
References: <158642182265.5805.199845175533907355.malonedeb@chaenomeles.canonical.com>
Message-Id: <158646070681.17525.2482888752787767694.malone@wampee.canonical.com>
Subject: [Bug 1871798] Re: Fails to start on Windows host without explicit
 --disable-pie
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 60429735bfec678db7f378e27ed0bec0878aff52
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
Reply-To: Bug 1871798 <1871798@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I didn't know whether PIE is generally supported on Windows or not. It
was possible that Gentoo is just inadvertently disabling support for it.
It did stem from a bug report though and reading around, others
elsewhere have reported that PIE on Windows doesn't work.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1871798

Title:
  Fails to start on Windows host without explicit --disable-pie

Status in QEMU:
  Incomplete

Bug description:
  Since commit d2cd29e30736afd4a1e8cac3cf4da360bbc65978, which removed
  the x86 conditional around PIE, QEMU completely fails to start on a
  Windows host unless --disable-pie is explicitly given at build time.
  Even just requesting the help text doesn't work. To make testing
  easier, this can be replicated with Wine.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1871798/+subscriptions

