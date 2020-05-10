Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900C1CC9F7
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 11:56:50 +0200 (CEST)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXihV-0007BG-3m
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 05:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXigZ-0006kp-8b
 for qemu-devel@nongnu.org; Sun, 10 May 2020 05:55:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:40754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXigX-0005Ml-LT
 for qemu-devel@nongnu.org; Sun, 10 May 2020 05:55:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jXigV-0001lF-Tl
 for <qemu-devel@nongnu.org>; Sun, 10 May 2020 09:55:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BE7332E8106
 for <qemu-devel@nongnu.org>; Sun, 10 May 2020 09:55:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2020 09:50:15 -0000
From: Michael Tokarev <1868221@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: gui usability
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange fbriere lockywolf mjt+launchpad-tls
X-Launchpad-Bug-Reporter: Lockywolf (lockywolf)
X-Launchpad-Bug-Modifier: Michael Tokarev (mjt+launchpad-tls)
References: <158469084688.19486.16271224237247905413.malonedeb@chaenomeles.canonical.com>
Message-Id: <158910421564.5426.7448941640507106518.malone@chaenomeles.canonical.com>
Subject: [Bug 1868221] Re: /usr/share/applications/qemu.desktop should have an
 "Exec=" key.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8532a13b18df076a22970c807a9635b5e56baf32
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 04:45:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1868221 <1868221@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

What's the actual problem we're trying to solve here? What needs to be
tested?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1868221

Title:
  /usr/share/applications/qemu.desktop should have an "Exec=3D" key.

Status in QEMU:
  New

Bug description:
  According to the www.freedesktop.org .desktop-file specification, all
  "Application" desktop files should have an "Exec=3D" key. The one in
  qemu doesn't.

  This can be easily verified by running kbuildsycoca4 if KDE4 is
  present, but the issue is not DE-dependent.

  Which binary exactly should be assigned as the default one, I don't
  know.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1868221/+subscriptions

