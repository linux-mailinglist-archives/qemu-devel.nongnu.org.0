Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B735D212194
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 12:52:17 +0200 (CEST)
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqwpE-0003JL-Qb
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 06:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jqwnm-0001fc-I6
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 06:50:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:39226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jqwnk-0000mt-Ef
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 06:50:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jqwni-00034G-Cg
 for <qemu-devel@nongnu.org>; Thu, 02 Jul 2020 10:50:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 49A1C2E810A
 for <qemu-devel@nongnu.org>; Thu,  2 Jul 2020 10:50:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2020 10:42:06 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1833661@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mips pflash
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cleber-gnu philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <156110193683.18432.8339006487274258755.malonedeb@chaenomeles.canonical.com>
Message-Id: <159368652733.1630.14845389977553399994.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1833661] Re: Linux kernel oops on Malta board while accessing
 pflash
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8905cb290063b34aeb7e7af49c6fc028a55522ba
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1833661 <1833661@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
     Assignee: Philippe Mathieu-Daud=C3=A9 (philmd) =3D> (unassigned)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1833661

Title:
  Linux kernel oops on Malta board while accessing pflash

Status in QEMU:
  Confirmed

Bug description:
  commit 33d609990621dea6c7d056c86f707b8811320ac1

  While running tests/acceptance/linux_ssh_mips_malta.py, the big-endian
  tests fail:

    physmap-flash.0: Found 1 x32 devices at 0x0 in 32-bit bank. Manufacture=
r ID 0x000000 Chip ID 0x000000
    Intel/Sharp Extended Query Table at 0x0031
    Using buffer write method
    Searching for RedBoot partition table in physmap-flash.0 at offset 0x10=
03f0000
    Creating 3 MTD partitions on "physmap-flash.0":
    0x000000000000-0x000000100000 : "YAMON"
    0x000000100000-0x0000003e0000 : "User FS"
    0x0000003e0000-0x000000400000 : "Board Config"
    CPU 0 Unable to handle kernel paging request at virtual address 00000014

  The 64-bit test fails with:

    CPU 0 Unable to handle kernel paging request at virtual address
  0000000000000028

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1833661/+subscriptions

