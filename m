Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964611AD080
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 21:42:04 +0200 (CEST)
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPAOh-0002qg-Me
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 15:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jPANb-0001ZB-JV
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:40:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jPANa-0008MH-Gv
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:40:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:42814)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jPANa-0008Lp-Be
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:40:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jPANZ-0006H6-Ix
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 19:40:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8D7DA2E805B
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 19:40:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2020 19:32:39 -0000
From: ruthan <ruthan@email.cz>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ruthan
X-Launchpad-Bug-Reporter: ruthan (ruthan)
X-Launchpad-Bug-Modifier: ruthan (ruthan)
Message-Id: <158706555938.11904.16475777662338789012.malonedeb@soybean.canonical.com>
Subject: [Bug 1873337] [NEW] Arrow keys press is double in some programs in Dos
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 97645dade0aa5ba3adcecae987e6455beb1b1a85
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
Reply-To: Bug 1873337 <1873337@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,
im trying to use Qemu for Dos machines.

 But there is problem with some programs that arrow key press is double
in some problems. As advanced Filemanagers - Dos Navigator or File
Wizard, same Scandisk.

There is gif:
https://www.vogons.org/download/file.php?id=3D77141&mode=3Dview

 Its blocking to use such problem, unless you use Numlock key for it,
but im used 25+ years to arrow keys and its bug.. I guess that it would
mess with some games too.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873337

Title:
  Arrow keys press is double in some programs in Dos

Status in QEMU:
  New

Bug description:
  Hello,
  im trying to use Qemu for Dos machines.

   But there is problem with some programs that arrow key press is
  double in some problems. As advanced Filemanagers - Dos Navigator or
  File Wizard, same Scandisk.

  There is gif:
  https://www.vogons.org/download/file.php?id=3D77141&mode=3Dview

   Its blocking to use such problem, unless you use Numlock key for it,
  but im used 25+ years to arrow keys and its bug.. I guess that it
  would mess with some games too.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873337/+subscriptions

