Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467822DF574
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 14:17:19 +0100 (CET)
Received: from localhost ([::1]:48242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqyaL-0001tr-SF
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 08:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kqyYu-00010y-6O
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 08:15:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:48738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kqyYq-00032q-19
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 08:15:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kqyYo-0004kf-HB
 for <qemu-devel@nongnu.org>; Sun, 20 Dec 2020 13:15:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8072C2E804B
 for <qemu-devel@nongnu.org>; Sun, 20 Dec 2020 13:15:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Dec 2020 13:07:40 -0000
From: Paolo Bonzini <1908489@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=centos; sourcepackage=qemu-kvm; component=None; 
 status=Unknown; importance=Unknown; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bonzini luqmana
X-Launchpad-Bug-Reporter: Luqman (luqmana)
X-Launchpad-Bug-Modifier: Paolo Bonzini (bonzini)
References: <160818582988.15420.16250079431178848252.malonedeb@soybean.canonical.com>
 <160846060219.1287.7718951679916511019.malone@soybean.canonical.com>
Message-Id: <2f020818-c55f-6979-28ac-78e429abc17d@gnu.org>
Subject: Re: [Bug 1908489] Re: qemu 4.2 bootloops with -cpu host and nested
 hypervisor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: ce8d40ba7bc61fbb7be3b44414b330869b2cba2d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1908489 <1908489@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Try instead disabling MPX with "-cpu host,-mpx".

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908489

Title:
  qemu 4.2 bootloops with -cpu host and nested hypervisor

Status in QEMU:
  New
Status in qemu-kvm package in CentOS:
  Unknown

Bug description:
  I've noticed that after upgrading from Ubuntu 18.04 to 20.04 that
  nested virtualization isn't working anymore.

  I have a simple repro where I create a Windows 10 2004 guest and
  enable Hyper-V in it. This worked fine in 18.04 and specifically qemu
  <4.2 (I specifically tested Qemu 2.11-4.1 which work fine).

  The -cpu arg I'm passing is simply:
      -cpu host,l3-cache=3Don,hv_relaxed,hv_spinlocks=3D0x1fff,hv_vapic,hv_=
time

  Using that Windows won't boot because the nested hypervisor (Hyper-V)
  is unable to be initialize and so it just boot loops. Using the exact
  same qemu command works fine with 4.1 and lower.

  Switching to a named CPU model like Skylake-Client-noTSX-IBRS instead
  of host lets the VM boot but causes some weird behaviour later trying
  to use nested VMs.

  If I had to guess I think it would probably be related to this change
  https://github.com/qemu/qemu/commit/20a78b02d31534ae478779c2f2816c273601e=
869
  which would line up with 4.2 being the first bad version but unsure.

  For now I just have to keep an older build of QEMU to work around
  this. Let me know if there's anything else needed. I can also try out
  any patches. I already have at least a dozen copies of qemu lying
  around now.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908489/+subscriptions

