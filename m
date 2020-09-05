Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61CC25E6DE
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 11:57:13 +0200 (CEST)
Received: from localhost ([::1]:53106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEUwa-0001Ta-OL
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 05:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kEUvO-0000DI-7O
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 05:55:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:59074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kEUvM-00007W-GC
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 05:55:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kEUvL-0002LG-0P
 for <qemu-devel@nongnu.org>; Sat, 05 Sep 2020 09:55:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EE8292E80EA
 for <qemu-devel@nongnu.org>; Sat,  5 Sep 2020 09:55:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2020 09:49:19 -0000
From: Thomas Huth <1717414@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: iiordanov th-huth
X-Launchpad-Bug-Reporter: Iordan Iordanov (iiordanov)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <150544685826.29673.14944456813287969209.malonedeb@chaenomeles.canonical.com>
Message-Id: <159929935944.19700.15934794035277589088.malone@gac.canonical.com>
Subject: [Bug 1717414] Re: Sending certain keysyms results in wrong symbol
 input
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="90a5703803d95539bdb5c0b289b1675630569e1e"; Instance="production"
X-Launchpad-Hash: 49a19f90c2d9a9f3449e65f90ca642122d3216c6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/05 03:50:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1717414 <1717414@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There have been quite a bunch of improvements in the keysyms handling
during the past years ... can you still reproduce your issue with the
latest version of QEMU?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1717414

Title:
  Sending certain keysyms results in wrong symbol input

Status in QEMU:
  Incomplete

Bug description:
  I develop bVNC, an Android VNC client. I noticed that when I connect
  to qemu VMs that have a VNC console, Keysyms that are usually sent
  over with SHIFT modifier when connecting from a PC have wrong symbols
  typed within the VM. A very short list of examples:

  exclam                              33     0x0021

  results in "1" typed in the VM.

  at                                  64     0x0040

  results in "2"

  plus                                43     0x002b

  results in "=3D"

  asterisk                            42     0x002a

  results in "8"

  On Android, KEYCODEs that correspond to the above keysyms do not come
  with SHIFT metastate. Therefore, the keysyms that they correspond to
  are not sent over with any modifiers and must just work.

  The issue was reproduced with bVNC and RealVNC viewers connecting to
  many versions of qemu (Ubuntu 14.04, oVirt 3.4, oVirt 4.1, etc.). The
  qemu version that comes with oVirt 4.1 is 2.6.0, commit hash
  bfc766d38e1fae5767d43845c15c79ac8fa6d6af.

  Sincerely,
  iordan

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1717414/+subscriptions

