Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441112CA0C6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:06:04 +0100 (CET)
Received: from localhost ([::1]:57100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3Tv-0000sW-AW
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kk3FR-0007OH-Ci
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:51:05 -0500
Received: from indium.canonical.com ([91.189.90.7]:54526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kk3FO-0000ut-Tn
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:51:04 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kk3FM-0000Vz-Dj
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 10:51:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 66CFE2E8141
 for <qemu-devel@nongnu.org>; Tue,  1 Dec 2020 10:51:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Dec 2020 10:37:09 -0000
From: Thomas Huth <1804961@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: aarch64 acpi
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee driver1998.ub imammedo th-huth
X-Launchpad-Bug-Reporter: GH Cao (driver1998.ub)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154309137717.32238.5287661827417174062.malonedeb@wampee.canonical.com>
Message-Id: <160681902954.20995.15373222405083023861.malone@gac.canonical.com>
Subject: [Bug 1804961] Re: qemu-system-aarch64: Windows 10 ARM64 BSoD on boot
 while using virt-3.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="12d09381f8e8eee3115395875b132e165fa96574"; Instance="production"
X-Launchpad-Hash: c4f9a0a333e780df355edeca333f5c226117ecf3
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
Reply-To: Bug 1804961 <1804961@bugs.launchpad.net>
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
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1804961

Title:
  qemu-system-aarch64: Windows 10 ARM64 BSoD on boot while using
  virt-3.0

Status in QEMU:
  Incomplete

Bug description:
  When I emulate a virt-3.0 machine, Windows 10 BSoD on boot, with the
  error code being ACPI_BIOS_ERROR(0x000000A5), virt-2.12 boots fine.

  Windows Build: 10.0.17134.1
  QEMU version: 3.0.0
  Commandline: qemu-system-aarch64 -M virt -accel tcg,thread=3Dmulti -cpu c=
ortex-a57 -smp 2 -m 2048 -bios QEMU_EFI.fd -device ramfb -device nec-usb-xh=
ci -device usb-kbd -device usb-tablet -hda disk.vhd -vnc :0

  By the way, the patch to add DBG2 table discussed here
  https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg01719.html
  works (although minor change is required to adapt to the qemu 3.0.0
  code), the table is accepted by Windows (Windows require both DBG2 and
  SPCR to be valid for serial kernel debugging to work), so it may help
  further diagnosing this issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1804961/+subscriptions

