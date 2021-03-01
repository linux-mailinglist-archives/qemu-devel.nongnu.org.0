Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE126327EE8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:07:04 +0100 (CET)
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGiGN-0006zI-FF
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGiF2-0006Hb-W8
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:05:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:42672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGiF0-00056j-TG
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:05:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lGiEy-0001jx-OZ
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 13:05:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 87C342E8141
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 13:05:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Mar 2021 13:00:00 -0000
From: John Arbuckle <1917161@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: programmingkidx th-huth
X-Launchpad-Bug-Reporter: John Arbuckle (programmingkidx)
X-Launchpad-Bug-Modifier: John Arbuckle (programmingkidx)
References: <161444687583.24678.13238506356231835061.malonedeb@wampee.canonical.com>
Message-Id: <161460360106.24265.10597638710410959534.malone@wampee.canonical.com>
Subject: [Bug 1917161] Re: Parameter 'type' expects a netdev backend type
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cd61f0bfc5208dd4b58a15e953892eaabba1e0b8"; Instance="production"
X-Launchpad-Hash: 908c6529caf4c16f3fe0564a402d2a01803c5f64
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1917161 <1917161@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I did try './configure --target-list=3Di386-softmmu --enable-slirp' but it
failed with this error message:

Run-time dependency slirp found: NO (tried pkgconfig)

../meson.build:1498:4: ERROR: Dependency "slirp" not found, tried
pkgconfig

I thought slirp came with QEMU. I do see a slirp folder packaged with
QEMU.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917161

Title:
  Parameter 'type' expects a netdev backend type

Status in QEMU:
  Incomplete

Bug description:
  When using QEMU on an M1 Mac with Mac OS 11.1, I see this error
  message when trying to enable networking for a guest:

  Parameter 'type' expects a netdev backend type

  Example command:
  qemu-system-i386 -m 700 -hda <Windows XP HD file> -netdev user,id=3Dn0 -d=
evice rtl8139,netdev=3Dn0

  What should happen is networking should work when issuing the above
  command. What actually happens is QEMU exits immediately.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917161/+subscriptions

