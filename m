Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9502C2F8D9F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 17:16:51 +0100 (CET)
Received: from localhost ([::1]:57162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0oFu-0005Ho-Le
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 11:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0oEn-0004pk-5l
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 11:15:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:40920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0oEk-0001N0-BL
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 11:15:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0oEi-0006Ed-C4
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 16:15:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5069A2E8138
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 16:15:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 Jan 2021 16:08:21 -0000
From: =?utf-8?q?Andreas_K=2E_H=C3=BCttel?= <1891748@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=charms; sourcepackage=None; component=None;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dilfridge ech1965 mdevaev rth th-huth tsp84
X-Launchpad-Bug-Reporter: Ech (ech1965)
X-Launchpad-Bug-Modifier: =?utf-8?q?Andreas_K=2E_H=C3=BCttel_=28dilfridge?=
 =?utf-8?q?=29?=
References: <159749143652.14755.7473614939867617680.malonedeb@gac.canonical.com>
Message-Id: <161081330181.6623.17814467356936825737.malone@wampee.canonical.com>
Subject: [Bug 1891748] Re: qemu-arm-static 5.1 can't run gcc
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: a9555221d9bb8c8e21aced08d9f2375e9dd1ec31
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
Reply-To: Bug 1891748 <1891748@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm still seeing this with qemu 5.2.0

armv7a-softfp-linux-gnueabi-gcc -O2 -pipe -march=3Darmv7-a -mfpu=3Dvfpv3-d1=
6 -mfloat-abi=3Dsoftfp   -Wl,-O1 -Wl,--as-needed  glibc-test.c   -o glibc-t=
est
Allocating guest commpage: Operation not permitted

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1891748

Title:
  qemu-arm-static 5.1 can't run gcc

Status in QEMU:
  Fix Released
Status in Juju Charms Collection:
  New

Bug description:
  Issue discovered while trying to build pikvm (1)

  Long story short: when using qemu-arm-static 5.1, gcc exits whith
  message:

  Allocating guest commpage: Operation not permitted

  =

  when using qemu-arm-static v5.0, gcc "works"

  Steps to reproduce will follow

  (1)  https://github.com/pikvm/pikvm/blob/master/pages/building_os.md

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1891748/+subscriptions

