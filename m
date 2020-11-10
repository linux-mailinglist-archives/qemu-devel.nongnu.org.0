Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765332AD826
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 14:57:52 +0100 (CET)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcU9f-0001pa-3Z
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 08:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcU7d-0000ku-Tw
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:55:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:41600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcU7W-0001t8-Mb
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:55:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcU7U-00041Z-2O
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 13:55:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B7CC42E8079
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 13:55:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 13:48:54 -0000
From: Daniel Berrange <1903712@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: beihaisuishe-239 berrange
X-Launchpad-Bug-Reporter: Trudy McClendon (beihaisuishe-239)
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <160501447454.28833.9213355837708100022.malonedeb@chaenomeles.canonical.com>
Message-Id: <160501613504.19188.9773311108259311191.malone@soybean.canonical.com>
Subject: [Bug 1903712] Re: when ../configure, cannot find Ninjia
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: c78eab078ac9193df9ffeee3ceed56bef314bf2a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1903712 <1903712@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Can you confirm whether you have installed the "ninja-build" package ?
It is a new build requirement for QEMU in 5.2.0

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1903712

Title:
  when ../configure, cannot find Ninjia

Status in QEMU:
  New

Bug description:
  On unbuntu18.04, after finishing

  wget https://download.qemu.org/qemu-5.2.0-rc0.tar.xz
  tar xvJf qemu-5.2.0-rc0.tar.xz
  cd qemu-5.2.0-rc0

  when I input

  mkdir build
  cd build
  ../configure

  Return Error:
  cannot find Ninjia

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1903712/+subscriptions

