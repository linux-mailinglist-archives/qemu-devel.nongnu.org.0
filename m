Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ADF1DB055
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 12:37:18 +0200 (CEST)
Received: from localhost ([::1]:47710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbM6A-0001X9-1P
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 06:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jbM4Y-0008CB-Jt
 for qemu-devel@nongnu.org; Wed, 20 May 2020 06:35:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:59778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jbM4X-00024R-G8
 for qemu-devel@nongnu.org; Wed, 20 May 2020 06:35:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jbM4V-0006FP-OH
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 10:35:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9749B2E806E
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 10:35:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2020 10:25:59 -0000
From: Daniel Berrange <1879672@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <158996968484.21371.12685815665992748631.malonedeb@wampee.canonical.com>
Message-Id: <158997035992.22320.3521032791619939364.malone@gac.canonical.com>
Subject: [Bug 1879672] Re: QEMU installer with WHPX support
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0385b538081bc4718df6fb844a3afc89729c94ce";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 04d52d32e44a75af86e1a4bbb514b32cedacee31
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 06:20:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1879672 <1879672@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Has anyone raised an RFE with the mingw64 project to provide these
headers / APIs ? That's what provides the interfaces we usually rely on
for Windows builds, and they're likely familiar with what they can &
can't do from a legal POV. I don't see this as something QEMU needs to
solve itself.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879672

Title:
  QEMU installer with WHPX support

Status in QEMU:
  New

Bug description:
  People often ask the community to add WHPX support to the QEMU installer =
for Windows,
  but it is impossible due to the license limitations of the WHPX SDK.

  The WinHvEmulation.h and WinHvPlatform.h header files needed are "All
  rights reserved".

  However these headers only contain struct definitions and integer constan=
ts,
  no functional code in macros or inline functions. See:
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg645815.html
  It is questionable whether the headers alone can be considered copyrighta=
ble material.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1879672/+subscriptions

