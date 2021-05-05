Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFA2374C29
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 02:02:46 +0200 (CEST)
Received: from localhost ([::1]:54812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRTY-0006Yp-Ns
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 20:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leRRv-00063X-Sm
 for qemu-devel@nongnu.org; Wed, 05 May 2021 20:01:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:36700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leRRs-0005nE-HU
 for qemu-devel@nongnu.org; Wed, 05 May 2021 20:01:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leRRq-0002cC-CW
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 00:00:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3F51B2E813A
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 00:00:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 23:54:30 -0000
From: Russell Morris <1921061@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-u3untu-h
X-Launchpad-Bug-Reporter: Russell Morris (6-u3untu-h)
X-Launchpad-Bug-Modifier: Russell Morris (6-u3untu-h)
References: <161654808841.23607.13822796780403513821.malonedeb@chaenomeles.canonical.com>
Message-Id: <162025887104.6829.16291903507440576488.malone@wampee.canonical.com>
Subject: [Bug 1921061] Re: Corsair iCUE Install Fails, qemu VM Reboots
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 241bbb168307737d58a7b5ca7e24e330aab309be
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
Reply-To: Bug 1921061 <1921061@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FYI, to provide an update - I found a workaround! It's related to the
CPU selection. I can't seem to pass through my host CPU, even with
v6.0.0 of qemu. Rather, I have to use the qemu64 CPU.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921061

Title:
  Corsair iCUE Install Fails, qemu VM Reboots

Status in QEMU:
  New

Bug description:
  Hi,

  I had this working before, but in the latest version of QEMU (built
  from master), when I try to install Corsair iCUE, and it gets to the
  driver install point =3D> my Windows 10 VM just reboots! I would be
  happy to capture logs, but ... what logs exist for an uncontrolled
  reboot? Thinking they are lost in the reboot :-(.

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921061/+subscriptions

