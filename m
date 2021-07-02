Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3384D3B9B7C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:28:35 +0200 (CEST)
Received: from localhost ([::1]:58428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzAn4-0002Pp-7J
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkU-00087y-6G
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:25:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:42410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkQ-0002Mw-Dv
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:25:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzAkL-000531-QE
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:25:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 48D232E817A
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 04:25:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jul 2021 04:17:31 -0000
From: Launchpad Bug Tracker <1859723@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor nilsa th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Nils_ANDR=C3=89-CHANG_=28nilsa=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157903878062.27252.729025731260908080.malonedeb@chaenomeles.canonical.com>
Message-Id: <162519945154.31921.5145096178224282944.malone@loganberry.canonical.com>
Subject: [Bug 1859723] Re: Qemu ungrabs before cursor reaches border
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 2e4e4c82e6db46be7ec620c90ce413bf2669605e
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
Reply-To: Bug 1859723 <1859723@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859723

Title:
  Qemu ungrabs before cursor reaches border

Status in QEMU:
  Expired

Bug description:
  This was first reported
  https://bugzilla.redhat.com/show_bug.cgi?id=3D1285378

  video: https://peertube.co.uk/videos/watch/fedaa432-79ef-4d30-bd0e-
  26c806e48db0

  version: QEMU emulator version 4.2.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859723/+subscriptions

