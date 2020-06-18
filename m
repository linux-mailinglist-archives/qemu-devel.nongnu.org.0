Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1981FF91D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 18:21:44 +0200 (CEST)
Received: from localhost ([::1]:44532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlxIN-0000JL-K6
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 12:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlxHP-0007sm-DB
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:20:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:36012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlxHL-0000NL-K8
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:20:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jlxHJ-0001ee-LT
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 16:20:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9E3692E8109
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 16:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2020 16:08:22 -0000
From: Peter Maydell <1884095@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: emulation incomplete tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell rcfa
X-Launchpad-Bug-Reporter: Ronald Antony (rcfa)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <159249543912.17037.1746740929144966356.malonedeb@chaenomeles.canonical.com>
Message-Id: <159249650285.17414.17150314098667904145.malone@chaenomeles.canonical.com>
Subject: [Bug 1884095] Re: QEMU not sufficiently focused on qEMUlation,
 with resulting holes in TCG emulation coverage
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: ce1a41d21345b567694477b5a050c77cb1632067
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
Reply-To: Bug 1884095 <1884095@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You made this point already in comments in LP:1818075 (and got some
responses there). This isn't a bug report, it's just a suggestion about
what the project ought to prioritize. If you'd like to have that kind of
discussion you can probably do better just starting a qemu-devel thread.


** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884095

Title:
  QEMU not sufficiently focused on qEMUlation, with resulting holes in
  TCG emulation coverage

Status in QEMU:
  Invalid

Bug description:
  It seems that QEMU has stopped emphasizing the EMU part of the name,
  and is too much focused on virtualization.

  My interest is at running legacy operating systems, and as such, they mus=
t run on foreign CPU platforms. m68 on intel, intel on ARM, etc.
  Time doesn't stand still, and reliance on KVM and similar x86-on-x86 tric=
ks, which allow the delegation of certain CPU features to the host CPU is g=
oing to not work going forward.

  If the rumored transition of Apple to ARM is going to take place,
  people will want to e.g. emulate for testing or legacy purposes a
  variety of operating systems, incl. NeXTSTEP, Windows, earlier
  versions of MacOS on ARM Macs.

  Testing that scenario, i.e. macOS on an ARM board with the lowest
  possible CPU capable of running modern macOS, results in these
  problems (and of course utter failure achieving the goal):

  qemu-system-x86_64: warning: TCG doesn't support requested feature: CPUID=
.01H:ECX.fma [bit 12]
  qemu-system-x86_64: warning: TCG doesn't support requested feature: CPUID=
.01H:ECX.avx [bit 28]
  qemu-system-x86_64: warning: TCG doesn't support requested feature: CPUID=
.07H:EBX.avx2 [bit 5]
  qemu-system-x86_64: warning: TCG doesn't support requested feature: CPUID=
.80000007H:EDX.invtsc [bit 8]
  qemu-system-x86_64: warning: TCG doesn't support requested feature: CPUID=
.0DH:EAX.xsavec [bit 1]

  And this is emulating a lowly Penryn CPU with the required CPU flags for =
macOS:
  -cpu Penryn,vendor=3DGenuineIntel,+sse3,+sse4.2,+aes,+xsave,+avx,+xsaveop=
t,+xsavec,+xgetbv1,+avx2,+bmi2,+smep,+bmi1,+fma,+movbe,+invtsc

  Attempting to emulate a more feature laden intel CPU results in even
  more issues.

  I would propose that no CPU should be considered supported unless it
  can be fully handled by TCG on a non-native host. KVM, native-on-
  native etc. are nice to have, but peripheral to qEMUlation when it
  boils down to it. At the very least, there should be a CLEAR
  distinction which CPUs require KVM to be used, and which can be fully
  emulated. It should not require wasting an afternoon to figure out
  that an emulation attempt is futile because TCG lacks essential
  functionality.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884095/+subscriptions

