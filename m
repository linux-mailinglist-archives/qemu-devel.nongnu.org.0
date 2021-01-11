Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CA32F0BCA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 05:27:13 +0100 (CET)
Received: from localhost ([::1]:60364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyonP-0005uY-ON
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 23:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kyom8-0004xb-Mh
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:25:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:39840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kyom6-0003Kr-Up
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:25:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kyom4-00078P-CZ
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:25:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 469EA2E8145
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:25:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 Jan 2021 04:17:15 -0000
From: Launchpad Bug Tracker <1903712@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: beihaisuishe-239 berrange janitor
X-Launchpad-Bug-Reporter: Trudy McClendon (beihaisuishe-239)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160501447454.28833.9213355837708100022.malonedeb@chaenomeles.canonical.com>
Message-Id: <161033863540.29318.17984423123378121164.malone@loganberry.canonical.com>
Subject: [Bug 1903712] Re: when ../configure, cannot find Ninjia
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: a5fe9514bab85acf2579dbba39b5c58372dcc6d7
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
Reply-To: Bug 1903712 <1903712@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1903712

Title:
  when ../configure, cannot find Ninjia

Status in QEMU:
  Expired

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

