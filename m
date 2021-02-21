Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F832320C0C
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 18:19:29 +0100 (CET)
Received: from localhost ([::1]:59378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDsOF-0001Mu-Cb
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 12:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lDsKg-0007oS-4J
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:15:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:55122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lDsKb-00083M-Av
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:15:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lDsKY-0004Wp-Mj
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 17:15:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A94522E8024
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 17:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Feb 2021 17:05:52 -0000
From: Frederic Bezies <1916394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fredb74
X-Launchpad-Bug-Reporter: Frederic Bezies (fredb74)
X-Launchpad-Bug-Modifier: Frederic Bezies (fredb74)
Message-Id: <161392715224.29500.2044106040123688461.malonedeb@soybean.canonical.com>
Subject: [Bug 1916394] [NEW] [git] Cannot build qemu: FAILED:
 target/hexagon/semantics_generated.pyinc 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bbfee60eef9f7fd8d30b24b3f53e75656e4d5fb0"; Instance="production"
X-Launchpad-Hash: 041aba05abd317fbb481912eb2c19092fdfaab92
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
Reply-To: Bug 1916394 <1916394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello.

I'm using Archlinux and I maintain qemu-git AUR package.

I tried to build Qemu at commit 4115aec9af2a3de5fa89a0b1daa12debcd7741ff
but it stops with this error message:

Found ninja-1.10.2 at /usr/bin/ninja
[632/9068] Generating semantics_generated.pyinc with a custom command
FAILED: target/hexagon/semantics_generated.pyinc
@INPUT@ target/hexagon/semantics_generated.pyinc
/bin/sh: line 1: @INPUT@: command not found
[637/9068] Compiling C object fsdev/vi...proxy-helper.p/virtfs-proxy-helper=
.c.o
ninja: build stopped: subcommand failed.

ninja version: 1.10.2
meson version: 0.57.1

Downgrading meson doesn't change anything.

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

  Hello.
  =

  I tried to build Qemu at commit 4115aec9af2a3de5fa89a0b1daa12debcd7741ff
  but it stops with this error message:
  =

- [code]
+ <code>
  Found ninja-1.10.2 at /usr/bin/ninja
  [632/9068] Generating semantics_generated.pyinc with a custom command
- FAILED: target/hexagon/semantics_generated.pyinc =

+ FAILED: target/hexagon/semantics_generated.pyinc
  @INPUT@ target/hexagon/semantics_generated.pyinc
  /bin/sh: line 1: @INPUT@: command not found
  [637/9068] Compiling C object fsdev/vi...proxy-helper.p/virtfs-proxy-help=
er.c.o
  ninja: build stopped: subcommand failed.
- [/code]
+ </code>
  =

  ninja version: 1.10.2
  meson version: 0.57.1

** Description changed:

  Hello.
  =

  I tried to build Qemu at commit 4115aec9af2a3de5fa89a0b1daa12debcd7741ff
  but it stops with this error message:
  =

- <code>
+ ```
  Found ninja-1.10.2 at /usr/bin/ninja
  [632/9068] Generating semantics_generated.pyinc with a custom command
  FAILED: target/hexagon/semantics_generated.pyinc
  @INPUT@ target/hexagon/semantics_generated.pyinc
  /bin/sh: line 1: @INPUT@: command not found
  [637/9068] Compiling C object fsdev/vi...proxy-helper.p/virtfs-proxy-help=
er.c.o
  ninja: build stopped: subcommand failed.
- </code>
+ ```
  =

  ninja version: 1.10.2
  meson version: 0.57.1

** Description changed:

  Hello.
  =

  I tried to build Qemu at commit 4115aec9af2a3de5fa89a0b1daa12debcd7741ff
  but it stops with this error message:
  =

- ```
+ `
  Found ninja-1.10.2 at /usr/bin/ninja
  [632/9068] Generating semantics_generated.pyinc with a custom command
  FAILED: target/hexagon/semantics_generated.pyinc
  @INPUT@ target/hexagon/semantics_generated.pyinc
  /bin/sh: line 1: @INPUT@: command not found
  [637/9068] Compiling C object fsdev/vi...proxy-helper.p/virtfs-proxy-help=
er.c.o
  ninja: build stopped: subcommand failed.
- ```
+ `
  =

  ninja version: 1.10.2
  meson version: 0.57.1

** Description changed:

  Hello.
  =

  I tried to build Qemu at commit 4115aec9af2a3de5fa89a0b1daa12debcd7741ff
  but it stops with this error message:
  =

- `
+ =

  Found ninja-1.10.2 at /usr/bin/ninja
  [632/9068] Generating semantics_generated.pyinc with a custom command
  FAILED: target/hexagon/semantics_generated.pyinc
  @INPUT@ target/hexagon/semantics_generated.pyinc
  /bin/sh: line 1: @INPUT@: command not found
  [637/9068] Compiling C object fsdev/vi...proxy-helper.p/virtfs-proxy-help=
er.c.o
  ninja: build stopped: subcommand failed.
- `
  =

  ninja version: 1.10.2
  meson version: 0.57.1

** Description changed:

  Hello.
+ =

+ I'm using Archlinux and I maintain qemu-git AUR package.
  =

  I tried to build Qemu at commit 4115aec9af2a3de5fa89a0b1daa12debcd7741ff
  but it stops with this error message:
- =

  =

  Found ninja-1.10.2 at /usr/bin/ninja
  [632/9068] Generating semantics_generated.pyinc with a custom command
  FAILED: target/hexagon/semantics_generated.pyinc
  @INPUT@ target/hexagon/semantics_generated.pyinc
  /bin/sh: line 1: @INPUT@: command not found
  [637/9068] Compiling C object fsdev/vi...proxy-helper.p/virtfs-proxy-help=
er.c.o
  ninja: build stopped: subcommand failed.
  =

  ninja version: 1.10.2
  meson version: 0.57.1

** Description changed:

  Hello.
  =

  I'm using Archlinux and I maintain qemu-git AUR package.
  =

  I tried to build Qemu at commit 4115aec9af2a3de5fa89a0b1daa12debcd7741ff
  but it stops with this error message:
  =

  Found ninja-1.10.2 at /usr/bin/ninja
  [632/9068] Generating semantics_generated.pyinc with a custom command
  FAILED: target/hexagon/semantics_generated.pyinc
  @INPUT@ target/hexagon/semantics_generated.pyinc
  /bin/sh: line 1: @INPUT@: command not found
  [637/9068] Compiling C object fsdev/vi...proxy-helper.p/virtfs-proxy-help=
er.c.o
  ninja: build stopped: subcommand failed.
  =

  ninja version: 1.10.2
  meson version: 0.57.1
+ =

+ Downgrading meson doesn't change anything.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916394

Title:
  [git] Cannot build qemu: FAILED:
  target/hexagon/semantics_generated.pyinc

Status in QEMU:
  New

Bug description:
  Hello.

  I'm using Archlinux and I maintain qemu-git AUR package.

  I tried to build Qemu at commit
  4115aec9af2a3de5fa89a0b1daa12debcd7741ff but it stops with this error
  message:

  Found ninja-1.10.2 at /usr/bin/ninja
  [632/9068] Generating semantics_generated.pyinc with a custom command
  FAILED: target/hexagon/semantics_generated.pyinc
  @INPUT@ target/hexagon/semantics_generated.pyinc
  /bin/sh: line 1: @INPUT@: command not found
  [637/9068] Compiling C object fsdev/vi...proxy-helper.p/virtfs-proxy-help=
er.c.o
  ninja: build stopped: subcommand failed.

  ninja version: 1.10.2
  meson version: 0.57.1

  Downgrading meson doesn't change anything.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916394/+subscriptions

