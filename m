Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA283B7CBF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 06:28:47 +0200 (CEST)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyRqA-0002T6-HM
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 00:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lyRnO-0007Il-5n
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 00:25:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:36456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lyRnL-0002MQ-IL
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 00:25:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lyRnH-000348-K7
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 04:25:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 103CB2E81F3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 04:25:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Jun 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1793635@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: pflash u-boot
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor philmd prosupcn th-huth
X-Launchpad-Bug-Reporter: prosup (prosupcn)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153750467250.30674.744561051616772902.malonedeb@chaenomeles.canonical.com>
Message-Id: <162502664156.20936.2845979139130659528.malone@loganberry.canonical.com>
Subject: [Bug 1793635] Re: Using pflash with u-boot,
 when CONFIG_SYS_FLASH_USE_BUFFER_WRITE were defined,
 envirment args won't be able to save correctly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c11083652ba158ce73cebdfd79e69cf6f7d05a73"; Instance="production"
X-Launchpad-Hash: b448e6f7b4b87b9c44c99918758291bed495c6c9
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
Reply-To: Bug 1793635 <1793635@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1793635

Title:
  Using pflash with u-boot,when CONFIG_SYS_FLASH_USE_BUFFER_WRITE were
  defined,envirment args won't be able to save correctly

Status in QEMU:
  Expired

Bug description:
  Generated a u-boot image with qemu_arm_defconfig,did some modification to=
 qemu-arm.h.
  Before added "CONFIG_SYS_FLASH_USE_BUFFER_WRITE",call saveenv in u-boot c=
ommand line can save the envirment but painful slow.

  after added it,seems the action took no time,but the data won't be
  saved correctly,reset the board to boot again(i'd waited a while to
  reset the board) ,the u-boot will tell you enviremnt checksum
  mismatch,using the default.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1793635/+subscriptions

