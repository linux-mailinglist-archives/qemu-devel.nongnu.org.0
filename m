Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96903BC5A2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:39:52 +0200 (CEST)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0csB-0001qO-BX
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfU-000079-5s
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:51646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfO-0003ET-3X
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cf9-0004wo-Jv
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:23 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 538A12E818C
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:46 -0000
From: Launchpad Bug Tracker <1881645@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adrianopinaffo janitor th-huth
X-Launchpad-Bug-Reporter: Adriano Pinaffo (adrianopinaffo)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159103911759.13896.350911340978783530.malonedeb@soybean.canonical.com>
Message-Id: <162554506647.7821.3535289736035838342.malone@loganberry.canonical.com>
Subject: [Bug 1881645] Re: qemu-system-x86_64 --help (or --version) gives no
 output
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: dfc6840cb798f0b1baaa7c5b747ed37534eda4b1
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
Reply-To: Bug 1881645 <1881645@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1881645

Title:
  qemu-system-x86_64 --help (or --version) gives no output

Status in QEMU:
  Expired

Bug description:
  I have Arch Linux with qemu 5.0.0-6 (seen with pacman). Running VMs work =
just fine, but when I run qemu-system-x86_64 --version or qemu-system-x86_6=
4 --help, there is no feedback on the screen. This behavior messes up other=
 applications (GNS3 in my case that cannot recognize qemu as correctly inst=
alled because there is no feedback.)
  My kernel is 5.6.11.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1881645/+subscriptions

