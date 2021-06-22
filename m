Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841C03AFC1C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:41:16 +0200 (CEST)
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYDr-0006T8-H0
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXze-00077s-90
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:34 -0400
Received: from indium.canonical.com ([91.189.90.7]:56520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzb-00053B-Dr
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzN-00015g-D3
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CA4062E81F1
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1840250@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: docker
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156587216258.26985.5763583236132855979.malonedeb@gac.canonical.com>
Message-Id: <162433543850.20423.14457436622293119675.malone@loganberry.canonical.com>
Subject: [Bug 1840250] Re: 'make -j1 docker-test-build' uses more than one job
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 90604ae8329909bb4937fce59bb3ad91f2a9c39c
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
Reply-To: Bug 1840250 <1840250@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840250

Title:
  'make -j1 docker-test-build' uses more than one job

Status in QEMU:
  Expired

Bug description:
  version: v4.1.0-rc5

  Run 'make -j1 docker-test-build', wait a few, various containers get
  instantiated.

  $ make -j1 docker-test-build 2>&1 > /dev/null

  On another terminal:

  $ docker ps
  CONTAINER ID        IMAGE                            COMMAND             =
     CREATED             STATUS
  62264a2d777a        qemu:debian-mips-cross           "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes
  80807c47d0df        qemu:debian-armel-cross          "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes
  06027b5dfd4a        qemu:debian-amd64                "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840250/+subscriptions

