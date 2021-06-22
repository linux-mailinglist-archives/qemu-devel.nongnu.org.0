Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C8B3AFC31
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:48:41 +0200 (CEST)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYL2-0001mW-RI
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzh-0007LJ-OZ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:56826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzf-00057i-SA
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzS-00014v-LV
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:22 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5ED442E81DF
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:23 -0000
From: Launchpad Bug Tracker <1837851@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: kvm qemu-kvm x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor stefan-proxmox th-huth
X-Launchpad-Bug-Reporter: Stefan (stefan-proxmox)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156404155054.10633.9207967667458929652.malonedeb@wampee.canonical.com>
Message-Id: <162433550345.20423.2229178113498797141.malone@loganberry.canonical.com>
Subject: [Bug 1837851] Re: hv-tlbflush malfunctions on Intel host CPUs with
 neither EPT nor VPID (qemu-kvm)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: a657dcff20cfa9f39d6adc86e5e036610980cb32
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
Reply-To: Bug 1837851 <1837851@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1837851

Title:
  hv-tlbflush malfunctions on Intel host CPUs with neither EPT nor VPID
  (qemu-kvm)

Status in QEMU:
  Expired

Bug description:
  Enabling hv-tlbflush on older hosts using Intel CPUs supporting VT-x
  but neither EPT nor VPID will lead to bluescreens on the guest.

  It seems KVM only checks if EPT is available, and if it isn't it
  forcibly uses VPID. If that's *also* not available, it defaults to
  basically a no-op hypercall, though windows is expecting the TLB to be
  flushed.

  hv-tlbflush is pretty useless on machines not supporting these
  extensions anyway (only reasonably fix I can see would be to flush the
  *entire* TLB on tlbflush hypercall in KVM (i.e. a kernel fix), but
  that would remove any performance benefits), so I would suggest some
  kind of preliminary check and warning/error if hv-tlbflush is
  specified on such a host.

  All CPUs mentioned in this thread[0] are confirmed to be affected by
  the bug, and I have successfully reproduced it on an Intel Core2Duo
  E8500.

  [0] https://forum.proxmox.com/threads/windows-guest-bluescreen-with-
  proxmox-6.56053/

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1837851/+subscriptions

