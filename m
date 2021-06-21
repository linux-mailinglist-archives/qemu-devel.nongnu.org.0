Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0693AE26A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:30:17 +0200 (CEST)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBZg-0006sb-B9
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBVc-0006wq-Vz
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:26:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:37378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBVb-0007Kp-5F
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:26:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvBVW-0002Aw-SS
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:25:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 098AA2E8210
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Jun 2021 04:17:43 -0000
From: Launchpad Bug Tracker <1719689@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: erichspaker janitor th-huth
X-Launchpad-Bug-Reporter: Erich Spaker (erichspaker)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150644549574.30872.12487281678930398558.malonedeb@wampee.canonical.com>
Message-Id: <162424906360.11837.18236662983199168308.malone@loganberry.canonical.com>
Subject: [Bug 1719689] Re: [feature request] add flag to treat warnings as
 errors
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: c7477163f7e06da2996f42e139366fc339073de0
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
Reply-To: Bug 1719689 <1719689@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1719689

Title:
  [feature request] add flag to treat warnings as errors

Status in QEMU:
  Expired

Bug description:
  Since booting could potentially take a lot of time and warnings are
  likely to indicate that something is wrong, it would be useful to have
  a command line flag which would abort the boot if there are any
  warnings.

  An example might be network configuration. The following output most
  likely indicates that there is something the user has to fix before
  starting and being able to use the guest os.

  Warning: hub port hub0port0 has no peer
  Warning: vlan 0 with no nics
  Warning: netdev hub0port0 has no peer
  Warning: requested NIC (anonymous, model vitrio-net-device) was not creat=
ed (not supported by this machine?)

  Ideally, there would be an option the user could pass which would
  cause qemu to print these warnings then exit, rather than boot the
  kernel.

  Alternatively, or additionally, a dry run option would be helpful for
  the same purpose: making sure qemu get to the booting the kernel stage
  with everything in working order so that you do not have to wait for
  the kernel to boot and then shut down while debugging things like
  networking (things which can be debugged (at least partially) without
  booting, or trying to boot, the guest os).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1719689/+subscriptions

