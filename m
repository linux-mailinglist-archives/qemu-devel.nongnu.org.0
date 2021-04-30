Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4DA36F73B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:37:46 +0200 (CEST)
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOef-0000IL-FA
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOYm-0003DO-L3
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:31:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:49040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOYc-0005RP-4e
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:31:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOYa-0002PV-12
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:31:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A9EBF2E816B
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:31:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:16:32 -0000
From: Thomas Huth <1914353@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: cve security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: pjps th-huth
X-Launchpad-Bug-Reporter: P J P (pjps)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161232963154.25287.15149381600371735783.malonedeb@wampee.canonical.com>
Message-Id: <161977059253.3730.16353313232278894019.malone@chaenomeles.canonical.com>
Subject: [Bug 1914353] Re: QEMU: aarch64: :GIC: out-of-bounds access via
 interrupt ID
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 392227abcbd0c05469326e7028b75fff20188fcb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1914353 <1914353@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix has been included here:
https://gitlab.com/qemu-project/qemu/-/commit/edfe2eb4360cde4ed5d95bd

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914353

Title:
  QEMU: aarch64: :GIC: out-of-bounds access via interrupt ID

Status in QEMU:
  Fix Released

Bug description:
  Via [qemu-security] list

  +-- On Sun, 31 Jan 2021, Philippe Mathieu-Daud=C3=A9 wrote --+
  | On 1/31/21 11:34 AM, Philippe Mathieu-Daud=C3=A9 wrote:
  | > Per the ARM Generic Interrupt Controller Architecture specification
  | > (document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
  | > not 10:
  | >
  | >    - Table 4-21 GICD_SGIR bit assignments
  | >
  | >    The Interrupt ID of the SGI to forward to the specified CPU
  | >    interfaces. The value of this field is the Interrupt ID, in
  | >    the range 0-15, for example a value of 0b0011 specifies
  | >    Interrupt ID 3.
  | >
  ...
  | > Correct the irq mask to fix an undefined behavior (which eventually
  | > lead to a heap-buffer-overflow, see [Buglink]):
  | >
  | >    $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt=
,accel=3Dqtest -qtest stdio
  | >    [I 1612088147.116987] OPENED
  | >  [R +0.278293] writel 0x8000f00 0xff4affb0
  | >  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds=
 for type 'uint8_t [16][8]'
  | >  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/a=
rm_gic.c:1498:13
  | >
  | > Cc: qemu-stable@nongnu.org
  | > Fixes: 9ee6e8bb853 ("ARMv7 support.")
  | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
  | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
  ...

  On 210202 1221, Peter Maydell wrote:
  > In both cases the overrun is on the first writel to 0x8000f00,
  > but the fuzzer has for some reason not reported that but instead
  > blundered on until it happens to trigger some other issue that
  > resulted from the memory corruption it induced with the first write.
  >
  ...
  > On the CVE:
  >
  > Since this can affect systems using KVM, this is a security bug for
  > us. However, it only affects an uncommon configuration:
  > you are only vulnerable if you are using "kernel-irqchip=3Doff"
  > (the default is 'on', and turning it off is an odd thing to do).
  >
  > thanks
  > -- PMM
  >

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914353/+subscriptions

