Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B6A20EC9A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 06:26:44 +0200 (CEST)
Received: from localhost ([::1]:33662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jq7r1-0005E2-7k
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 00:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jq7qC-0004mN-6V
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 00:25:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:57116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jq7qA-0003Ww-1a
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 00:25:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jq7q3-0007wp-AP
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 04:25:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E1B352E812D
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 04:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2020 04:17:15 -0000
From: Launchpad Bug Tracker <1869858@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chenyifei2008 janitor th-huth
X-Launchpad-Bug-Reporter: chen (chenyifei2008)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158564614354.21602.16034266356442698815.malonedeb@gac.canonical.com>
Message-Id: <159349063592.19938.6033813023591968124.malone@loganberry.canonical.com>
Subject: [Bug 1869858] Re: qemu can't start Windows10arm64 19H1(with kvm)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 58b3f36b7d3289ce57172efd1c5a5e2778dc0938
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 00:25:45
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
Reply-To: Bug 1869858 <1869858@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1869858

Title:
  qemu can't start Windows10arm64 19H1(with kvm)

Status in QEMU:
  Expired

Bug description:
  My cpu's model is arm64(cortex-a53),I want start Win10arm64 with kvm,Beca=
use is fast than x86.But it's did'nt work.The screnn is card in Uefi's logo=
. But I am use ramfb now,So it has nothing to do with the graphics card.But=
 if I discard kvm,It can start now.But its so slowly.But I use the uefi and=
 kvm can start with Debian arm64 buster. So who's the problem?qemu or kvm o=
r Microsoft?But others use it to start successfully. I don't know what I wo=
uld like to do
  This is start command(Qemu version is 4.1')
  qemu-system-aarch64 -hda /win10.vhdx -cdrom /win10arm.iso -m 1G -accel kv=
m -smp 4 -cpu host -pflash efi.img -pflash var.img -device ramfb -device qe=
mu-xhci -device usb-kbd -device usb-mouse -device usb-tablet
  If I replace the above three parameters with "- CPU cortex-a53" and "- ac=
cel TCG" and "- device VGA", I can start normally. What's the matter?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1869858/+subscriptions

