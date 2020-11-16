Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28A52B4491
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:18:08 +0100 (CET)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeOV-0003EN-5g
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keeHz-00054o-39
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:11:23 -0500
Received: from indium.canonical.com ([91.189.90.7]:44532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keeHt-0003B1-TS
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:11:22 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1keeHr-0005Oa-DR
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 13:11:15 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 639582E812F
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 13:11:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2020 13:04:10 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1793635@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=philmd@redhat.com; 
X-Launchpad-Bug-Tags: pflash u-boot
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: prosupcn th-huth
X-Launchpad-Bug-Reporter: prosup (prosupcn)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <153750467250.30674.744561051616772902.malonedeb@chaenomeles.canonical.com>
Message-Id: <160553185101.32050.13184313346372717841.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1793635] Re: Using pflash with u-boot,
 when CONFIG_SYS_FLASH_USE_BUFFER_WRITE were defined,
 envirment args won't be able to save correctly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: c1d6106a673f6e19978c7c682d4eb637abba93df
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:16:03
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1793635 <1793635@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
     Assignee: (unassigned) =3D> Philippe Mathieu-Daud=C3=A9 (philmd)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1793635

Title:
  Using pflash with u-boot,when CONFIG_SYS_FLASH_USE_BUFFER_WRITE were
  defined,envirment args won't be able to save correctly

Status in QEMU:
  Incomplete

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

