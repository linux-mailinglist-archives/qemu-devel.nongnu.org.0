Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2780F3678BD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:31:47 +0200 (CEST)
Received: from localhost ([::1]:59586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZR0E-0006EW-62
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQuX-0005w3-Rx
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:25:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:44204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQuS-0002PO-43
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:25:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZQuQ-0006ag-MD
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:25:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A51A22E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:25:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 04:15:40 -0000
From: Thomas Huth <1833661@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mips pflash
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cleber-gnu philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156110193683.18432.8339006487274258755.malonedeb@chaenomeles.canonical.com>
Message-Id: <161906494045.22276.11940321341979968067.malone@gac.canonical.com>
Subject: [Bug 1833661] Re: Linux kernel oops on Malta board while accessing
 pflash
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 35e6fc229007a6d20a770f4e5180f4aa934c6a1d
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
Reply-To: Bug 1833661 <1833661@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.


** Changed in: qemu
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1833661

Title:
  Linux kernel oops on Malta board while accessing pflash

Status in QEMU:
  Incomplete

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

