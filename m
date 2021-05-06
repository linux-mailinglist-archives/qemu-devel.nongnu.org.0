Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3675F375870
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:28:33 +0200 (CEST)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legrY-000198-AH
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1legkQ-00044b-TC
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:21:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:50374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1legkI-000272-GD
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:21:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1legkF-0007tB-1x
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 16:20:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5114C2E81B8
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 16:20:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 16:14:17 -0000
From: Thomas Huth <1881645@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adrianopinaffo th-huth
X-Launchpad-Bug-Reporter: Adriano Pinaffo (adrianopinaffo)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159103911759.13896.350911340978783530.malonedeb@soybean.canonical.com>
Message-Id: <162031765788.6373.10915105835670524806.malone@wampee.canonical.com>
Subject: [Bug 1881645] Re: qemu-system-x86_64 --help (or --version) gives no
 output
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: e4d157e9646b6bbe728f8778132ee16bb0cf1b6d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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

Can you reproduce this problem with the latest upstream version of QEMU,
too (currently v6.0)? Otherwise it might be a bug in the version from
your distribution, in that case please report it in the bug tracker of
your distro instead.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1881645

Title:
  qemu-system-x86_64 --help (or --version) gives no output

Status in QEMU:
  Incomplete

Bug description:
  I have Arch Linux with qemu 5.0.0-6 (seen with pacman). Running VMs work =
just fine, but when I run qemu-system-x86_64 --version or qemu-system-x86_6=
4 --help, there is no feedback on the screen. This behavior messes up other=
 applications (GNS3 in my case that cannot recognize qemu as correctly inst=
alled because there is no feedback.)
  My kernel is 5.6.11.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1881645/+subscriptions

