Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B1636E8F9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:42:07 +0200 (CEST)
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc47S-00041B-6n
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc46Y-0003bl-Vm
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:41:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:35988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc46W-0001bT-Is
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:41:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc46U-00060B-Sh
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:41:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D49E32E8144
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:41:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 10:31:29 -0000
From: Thomas Huth <1863678@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: compilation misc.c
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: coltoiu-matei th-huth
X-Launchpad-Bug-Reporter: matthew (coltoiu-matei)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158197631227.29007.17964725834927610095.malonedeb@chaenomeles.canonical.com>
Message-Id: <161969228953.9706.16015233762625753307.malone@gac.canonical.com>
Subject: [Bug 1863678] Re: qemu and virtio-vga black screen in Android
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 5d7ea9d2c6ca918db654ab2c8310d8481326e295
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
Reply-To: Bug 1863678 <1863678@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

slirp is a separate project now ... if the problem persists, could you
please report this in the
https://gitlab.freedesktop.org/slirp/libslirp/-/issues bug tracker?
Thanks!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863678

Title:
  qemu and virtio-vga black screen in Android

Status in QEMU:
  New

Bug description:
  QEMU emulator version 4.2.50

  kernel 5.3.0-29-generic
  host Ubuntu 19.10
  guest: Android 8.1

  While trying to compile I get the following error

  qemu/slirp/src/misc.c:146: undefined reference to
  `g_spawn_async_with_fds'

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863678/+subscriptions

