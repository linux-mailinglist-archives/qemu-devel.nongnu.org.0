Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE5F1EAF90
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 21:26:49 +0200 (CEST)
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfq5A-0005Im-EF
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 15:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jfq47-0004ir-BI
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 15:25:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:58168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jfq42-00015M-3A
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 15:25:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jfq40-0007QA-2X
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 19:25:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EDD172E810A
 for <qemu-devel@nongnu.org>; Mon,  1 Jun 2020 19:25:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2020 19:18:37 -0000
From: Adriano Pinaffo <1881645@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adrianopinaffo
X-Launchpad-Bug-Reporter: Adriano Pinaffo (adrianopinaffo)
X-Launchpad-Bug-Modifier: Adriano Pinaffo (adrianopinaffo)
Message-Id: <159103911759.13896.350911340978783530.malonedeb@soybean.canonical.com>
Subject: [Bug 1881645] [NEW] qemu-system-x86_64 --help (or --version) gives no
 output
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="275d46a24253e557e4403d52832837e4bfa425b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 51e2f4ed15c9e36e984abdf023a2cb8bca24d334
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 13:41:01
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
Reply-To: Bug 1881645 <1881645@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I have Arch Linux with qemu 5.0.0-6 (seen with pacman). Running VMs work ju=
st fine, but when I run qemu-system-x86_64 --version or qemu-system-x86_64 =
--help, there is no feedback on the screen. This behavior messes up other a=
pplications (GNS3 in my case that cannot recognize qemu as correctly instal=
led because there is no feedback.
My kernel is 5.6.11.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1881645

Title:
  qemu-system-x86_64 --help (or --version) gives no output

Status in QEMU:
  New

Bug description:
  I have Arch Linux with qemu 5.0.0-6 (seen with pacman). Running VMs work =
just fine, but when I run qemu-system-x86_64 --version or qemu-system-x86_6=
4 --help, there is no feedback on the screen. This behavior messes up other=
 applications (GNS3 in my case that cannot recognize qemu as correctly inst=
alled because there is no feedback.
  My kernel is 5.6.11.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1881645/+subscriptions

