Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BA03AD0A4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:43:10 +0200 (CEST)
Received: from localhost ([::1]:37304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luHaH-0006DA-IS
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luHYE-00032N-25
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:41:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:43000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luHYA-0004uG-Jn
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:41:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1luHY7-0007PX-Oi
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 16:40:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 93AAB2E8169
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 16:40:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Jun 2021 16:33:58 -0000
From: Thomas Huth <1829498@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ffhguy jnsnow th-huth
X-Launchpad-Bug-Reporter: arseniy (ffhguy)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155808951981.15307.7632909900341712173.malonedeb@gac.canonical.com>
Message-Id: <162403403814.17686.8049408048053311729.malone@gac.canonical.com>
Subject: [Bug 1829498] Re: window 8 stuck during boot on Qemu 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 46f24e3da534b3d2568d38547478159d2b7baa78
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
Reply-To: Bug 1829498 <1829498@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/436


** Changed in: qemu
       Status: Incomplete =3D> Expired

** Changed in: qemu
     Assignee: John Snow (jnsnow) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #436
   https://gitlab.com/qemu-project/qemu/-/issues/436

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1829498

Title:
  window 8 stuck during boot on Qemu

Status in QEMU:
  Expired

Bug description:
  Description of problem:
  I've got windows 8 image(64 bit), installed on Qemu(x86-64_softmmu) and t=
hen i'm trying to boot/shutdown it in the same Qemu configuration. Windows =
8 has feature - when you click "Shutdown" in UI, windows 8 doesn't actually=
 power off, it goes to "Suspend to disc" ACPI state. After shutdown, i'm tr=
ying to boot it again, but it stucks during boot.

  I've discovered, that it hangs when windows 8 writes to AHCI's command re=
gister, AHCI triggers irq, but windows 8 sends EOI, don't accessing AHCI re=
gister,so irq line stills in high state, and irq will be injected again and=
 again, while windows will send EOI on each AHCI interrupt. Strange thing i=
s that it happens only on TCG mode or =

  with option "kernel-irqchip=3Doff/split", with "kernel-irqchip=3Don" ever=
ything works ok(windows 8 accesses AHCI register and line goes to low state=
).

  Version-Release number of selected component (if applicable):
  Qemu revision: d8276573da58e8ce78dab8c46dd660efd664bcb7

  =

  Steps to Reproduce:
  1. Install Windows 8 on QEMU(qemu command line: "-enable-kvm -m 1G -hda <=
image>  -serial stdio  -cpu core2duo -machine q35,kernel-irqchip=3Doff"
  2. Click shutdown in UI.
  3. Try to boot again(it will stuck)
  4. Kill Qemu and boot again, it will boot, now go to 2) :)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1829498/+subscriptions

