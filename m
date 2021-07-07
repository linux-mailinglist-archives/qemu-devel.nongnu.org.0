Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 466143BE219
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 06:29:49 +0200 (CEST)
Received: from localhost ([::1]:34018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0zC0-0007F0-9q
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 00:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0z8H-0006sI-Po
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:25:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:42552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0z8G-0003I0-6N
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:25:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0z8D-0006kl-P0
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 04:25:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A0E5B2E8135
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 04:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Jul 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1888417@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: force-stop hangs nvidia pci reboot
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor lightninjay th-huth
X-Launchpad-Bug-Reporter: Jason (lightninjay)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159535256686.7592.12361820079263274205.malonedeb@wampee.canonical.com>
Message-Id: <162563143733.23671.11649281791608338015.malone@loganberry.canonical.com>
Subject: [Bug 1888417] Re: Latest QEMU git build on Arch linux causes PCI
 Passthrough host to hang on guest reboot.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 5181e586ba889dd06652f8e449a510cee02fe884
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
Reply-To: Bug 1888417 <1888417@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888417

Title:
  Latest QEMU git build on Arch linux causes PCI Passthrough host to
  hang on guest reboot.

Status in QEMU:
  Expired

Bug description:
  Current Arch linux release, up-to-date as of 7/21/2020.

  Running a windows 7 virtual machine (also happens with windows 10,
  possibly more OSes), with an nvidia GTX 1060 passthrough, if the VM is
  attempted to be restarted, either through the guest interface, or by
  libvirt's gui interface "Virtual Machine Manager", it hangs in a
  "paused" state once the VM shutsdown, and just before the reboot can
  take place.  A force-stop of the VM allows the VM to be properly
  booted without any disk error checks, alluding to a clean shutdown,
  but failed reboot.  The VM can be properly shutdown using the guests
  shutdown function, or the libvirt manager shutdown, without any hangs.
  Reverting to Arch stable build QEMU 5.0.0-7 fixes the issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888417/+subscriptions

