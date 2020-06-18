Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935451FF80F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 17:52:08 +0200 (CEST)
Received: from localhost ([::1]:46848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlwpe-0000Ms-Ij
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 11:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlwoX-0007xX-Hy
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 11:50:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:55714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlwoV-0002n3-FE
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 11:50:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jlwoS-0004hm-Bd
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 15:50:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 52D7B2E8109
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 15:50:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2020 15:45:32 -0000
From: Ronald Antony <1877781@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crossd rcfa
X-Launchpad-Bug-Reporter: Dan Cross (crossd)
X-Launchpad-Bug-Modifier: Ronald Antony (rcfa)
References: <158905060046.6343.9507725476835392793.malonedeb@soybean.canonical.com>
Message-Id: <159249513267.13634.17161130494762928656.malone@wampee.canonical.com>
Subject: [Bug 1877781] Re: TCG does not support x2APIC emulation
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 338822f0b3ac0f2b9ef065384581c0d75154271a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 11:20:43
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
Reply-To: Bug 1877781 <1877781@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If I may be so free:

It seems that QEMU has stopped emphasizing the EMU part of the name, and
is too much focused on virtualization.

My interest is at running legacy operating systems, and as such, they must =
run on foreign CPU platforms. m68 on intel, intel on ARM, etc.
Time doesn't stand still, and reliance on KVM and similar x86-on-x86 tricks=
, which allow the delegation of certain CPU features to the host CPU is goi=
ng to not work going forward.

If the rumored transition of Apple to ARM is going to take place, people
will want to e.g. emulate for testing or legacy purposes a variety of
operating systems, incl. earlier versions of MacOS.

Testing that scenario, i.e. macOS on an ARM board with the lowest
possible CPU capable of running modern macOS, results in these problems
(and of course utter failure achieving the goal):

qemu-system-x86_64: warning: TCG doesn't support requested feature: CPUID.0=
1H:ECX.fma [bit 12]
qemu-system-x86_64: warning: TCG doesn't support requested feature: CPUID.0=
1H:ECX.avx [bit 28]
qemu-system-x86_64: warning: TCG doesn't support requested feature: CPUID.0=
7H:EBX.avx2 [bit 5]
qemu-system-x86_64: warning: TCG doesn't support requested feature: CPUID.8=
0000007H:EDX.invtsc [bit 8]
qemu-system-x86_64: warning: TCG doesn't support requested feature: CPUID.0=
DH:EAX.xsavec [bit 1]

And this is emulating a lowly Penryn CPU with the required CPU flags for ma=
cOS:
-cpu Penryn,vendor=3DGenuineIntel,+sse3,+sse4.2,+aes,+xsave,+avx,+xsaveopt,=
+xsavec,+xgetbv1,+avx2,+bmi2,+smep,+bmi1,+fma,+movbe,+invtsc

Attempting to emulate a more feature laden intel CPU results in even
more issues.

I would propose that no CPU should be considered supported unless it can
be fully handled by TCG on a non-native host. KVM, native-on-native etc.
are nice to have, but peripheral to qEMUlation when it boils down to it.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877781

Title:
  TCG does not support x2APIC emulation

Status in QEMU:
  New

Bug description:
  This is not a bug so much as a feature request.

  It would be great if there was a pure-software emulation of the x2APIC
  on x86_64, so that it could be used on systems that don't support such
  providing a thing on via a host-based solution (e.g., KVM etc). KVM
  provides this, but that doesn't help if you're working on a machine
  that doesn't support KVM.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877781/+subscriptions

