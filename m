Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774C636F85F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:18:37 +0200 (CEST)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQEG-0004Mc-JB
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcQBi-0002ja-V5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:15:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:50108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcQBg-0007HL-0t
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:15:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcQBc-000352-Qb
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:15:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9EAC42E816C
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:15:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 10:06:14 -0000
From: Thomas Huth <1826175@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: avladu berrange chadkennedyonline fonthime
 pmaydell th-huth
X-Launchpad-Bug-Reporter: Gwendolyn Haller (fonthime)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155609955691.16667.3366200166619949036.malonedeb@soybean.canonical.com>
Message-Id: <161977717429.10956.13776967824920970447.malone@gac.canonical.com>
Subject: [Bug 1826175] Re: Compilation on MSYS2/MinGW-w64 fails with error:
 "No rule to make target capstone.lib"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 23c803520d0b7b12d3f37bdf28207b998eea5472
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
Reply-To: Bug 1826175 <1826175@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As far as I can see we're using a capstone version now that contains the
commit with the fix, so I'm closing this bug. If you are still having
problems, please open again or file a new bug ticket.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1826175

Title:
  Compilation on MSYS2/MinGW-w64 fails with error: "No rule to make
  target capstone.lib"

Status in QEMU:
  Fix Released

Bug description:
  I submitted this bug to Capstone directly but I figured it'd be useful
  to post it here too. The IS_MINGW check in the Makefile for Capstone
  fails under MSYS2 MinGW-w64 because cc --version doesn't have mingw in
  the output anymore:

  $ whereis cc
  cc: /mingw64/bin/cc.exe

  $ cc --version
  cc.exe (Rev2, Built by MSYS2 project) 8.3.0
  Copyright (C) 2018 Free Software Foundation, Inc.
  This is free software; see the source for copying conditions.  There is NO
  warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.

  Really simple patch:

  diff --git "a/Makefile" "b/Makefile"
  index 063f50db..1d9f042e 100644
  --- "a/Makefile"
  +++ "b/Makefile"
  @@ -288,7 +288,7 @@ CFLAGS :=3D $(CFLAGS:-fPIC=3D)
   # On Windows we need the shared library to be executable
   else
   # mingw?
  -IS_MINGW :=3D $(shell $(CC) --version | grep -i mingw | wc -l)
  +IS_MINGW :=3D $(shell $(CC) --version | grep -i msys2 | wc -l)
   ifeq ($(IS_MINGW),1)
   EXT =3D dll
   AR_EXT =3D lib

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1826175/+subscriptions

