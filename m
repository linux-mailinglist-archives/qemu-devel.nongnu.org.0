Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77B03AFC29
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:45:52 +0200 (CEST)
Received: from localhost ([::1]:50918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYIJ-0004O5-TP
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzd-000762-Q8
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:33 -0400
Received: from indium.canonical.com ([91.189.90.7]:56574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzb-00054D-VX
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzO-00014F-5B
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AA2672E81DB
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1840249@bugs.launchpad.net>
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
References: <156587194288.26490.13000707858275373489.malonedeb@gac.canonical.com>
Message-Id: <162433543731.20423.16557833195240438447.malone@loganberry.canonical.com>
Subject: [Bug 1840249] Re: Cancelling 'make docker-test-build' does not cancel
 running containers
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 2e55ba2d9c3b5b9c2e6213a8be14948cf951459d
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
Reply-To: Bug 1840249 <1840249@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840249

Title:
  Cancelling 'make docker-test-build' does not cancel running containers

Status in QEMU:
  Expired

Bug description:
  version: v4.1.0-rc5

  Run 'make -k docker-test-build', wait a few, cancel with ^C:

  $ make -k docker-test-build 2>&1 > /dev/null
  ^C

  $ docker ps
  CONTAINER ID        IMAGE                            COMMAND             =
     CREATED             STATUS
  62264a2d777a        qemu:debian-mips-cross           "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes
  80807c47d0df        qemu:debian-armel-cross          "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes
  06027b5dfd4a        qemu:debian-amd64                "/var/tmp/qemu/run t=
=E2=80=A6"   10 minutes ago      Up 10 minutes

  The docker containers are still up building QEMU.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840249/+subscriptions

